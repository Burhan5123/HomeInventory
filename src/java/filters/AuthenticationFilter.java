package filters;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import services.AccountService;

public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {  
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession();
        AccountService as = new AccountService();
        String email = (String)session.getAttribute("email");
        boolean active = false;
        
        try {
            User user = as.get(email);
            active = user.getActive();
        } catch (Exception ex) {
            Logger.getLogger(AuthenticationFilter.class.getName()).log(Level.SEVERE, null, ex);
        }

        if( email == null || !active){
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("login");
            return;
        }
        chain.doFilter(request, response);

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }

}

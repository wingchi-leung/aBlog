package com.wingchi.bean;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Data
public class User implements UserDetails {
    Integer id ;
    String userName ;
    String passWord ;
    boolean enabled ;
    List<Role> roles ;
    Timestamp createTime ;
    Timestamp lastLoginTime ;
    List<?> favorites ; //文章收藏夹
    Integer follower ;
    Integer fans;


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities =new ArrayList<>() ;
        for(Role role : roles){
            authorities.add(new SimpleGrantedAuthority("ROLE_"+role.getName())) ;
        }
        return authorities;
    }

    @Override
    public String getPassword() {
        return passWord;
    }

    @Override
    public String getUsername() {
        return userName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

//    凭证是否过期
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }
}

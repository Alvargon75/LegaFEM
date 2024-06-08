module f_rotation
    implicit none
    
contains

    function cross(v1, v2) result(crossv)
        real, dimension(3), intent(in) :: v1, v2
        real, dimension(3) :: crossv

        crossv(1) = v1(2) * v2(3) - v1(3) * v2(2)
        crossv(2) = -v1(3) * v2(1) + v1(1) * v2(3)
        crossv(3) = v1(1) * v2(2) - v1(2) * v2(1)
    
    end function cross

    ! function rotmat1d(node1, node2, j_aux) result(R)
    !     real, dimension(3), intent(in) :: node1, node2
    !     real, dimension(3), intent(in) :: j_aux
    !     real, dimension(3) :: i_hat, j_hat, k_hat
    !     real, dimension(3,3) :: R

    !     i_hat = (node2 - node1)/norm2(node2 - node1)

    !     if ( norm2( cross(i_hat, j_aux) ) <= 1e-6) then
    !         write(*,*) "ERROR: j_aux can't  be parallel to bar."
    !     end if

    !     k_hat = cross(i_hat, j_aux) / norm2(cross(i_hat, j_aux))
    !     j_hat = cross(k_hat, i_hat)

    !     R(1,1) = i_hat(1)
    !     R(1,2) = i_hat(2)
    !     R(1,3) = i_hat(3)
    !     R(2,1) = j_hat(1)
    !     R(2,2) = j_hat(2)
    !     R(2,3) = j_hat(3)
    !     R(3,1) = k_hat(1)
    !     R(3,2) = k_hat(2)
    !     R(3,3) = k_hat(3)
    
        
    ! end function rotmat1d

    subroutine rotmat1d(node1, node2, j_aux, R)
        real, dimension(3), intent(in) :: node1, node2
        real, dimension(3), intent(in) :: j_aux
        real, dimension(3) :: i_hat, j_hat, k_hat
        real, dimension(3,3), intent(out) :: R

        i_hat = (node2 - node1)/norm2(node2 - node1)

        if ( norm2( cross(i_hat, j_aux) ) <= 1e-6) then
            write(*,*) "ERROR: j_aux can't  be parallel to bar."
        end if

        k_hat = cross(i_hat, j_aux) / norm2(cross(i_hat, j_aux))
        j_hat = cross(k_hat, i_hat)

        R(1,1) = i_hat(1)
        R(1,2) = i_hat(2)
        R(1,3) = i_hat(3)
        R(2,1) = j_hat(1)
        R(2,2) = j_hat(2)
        R(2,3) = j_hat(3)
        R(3,1) = k_hat(1)
        R(3,2) = k_hat(2)
        R(3,3) = k_hat(3)
    
        
    end subroutine rotmat1d
    
end module f_rotation

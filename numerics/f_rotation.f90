module f_rotation
    use f_aux
    implicit none
    ! comments
    
contains

    function rotmat1d(node1, node2, j_aux) result(R)
        real, dimension(3), intent(in) :: node1, node2
        real, dimension(3), intent(in) :: j_aux
        real, dimension(3) :: i_hat, j_hat, k_hat
        real, dimension(3,3) :: R

        i_hat = (node2 - node1)/norm2(node2 - node1)

        if ( norm2( cross(i_hat, j_aux) ) <= 1e-6) then
            write(*,*) "ERROR: j_aux can't  be parallel to bar."
        end if

        k_hat = cross(i_hat, j_aux) / norm2(cross(i_hat, j_aux))
        j_hat = cross(k_hat, i_hat)

        R(1,:) = i_hat
        R(2,:) = j_hat
        R(3,:) = k_hat
        
    end function rotmat1d

    function rotmat2d(nodes) result(R)
        real, dimension(4,3), intent(in) :: nodes
        real, dimension(3,3) :: R
        real, dimension(3) :: Pc, Pm23, Pm34
        real, dimension(3) :: i_hat, j_hat, k_hat, j_aux

        Pc = 0.25 * sum(nodes, dim=1)
        write(*,*) Pc
        
        Pm23 = 0.5 * (nodes(2,:) + nodes(3,:))
        Pm34 = 0.5 * (nodes(3,:) + nodes(4,:))
        
        i_hat = (Pm23 - Pc)/norm2(Pm23 - Pc)
        j_aux = (Pm34 - Pc)/norm2(Pm34 - Pc);
        k_hat = cross(i_hat, j_aux)/norm2(cross(i_hat, j_aux))
        j_hat = cross(k_hat, i_hat)/norm2(cross(k_hat, i_hat))

        R(1,:) = i_hat
        R(2,:) = j_hat
        R(3,:) = k_hat
        
    end function rotmat2d
    
end module f_rotation

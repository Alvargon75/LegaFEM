module f_aux
    implicit none
    
contains

    function cross(v1, v2) result(crossv)
        real, dimension(3), intent(in) :: v1, v2
        real, dimension(3) :: crossv
    
        crossv(1) = v1(2) * v2(3) - v1(3) * v2(2)
        crossv(2) = -v1(3) * v2(1) + v1(1) * v2(3)
        crossv(3) = v1(1) * v2(2) - v1(2) * v2(1)
        
    end function cross
    
end module f_aux
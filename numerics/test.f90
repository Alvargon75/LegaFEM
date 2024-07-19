program testprog
    use f_rotation

    implicit none
    
    real, dimension(3) :: v1, v2, v3, p1, p2
    real, dimension(4,3) :: nodes
    real, dimension(3) :: result
    real, dimension(3,3) :: R_mat

    v1(1) = 1
    v1(2) = 2
    v1(3) = 3
    v2(1) = 4
    v2(2) = 5
    v2(3) = 6
    v3 = [0,1,0]

    p1 = [0,0,0]
    p2 = [1,0,0]

    result = cross(v1, v2)

    write(*,*) "Cross product"
    write(*,*) result

    R_mat = rotmat1d(p1,p2,v3)

    write(*,*) "Rotation Matrix 1D"
    write(*,*) R_mat

    nodes(1,:) = [0,0,0]
    nodes(2,:) = [1,0,0]
    nodes(3,:) = [1,1,0]
    nodes(4,:) = [0,1,0]

    R_mat = rotmat2d(nodes)

    write(*,*) "Rotation Matrix 2D"
    write(*,*) R_mat

end program testprog
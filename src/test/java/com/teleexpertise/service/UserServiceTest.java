package com.teleexpertise.service;

import com.teleexpertise.dao.UserDAO;
import com.teleexpertise.model.MedecinSpecialiste;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class UserServiceTest {

    private UserDAO mockDAO;
    private UserService userService;

    @BeforeEach
    void setUp() throws Exception {
        mockDAO = mock(UserDAO.class);
        userService = new UserService();

        Field field = UserService.class.getDeclaredField("userDAO");
        field.setAccessible(true);
        field.set(userService, mockDAO);
    }

    @Test
    void testFindAllMedecinSpecialiste() {
        MedecinSpecialiste doc1 = new MedecinSpecialiste();
        doc1.setId(1L);
        doc1.setSpecialite("Néphrologie");

        when(mockDAO.getAllMedicinesSpecialistes()).thenReturn(Arrays.asList(doc1));

        List<MedecinSpecialiste> result = userService.findAllMedecinSpecialiste();

        assertEquals(1, result.size());
        assertEquals("Néphrologie", result.get(0).getSpecialite());
        verify(mockDAO, times(1)).getAllMedicinesSpecialistes();
    }

}

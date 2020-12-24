package com.wulin.dao;

import com.wulin.bean.Client;

import java.util.List;

public interface ClientMapper {
    List<Client> findAllClient();

    void addClient(Client client);

    void deteleClient(Integer clientId);

    void updateClient(Client client);
}

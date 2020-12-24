package com.wulin.service;

import com.wulin.bean.Client;

import java.util.List;

public interface ClientService {
    List<Client> findAllClient();

    void addClient(Client client);

    void deleteClient(Integer clientId);

    void updateClient(Client client);

}

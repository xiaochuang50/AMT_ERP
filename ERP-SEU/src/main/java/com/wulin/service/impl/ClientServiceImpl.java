package com.wulin.service.impl;

import com.wulin.bean.Client;
import com.wulin.dao.ClientMapper;
import com.wulin.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("clientService")
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientMapper clientMapper;

    @Override
    public List<Client> findAllClient() {
        return clientMapper.findAllClient();
    }

    @Override
    public void addClient(Client client) {
        clientMapper.addClient(client);
    }

    @Override
    public void deleteClient(Integer clientId) {
        clientMapper.deteleClient(clientId);
    }

    @Override
    public void updateClient(Client client) {
        clientMapper.updateClient(client);
    }
}

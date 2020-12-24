package com.wulin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wulin.bean.Client;
import com.wulin.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ClientController {

    @Autowired
    private ClientService clientService;

    @RequestMapping("/client")
    public String clientManagement(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        return showPages(pn,model);
    }

    @RequestMapping("/addClient")
    public String addClient(Client client, Model model){
        clientService.addClient(client);
        return showPages(1,model);
    }

    @RequestMapping("/deleteClient")
    public String deleteClient(Integer clientId,Model model){
        clientService.deleteClient(clientId);
        return showPages(1,model);
    }

    @RequestMapping("/updateClient")
    public String updateClient(Client client,Model model){
        clientService.updateClient(client);
        return showPages(1,model);
    }

    public String showPages(Integer pn,Model model){
        PageHelper.startPage(pn, 10);
        List<Client> clients = clientService.findAllClient();
        PageInfo pageInfo = new PageInfo(clients,5);
        model.addAttribute("pageInfo",pageInfo);
        return "client_management";
    }
}

package com.wavemagister.dao;

import com.wavemagister.entities.Agreement;
import com.wavemagister.entities.User;
import java.util.List;
public interface AgreementDAO
{
    public void saveAgreement(Agreement agreement);
    public Agreement getAgreementById(int id);
    public void updateAgreement(Agreement agreement);
    public void deleteAgreement(int id);
    public List<Agreement> getAllAgreements();
    public List<Agreement> getShipownerAgreements(User loggedInUser);
    public List<Agreement> getChartererAgreements(User loggedInUser);
}

using System;

namespace ECOMBLL
{
    public class BLLPageLevelSecurity
    {
        public bool IsAccessAdmin(string userGroup)
        {
            try
            {
                if (userGroup == "SuperAdmin" || userGroup == "Admin" || userGroup == "CompanyAdmin")
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
        }

        public bool IsAccessDelivary(string userGroup)
        {
            try
            {
                if (userGroup == "DelivaryPerson")
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
        }

        public bool IsAccessCustomer(string userGroup)
        {
            try
            {
                if (userGroup == "Customer")
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
        }
    }
}

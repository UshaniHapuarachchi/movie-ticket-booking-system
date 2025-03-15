public class quary extends config{
    String result;
    public String Insert(String qry){

        try {
            st.execute(qry);
            result = "Done";
        }catch (Exception e){
            result = String.valueOf(e);
        }

        return  result;
    }
}

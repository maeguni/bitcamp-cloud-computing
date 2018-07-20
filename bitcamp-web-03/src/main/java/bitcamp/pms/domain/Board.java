package bitcamp.pms.domain;

import java.sql.Date;

public class Board {

    protected String titl;
    protected String cont;
    protected Date cdt;
    protected int bno;   
    
    public Board() {

    }

    public String getTitl() {
        return titl;
    }

    public void setTitl(String titl) {
        this.titl = titl;
    }

    public String getCont() {
        return cont;
    }

    public void setCont(String cont) {
        this.cont = cont;
    }

    public Date getCdt() {
        return cdt;
    }

    public void setCdt(Date cdt) {
        this.cdt = cdt;
    }

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    @Override
    public String toString() {
        return "Board [titl=" + titl + ", cont=" + cont + ", cdt=" + cdt + ", bno=" + bno + "]";
    }
    


}

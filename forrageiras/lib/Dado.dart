class Dado{
  List<List<String>> lista= new List();
  List<String> orden=new List();
  Dado(){
     orden.addAll(["PRODUTIVIDADE","PROPAGAÇÃO","FERTILIDADE","TOL. ACIDEZ","TOL. SECA","TOL. FRIO ","SOLO ENCHARCADO","RESIST. CIGARRINHA","ESTABELECIMENTO","RELEVO","USO","TOL. SOMBREAMENTO","ANIMAL","CULTIVAR"]);
    
    carregaLista();




  }
  






  void carregaLista(){
    lista.add(['média','semente/muda','Média','Média','Média','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Marandu, Xaraés']);
		lista.add(['média','semente/muda','Média','Média','Alta','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Piatã']);
		lista.add(['média','semente/muda','Média','Média','Alta','Baixa','Baixa','Baixa','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Paiaguás']);
		lista.add(['média','semente/muda','Média','Alta','Média','Baixa','Alta','Alta','lento','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Tupi']);
		lista.add(['média','semente/muda','Média','Média','Média','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Ipyporã']);
		lista.add(['média','semente/muda','Média','Alta','Média','Baixa','Alta','Baixa','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Llanero']);
		lista.add(['média','semente/muda','Média','Alta','Alta','Baixa','Baixa','Baixa','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Basilisk']);
		lista.add(['média','semente/muda','Média','Alta','Média','Baixa','Alta','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Humidicola']);
		lista.add(['média','semente/muda','Média','Baixa','Baixa','Baixa','Baixa','Baixa','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Ruziziensis']);
		lista.add(['alta','semente/muda','Alta','Baixa','Média','Baixa','Média','Alta','rápido','plano','pastejo/silagem','Média','Bovino/equino','Tanzânia, Mombaça, Zuri']);
		lista.add(['média','semente/muda','Média','Média','Alta','Baixa','Média','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Massai']);
		lista.add(['alta','semente/muda','Alta','Baixa','Média','Média','Baixa','Alta','rápido','plano','pastejo/silagem','Média','Bovino/caprino-ovino/equino','Tamani']);
		lista.add(['alta','semente/muda','Alta','Baixa','Média','Média','Baixa','Alta','rápido','plano/montanhoso','pastejo/silagem','Média','Bovino/caprino-ovino/equino','Quênia']);
		lista.add(['alta','muda','Alta','Baixa','Alta','Baixa','Baixa','Baixa','rápido','plano','silagem/capineira','Baixa','Bovino/caprino-ovino/equino','Cameroon, Napier']);
		lista.add(['média','muda','Alta','Baixa','Alta','Baixa','Baixa','Baixa','rápido','plano','pastejo','Baixa','Bovino/caprino-ovino/equino','Mott']);
		lista.add(['média','semente/muda','Média','Baixa','Média','Média','Média','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Capim Kikuio']);
		lista.add(['média','semente/muda','Média','Alta','Alta','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/equino','Planaltina']);
		lista.add(['média','semente/muda','Alta','Baixa','Alta','Média','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Baixa','Bovino/equino','Capim Rhodes']);
		lista.add(['média','semente/muda','Média','Alta','Baixa','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Baixa','Bovino/caprino-ovino/equino','Capim Gordura']);
		lista.add(['média','semente/muda','Média','Média','Média','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Baixa','Bovino/equino','Capim Jaraguá']);
		lista.add(['média','semente/muda','Média','Média','Média','Média','Média','Alta','rápido','plano/montanhoso','pastejo/feno','Baixa','Bovino/equino','Pangola']);
		lista.add(['média','semente/muda','Média','Alta','Média','Média','Média','Baixa','lento','plano/montanhoso','pastejo/feno','Baixa','Bovino/equino','Capim Setária']);
		lista.add(['média','muda','Alta','Média','Média','Média','Média','Alta','rápido','plano/montanhoso','pastejo/feno','Baixa','Bovino/caprino-ovino/equino','Tifton 85']);
		lista.add(['alta','muda','Média','Média','Alta','Baixa','Baixa','Baixa','lento','plano','silagem/capineira','Baixa','Bovino/caprino-ovino/equino','cana de açúcar']);
		lista.add(['alta','semente','Alta','Baixa','Baixa','Baixa','Baixa','Alta','lento','plano','silagem','Baixa','Bovino/caprino-ovino/equino','milho']);
		lista.add(['alta','semente','Alta','Baixa','Média','Baixa','Baixa','Baixa','lento','plano','silagem','Baixa','Bovino/caprino-ovino/equino','sorgo']);
		lista.add(['baixa','muda','Média','Alta','Alta','Baixa','Baixa','Alta','lento','plano','capineira','Baixa','Bovino/caprino-ovino','palma']);
		lista.add(['baixa','semente/muda','Média','Média','Média','Média','Média','Alta','lento','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Amendoim For']);
		lista.add(['alta','semente/muda','Média','Média','Média','Baixa','Baixa','Baixa','lento','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Guandu']);
		lista.add(['alta','semente/muda','Alta','Baixa','Alta','Baixa','Baixa','Baixa','lento','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Leucena']);
		lista.add(['média','semente/muda','Alta','Baixa','Alta','Baixa','Baixa','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Alfafa']);
		lista.add(['média','semente/muda','Média','Baixa','Média','Média','Baixa','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Estilosantes']);
		lista.add(['baixa','semente/muda','Média','Alta','Baixa','Baixa','Alta','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Calopogônio']);
		lista.add(['baixa','semente/muda','Média','Média','Alta','Média','Média','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Centrosema']);
		lista.add(['baixa','semente/muda','Média','Média','Média','Baixa','Média','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Galáctia']);
		lista.add(['baixa','semente/muda','Média','Baixa','Alta','Média','Baixa','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Lablab']);
		lista.add(['baixa','semente/muda','Média','Alta','Média','Média','Média','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Kudzu Tropical']);
		lista.add(['baixa','semente/muda','Alta','Média','Alta','Baixa','Baixa','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Siratro']);
		lista.add(['média','semente/muda','Alta','Média','Alta','Baixa','Média','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Soja Perene']);
		

  }



}
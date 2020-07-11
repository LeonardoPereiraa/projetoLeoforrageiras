import 'package:flutter/material.dart';



class Dados {
	List<List<List<int>>> repeticao = List();//(2)
	List<List<String>> dados = List();
	int numero_linhas;
	List<int> possiveis_linha; 
	List<bool> ja_escolido;
  List<List<int>> grafo_deletado = List();
	Dados(){
		
		 numero_linhas=39;
		for (int i = 0; i<numero_linhas; i++) {
			List<String> lista = new List<String>();
			this.dados.add(lista);
		}
		
		
		carregar_itens_inicio(this.dados);
		gera_lista_repeticao();
		this.ja_escolido =gera_lista_Falso(dados[0].length);
		this.possiveis_linha = gera_lista_sequencia(dados.length);
		this.grafo_deletado.add(new List<int>());
    this.grafo_deletado.add(new List<int>());
    
	}
//(3)
	void gera_lista_repeticao(){
		List<int> valor_minimo=[0,0];
		for(int coluna=0 ; coluna < dados[0].length;coluna++){
			repeticao.add( List());
			pega_repeticao(dados[valor_minimo[0]][coluna],coluna,valor_minimo);
			for(int linha=0 ; linha<dados.length;linha++){
				procura_elementao_fora_lista_repeticao(valor_minimo,coluna);
				pega_repeticao(dados[valor_minimo[0]][coluna],coluna,valor_minimo);		
				if(valor_minimo[1]==39){
					linha=50;
				}
			}
			valor_minimo[0]=0;
			valor_minimo[1]=0; 
			
		}
		adiciona_coluna_nofinal();

	}
//(3.3)
	void procura_elementao_fora_lista_repeticao(List<int> valor_minimo, int coluna){
		int botao = 0;
		for(int i=0 ;i< repeticao[coluna].length ; i++){
			for(int p = 0 ; p<repeticao[coluna][i].length;p++){
				if(valor_minimo[0] == repeticao[coluna][i][p]){
					valor_minimo[0] =valor_minimo[0] +1;
					botao = 1;				
				}
				if(valor_minimo[0] < repeticao[coluna][i][p] ){

					if(botao == 1){
						botao = 0;
						i=0;
						p=0;

					}
					else{
						p=repeticao[coluna][i].length;
					}
				}
				
				

			}
			
		}
		

		
		
	}

	void adiciona_coluna_nofinal(){
		for(int i = 0 ; i< repeticao.length;i++){
			if(i==0)
			{
				
				
			}
			for(int p =0 ; p<repeticao[i].length;p++){
				repeticao[i][p].add(i);
			}

		}

	}
//(3.2)
	void pega_repeticao(String palavra, int coluna, List<int> valor_minimo){
		List<int> lista = new List<int>();
		int botao = 0;
		for(int linha=valor_minimo[0] ; linha< this.dados.length ; linha++){
			if(palavra==this.dados[linha][coluna]){
				lista.add(linha);
				valor_minimo[1]=valor_minimo[1] +1;
				
			}
			else{
				if(botao==0){
					valor_minimo[0] = linha;
					botao = 1;	
				}			
			}
		}
		
		repeticao[coluna].add(lista);

	}



	int getNumeroLinhas(){
		return numero_linhas;

	}
	String getElemento(int linha , int coluna){

		return dados[linha][coluna];
	}



	List<bool> gera_lista_Falso(int tamanho){
		List<bool> lista = List();
		for(int i =0 ; i<tamanho; i++){
			lista.add(false);
		}
	 	return lista;
	}
	List<int> gera_lista_sequencia(int tamanho){
		List<int> lista = List();
		for(int i =0 ; i<tamanho;i++){
			lista.add(i);
		}
		return lista;	
	}



	void intersecao(List<int> a){
		int flag =0;
		
		for(int i =0;i<possiveis_linha.length;i++){
			
			for(int p =0;p<(a.length -1) ; p++){
        
        
				if(a[p]== possiveis_linha[i]){
					
					p=a.length;
					flag =1;
				}
			}
			if(flag==0){
				possiveis_linha.removeAt(i);
				i = i -1;			
			}
			else{	
				flag =0;
			}
		}
    
	}


	bool contido(List<int> a){
		bool fleg = false; 
		for(int i =0 ; i < possiveis_linha.length; ++i  ){

			for(int p= 0 ; p<a.length - 1 ;p++){
				if(a[p]==possiveis_linha[i]){
					p = a.length - 1;
					fleg = true;
				}
			}
			if(fleg == false){
				return false;
			}
			fleg = false;
		}
		return true;
			
	}
  bool pertence(List<int> a){

  for(int i =0 ;i<possiveis_linha.length ; i++){
    for(int p= 0 ;p< a.length -1 ; p++ ){
      if(a[p]==possiveis_linha[i]){
        return true;

      }


    }

  }
  return false;

  }
  void muda_ja_escolido(int a ){
    if(this.ja_escolido[a]==true){
      this.ja_escolido[a]=false;
    }
    else{
      this.ja_escolido[a]=true;
    }
  }

  bool pega_estado_ja_escolido(int a){
  
    return this.ja_escolido[a];
  }

  void add_elemento_grafo_deletado(int coluna, int linha ){
    this.grafo_deletado[0].add(coluna);
    this.grafo_deletado[1].add(linha);
  }

  void remove_ultimoElemento_grafo_deletado(){
    this.grafo_deletado[0].removeAt(this.grafo_deletado[0].length -1);
    this.grafo_deletado[1].removeAt(this.grafo_deletado[1].length -1);
  }
  int paga_colunaUltimo_grafo_deletado(){
    return this.grafo_deletado[0][this.grafo_deletado[0].length -1];
  }
   int paga_LinhaUltimo_grafo_deletado(){
    return this.grafo_deletado[1][this.grafo_deletado[1].length -1];
  }
    int pega_linhaRepeticao_referentaAoGrafo(int coluna, int primeiroElem){
    for(int i =0;i< this.repeticao[coluna].length;i++){
      if(primeiroElem == this.repeticao[coluna][i][0]){
        return i;
      }
    }
    return -1;

  }

  int quantidade_de_ja_escolido(){
    int cont =0;
    for(int i =0 ; i < this.ja_escolido.length;i++){
      if(this.ja_escolido[i]==true){
        cont = cont + 1;
      }

    }
    return cont;

  }



  void organizar_lista_possiveis_linhas(int parada,List<List<int>> combobox){
    this.possiveis_linha = gera_lista_sequencia(this.dados.length);
    for(int i =0 ; i<grafo_deletado[0].length;i++){

      if(parada == grafo_deletado[0][i] && grafo_deletado[1][i]== -1 ){
        return;
      }
      if(grafo_deletado[1][i]== -1){
        intersecao(combobox[grafo_deletado[0][i]]);


      }

    }




  }



//(1)
	carregar_itens_inicio(List<List<String>> lista){
		lista[0].addAll(['média','semente/muda','Média','Média','Média','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Marandu, Xaraés']);
		lista[1].addAll(['média','semente/muda','Média','Média','Alta','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Piatã']);
		lista[2].addAll(['média','semente/muda','Média','Média','Alta','Baixa','Baixa','Baixa','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Paiaguás']);
		lista[3].addAll(['média','semente/muda','Média','Alta','Média','Baixa','Alta','Alta','lento','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Tupi']);
		lista[4].addAll(['média','semente/muda','Média','Média','Média','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Ipyporã']);
		lista[5].addAll(['média','semente/muda','Média','Alta','Média','Baixa','Alta','Baixa','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Llanero']);
		lista[6].addAll(['média','semente/muda','Média','Alta','Alta','Baixa','Baixa','Baixa','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Basilisk']);
		lista[7].addAll(['média','semente/muda','Média','Alta','Média','Baixa','Alta','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Humidicola']);
		lista[8].addAll(['média','semente/muda','Média','Baixa','Baixa','Baixa','Baixa','Baixa','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino','Ruziziensis']);
		lista[9].addAll(['alta','semente/muda','Alta','Baixa','Média','Baixa','Média','Alta','rápido','plano','pastejo/silagem','Média','Bovino/equino','Tanzânia, Mombaça, Zuri']);
		lista[10].addAll(['média','semente/muda','Média','Média','Alta','Baixa','Média','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Massai']);
		lista[11].addAll(['alta','semente/muda','Alta','Baixa','Média','Média','Baixa','Alta','rápido','plano','pastejo/silagem','Média','Bovino/caprino-ovino/equino','Tamani']);
		lista[12].addAll(['alta','semente/muda','Alta','Baixa','Média','Média','Baixa','Alta','rápido','plano/montanhoso','pastejo/silagem','Média','Bovino/caprino-ovino/equino','Quênia']);
		lista[13].addAll(['alta','muda','Alta','Baixa','Alta','Baixa','Baixa','Baixa','rápido','plano','silagem/capineira','Baixa','Bovino/caprino-ovino/equino','Cameroon, Napier']);
		lista[14].addAll(['média','muda','Alta','Baixa','Alta','Baixa','Baixa','Baixa','rápido','plano','pastejo','Baixa','Bovino/caprino-ovino/equino','Mott']);
		lista[15].addAll(['média','semente/muda','Média','Baixa','Média','Média','Média','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Capim Kikuio']);
		lista[16].addAll(['média','semente/muda','Média','Alta','Alta','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Média','Bovino/equino','Planaltina']);
		lista[17].addAll(['média','semente/muda','Alta','Baixa','Alta','Média','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Baixa','Bovino/equino','Capim Rhodes']);
		lista[18].addAll(['média','semente/muda','Média','Alta','Baixa','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Baixa','Bovino/caprino-ovino/equino','Capim Gordura']);
		lista[19].addAll(['média','semente/muda','Média','Média','Média','Baixa','Baixa','Alta','rápido','plano/montanhoso','pastejo/feno','Baixa','Bovino/equino','Capim Jaraguá']);
		lista[20].addAll(['média','semente/muda','Média','Média','Média','Média','Média','Alta','rápido','plano/montanhoso','pastejo/feno','Baixa','Bovino/equino','Pangola']);
		lista[21].addAll(['média','semente/muda','Média','Alta','Média','Média','Média','Baixa','lento','plano/montanhoso','pastejo/feno','Baixa','Bovino/equino','Capim Setária']);
		lista[22].addAll(['média','muda','Alta','Média','Média','Média','Média','Alta','rápido','plano/montanhoso','pastejo/feno','Baixa','Bovino/caprino-ovino/equino','Tifton 85']);
		lista[23].addAll(['alta','muda','Média','Média','Alta','Baixa','Baixa','Baixa','lento','plano','silagem/capineira','Baixa','Bovino/caprino-ovino/equino','cana de açúcar']);
		lista[24].addAll(['alta','semente','Alta','Baixa','Baixa','Baixa','Baixa','Alta','lento','plano','silagem','Baixa','Bovino/caprino-ovino/equino','milho']);
		lista[25].addAll(['alta','semente','Alta','Baixa','Média','Baixa','Baixa','Baixa','lento','plano','silagem','Baixa','Bovino/caprino-ovino/equino','sorgo']);
		lista[26].addAll(['baixa','muda','Média','Alta','Alta','Baixa','Baixa','Alta','lento','plano','capineira','Baixa','Bovino/caprino-ovino','palma']);
		lista[27].addAll(['baixa','semente/muda','Média','Média','Média','Média','Média','Alta','lento','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Amendoim For']);
		lista[28].addAll(['alta','semente/muda','Média','Média','Média','Baixa','Baixa','Baixa','lento','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Guandu']);
		lista[29].addAll(['alta','semente/muda','Alta','Baixa','Alta','Baixa','Baixa','Baixa','lento','plano/montanhoso','pastejo/feno','Média','Bovino/caprino-ovino/equino','Leucena']);
		lista[30].addAll(['média','semente/muda','Alta','Baixa','Alta','Baixa','Baixa','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Alfafa']);
		lista[31].addAll(['média','semente/muda','Média','Baixa','Média','Média','Baixa','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Estilosantes']);
		lista[32].addAll(['baixa','semente/muda','Média','Alta','Baixa','Baixa','Alta','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Calopogônio']);
		lista[33].addAll(['baixa','semente/muda','Média','Média','Alta','Média','Média','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Centrosema']);
		lista[34].addAll(['baixa','semente/muda','Média','Média','Média','Baixa','Média','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Galáctia']);
		lista[35].addAll(['baixa','semente/muda','Média','Baixa','Alta','Média','Baixa','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Lablab']);
		lista[36].addAll(['baixa','semente/muda','Média','Alta','Média','Média','Média','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Kudzu Tropical']);
		lista[37].addAll(['baixa','semente/muda','Alta','Média','Alta','Baixa','Baixa','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Siratro']);
		lista[38].addAll(['média','semente/muda','Alta','Média','Alta','Baixa','Média','Baixa','lento','plano','pastejo/feno','Média','Bovino/caprino-ovino/equino','Soja Perene']);
		
		



	}

}

//(1) carregar_itens_inicio: essa é uma funçao que adiciona todos os dados dos conbobox em uma matriz da forma linhaxcoluna 

/*(2) List<List<List<int>>> repeticao: essa é uma lista de repetiçoes. para cada coluna e palavra diferente do conbobox temos uma lista de linha, que a quela palavra se repete.
ou seja, a primera cordenada esta associada as colunas dos dados  a sengunda esta associada as palavras repetidas em cada coluna
e a terceira esta associada a uma linha da tabela onde aquela palavra se repete OBS: o ultimo elemento é a coluna associada a essa palavra 
*/

//(3) gera_lista_repeticao:essa funçao tem o intuito de gerar gerar a lista (2)

/*(3.2) pega_repeticao: ela recebe uma palavra, a coluna onde voce esta procurando as respetiçoes e o valor_minimo. 
essa funaçao cria uma lista linhas que aparece a entrada palavra   
*/


//(3.3)procura_elementao_fora_lista_repeticao: essa funçao encontra a primeira palavra ainda nao procurada na linsta de repeticao
 

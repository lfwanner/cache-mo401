# Análise de desempenho de caches - MO401 - 2s2025

## Objetivo geral

Neste trabalho vamos analisar o impacto de configurações de cache e otimizações em nível de software para o desempenho geral do sistema de memória. Vamos usar o simulador de RISC-V Spike para estimar cache misses sob diferentes configurações, e diferentes implementações de multiplicação de matrizes.

## Instruções Básicas


1. Instale as ferramentas de compilação com uma das seguintes alternativas:
   - Download de binários SiFive Freedom Tools: [Ubuntu](https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.12/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz). [Outras versões](https://github.com/sifive/freedom-tools/releases/tag/v2020.12.0)
   - (Alternativa): [Build manual](https://github.com/riscv-collab/riscv-gnu-toolchain)

2. Compile e instale o simulador [Spike](https://github.com/riscv-software-src/riscv-isa-sim)

3. Adicione os diretórios com binários das ferramentas e Spike ao path

## Compilação e execução dos exemplos

Estude o código em `mmult.c`, que contém múltiplas versões de um algoritmo ingênuo de multiplicação de matrizes. De acordo com o valor definido por `MMORDER` na compilação, uma das versões (de 0 a 5) será executada.

1. Compile o código, definindo `MMORDER`, conforme o exemplo abaixo:

   `make -B CFLAGS="-D MMORDER=0"`

2. Execute o código com Spike

   `spike mmult.bin`

3. Use `spike --help` para verificar o funcionamento das opções ``--ic``,  ``--dc`` e  ``--l2`` que simulam caches de instruções, dados, e L2, respectivamente. Execute a simulação com diferentes configurações de cache e observe os resultados.


## Análise e otimização

1. Para uma capacidade total fixa da cache (por exemplo, 4K ou 8K), varie as configurações da cache de dados para a versão zero do algoritmo. Analise e explique as variações observadas no número e taxa de misses. Qual foi a melhor configuração, e por quê? 

2. Para a melhor configuração de cache encontrada no passo 1, compile e execute o programa usando as diferentes ordenações (`MMORDER`). Analise e explique as variações observadas. Qual foi a melhor ordenação, e por quê? 

3. Desenvolva uma nova versão do algoritmo de multiplicação de matrizes que melhore a taxa de misses. _Dica: procure por Blocked Matrix Multiplication._ Explique como a sua estratégia melhora o desempenho da cache.

4. Varie outros parâmetros da cache, como tamanho e uso de segundo nível, e analise e explique o impacto para o seu algoritmo e para a melhor e pior ordenações ingênuas. 


## Entrega e aproveitamento

Para entrega do trabalho, prepare um arquivo .zip com seu código, instruções para execução, e um breve relatório em formato Markdown ou PDF. Entregue via Classroom até a data limite. Quem entregar uma solução completa para o trabalho receberá bonus de até 2 pontos na nota total da prova, de acordo com a nota do trabalho. Só serão consideradas submissões com soluções que respondam todas as questões de implementação e análise (ainda que contendo eventuais erros).


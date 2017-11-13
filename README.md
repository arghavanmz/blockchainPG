# Group project of the TU Dortmund
## Using the blockchain for distributed optimization
Many real world challenges can be mathematically formulated as general optimization problems. Optimizing the profits in a chemical parks, where interconnected plants are operated by different companies, is an example, with u_i being the variables of the interconnecting streams.
Due to, e.g., privacy issues, where the companies want to limit the flow of information, only a distributed optimization is possible. Problems of such structure can be solved using distributed optimization techniques such as Lagrangian decomposition, where the joint problem is solved by iterating between local optimization and a coordinated update of the exchange variables. This procedure is well known and depicted in the figure exemplarily with local model predictive controllers.
The idea in this project is to not have a single coordinator but to do this update of the exchange variables distributedly in all systems on the blockchain using smart contracts (= code that runs on the blockchain). Thus, the necessity of a trusted coordinator is removed while the remaining properties of the hierarchical scheme are still valid.

### OBJECTIVE:
The objective of the project group is to use the given case study (including a Lagrangian based distributed optimization scheme) and existing blockchain technology to implement the coordinator of the optimization scheme as a smart contract.
### TASKS:
The task of this project group can be divided into the following tasks:
- Getting familiar with the blockchain technology.
- Evaluating suitable blockchain frameworks.
- Programming of the smart contracts.
- Executing the smart contracts on a test net.
- Running the smart contracts on different nodes that simulate the different agents.
- Tuining of blockchain properties.


### Quick Start

```matlab
id = 19;
N = 2;
M = 2;

[data, r] = load_data_c(id);
[rho] = set_rho(id);

CNO_MPF(data, r, M, N, rho);
%CNO_MPF(data, r, M, N);
%CNO_MPF(data, r);
```

#### Parameters:
- **`id`**: An identifier used to load the dataset (e.g., `19`).
- **`N`**: The number of population (or the number of solutions in the algorithm).
- **`M`**: termination criterion.
  
#### Functions:
- **`load_data_c(id)`**: Loads the dataset based on the given identifier `id`. It returns:
  - `data`: The dataset.
  - `r`: A parameter associated with the data.
  
- **`set_rho(id)`**: Sets the `rho` parameter based on the given identifier `id`, which is used in the optimization process.

#### CNO_MPF Function:
The `CNO_MPF` function (commented out here) can be run in three different modes:
- **`CNO_MPF(data, r, M, N, rho)`**: Runs the `CNO_MPF` algorithm using the full set of input parameters: `data`, `r`, `M`, `N`, and `rho`.
- **`CNO_MPF(data, r, M, N)`**: Runs the algorithm without specifying `rho` (the function will use a default value for `rho`).
- **`CNO_MPF(data, r)`**: Runs the algorithm with just `data` and `r`, using the default values for `M`, `N`, and `rho`.

#### Outputs:
- **`data_hat`**: The permuted machine-part incidence matrix. This matrix is the result of applying the optimization algorithm to the input dataset. It represents the optimized arrangement of machines and parts, reflecting the new machine-part relationships after optimization.

- **`BE`**: bond energy

- **`PE`**: the percentage of exceptional elements

- **`MU`**: machine utilization

- **`GE`**: grouping efficiency

- **`GE_2`**: grouping efficiency

Additionally, the function displays the following messages in the MATLAB console:
- The objective function updates during the optimization process.
- A summary of the evaluation metrics (BE, PE, MU, GE, GE_2) after optimization.

The function also generates a plot of the `data_hat` matrix:
- The plot visualizes the permuted machine-part incidence matrix after optimization.
- The x-axis is labeled as "Parts" and the y-axis as "Machines," both with bold labels for clarity.
---

### Contact

For any questions or support, feel free to reach out via email:

- **Email 1**: [hongzong.li.cn@gmail.com](mailto:hongzong.li.cn@gmail.com)
- **Email 2**: [hongzli2-c@my.cityu.edu.hk](mailto:hongzli2-c@my.cityu.edu.hk)

---
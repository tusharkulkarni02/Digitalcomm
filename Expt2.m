% Define the number of inputs and outputs
num_inputs = input("Enter number of inputs: ") #2
num_outputs = input("Enter number of outputs: ") #2

% Define the probability distribution P(X)11 2
Px = input("Enter P(X) row matrix "); #[0.5, 0.5]

% Define the conditional probability distribution P(Y|X)
PY_X = input("Enter P(Y|X) matrix"); #[0.9, 0.1; 0.1, 0.9]

% Check if the dimensions of the matrices are valid
if size(Px) ~= [1, num_inputs] || size(PY_X) ~= [num_inputs, num_outputs]
 error("Invalid dimensions of input matrices.");
end

% Calculate P(Y) matrix
PY = Px * PY_X;

% Calculate P(X,Y) matrix
PXY = diag(Px) * PY_X;

% Calculate entropies H(X) and H(Y)
HXmat = -(Px .* log2(Px));
HYmat = -(PY .* log2(PY));

% Calculate matrices of values so I can remove NaN values and replace them with zeros
HXmat(isnan(HXmat)) = 0;
HYmat(isnan(HYmat)) = 0;

% Calculate sum
HX = sum(HXmat);
HY = sum(HYmat);

% Calculate joint entropy H(X,Y)
HXYmat =PXY .* log2(PXY);
HXYmat(isnan(HXYmat)) = 0;
HXY = -sum(sum(HXYmat));

% Calculate conditional entropies H(X|Y) and H(Y|X)
HX_Y = HXY - HY;
HY_X = HXY - HX;

% Calculate mutual information I(X,Y)
IXY = HX + HY - HXY;

% Display the results
disp("P(Y|X) matrix:");
disp(PY_X);
disp("P(X) matrix:");
disp(Px);
disp("P(Y) matrix:");
disp(PY);
disp("P(X,Y) matrix:");
disp(PXY);
disp("H(X):");
disp(HX);
disp("H(Y):");
disp(HY);
disp("H(X,Y):");
disp(HXY);
disp("H(X|Y):");
disp(HX_Y);
disp("H(Y|X):");
disp(HY_X);
disp("I(X,Y):");
disp(IXY);

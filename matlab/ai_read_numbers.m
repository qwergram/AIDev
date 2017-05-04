% machine learning and nueral networks 

% download images and labels
images = loadMNISTImages('train-images-idx3-ubyte');
labels = loadMNISTLabels('train-labels-idx1-ubyte');
% display first D images and labels
D = 100;
display_network(images(:,1:D)); 
disp(labels(1:D));


% initialize nueral network

% hidden layer specifications
l = 2; % l = number of hidden layers (integer greater than 1)
d = 15; % d = hidden layer depth / sigmoid nuerons per hidden layer

% initialize hidden layers
n = ones(d,l)./(ones(d,l) + exp(ones(d,l) - 2*rand(d,l))); 
% n = hidden nueral network matrix
% elements in n randomly assigned sigmoid value 1/(1+e^(-x))...
% ... where x is from uniform random distribution on [-1,1]

%initialize output layer
n0 = ones(10,1)./(ones(10,1) + exp(ones(10,1) - 2*rand(10,1)));
%same structure as hidden nueral network, but always 10 nueron depth 

% initialize nueron input weights 
w1 = rand(d,784); % layer 1 nueron input weights
w = rand(d,d*(l-1)); 
% w = layers 2 to l nueron input weights tensor 
% tensor represented as matrix where w(:,[k(l-2)+1:k(l-1)]) represents ...
% ...w_{k,l} where w_{k,l} is layer k nueron input weights
wout = rand(10,d); % output layer nueron input weights

%initialize nueron bias
b = rand(d,l); % hidden layers nueron bias matrix
bout = rand(10,1); %output layer nueron bias vector

% initialize testing sample set of size T
T = 100;
[x,i] = datasample(images,T,2,'Replace',false); 
xid = labels(i);

% display testing set
%figure(1) 
%display_network(x); 
%disp(xid);

% train nueral network
% jruns through test samples, k runs through layers 2 to l-1
% 
for j = 1:T
    y = ones(d,1)./(ones(d,1) + exp(-(w1*x(:,j) + b(:,1))));
    % y = output from first layer
    % get rid of for loop with matrix multiplication!
    for k = 2:l-1
        y = ones(d,1)./(ones(d,1) + exp(-(w(:,[k-1:d])*y + b(:,k))));
        %first y defines output from kth layer
        %second y is output from (k-1)th layer--
    end
    y = ones(10,1)./(ones(10,1) + exp(-(wout*y + bout))); 
    % y = output (final layer)
   d) - 1; 
    C = norm(y);
end
        


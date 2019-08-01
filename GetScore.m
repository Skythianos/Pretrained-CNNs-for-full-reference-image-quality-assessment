function [score] = GetScore(refImage, distImage, net, Layers, FR_Metrics, method)

    numberOfLayers = size(Layers,2);
    
    subScores = zeros(1,numberOfLayers);
    
    for i=1:numberOfLayers
        layerName = Layers{i};
        
        RefMap = activations(net, refImage, char(layerName));
        DistMap= activations(net, distImage,char(layerName));
        
        depth  = size(RefMap,3);
        
        mapScores = zeros(1,depth);
        
        for j=1:depth
            RefFeatureMap = RefMap(:,:,j);
            DistFeatureMap= DistMap(:,:,j);   
            
            if strcmp(FR_Metrics, 'ssim')
                RefFeatureMap = mat2gray(RefFeatureMap);
                DistFeatureMap= mat2gray(DistFeatureMap);
                mapScores(j) = ssim(DistFeatureMap, RefFeatureMap);
            elseif strcmp(FR_Metrics, 'GSM')
                RefFeatureMap = mat2gray(RefFeatureMap);
                DistFeatureMap= mat2gray(DistFeatureMap);
                
                RefFeatureMap = double(255*RefFeatureMap);
                DistFeatureMap= double(255*DistFeatureMap);
                
                [m] = GSM(RefFeatureMap, DistFeatureMap);
                mapScores(j) = m;
            elseif strcmp(FR_Metrics, 'SR-SIM')
                RefFeatureMap = mat2gray(RefFeatureMap);
                DistFeatureMap= mat2gray(DistFeatureMap);
                
                RefFeatureMap = double(255*RefFeatureMap);
                DistFeatureMap= double(255*DistFeatureMap);
                
                [m] = SR_SIM(RefFeatureMap, DistFeatureMap);
                mapScores(j) = m;
            else
                error('Unknown FR metrics');
            end
        end
        
        subScores(i) = mean(mapScores(:));
        
    end
    
    if strcmp(method, 'arithmetic')
        score = mean(subScores(:));
    elseif strcmp(method, 'geometric')
        score = geomean(subScores(:));
    elseif strcmp(method, 'harmonic')
        score = harmmean(subScores(:));
    elseif strcmp(method, 'median')
        score = median(subScores(:));
    else
        error('Unknown method');
    end

end

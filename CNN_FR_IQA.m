clear all
close all

load KADID_Data.mat

pathToImages = strcat(pwd, filesep, 'kadid10k', filesep, 'images'); 

BaseCNN = 'AlexNet';
% BaseCNN = 'VGG16';
% BaseCNN = 'VGG19';
% BaseCNN = 'ResNet101';
% BaseCNN = 'InceptionV3';

[Results_0] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'GSM', 'arithmetic');
[Results_1] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'GSM', 'geometric');
[Results_2] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'GSM', 'harmonic');
[Results_3] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'GSM', 'median');

[Results_4] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'ssim', 'arithmetic');
[Results_5] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'ssim', 'geometric');
[Results_6] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'ssim', 'harmonic');
[Results_7] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'ssim', 'median');

[Results_8] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'SR-SIM', 'arithmetic');
[Results_9] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'SR-SIM', 'geometric');
[Results_10] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'SR-SIM', 'harmonic');
[Results_11] = TestMethodOnKadid10k(BaseCNN, pathToImages, dmos, dist_img, ref_img, 'SR-SIM', 'median');

function CompressionRatio(filename)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    I = imfinfo(filename);
    Total_Bytes = (I.Width*I.Height*I.BitDepth)/8;% /8 to convert in byte
    Stored_Bytes=I.FileSize; % Bits required to store file which is in bytes according to documentation
    cr= Total_Bytes / Stored_Bytes;
    disp('File name :' + string(filename))
    disp('Compression Ratio :' + string(cr))
end
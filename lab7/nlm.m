function data_filtered = nlm(data,local_window)
    FUNCTION = @(data_,local_window_)convolution_local(data_,local_window_);
    data_filtered = colfilt(data,local_window, 'sliding', FUNCTION,local_window);
end


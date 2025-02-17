Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC623CE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788601; cv=none; b=k785sDkRcN8lgQbfdCz2WVE895tlV9MQ4QODyW9sQEvee4Bvc5WUuhkXDQJVwejmXZulIPamo1kFZbTGj3s7zyNBJItcWpbbnekbDe/RPs9QvQ/TEEwt2IjRX1h+kN+UL7GU4KbolM0wABnOXJZv6MbgbMsCyrN/hvZHVLJES3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788601; c=relaxed/simple;
	bh=4WZ48YT0MSsLinCjw+MfJuQIAoiu6CuoEfavQporznU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVcMWL/6rjdJ1L4GS1CpNElsUuQTJOWZkoQLA9kU00giUKibTtIj6ErSKAR6fDT6MqiGpDE6FjQc7zKMQ6HyBU7hJ64cKX8BnVpOGtOW94dLzd2OF6B0TxO8yGmSZ4iBOnb8rXzpX44X/s5sydaJeN4ZG4w5Xxz3YRScmVXOPbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PKlMKuYm; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PKlMKuYm"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso688248166b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 02:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739788596; x=1740393396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPeqxV3v8H4g+Vxay8XkZcl1XNuYQ+5vEQ3ndyeG8ww=;
        b=PKlMKuYmKs3l8/HBWb743ucQT0nrk65EW18AbFRaMm/2Yvvf/GVVl9rTFDQ76riigN
         yflL7bB4iHjRJ1ymlNzCEDDJRARerD5gDlgkPnQh5zUAncwUwBsIOcQvjudE73XrYBVm
         o+1oXjQZTKUNmfqga9BrlYiavoTULbKeYuKXPR4kC3EIE0jgVUsl9cC19sx3fYhiZx8T
         RcPua0EBnTzTjTq4K2BJWuoezjuWtOX6ybawHfKiDiVB5kjlsC1l7vwbP0RNBifQd2a4
         xh6OfBPsCGofeSBrShfG910bki+HI9FSm7eeDv6U8ZyeThiyj/DGEVWOUjXeQ+ArT/DO
         xZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788596; x=1740393396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPeqxV3v8H4g+Vxay8XkZcl1XNuYQ+5vEQ3ndyeG8ww=;
        b=oLeoJ6knVXQiNG0obhRmh1GbSQ7Zl2tj9RyWQvnIfsSyTSkKxaV59/A7lck5IlE/L1
         QLThT0dsH2l2VcJn1c/U9iz8JT8cWrBKZnecTiuAf447AwXWFtm26n/8RQP0+fZDqPv7
         AIZc3y0S9RUaieJsocTKcaW8sJlSsUaw54TdVR8pnm6rAb9a/3L59yFu8RR8MDEjdWNi
         Bgf5xTsz7V1bykv0+AC0zvp5X7AUDsHX9y0phq5FUrkn0F2uk6pCicr1wfE1xtdrOnje
         MXuohcN+FopfVXTIOj7paYTfj0bP2cyjaCwj41SVBdeaZvFDfr96yiCpafJJEhliCCTD
         Et5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKHO+HRtJcgeg8QiPYNfYRF9cv9y7cafWdFcj10qZYRb36StK4mcQHgp7yhICx4NcrvzfubyTl9w1xIB42bASfYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx64ovySS/pgNR07Kabt/Wuob0DElcRO3HSN4MVwjO0ygcn42sR
	To1yugSxv1Bd5tp4GGbxMAyiGa+9Bht9CgGfKGFPGJ6om1F6iWigvLMDa0+lSM4=
X-Gm-Gg: ASbGncuxWwOjUDgC5slPXNLPDTeT19FxEsB+XP+O6P00XdgitxpyK5Kt0DoEIL3UjXo
	NuhANs98ZV6SI6t7g4X78kLr+u79klrlh62CkxadpdgTj+3mwUs+n8WLr9Mh5WjNPLcXbHEd2jX
	4GOd/kpKyNZ8iMlbFer1+drHCPB2xG2vkmLQKyNIOJfA7FRAJs3wRifq3X7AoO31rhUqftuK2vh
	uBoNoE3QfeRvMHLGK3/4TJGgR9lQV+sF9602o9SB51ObRWbAm+DxIqlPLvvm1EGhvfSRjWJv+bE
	MXlenoUVUkgmaloZtKhTgcP+
X-Google-Smtp-Source: AGHT+IHZ274Des1ePN4oUbKhdVm0Vo5N1Xho1JI8Us9w6PhLudWtJ/YtQif5hVEJjAu8oDNIqvcsnQ==
X-Received: by 2002:a17:907:784b:b0:ab7:c6a2:7a43 with SMTP id a640c23a62f3a-abb70b7c310mr839740066b.31.1739788596142;
        Mon, 17 Feb 2025 02:36:36 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8190d15esm388729366b.16.2025.02.17.02.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 02:36:35 -0800 (PST)
Message-ID: <2d3b8404-81cd-44fd-905d-2e6e0b0ceab1@linaro.org>
Date: Mon, 17 Feb 2025 10:36:34 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] firmware: Exynos ACPM: Fix spelling mistake "Faile"
 -> "Failed"
To: Colin Ian King <colin.i.king@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250217091341.297401-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250217091341.297401-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/17/25 9:13 AM, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks!
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 1201380227e0..a85b2dbdd9f0 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -620,7 +620,7 @@ static int acpm_probe(struct platform_device *pdev)
>  	match_data = of_device_get_match_data(dev);
>  	if (!match_data)
>  		return dev_err_probe(dev, -EINVAL,
> -				     "Faile to get match data.\n");
> +				     "Failed to get match data.\n");
>  
>  	acpm->shmem = acpm->sram_base + match_data->initdata_base;
>  	acpm->dev = dev;


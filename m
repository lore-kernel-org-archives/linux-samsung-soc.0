Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC7C230BC9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2025 11:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209866; cv=none; b=EL36b+P8WuTBVqwf/l0bzcFZvZfymY1vDJrvGlRb/sTRWe3zixVZ3Tvy82joUw/WzEh225Pvnaop9mf6Rt+ic1bjSf8tnaO8uJVJ6FiMrUYHz7stGve06EchjNJwJftjR0cMSuqS4QdowA54Dw8O7vSaJlgVN0d5L3oaR4Mals8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209866; c=relaxed/simple;
	bh=AnrsQLvHijfeZTAeUyDiBdqlQ/V+KuOhDqmhlYfAtDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHpdSiHH9CzXI0hlMyzcw/oBkrBLFv32i8t0GMW7rARbE4pavF5GhxOsXOo5ZTeYI1u7gvuflVbqFw3OjWJKhL7hVXQ2U8C4W6QfE20dTB2bxD7JZphFvi1Ve1W0JgyhuMWsy4C6MYgjAm3nNvpmCOg/VP0Og7mDs/OagWekOaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZhY7YsEq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhY7YsEq"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912baafc58so3690937f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2025 04:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742209863; x=1742814663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MR6V4/Niwov3dT1lKEaWV6Yp8Zy1voFzaQ1D9zoTY3k=;
        b=ZhY7YsEqWuYO0n+9UZh0lhWNIrRVuBtA2pDbKrPiX1BIDpSttBPEbrC7IXd40sSDEH
         b2hSvVQPf2iwBVgGKvfSE99esQABwnJ+u8RfD4gKw7kx9CmWzPXRc82RKkUg+T0EA/o4
         dAcVIu6ZtwSGMaiULpEaWjwgqUMO7XQXRKCicX3e0XgxBwjfkxdMHr4m0RBNDbTSf8dV
         C51TK7gWeGCJyCPXN2i7+eCla20fY/zmEhIZJyb3k8WPUmscADeyKJX+CITqJ5HWVP6k
         bnUmGCWmFwe9+DjsXppUP58wud1Oc60ay7zktoKvNADeSEiQ6W6yOGDQVhegmRbziW8O
         wKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742209863; x=1742814663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MR6V4/Niwov3dT1lKEaWV6Yp8Zy1voFzaQ1D9zoTY3k=;
        b=Kdc0u46x6nXmQ3+8/g8u+RggOCr24Ogf+oS5htcb8YL8L72dQKx448xgG07VoC+Ndu
         cafiMSV89u/fWpaWOEl+PLx/5UqL+UKhs85bOTNCFceVsqyV6y5kRN/gNfc6Q6TAcwcf
         EijZktEJzf7D6LZGyBRgmErUrASoTTFZLZQt5+IXmTo86j5UKtRF4NFzf4NMEfEXKXsS
         JI4w0rNP6/ScNA+fvMkcKH/xwChZ9cp73kzxyJWm7a7vWSklXNAvD/zfPx6HpzPnLyc4
         owdimH1ne+yJEKLYSivrCbgyCQ0/ogj8kgThLJvTKo6pX9ksWiqKrPpQLurdxzuv1yLg
         u9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGBMuWwS0k8KD6VZssTJzT91bwlO043luUTyrj0RA7sC3GwS6wfXUaBojptO7eBIjyyZLh0fHFpnZpPD1Uw2hegg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIhwIdktItRmoOJTjkwKoUaMgSl8Bif4z5GdNRHTJIvwx0FY5/
	Bk8N9OSETTlaiFClJYhjTSdWE1iIMAbsUPCllpu6LnPAfmGTmrqV/7ddYNLGXGs=
X-Gm-Gg: ASbGncvpb8EBjgPA9Vb5BinDkuuqriMtaT2bbbMEHnos2IDXL1OF5mpV/rzyjdp2NX7
	LS6xGovV/Jzyt0txVRVJa45Ij5kagQSFJvvSYbXBfW9IJj8VIHteIwrw3YPEmpVyL7K5ttR2zJQ
	q3L6mq5sRpgWdOZ84xjHtA2OoAT1FIUrpUjBtJn0Q4b/hw3sswvQmI3G0aCWc/E/n5M9gGFuXZO
	YA4DYpZ3OLiG8T0wtiVISjtteYAExQsEbzUwUJbUmmQ4CEFbL/ITtwF2Rsg48s3zOVNSmxW7Exc
	ozIKWBUQaHh/QbtZxskdkFQUCJ5Id8hT1CKJoSC0klAS0CQ/sul03pAL3p2xQIGDqJn9GX1uKfl
	Z0z1p7wAC/RFp8J4Evgs=
X-Google-Smtp-Source: AGHT+IE476SO8H91edeKXZBTAyLprfXCwLhm85dorgsKMjTo5H3Yf/EGW9XVvxTRoJ7VcbN4UEacig==
X-Received: by 2002:a05:6000:1ace:b0:391:41c9:7a87 with SMTP id ffacd0b85a97d-3971fdc6db1mr13823999f8f.51.1742209862843;
        Mon, 17 Mar 2025 04:11:02 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:900a:ff00:eb98:2c37:6a77:39? ([2a02:2f04:900a:ff00:eb98:2c37:6a77:39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318af0sm14702121f8f.73.2025.03.17.04.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 04:11:02 -0700 (PDT)
Message-ID: <75f49e65-5a8a-4a52-bed9-31be4a76d536@linaro.org>
Date: Mon, 17 Mar 2025 11:11:01 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] firmware: exynos-acpm: convert to dev_err_probe() in
 client API
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
 <20250314-acpm-fixes-v1-3-ab03ca8e723f@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250314-acpm-fixes-v1-3-ab03ca8e723f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/14/25 4:40 PM, André Draszik wrote:
> dev_err_probe() exists to simplify code and unify error messages by
> using its message template.
> 
> Convert the remaining dev_err() in acpm_get_by_phandle() to
> dev_err_probe().
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 48f1e3cacaa709ae703115169df138b659ddae44..03f907a95c6acd66d89cd8af2f52e7c6dadf492a 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -701,12 +701,14 @@ static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
>  
>  	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
>  	if (!link) {
> -		dev_err(&pdev->dev,
> -			"Failed to create device link to consumer %s.\n",
> -			dev_name(dev));
> +		int ret = -EINVAL;
> +
> +		dev_err_probe(&pdev->dev, ret,
> +			      "Failed to create device link to consumer %s.\n",
> +			      dev_name(dev));
>  		platform_device_put(pdev);
>  		module_put(pdev->dev.driver->owner);
> -		return ERR_PTR(-EINVAL);
> +		return ERR_PTR(ret);
>  	}
>  
>  	return &acpm->handle;
> 

The clients are indeed expected to call this method in their probe
method. Shall we make such assumption? I'm in the middle here, but I
don't mind if this gets queued:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

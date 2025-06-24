Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818D9291C1A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772913; cv=none; b=TxfQ0kNw+CUUXqGn9HwhQ6c9L8XrcPWynZnPpX8HbOtHznrMNB4ZJsG6tSiF163mTzskKk2YFZmM0qJsP45nqFCzCeAWQzncF/cmy+PWzeLQt5aMAex6CuC13vbK6vDOwaFNZMMSnKGzkPTuGTzmjGQ721GPGdfXRsjCYmjVoZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772913; c=relaxed/simple;
	bh=0JSun8YMBB7AW9rZu25FKkVf1C+gvp+ffT6j4LJGL+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJeOPR9x2eAheElP8YDq5wurAk+yxJAdfdfYFLPFx8i3lQy7EQwtrYqp9L3ny/4EEk3T2UZhmIbtwcZNR8E2LI4BpxxwrDRBVL8hATWGNs2r95AzXP7uYObUQ44Th8IcHOGrCUylNVrcNg4SpVwuoxs8UuEXSl5h5RkPCNwew6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2IDPw0z; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2IDPw0z"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45377776935so19907465e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750772909; x=1751377709; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sOKIm9/dJcTZ6ipUeMx8GILyup6CNf+4evU6I00WnKE=;
        b=l2IDPw0zaMLGLAXW+R85DFetR9Im+G9Qnu3UDtKt0FujuMRwlqYdUkIDqLdM5a0G0F
         dMLwuB+VI++cuWWk/vUBkn2A1nqim1Ms49CrgdxOt6TI5EPIqg28CKYvlW9vH2m6nzge
         Erhx3td6KcPKxSb4oX+I0ekql/JvUZ5UsOztksn8tEH72NaNk+Hm30NmaI1eGadPFqeu
         z+ZaCf6WJEloeO0WJUfZCi2QIdDu+J8fSK838o/s3T+/v+DwPrN6raLCNToF62zWqBhK
         Qz7uXldge6fjQh3cVb6MJfPQGwCYeHZM4E97cbVQdbGSdC+DOoWcUf2NeKI9a9BFYKSo
         AXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772909; x=1751377709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOKIm9/dJcTZ6ipUeMx8GILyup6CNf+4evU6I00WnKE=;
        b=R+p77jckHyqYVgT503XFXWQB0I8mkUzDU5FLFajChE1LniTVwIvlt53Khf61fDIxGJ
         o162iHaThTjAWMBssT9eukNw2hmVitVHoPfJmPysHq8Z2tEVGqH383vMu+jYUT3ERuk9
         wUFFdjHoSWKHZAIUzlIdFCgVjpS+sFg+DOJLIPieZkD3eBeF2SXzMNOEJEMSB0JROoKX
         tQPf8zAvSdNsP2RhP+m06E8Jp7uyYyGJLs/vYhqszF1TpHopyY5YccG6JtwhY+Ddrdli
         UTkMSW8xQSeHUUiwc94na826DBovr28+s7CDhS1dmYbNuEBCNvf+gJQRep22/1wMWMM3
         xDPA==
X-Forwarded-Encrypted: i=1; AJvYcCU8oSco7YsdTogpyY0HRUs7esvZmGwlOQS6NMcKZr/A8SSTrRgmlp39uy5TdyFniu2Yr66KabY2M8gUv7gMRFIw1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz95x525CpNDcH/zhKZlJWcsWK/Z4t10XZI+cUO6mX/sFwIZip3
	RHQhqmhRgC80/Tej+8CDrFdlghxYxH6j90G3ZJ84awL3NuW9UNNqO9Zhj9pE10CRtfA=
X-Gm-Gg: ASbGnctwWQ3EN7AQ6qlRG5Zw/P9hAJvFaMBiCyIUeZpf1o+refdKSd6eeznSVuKBAUW
	upmXjgWZrEq+rWy75HHK5fUKcwQi4xlzRDH71c6S495cwxONCb/zResSrWUqt+lOzl+NOnnA2dh
	zwz/hkvpj9I5T03L5xz5iKFjn2uC+fFvgcw5qN4/gV30lZBsTq/MK+OLZcFiRRCoFeiKjzvnTIL
	aGPUCobWBJalE5eZOHRIjzId/D/2XuD54Mc5VT3cRYCVIzowHaopBGOZmeGJkkAaRlUBpYapoC6
	SaHGbVm3twrrJ7BskEYWsHDolh7C1+LDBfMTPanNEDNboFwLahF7hoLM9R7sqpqBANewzDvWkzB
	q1GAyV6AOltotjRod1blPKfWB
X-Google-Smtp-Source: AGHT+IHZM/Db3rJ671u0WvDIe/VvY5UdAh5v59kB6hTOoptlOF4+lnhl6a+lk700LR1ins07EJj9kg==
X-Received: by 2002:a05:600c:34c4:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-453659dccb8mr147036145e9.19.1750772908848;
        Tue, 24 Jun 2025 06:48:28 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb5ecsm147323495e9.8.2025.06.24.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:48:28 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:48:26 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <aFqsqr7i7cdR5-I0@mai.linaro.org>
References: <20250620181719.1399856-1-willmcvicker@google.com>
 <20250620181719.1399856-6-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620181719.1399856-6-willmcvicker@google.com>

On Fri, Jun 20, 2025 at 11:17:08AM -0700, Will McVicker wrote:
> From: Donghoon Yu <hoony.yu@samsung.com>
> 
> On Arm64 platforms the Exynos MCT driver can be built as a module. On
> boot (and even after boot) the arch_timer is used as the clocksource and
> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> source for the arch_timer.
> 
> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---

...

> -static int __init mct_init_spi(struct device_node *np)

__init_or_module

> +static int mct_init_spi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_SPI);
>  }
>  
> -static int __init mct_init_ppi(struct device_node *np)
> +static int mct_init_ppi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_PPI);
>  }
> -TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
> -TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);

Are you sure this is not going to hurt the ARM platforms ? Here the
timer is enabled very early in the boot process while with this change
the timer will be available later.

> +static int exynos4_mct_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int (*mct_init)(struct device_node *np);
> +
> +	mct_init = of_device_get_match_data(dev);
> +	if (!mct_init)
> +		return -EINVAL;
> +
> +	return mct_init(dev->of_node);
> +}
> +
> +static const struct of_device_id exynos4_mct_match_table[] = {
> +	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
> +	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
> +
> +static struct platform_driver exynos4_mct_driver = {
> +	.probe		= exynos4_mct_probe,
> +	.driver		= {
> +		.name	= "exynos-mct",
> +		.of_match_table = exynos4_mct_match_table,
> +	},
> +};
> +module_platform_driver(exynos4_mct_driver);
> +
> +MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.50.0.rc2.761.g2dc52ea45b-goog
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

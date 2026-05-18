Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0015338595
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101844; cv=none; b=DVNbNkZcKlnguaGCtmg82gPtA2nO8SGU5jSZbMdkkJhqrECKUyU+FGHTUrzBetNomrURaaA/dwLEZsw+IbvGsUvDvK3GjMOaXmtfA/O5JWtaXXLgWFSSq4IKygGJ4KlIlGXnx1YTsZVGOzWtVmA4hoLyrPlrKEWCsc7FbbHtwPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101844; c=relaxed/simple;
	bh=cPW19SXjJnBDAagt7qB0/bXd0/z1hFemivJL8yGhT14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/bN6m6HHd5piCDOwIVpPniLU2SqyRcaQMWyDw+3WaCyQ1KFPA1QV4h6m/g5jMBmbQi+PZPtqO+CwnZSrBI55hdz2i/X9fh04lqxZoGl5PkuSyd3BUGPeTpts5Ga2s2QUucECkdbMXrnHyY//xH+EX3hcSMQZso/V1nxtgqc+hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SezkLL2q; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SezkLL2q"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44a5174670eso1083193f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779101835; x=1779706635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ARy9rq4cIvrxa/NBCnY0lb4B/GYtx7QC9maKRt4gYo=;
        b=SezkLL2qU+OvZzl4uRKG/HpRQD+VwEnjDtKX7SClcPsMhbdF2URRw6c8fh2FopfIVg
         DfLE43llPYs54kOs9imV5PdTQZxNAJDTqWjj9fu8Ap7F52S6brqGz69aebGwa6KDY5T/
         1QIk8ZpGER55HonQj1PBdpX3LSEVacOA0JqbJHg0ldXMY8rFwIf8zgcsbkFSf0X7vLew
         bOkDZC7ZQzddyy6YaQ2yRy7AROkXHv0gLGee3UK2cupZhRr4YdpRfn8Be3JV8v/toZzq
         gSjOOJuHBguRtO4FsDJ+t0rU9KNxuwLiQCHQNOOWOR/xJxKBIAeizGL+5y1FF64hjzee
         477w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101835; x=1779706635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ARy9rq4cIvrxa/NBCnY0lb4B/GYtx7QC9maKRt4gYo=;
        b=BBtXw3YhcogWhl32TgQt5rpUcarxULnVhsbUMSkiAAW5GmzGXoz1nRv5R57Uw7RX3k
         MlUPPkSzJxhRGwrwslPsTJVEekQXqnT9kJ9KnngfApOpIpYFZH+G4GValtvMTB5CV3FH
         rJcSywhgJFuykC/LYeynegUbahxjztOYFLV1s8SDJMrbnZlUnFEEWkRm7Zc2WCR5qeXC
         j5h3ODRwL6eHrorCbmxwBaD88M35HnoHUI1YprZkm2jWbyk+iBplJtl1W3KG/uKLnuOg
         Kt7aAEB4s4zwhM4kgraGLYC1OS6O4kE+wd0DMUu7SDiMhRpZ8Ck3eJ8P+vj4dB7vZV6u
         WWgg==
X-Gm-Message-State: AOJu0Yyp8LTOBN9Ym/eutRWcU53qNZZvpI8+7CockAbbaJjFd3MyEtBN
	DjYvcclqTVAryrtj/I3XqVg7q+oYuQDRrk+Dp45YRjFsivhwadXDbyOsLBFFMmaGpeY=
X-Gm-Gg: Acq92OHZcJGd8a91r6GxpPNGaL37QaZpY6s+ZwS9CX8gdu/AxRSnCHUzuwriwEwR4NA
	My4OTeGWAjnjpeWWgYcMcqpgEI4jo3HnvniMsWTLscDwF4zx9zvrDlii6MZn5TBtKJCcb0XBIRl
	q49YKZUqsEoQB9Bw/zof1EfPdQHmoDfBbHQtXqM6TeBDnQfEdLPEsI497ll1TmMVY3v1GmrN9e2
	eWjF8M7ParTvJGX57Tf4Hq52EGna+FFbIdHWLP3taLNq/GM7akyNBGRnG11M4p5DuU4TtIMKqwo
	YbtbbIkCPSONo9+T2KzW3EudreZRvmzEawgrsmjxC8i22B/CK+6xVEbx/xJTO+EFvRPnQu5hJPP
	NtTC+pLqv1FEApDJ4McmJmHz3l5BMVW8/xyO84tUC8tfr4R0QPTxAZz5CcHh4Cqq7Dgks7iWEMi
	tghLdQ0VKRFBMN660oJy9vXdW10+DEE41s3shKxSsDZA==
X-Received: by 2002:a05:600c:8707:b0:48f:fddb:dcd9 with SMTP id 5b1f17b1804b1-48ffddbf75emr131962865e9.27.1779101834543;
        Mon, 18 May 2026 03:57:14 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb029180sm117010795e9.4.2026.05.18.03.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:57:14 -0700 (PDT)
Message-ID: <1c41ecc9-d951-45df-b933-1934e1381663@linaro.org>
Date: Mon, 18 May 2026 13:57:11 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: samsung: acpm: introduce driver data for
 SoC-specific clocks
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org>
 <20260512-exynos850-acpm-clk-v1-1-837532ddbf38@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260512-exynos850-acpm-clk-v1-1-837532ddbf38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/12/26 11:40 PM, Alexey Klimov wrote:
> Currently, the ACPM clock driver hardcodes the GS101 clock variant
> arrays and counts directly in probe() routine. To support additional
> other SoCs (for instance Exynos850 SoC) that use the same ACPM protocol
> but have different clock trees, the driver needs to be more flexible.
> 
> Introduce driver data attached to the platform_device_id table.
> Update the probe function to dynamically extract the clock lists,
> number of clocks, its names and mailbox channel id based on the matching
> device ID.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/clk/samsung/clk-acpm.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
> index d8944160793a..604604b5b814 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -113,6 +113,8 @@ static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
>  
>  static int acpm_clk_probe(struct platform_device *pdev)
>  {
> +	const struct acpm_clk_driver_data *drv_data;
> +	const struct platform_device_id *id;
>  	struct acpm_handle *acpm_handle;
>  	struct clk_hw_onecell_data *clk_data;
>  	struct clk_hw **hws;
> @@ -126,8 +128,14 @@ static int acpm_clk_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(acpm_handle),
>  				     "Failed to get acpm handle\n");
>  
> -	count = acpm_clk_gs101.nr_clks;
> -	mbox_chan_id = acpm_clk_gs101.mbox_chan_id;
> +	id = platform_get_device_id(pdev);
> +	if (!id || !id->driver_data)
> +		return -ENODEV;
> +
> +	drv_data  = (const struct acpm_clk_driver_data *)id->driver_data;
> +
> +	count = drv_data->nr_clks;
> +	mbox_chan_id = drv_data->mbox_chan_id;
>  
>  	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
>  				GFP_KERNEL);
> @@ -154,8 +162,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
>  
>  		hws[i] = &aclk->hw;
>  
> -		err = acpm_clk_register(dev, aclk,
> -					acpm_clk_gs101.clks[i].name);
> +		err = acpm_clk_register(dev, aclk, drv_data->clks[i].name);
>  		if (err)
>  			return dev_err_probe(dev, err,
>  					     "Failed to register clock\n");
> @@ -166,7 +173,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
>  }
>  
>  static const struct platform_device_id acpm_clk_id[] = {
> -	{ "gs101-acpm-clk" },
> +	{ "gs101-acpm-clk", (kernel_ulong_t)&acpm_clk_gs101 },

you need to include linux/mod_devicetable.h for kernel_ulong_t.

With that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

>  	{}
>  };
>  MODULE_DEVICE_TABLE(platform, acpm_clk_id);
> 


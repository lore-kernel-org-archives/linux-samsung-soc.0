Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535CE77A14
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708083117; cv=none; b=PKEYiAqZACnfLXPYlxZJfAqae2/m+WJMQdZF3SWRcO+7hJBmcMvsnTIVyUG9U4XcMxBJOTgIIws3VPmwAqf0V+zzF79Uy0bGZbIJ6d69ATCm97sH+KNDAUh52QUAHa0em6Udf7k57KpvgmxaNqBVt7i6PNLFldgOV+L5wy3ZB1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708083117; c=relaxed/simple;
	bh=UwV6PP9Dy4l/PHEko/rhazRk7bZ5pWgavF2GNsY4jB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXPb5xTrIhfFqGGJhcS/EV0re8cysIabHnkbgXRDpJG+ulbgiHV0dDKulCh4dIMk67w8ZyaCBrBEXrDPAD6M14geXVwRofirLphn5o/EPGXWlHxO2c+Hf755Ca1t9kyOGaA1aVfzKNgzxPhlbMfUSKqMi0dTe5ZcjqT83/QrNrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K5Lv258E; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K5Lv258E"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dbae7b8ff2so1677935ad.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 03:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708083114; x=1708687914; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yTLg2p9rvSPRXvNKR+Iv16WduzUd8WzxwmsQxSSHbjw=;
        b=K5Lv258EC7/0q9VDM7mhlj/jvCDy4xaOetbe37QlFvlSvzrmEK/llqd0ztiRn5LJ3p
         j2AMzYvUL7IYFASyPJqKPJhondmmaW4G9T2s1i+URB5EcaqOVV2wfRaGd8R+Mqf1S6MX
         jVA0wx2Gv/4milh3bC9wHZ6TjFkhAd0WvhOoBQdVPz0OQ7EgsFLlOzqchjk1VZF+K+8V
         Jo9yduEPMLBW9TL9/xprWd8uwTilLwALuOqmA/8zU9FwPstdohqSx1aJfxLbjWnkpyk4
         FREpG5Fv/4B/XpbP3+pmjjRIIdbAuQMmNdjQ0koQ3e0R5edm8WbP/bDDjmjcVuUcRD8W
         lRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708083114; x=1708687914;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTLg2p9rvSPRXvNKR+Iv16WduzUd8WzxwmsQxSSHbjw=;
        b=uOfE0VXkTzDUaykSbEenPn1AtTQh1SOa6GRfV/XqEMG8Rr39+uv4hhZyiti3iloyoF
         vP4nrY2TZ5hSvjLLDlprjO/C7Qqj0J3vIy3K7A1x4sMOIEHSMzuxye0bs1BmdI0Ny91n
         AeUljYuCo0jl02zEifFPaRUpWiQI8QwE5HEIJhsfr0ctqvnZ2SlZEDXltLMeWpSCcF//
         U0AJQSxZZiW2IZZ4M742iXE94Ck38BUPuXcMcmZyJtDeIgwu9I8ZNSQs2Rd6sGXvTc5I
         Wiz1W6Jju+JpJ/xbfajkhReiHxjLFClFoHDvTNt63Uz+xccCS9nJPSJ95k7LC/FThe3N
         x4VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaWNPgIgYOikvD4yL+xa1TBw14nAQw1gRO8oUMMuzX816+JYb5kaqrZLBDLleE1Ywen2EDwUMIGBu16xurMbqOpgilTpDws1DYjQQiRmMUHTM=
X-Gm-Message-State: AOJu0Yx25cDHhaKmZDAcOH7cMCP8/0vaniIBh8O0VbVYyBX+tes/NHDP
	gd0ciucYmyRYlQgjidBQBEEg+zWCkvoImAoZiZI/ylsUOvXe64cCJV1Ez5MI/w==
X-Google-Smtp-Source: AGHT+IGSaTOg2dt+FTkxvX5Wl5p6EaLyGySJFive4sWTF+xzn0NGHSw3oNW6LvNQq58PkNw1txprjQ==
X-Received: by 2002:a17:902:e84e:b0:1da:2a3e:4c62 with SMTP id t14-20020a170902e84e00b001da2a3e4c62mr6071696plg.14.1708083114435;
        Fri, 16 Feb 2024 03:31:54 -0800 (PST)
Received: from thinkpad ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902c60a00b001db817b956bsm2811849plr.259.2024.02.16.03.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:31:54 -0800 (PST)
Date: Fri, 16 Feb 2024 17:01:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, jingoohan1@gmail.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
	linux@armlinux.org.uk, m.szyprowski@samsung.com,
	pankaj.dubey@samsung.com, gost.dev@samsung.com
Subject: Re: [PATCH v5 1/2] clk: Provide managed helper to get and enable
 bulk clocks
Message-ID: <20240216113147.GF2559@thinkpad>
References: <20240213132751.46813-1-shradha.t@samsung.com>
 <CGME20240213132806epcas5p43e394aea91c61797a8cc3a901e0cf574@epcas5p4.samsung.com>
 <20240213132751.46813-2-shradha.t@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213132751.46813-2-shradha.t@samsung.com>

On Tue, Feb 13, 2024 at 06:57:50PM +0530, Shradha Todi wrote:
> Provide a managed devm_clk_bulk* wrapper to get and enable all
> bulk clocks in order to simplify drivers that keeps all clocks
> enabled for the time of driver operation.
> 
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/clk/clk-devres.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/clk.h      | 23 +++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index 4fb4fd4b06bd..cbbd2cc339c3 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -182,6 +182,46 @@ int __must_check devm_clk_bulk_get_all(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all);
>  
> +static void devm_clk_bulk_release_all_enable(struct device *dev, void *res)
> +{
> +	struct clk_bulk_devres *devres = res;
> +
> +	clk_bulk_disable_unprepare(devres->num_clks, devres->clks);
> +	clk_bulk_put_all(devres->num_clks, devres->clks);
> +}
> +
> +int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
> +					      struct clk_bulk_data **clks)
> +{
> +	struct clk_bulk_devres *devres;
> +	int ret;
> +
> +	devres = devres_alloc(devm_clk_bulk_release_all_enable,
> +			      sizeof(*devres), GFP_KERNEL);
> +	if (!devres)
> +		return -ENOMEM;
> +
> +	ret = clk_bulk_get_all(dev, &devres->clks);
> +	if (ret > 0) {
> +		*clks = devres->clks;
> +		devres->num_clks = ret;
> +	} else {
> +		devres_free(devres);
> +		return ret;
> +	}
> +
> +	ret = clk_bulk_prepare_enable(devres->num_clks, *clks);
> +	if (!ret) {
> +		devres_add(dev, devres);
> +	} else {
> +		clk_bulk_put_all(devres->num_clks, devres->clks);
> +		devres_free(devres);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enable);
> +
>  static int devm_clk_match(struct device *dev, void *res, void *data)
>  {
>  	struct clk **c = res;
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 1ef013324237..85a9330d5a5a 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -438,6 +438,22 @@ int __must_check devm_clk_bulk_get_optional(struct device *dev, int num_clks,
>  int __must_check devm_clk_bulk_get_all(struct device *dev,
>  				       struct clk_bulk_data **clks);
>  
> +/**
> + * devm_clk_bulk_get_all_enable - Get and enable all clocks of the consumer (managed)
> + * @dev: device for clock "consumer"
> + * @clks: pointer to the clk_bulk_data table of consumer
> + *
> + * Returns success (0) or negative errno.
> + *
> + * This helper function allows drivers to get all clocks of the
> + * consumer and enables them in one operation with management.
> + * The clks will automatically be disabled and freed when the device
> + * is unbound.
> + */
> +
> +int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
> +					      struct clk_bulk_data **clks);
> +
>  /**
>   * devm_clk_get - lookup and obtain a managed reference to a clock producer.
>   * @dev: device for clock "consumer"
> @@ -960,6 +976,13 @@ static inline int __must_check devm_clk_bulk_get_all(struct device *dev,
>  	return 0;
>  }
>  
> +static inline int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
> +						struct clk_bulk_data **clks)
> +{
> +
> +	return 0;
> +}
> +
>  static inline struct clk *devm_get_clk_from_child(struct device *dev,
>  				struct device_node *np, const char *con_id)
>  {
> -- 
> 2.17.1
> 

-- 
மணிவண்ணன் சதாசிவம்

Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC30C2D322C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753436438; cv=none; b=UchHNHWZ0imiC3RdnSS1CXojQxeEc41VGh7owfayOxVNmV/tQ+XQkjF9a4h3Sm36tE9SBAEkCUuO0zS8A27uE61fRdbw+WUi01ne4h/8TMdzEINzITdkctb5s+JMy3dles+d1Co37UN5cAoEwE4AyqdXQyfWW2fYzhRd9vR5cUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753436438; c=relaxed/simple;
	bh=P1J3icjYc/2BNbZQCJB5BZ80qJIDCLFPNqRomdxH39I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRv3d29kYf9qLJDKgnXik/YpRZAQxiT32HOOym7uaQq11wP9/K0Z8FWorsx+ELg5P5os3Rf1DHSpFumZG7c5X4nVM1XGqEvphBi7uJPFj+WW24kiBwruTv1gNsgu20SpNhL6RFF/FbCxewB9KEPUMy6BTIjMjSVnmTQQTAU690w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BWtgYzlZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BWtgYzlZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-454f428038eso18044745e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 02:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753436435; x=1754041235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44ssHbdRXCrYyyAtxyTkKDOjXtvAc5bmAzGl6tF02xI=;
        b=BWtgYzlZ7yxZicUP4cMA+wGGzRRsuB10b+T/9j2trGZMZid5WVHhMghbAD2Eqop+Q3
         Kctq8uHUxVVw5VfSARivTa/K/IeXDEVIuzs2PAriGh4nS8SPA1TqAr+znl4YGinlvAAs
         u4+8ui1aFGckuV5ACkXVLGVZn93vsgI87Z4mtudaFuABLkKG6I3ow2t3m+nTrCac6x8j
         SeeX0YktUSn+Ia7DN8R0mF8nQHBlciKp4CdPRURITOQwn7wxE66D1Q6NalbhNLk13Z2E
         2CRpbYw8HcngLu38+aJBMjn70rGwnMveP8RNxFTByVYNurUCsZ0d/NVkFNUrEozAuU5D
         xBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753436435; x=1754041235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44ssHbdRXCrYyyAtxyTkKDOjXtvAc5bmAzGl6tF02xI=;
        b=xEA6u/w/1cfiBGxFCGBPULiMPezoNN2CFMieUFwtKBt/k8gHrnYX6MXDYe9AUDBQf/
         rXw7Bi0PbwfFttuCrtGnke4yfGh3EcMDt7yJru37TpVO0xAF0Jfz1Dyknfb7dD/Yfvs6
         m9moxbpS6/HnIlzy2sXIaAANiY7qQzveQKgmTTXdVU8LUKj3OWZlSH7efzysc2YxwCyT
         2i9K4NEnrz7oLiO1H7VEanQ8Gx/h+HLrbNQcM9sJbm/AIrydkpwe1+Ows0x+2T2lyvaz
         yyjM1xBIbRKOzc79UJ8Gc8e9AaeNa4K7wcQR2xFKHKchs6SmjuTqEqZYhXctOm4YOGVM
         fqgA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2jbsPITosPVuy3uxDsQrtFjDTKeC/nxTJwoY6zPx4wiJbVLI+e23zUf3WdzwNjT8yh/V9oCKDRgLJiiodBpquA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkEt3rslqqFlEqH+gfbCTuXI7o3nYiv2tBSBWUZBRCCSlHyycs
	7X9udn84ucx667BbTGriHJu2ejnVsfGXIdmlhJvn55nwbLk/6yij24eEaiudK98JbyU=
X-Gm-Gg: ASbGncsTu5WaD+7wlIYaWZ+brYGtj6b3igOvNt1zz/ycE5tTYsc4lQ70GJNUjwonYVd
	vFk7De0vBxZlg/1gRxW9UJpA3xo3wN3S4Lsl0GC682jnUlrcLAUAML/FANl6oUHZe9L/Zqbg3y2
	WLvA1Cbe17w2H1+YPRMGqI1TmTbZMNJw40/1LMKx0qncTo6RZ8Acb2y5ZRtUGAw2TvlJPYwisRk
	vWOfgXRZiN4DhrSLvMq14OsJJ7JY/UO8Bz8LcoyMLIJlkNhexTFN4YFbCobkPd7d0M45QVwj38J
	8on/6fUVmkxU3QhlhfIwhXf2pZCBEsZYCa+/kt6q7k+sE9+xVBYjcDSkJk6wqQ1Ln/Qq/fxFBc7
	r0Rz6ifPhwR5aMLlMD2ypaGC6D28ZrOaZ0LBo0+GyDMxIc0Cptady7Ycon1H1Ah+ogWBozj6F
X-Google-Smtp-Source: AGHT+IGOE4MKcXHWjyTgJ7GhAdYKgzZsFBV6lx5kihfphiDuGxCqQM/cXPB8xKXyeFvG0Uyggh7qPg==
X-Received: by 2002:a05:600c:628f:b0:455:f59e:fd9b with SMTP id 5b1f17b1804b1-45876549a91mr10063115e9.24.1753436435188;
        Fri, 25 Jul 2025 02:40:35 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b76fc604bcsm4595223f8f.17.2025.07.25.02.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:40:34 -0700 (PDT)
Message-ID: <9bf2899f-8981-4b66-8cf0-b7dd0d617747@linaro.org>
Date: Fri, 25 Jul 2025 11:40:33 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] clocksource/drivers/exynos_mct: Add module support
To: Will McVicker <willmcvicker@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, John Stultz <jstultz@google.com>,
 Youngmin Nam <youngmin.nam@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250620181719.1399856-1-willmcvicker@google.com>
 <20250620181719.1399856-6-willmcvicker@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250620181719.1399856-6-willmcvicker@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Will,


On 20/06/2025 20:17, Will McVicker wrote:

[ ... ]

> -TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
> -TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);

Was these changes tested on the ARM32 Exynos platforms ? Especially did 
you check if there is no boot time regression ?

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


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

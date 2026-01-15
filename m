Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC8395249
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Jan 2026 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483266; cv=none; b=XoNJF0llRPpLYNMSSiPv9lDQRVUaCHyPH6PW+T9q/05AjxinS+WL/yLwU7DsDzysgpOk4Dc/SaI70lU4muATcWqwfKGa8nOQamFTPGNdUcXBtaYTxAELiZ20sRfHlRKAx+ekJw2Nt0ZKwr3n5JTIMk1xXP/Q6dcpZGDtBIdw9lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483266; c=relaxed/simple;
	bh=abcUDzMsgI0NC3SXlFQOTmLmr7KJcSauM8GeBtGxewE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LPwlaVWuD9+fdcTlsjY3cY9hsmznKlCKNvuwBaipPGOsvkffJh3wFZ9PhG8dLHHBlhTAXnIOlDkVm06O18Z5qhATEaML194qGy7zhFHXMyTAJpzSMlFMPUqC/cfUQa5SbCZDRFueXMvR2dDqbwc6QPgSHY5ZpxgiqVCfpQH+hWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlAon3Pp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlAon3Pp"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8010b8f078so154875166b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Jan 2026 05:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768483263; x=1769088063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=po4SDkFceK6L+A0r9CoW5e+XAeuKVFUf0lqkYgvkprY=;
        b=jlAon3PpurmiNxWJFMaLDcAYNMKICmkJqYtl9t8bvsbkTI8e2QStLKRG0ix0u4K+Xf
         FBT0a6gsS02xlw9J3T2s8hOvnUqxmYldl+HR07gQZ8syA9WxINMNlg2I7+46eHx95N4Q
         LzxwsVNdqW28NDIhereW4XkwFVDmmLBCd2en05MpuevG9pYEQ0nS/AGeiahTOclholuP
         4yaVkClhSr7kTI/5eyV782R8c5LteKYjKeNkGxayIFTrgY7FBixIj3B5KPdpEIMWXwah
         fJ7qqfSHUFEP5zEHILOd4i446EEYZ9HFzFgWPMFhNw5opMHvTIwvXZmg0Gnorv+5R2J9
         HArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768483263; x=1769088063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po4SDkFceK6L+A0r9CoW5e+XAeuKVFUf0lqkYgvkprY=;
        b=OZzHn1wBThepx2GuftNgb/t48/n7bAG4SQtzLffdMVkjc1JGucHHzWxyGt+QY1cgW8
         lUWN4kadWXL94C57a0AooutXGI9r2MhaZIhp99ORpXflOuxDXhG+gDOacT6fZRxEMHfK
         k8z20VtwNhINXfCNGQz+qnFLtclks2SGXd3T/uTQ44MTxYPq8Pais+iXwG47wSYbEimM
         DeTzcUno1U+qYHQuSgWhLCUdzjV80AR9KNLMb8EU1BgoNMFeD8Yky0q1zoxkR0IzIEY3
         wITU6EOTm2lWfu8Pw0D1Dg54Bh3B+DQOmrxKQXz7cnvBomK3JyRGtVMG4Puz6lO879fB
         JQbg==
X-Forwarded-Encrypted: i=1; AJvYcCUHQn24GQhCge/vorED10EwN5I08kS5kmomChK+nGTJXcWLny4yfxUPPar2YDOpvEb+PXlu1OoL6w/1EPhp5EzqgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoGeG0vhASvYiwnYkIDWwPkaFmazpYt4+GSsf+/RFT8qywC8Om
	sdm6LUci1KW2JXqlYjz5BDoaUEgGBQPz/R+qMXAIGUTpPRsaBUTAcneHY8eSIf2218w=
X-Gm-Gg: AY/fxX72jVH6NAaFV7C9YnYHlN1WtYYHVlk0PF9qVwTe+VnvpA0Pq/9T0pP5TjSxo3L
	BD5SSPEu6V1lw0nKwCyPAf5hDcfNp2yoBf9XlckXCH/CM7LtVRfE8eY0+GJgtv0PpppuErGJFKr
	LPQRTrOZAJ4d5eDzWkEVvMDC2i6SaV9VvPsDy7wmDQKmoZVRpTC8JK7WfAZzqHW+Z6wRaBtFpmc
	3wqa88vUbL7E2PYKf7dRz3y5t2QbBF+1VeYe8gNHDfDvPZp3csAiMwFQ/+fA49mvmRcC7KT7fu6
	YubqPvY4t6tOEyr6lkVKVQR8kMDUhoStmkcuIyC0FSLhaeGpsLPr9IBkaf6vDYpiNd3AME9UP4u
	wNBr/rThPhqMxcsnd264zTo/nRYGNZ4mi+aXaCKpf/KcqHru+5cCQLidqPG2DP5E9b7O4Uhud2J
	u6J6tV/19bFC3F8qOeDw==
X-Received: by 2002:a17:906:f58a:b0:b7a:39a2:7f50 with SMTP id a640c23a62f3a-b876113a364mr534982066b.39.1768483262801;
        Thu, 15 Jan 2026 05:21:02 -0800 (PST)
Received: from [10.11.12.107] ([86.127.43.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8767042186sm467121766b.0.2026.01.15.05.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:21:02 -0800 (PST)
Message-ID: <f7d75089-732b-42c8-a5f6-2e42e6e82c26@linaro.org>
Date: Thu, 15 Jan 2026 15:21:00 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: defconfig: enable Exynos ACPM thermal support
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-8-cfe56d93e90f@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-8-cfe56d93e90f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/14/26 4:16 PM, Tudor Ambarus wrote:
> Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
> to allow temperature monitoring and thermal management on Samsung
> Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
> protocol.
> 
> This ensures that thermal zones are properly exposed and handled on
> platforms such as the GS101.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 45288ec9eaf7365427d98195c48e2f8065a8bb1b..1bfe37857f51663c9d745cd575f107fef183008f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -752,6 +752,7 @@ CONFIG_BCM2711_THERMAL=m
>  CONFIG_BCM2835_THERMAL=m
>  CONFIG_BRCMSTB_THERMAL=m
>  CONFIG_EXYNOS_THERMAL=y
> +CONFIG_EXYNOS_ACPM_THERMAL=y

I should have made this a module. Will update after I get some feedback
on the rest of the patches.

>  CONFIG_TEGRA_SOCTHERM=m
>  CONFIG_TEGRA_BPMP_THERMAL=m
>  CONFIG_GENERIC_ADC_THERMAL=m
> 


Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8788215077;
	Wed,  5 Feb 2025 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738743531; cv=none; b=PGtrMZsrUSaZeT9wZsPByud5AmMqfW6BkSLAS5ap11IDPGN7GBxS7BVZ2AY+tCIezCQ3NbYA5GW2mDI24aboBaAPr/D/VucyKmduniab1VqtHpqaWdhm4DHVLK3Uk28FIRmPfa0K2Wlzu6GRSTP9D4aJM0DsEwgURaXZJRwQXjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738743531; c=relaxed/simple;
	bh=4yFYHF9xYptZpF0Uo5Lcj/AR1aNAJOWX6ts3nzJseaw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Dplou9QtQj6p2a8xYSiWy3vxaYv06REatIqnTq1A9CuAveAAzHlVYHuqnErwaT23AIJP2kgSy4JOmB3YtN4V8ckBStdzMsiCJGtyBu9UeqfTKBUCuAcL/QLL0f2ZaVssY66+hXQ5ksrYlmk8Skh5y1OMBmr9khRy//RlIfKcke4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQ4uWsNv; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQ4uWsNv"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dce27a72e8so118544a12.2;
        Wed, 05 Feb 2025 00:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738743528; x=1739348328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNW7uXFJKMR9kCFEqLTGkFIRk/6qrajv5bHRhgQljQY=;
        b=RQ4uWsNv3338UCA+ipMQNzPY5G4qwecPntSeEVjnlWU4NRfd2BTGlDcifuU8+gUYj3
         r2828MYLgVf8AeWSR5PNhmCDkuTHhNG8AQYnzE9jrMX56HBJ6jnQED1nmDEnNasECYK4
         /ij++L5Q+zF+VoCzW0m8CuxGa7aG8kbES7i7D628APWDDFzi2bvWo0Foi9DtDdsY+udS
         lb0f4zB7vMW0s3L2TfkeFoFYJTrc759rU5urUTMKmEbwRTDkMlxY2RK0/Q5I2vi77gTz
         aCbXSsPl/dERXhd+ElzujujYmClNxhjg/01U2grmvl4Yc3y5kmkEk1VSDJp5wSkBNsFw
         3P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738743528; x=1739348328;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNW7uXFJKMR9kCFEqLTGkFIRk/6qrajv5bHRhgQljQY=;
        b=h7HZaWg7nxSx21VX3hB9hSHh3jNugelNSSyG2sQ03eyktTWFcUATWZQpbE5FpAUzaS
         CMevZWBOFnqwBsWsFI2/VZaXsw/j+l1NM3dbvgUjPmXvks+KL/ytK67ntEiyWFCsLUew
         BeEgALDyXqkdoNZJShHpEugyoHbUracJYnsPO7P176BJVMqIVAvd0EFvqpqgFf4UZOLC
         HkHTB7hPqqBxyUKhBZGVZHRPAnPHvjX0QHb6bIx/6XeLCtsq1Y35jHDQjXCxFU2i8eOv
         /kdobKaBQCnpmQVcGBKc4xZUBGrlUDdsvEkcVGX+LruceO405W+Zmu0vXEVUZ7gZl75U
         +0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGHT9biXC8PtFFw7pXSDTgi4f3aSCP3VuoX0WeB3sNHe/YT5TvWBB06BTOifY9CLSX7yb4uSzKgnIegdHzWtaZBmg=@vger.kernel.org, AJvYcCXsiXCJCaJd/XHCBgSmBmDJ37QdQW0mEBzq0RoyMR/XaVj/fqluE3cuuKrdAUrOgvIqbzGZQSL4HfuhY80=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs0rEsDQm7I/nyPFxtZ+bdHi3i84Ml0wWKmaHsWd7Kc2+OjkY2
	mMA7D8yxGky4MA7Ar2xC74cIwrKHAfn7fYSRH7HyAEDt8CiMxiY5/oDHXA==
X-Gm-Gg: ASbGncsQeilcQ2qLhUo6zH1H0IeMjhgsxkwBdBamYkPxSNsEQKv+5D32SvEpnjtkD3I
	tNNamafvNta2c6gKl040sLeO5wDvqph4nX0uahxuWDsLx/yfyFNiaFYMGF6QGyRG1+Mv0vcv3po
	j2KdTBsgSavTE9vaw1ci1xnRLp+phnCycJyCeHq5W2jeHdVNCX8aWZgerL8ErRFSdEEARWjKB1A
	CGg1qpK66K0G6aY0vshUdYoUiS81SchhRRJxoG7PeHaBBhDez7ov9ak4E2BlwD6x3MrL/aL7Pna
	BlTOeep6wD5D5A1TnWvvGAz5wkfRXvn2AAItMCL8ZuVjz76EnjHm2vJMM46T5l2pgBTiRA==
X-Google-Smtp-Source: AGHT+IHDbLiE7YoVUr4CvYmahaf4zTpaa81sGHBgInIf/ZKG021o5cEBnKKzmiCc6pqVQHocIMOaAQ==
X-Received: by 2002:a17:906:db04:b0:ab6:d575:9540 with SMTP id a640c23a62f3a-ab75e34dc14mr153610966b.50.1738743527521;
        Wed, 05 Feb 2025 00:18:47 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7008b2c04sm852094466b.33.2025.02.05.00.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 00:18:46 -0800 (PST)
Message-ID: <dc3dcfe1-2706-449b-8622-2783349e8b41@gmail.com>
Date: Wed, 5 Feb 2025 10:18:45 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: exynos: update all samsung,mode
 constants
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
 <20250204172803.3425496-5-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250204172803.3425496-5-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/4/25 19:28, Ivaylo Ivanov wrote:
> Update all samsung,mode property values to account for renaming USI_V2
> constants to USI_MODE in the bindings.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +++---
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 +++++++++----------
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
>  .../boot/dts/exynos/google/gs101-oriole.dts   |  4 +-
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
>  5 files changed, 35 insertions(+), 35 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index f1c8b4613..cb55015c8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -651,7 +651,7 @@ usi_uart: usi@138200c0 {
>  			compatible = "samsung,exynos850-usi";

...

> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> index 387fb779b..b73c152c7 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts

This patch won't apply anymore since gs101-oriole was moved to pixel-common.

I didn't see that [1] was applied yesterday. I could make a new patch that
also covers these changes, but I'd expect the rest of this series to get applied first.

[1] https://lore.kernel.org/all/20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org/

> @@ -161,12 +161,12 @@ &usi_uart {
>  };
>  
>  &usi8 {
> -	samsung,mode = <USI_V2_I2C>;
> +	samsung,mode = <USI_MODE_I2C>;
>  	status = "okay";
>  };
>  
>  &usi12 {
> -	samsung,mode = <USI_V2_I2C>;
> +	samsung,mode = <USI_MODE_I2C>;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index 302c5beb2..473db46aa 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -825,7 +825,7 @@ usi_uart: usi@10a000c0 {
>  				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
>  			clock-names = "pclk", "ipclk";
>  			samsung,sysreg = <&sysreg_peric0 0x1020>;
> -			samsung,mode = <USI_V2_UART>;
> +			samsung,mode = <USI_MODE_UART>;
>  			status = "disabled";
>  
>  			serial_0: serial@10a00000 {


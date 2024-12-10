Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF1153BF6;
	Tue, 10 Dec 2024 21:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733865054; cv=none; b=gkeGgJKrhj4r9q+LzfsHK0m3vWJr3Z5NX1QvdS+5JTFDcPebl35OOe9RGHGaVXfLZjBeJWBGQXR8DUgna89gggtVlSEeRGbo4xvPgJwyhbUIfkPmvOSEt6Og4WZqADnsSIThpDqoJtHm8aNVaZGgLSfSFOV3z2pKJAIIeGmw9bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733865054; c=relaxed/simple;
	bh=rGOHQx90VWljTDL3v5Se9+43mGwPkb6TX1hI7BZD5eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGCmOjNvcu+Rsh8H03VS7pPnM9KYtnJkDAovXalSqKrt4HilCG4A6TsFrFanvaIfKuxKHsX2Hyzg0b4KIzGOgvv7itULr3vetfOskDgN751DjyaKlLnP6IFwr6jJILrOgIbp/0Stq4mxZ2lKuTXk8ZCJ5cPcCgmz3nN2eROK3o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NV6ZU9yT; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NV6ZU9yT"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30229d5b21cso18931511fa.1;
        Tue, 10 Dec 2024 13:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733865051; x=1734469851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/TEMZfbq0jaQ0Bvw7H8/whT9tQxinQCI6Wxd1hCr6Y=;
        b=NV6ZU9yTCtvpbxRyJBRPym9onImYNEqchrAfRQPIThTAMdek9okv1yaitP3Y067OoL
         gYpp/NlqrlMpprHSKzloYbYoPN9U8+8ay1KvrAI+/2G4ElFQy1bGBwEWWYZapBWJQ9py
         tFHd49K5PsXmeMMFqtTDQOCQO+iA+J6H3yHO6cySC1J+bgAK/jVVjOIANfqauKA0TkYH
         lNT6tIy3o7NpJcI+bQ3edvj3agfOvIF8ha/DGg794VZYWgqeR7ukMdavMoc9hvj6REFW
         gQcUQr7U5QmItrfckS7ORVGZ1cfB2lEiXH5+7Cyb3rj2trIgjvMZHpErpBfWPTFwdCTk
         gmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733865051; x=1734469851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/TEMZfbq0jaQ0Bvw7H8/whT9tQxinQCI6Wxd1hCr6Y=;
        b=wgvf2HU/8vzdrosTORskCNi5SJn/F48bH/EljMjOL6mxl997CU5/N+2QfSq7G9MBmA
         +V615xzPsdJB7flfl9lruwcEEUSRbN5nfsVuS5G79LYm1Y/aAetGmNGm9qlP/MrvSNb3
         lJ8rIsj8OLbzmacYsuA7cDvLhTNAMtPWrQirXUe8D0V16Zwpjwn9zpPkVxDx3W8ylrPS
         o4hVrLSh8bsMPE0L/3TIn1CJv/H84ruWTEGmgGftZfCnK2SonwfMC2VEwtGIWZburndI
         eLXcEKhihifuO9E/XRv/WaYaOyIR9WD8gkg0M+wLMYloIPJ+VFkMd1rqku82FO4l7a9S
         aiGA==
X-Forwarded-Encrypted: i=1; AJvYcCUJgQld7mzTVCmJxhhcT6tmjgunf7EBUfCDCKYhbSp2CPH9vh30i+qd1+z7uTwMr41lTUDrfwLv6lOi@vger.kernel.org, AJvYcCX6eg9kAkulbFH/CopO0OzaRnBif4cJEAv99DsQcoWh5i2jXLHhuuTKMHabSnEsDVOC66UWbPoUhLAjP/04@vger.kernel.org
X-Gm-Message-State: AOJu0YziSu9dx1MTj+o18oY5dVPc76FbywEuwLUaWmfp8YNAWSX4pY4d
	mgv2smyMHA3MBlGWaL0NdFr98khWjNY0tJTL/4hjeQ1XNozcID+S
X-Gm-Gg: ASbGncsESpJEZ8r8rwko0jLuKEQlcsyTjnKTD9f5oXrZL9hUt7SfGbiE/9jQBaN1pli
	Q0f9FyQlkZTTX5XftdrSbYeU1SLrvmoFW/YfT52wC3a0apCyo/ZlbuCPUVxNPDvUG+p7qQRHnJI
	SR6nX4nQ9Hk63z3bKRHCeglyuWKp952O3Hw0fhsi0e0PdGY0s1KQXn/lQq6fVhAzboWC5hAEhaI
	N052qqX4vi9Awfk+l6+upe5ld3dA8zON7cWzbsPsYOhJDP6rqM+mA0jyuQs3zKVXg==
X-Google-Smtp-Source: AGHT+IHRit5K/PJSdYi1ezn9KV1uCZK9mQQ4OcVcnES9kI4Wftm++v7qYBkluI6PlbbxGtVfPWA5qw==
X-Received: by 2002:a2e:9a14:0:b0:2fb:510c:7236 with SMTP id 38308e7fff4ca-30240d728a9mr2089651fa.40.1733865050350;
        Tue, 10 Dec 2024 13:10:50 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30220a14d61sm8014071fa.115.2024.12.10.13.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 13:10:50 -0800 (PST)
Message-ID: <768b70d3-910a-42f2-a61a-6338a41f41b1@gmail.com>
Date: Tue, 10 Dec 2024 23:10:46 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: exynos8895: Add syscon-poweroff and
 syscon-reboot nodes
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
 <20241210180216.398165-3-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <20241210180216.398165-3-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/10/24 8:02 PM, Ivaylo Ivanov wrote:
> For Exynos8895, a reboot is handled by setting the bit(SWRESET_SYSTEM[1])
> of SWRESET register(PMU + 0x400) and power-off is handled by setting
> bit(DATA[8]) of PS_HOLD_CONTROL register (PMU + 0x330c).
>
> Tested using "reboot" and "poweroff -p" commands.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>   arch/arm64/boot/dts/exynos/exynos8895.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> index 90b318b2f..9eb89dd19 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> @@ -388,6 +388,21 @@ pmu_system_controller: system-controller@16480000 {
>   			compatible = "samsung,exynos8895-pmu",
>   				     "samsung,exynos7-pmu", "syscon";
>   			reg = <0x16480000 0x10000>;
> +
> +			poweroff: syscon-poweroff {
> +				compatible = "syscon-poweroff";
> +				regmap = <&pmu_system_controller>;
> +				offset = <0x330c>; /* PS_HOLD_CONTROL */
> +				mask = <0x100>; /* reset value */
> +			};
> +
> +			reboot: syscon-reboot {
> +				compatible = "syscon-reboot";
> +				regmap = <&pmu_system_controller>;
> +				offset = <0x400>; /* SWRESET */
> +				mask = <0x1>; /* SWRESET_SYSTEM */
> +				value = <0x1>; /* reset value */
> +			};
>   		};
Aren't those already included with 
arm/samsung/exynos-syscon-restart.dtsi? I can see that the values for 
poweroff are different here though, does it not work with the value from 
exynos-syscon-restart?
>   
>   		pinctrl_alive: pinctrl@164b0000 {


- Markuss


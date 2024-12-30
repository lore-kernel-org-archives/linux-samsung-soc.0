Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC185156C6F;
	Mon, 30 Dec 2024 07:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735545345; cv=none; b=JpRD2sy/ITEM6Nxa/9JgRSU8wEDMsvQQVLtne42q0vzmVpmSwzzNxrFUPnT5LZeIMLHquGyZiG/lhzu4uglKNS8mDFNrDCnE/AaUfIHpgih/sKFWy+1jz37LvBK6kzE+VVeM96RaV9UZHsXRdBSMElRpg3nb7uAQqvDOEVcu4NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735545345; c=relaxed/simple;
	bh=UznonsLB1/1VElz70YeWXmhy2SsBvdwmLQBT9pg45kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pqx0w9tZ6o+Wfb9RtLvbRdLyT1zuBanAGdCIpGBk+H6ZD0vnZVaqDxrbiKr5ah7GQvA1WvCn5aqXm3Ut0RJbzKj3fR42pTps8Vt4RuVHP0HN8hloWUWlK2RVKiXJ37POvb06X8Tb1+wl3nQ/SIhaWoM/va/W1F37GvSvs2WR8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HK+jzUdS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HK+jzUdS"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43675b1155bso74064135e9.2;
        Sun, 29 Dec 2024 23:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735545342; x=1736150142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jPQzETbuKo49mi8wQANfNeYO7kgQRt1+vSf7zU80tA=;
        b=HK+jzUdSWKr0onCvOtB8IzyhIJ36n9rYK8qbNDufUPn4UsPy579lGLEXzE6mkhdAQ+
         +ttM/6e64swcak5Aro/FiZfKBO8rxJAbOWZcnv+lLGussNiHanrCRcK6JfiZl/IpNJEf
         euuKdWfrxvn5RCMeELehW7F8UOqlF8dvWj9bmKajgTCVFsNEmkZcSMw1+F04U4U0t95x
         dNJTYRNeHbsxO9MOAFZZYUIRbZgP38gFgodXVAqWlQpw4ySnp5wh5clfqhzLvQSVXrzj
         0NajeCqKABWUl1lGuRyA9TMnasPVDLQQZaGg+a3XxRCm2S7N7O4/mmsB1BxkWsRjz4Yk
         GAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735545342; x=1736150142;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jPQzETbuKo49mi8wQANfNeYO7kgQRt1+vSf7zU80tA=;
        b=wlWw97y8CLQt1hB4mwiDYalRORBGmBWTdCvwurB4TI1UhvuKgbDxlZll/kYsv/KLWI
         AJ6J65j/zsY0SKvlosVO4dm4t0c+Jea8p8SxrXqDVGuZqffN9Iji7gIUZUtIk9BGxgUI
         ATjbZIDxO597cWLj4SGixWKCn2PQYgSgonJ7wEsOgtr+jM9/Rt9C4RS6ntrlQIfdZjWf
         d4Ee9NMNAF0Sg8UcNexirCDQKdtSNoZC+wRXMoGD2h/iRDaSsAfuNWZDUsFIUVaAIU3x
         WywQHrpVOrFliURL/H9Qjq0LlIWf5isdoJR3b9j9/Ux6l2x841+wB6PyOROIwltAOoST
         VYXg==
X-Forwarded-Encrypted: i=1; AJvYcCWmhoDGVS10r3qXozuQ9sSG10pB7TcQm0wHvZDwva8d1GICVEzlSiBWhTczwkUI/ZtGEXUiYQTC7ZJqVRfz8iUL21Q=@vger.kernel.org, AJvYcCXX0hLMcPTgr1JQotsfsxE2/lXUCkzIRK1HoWJQQTOaNyroZAp7Z2EKtVEOruvtba5/Oj7EkuAGgfuqvaxS@vger.kernel.org, AJvYcCXmvyZjElfwbLlFZIfThw0nxPMqQTYWXUDPevMX3n+JLpeYN1QfEXc3YQuSXhTYm1/hjqVhrKtjvJJC@vger.kernel.org
X-Gm-Message-State: AOJu0YynNB8wFILjDD6giUd1gk6ZheXP+Wij6XEETWsdzcAKfmhpI/FP
	h9L5kyUEqEaar6adETKurs0YNvb4DAsMBZVsqZplgLMxrxewqVkArpBhHw==
X-Gm-Gg: ASbGncvGnFiBO7yu6IKbWCqHuw15GT/ZEoxCyjaBaB7BEQPomDcaASfHA+zdgAvGKSn
	HaxXNeupMI5dYG9nbCmCKe+Ck6JP/8uJL+jwLTX5iNg0yRnlMwUx0IEqAkhkOJpZqW9HHCrN10J
	9oedDnAjzuBxGp/I6ldRGUTGHkRO5EtSKiKTU5tUvXvf1i3XWsJoWDjNy65VPKpIM4HguO2xfLO
	na9H7uuu/rszaOFnF1Nwmk9VKXiQ0Z7djU/t1clKBZpwKvjZZjjx/dtfSJeK58R9aW4fho34A==
X-Google-Smtp-Source: AGHT+IG2dh4UWHVSRIJXHl7OjSsaZff31+ehklabWaUsZJyeJBLzx13CbR+b1hLaxiOcwwHHm6XF2A==
X-Received: by 2002:a5d:5e09:0:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a223fc3d0mr34519211f8f.48.1735545342134;
        Sun, 29 Dec 2024 23:55:42 -0800 (PST)
Received: from [192.168.1.104] ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a8d3dsm29034261f8f.94.2024.12.29.23.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 23:55:41 -0800 (PST)
Message-ID: <a9c25aa2-d61e-4f67-8e88-a214e2b8d628@gmail.com>
Date: Mon, 30 Dec 2024 09:55:40 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos8895: Rename PMU nodes to fixup sorting
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241222145257.31451-1-krzysztof.kozlowski@linaro.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241222145257.31451-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/22/24 16:52, Krzysztof Kozlowski wrote:
> Nodes should be sorted by name but it is also nice to have same class of
> devices together, so rename both PMU nodes (A53 and M2) to use "pmu"
> prefix, instead of suffix.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> I know we have everywhere else in pure-ARM designs nodes "arm-xxx-pmu",
> but this is too trivial and unimportant to change.  I however want to
> avoid copying unsorted-style code to new patches.

Looks good to me. I'll make sure to inform other people too, considering
we should have at least 3 SoCs lined up for Q1 2025.

Best regards,
Ivo

> ---
>  arch/arm64/boot/dts/exynos/exynos8895.dtsi | 48 +++++++++++-----------
>  1 file changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> index 90b318b2f08a..d31d74cc4580 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> @@ -26,30 +26,6 @@ aliases {
>  		pinctrl7 = &pinctrl_peric1;
>  	};
>  
> -	arm-a53-pmu {
> -		compatible = "arm,cortex-a53-pmu";
> -		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-affinity = <&cpu0>,
> -				     <&cpu1>,
> -				     <&cpu2>,
> -				     <&cpu3>;
> -	};
> -
> -	mongoose-m2-pmu {
> -		compatible = "samsung,mongoose-pmu";
> -		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-affinity = <&cpu4>,
> -				     <&cpu5>,
> -				     <&cpu6>,
> -				     <&cpu7>;
> -	};
> -
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -149,6 +125,30 @@ oscclk: osc-clock {
>  		clock-output-names = "oscclk";
>  	};
>  
> +	pmu-a53 {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>,
> +				     <&cpu1>,
> +				     <&cpu2>,
> +				     <&cpu3>;
> +	};
> +
> +	pmu-mongoose-m2 {
> +		compatible = "samsung,mongoose-pmu";
> +		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu4>,
> +				     <&cpu5>,
> +				     <&cpu6>,
> +				     <&cpu7>;
> +	};
> +
>  	psci {
>  		compatible = "arm,psci";
>  		method = "smc";


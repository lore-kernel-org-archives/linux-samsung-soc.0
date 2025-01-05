Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA92313C67E;
	Sun,  5 Jan 2025 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736077150; cv=none; b=PjxoqjtZOU/RCnk8+4rY9COhBzc85gRUCGDTduhLnAXDDwKp6pcROWRSjnKfuzsTs9NrQYko2Q3c7JfSWbafXa2ywc+n8OcD6vRXfozoLSVbSnm4Y1RKMrlFZevQvLM4dEV/wETuPCn0vArJ8YmmLgozAh6fkHUKuDT6CxKmBW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736077150; c=relaxed/simple;
	bh=GbVq4iz1zT4RrXLpGqzBbjuTP7qF+LgILOueB4D24Qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLTlkPa4ja74y9qCoM/4Vxy7oFH2hX7nGdHVvMTTuBo2dkeJVWl1a7pR6kqSrYT+Yro5DqbCb1r2aoMwipRE5WQPb6B/jYD8W1Ol7pKWI8jZJ42g45Y0r1jncHtfEQ5kogAL3O6ZuRfP2MUCD8tUiBywaMX2Q6MdE0tJvSgInn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKI8KNDy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKI8KNDy"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so19257177a12.2;
        Sun, 05 Jan 2025 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736077147; x=1736681947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxu//ISNcCtNY3FBtAgva/sWf04S+B9CxZogSVZoMPI=;
        b=UKI8KNDyJcrYgQf//uFtpXsG5UJ708soRiTHY5ulN+13VwkhxmIVFba+vsNOY4eSNH
         F9ZlfBBJcG1qvE8BabbkkO2drEr2pZ6MxFbMYRXF8Pgv9c+PBP7IslrB9/dBRGVBXl+k
         K+JrXACAeQIKe4TWhGYtBRYzje9hhPvAKNYLtqHiBPuKmspZcVp8yAiIptCambS7mUk/
         g9X8LEe6cgb/TAtvrDW53AzMG5bkorayWuwKEq/jgkVnVL9HgS3WksumpFyVCsXXnmOE
         WSgtTQRxeeQUPhV+wmUTCEP+r+asYDfD7MKrnsDwkF/aW27qz8ju0FjksHEd9uqIQK7o
         HNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736077147; x=1736681947;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxu//ISNcCtNY3FBtAgva/sWf04S+B9CxZogSVZoMPI=;
        b=c6FlYjADa/x+yZshAPo0ME/VniUT2STx78EJjA51Ma8WgvjBnSFZ19kcjlfCGi/0Y3
         vbvEyyaki1x28z876a3ZEhtEnmzQc/Qdv83fIKeI7liuErNhVuLLbpSNJLZmZvkNxVz8
         af0Ci5djwsLXLdnttM3NnYWHD/BSD3thSCaFZyJHqykIDcILyHpjWT4o33rsJZ9DKnqm
         7m0R5LWBCGA0cDC2UKRMTPx+eT1NDkNyh6N+LvfT1S1cK3ZjNpdfpzDqz2jPe1LU9hQi
         UXpRlJXQvLI9936Z//siTcKB/vDeSb0NPjoZ2i8c/ChiJRZR4i8mT9TB4jafkKTZE9vT
         Za3w==
X-Forwarded-Encrypted: i=1; AJvYcCWRnnRCECriFmbQ40sUn5f+pS/qx68DvWVcHs+1oF4g6JqQsJMWFtFaxy2RFKz4F5+lBIHdRkIQywAO98S1x3p6k1M=@vger.kernel.org, AJvYcCX3SAQjrKn6vWsDzvPoY+KyJOdeRqfTHEMr5YKK/VgWSK2E+097Bj/bHHPFjTVXI6JOVm7EXKRXEsOGw1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQV3uv7Q4780uOu5t54zjXGD8BwJR+KeasfOsHeDMSdHq0MiMl
	fX5e+dX1E3Dbp/sKfxok76oN1bvwqVK4rbdsSWaCbEiZmEIDZO3j
X-Gm-Gg: ASbGncs04mAIuXO9OmsnVrSmgifpaRX0wskVakqlZZd7wxwseUq3E6D9udaBlK8/FEh
	IIdNuu+PeZ6cUW1KQuto541jAAgPxKNVNds8Ry1EbjWmw3gCsjcmlgadqfz5Dmv/Xs7UGsQxirv
	eqkgcdac5nk8P6GXWeuMOI44ofYxSRnCJfyFJLLCh8LHQm2N1/ux1+VZW0b87GBcdvHl3EtZU0O
	BnEBIDn1CekHOPSkxvAyP4AgbO5lmpYIoFZbix7mjchmMnKPL0wLTq33FHZ61uPXnfg
X-Google-Smtp-Source: AGHT+IF0csgd6RKoTCBp6b3WBaRUbNGsIKif1YMuHokZ78M4uOjQYYixcVOoJBLzM102/1S2/+WOYQ==
X-Received: by 2002:a05:6402:5189:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5d81dd846ecmr123155836a12.1.1736077146868;
        Sun, 05 Jan 2025 03:39:06 -0800 (PST)
Received: from [192.168.0.3] ([151.251.251.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f1aasm21754982a12.50.2025.01.05.03.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 03:39:06 -0800 (PST)
Message-ID: <bb1e89a5-a83e-4e68-9568-073f9c4a8af9@gmail.com>
Date: Sun, 5 Jan 2025 13:39:04 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos990: Rename and sort PMU nodes
Content-Language: en-US
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/5/25 13:16, Igor Belwon wrote:
> These nodes were sorted by name, but it's nice to have the same class of
> devices together. As such, drop the pmu suffix and add "pmu" as a prefix.
> This keeps consistency between other Exynos SoCs too.

Well, most SoC device trees still have it as a suffix. Perhaps it'd be better to
apply this change for all exynos device trees instead of waiting for other
people to apply it separately?

Best regards,
Ivaylo

>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos990.dtsi | 62 +++++++++++++++----------------
>  1 file changed, 31 insertions(+), 31 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
> index 9d017dbed9523e874891f13258d331c3e829ca03..fc2c5049d764c3f50be7337bc777bb9561f88790 100644
> --- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
> @@ -25,37 +25,6 @@ aliases {
>  		pinctrl6 = &pinctrl_vts;
>  	};
>  
> -	arm-a55-pmu {
> -		compatible = "arm,cortex-a55-pmu";
> -		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> -
> -		interrupt-affinity = <&cpu0>,
> -				     <&cpu1>,
> -				     <&cpu2>,
> -				     <&cpu3>;
> -	};
> -
> -	arm-a76-pmu {
> -		compatible = "arm,cortex-a76-pmu";
> -		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> -
> -		interrupt-affinity = <&cpu4>,
> -				     <&cpu5>;
> -	};
> -
> -	mongoose-m5-pmu {
> -		compatible = "samsung,mongoose-pmu";
> -		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
> -
> -		interrupt-affinity = <&cpu6>,
> -				     <&cpu7>;
> -	};
> -
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -163,6 +132,37 @@ oscclk: clock-osc {
>  		clock-output-names = "oscclk";
>  	};
>  
> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		interrupt-affinity = <&cpu0>,
> +				     <&cpu1>,
> +				     <&cpu2>,
> +				     <&cpu3>;
> +	};
> +
> +	pmu-a76 {
> +		compatible = "arm,cortex-a76-pmu";
> +		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		interrupt-affinity = <&cpu4>,
> +				     <&cpu5>;
> +	};
> +
> +	pmu-mongoose-m5 {
> +		compatible = "samsung,mongoose-pmu";
> +		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		interrupt-affinity = <&cpu6>,
> +				     <&cpu7>;
> +	};
> +
>  	psci {
>  		compatible = "arm,psci-0.2";
>  		method = "hvc";
>
> ---
> base-commit: 7c19e0e190aebd1c879a3913f1a8855a88d73a2a
> change-id: 20250105-pmu-sorting-ec6954b6b659
>
> Best regards,


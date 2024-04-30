Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9766C199D9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 06:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457808; cv=none; b=L/65UBxtHiebR9jU/ZO6jXL57YWHt/i3AdZPkziiTkMUX0GSrTVLdUaFb3kckzx2txBUShzajwKWa/NlBYEYxtj+vWnGa62bX1ICeK/QYcYKqUktLRFl/MgVu0Wcu7MNne/WaRWl7mJ4Sw5HLYBapbWJNL+MUtPw7nA/D0fogQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457808; c=relaxed/simple;
	bh=mlVVoQ8EKhKNlMeGz0t/txrVLhcg207hYhyUJ8O5xOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aEBpC0v1UVxsycX6mu8yvIwdzjHiYHWseAps3k7O5mIwt4Ok9qxMq/PVp73peEKHu+jBCp5aITQOR/NlPcJpcrNaY4WrrgrhcRnBuXFYZ7ss/2g5Sl1o43VH85Is0D2SqSFlyL4uZeLf6SrVXpNmeQ8UGzSH5eqeeNHL4m5UCDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P2p4gaeY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2p4gaeY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e1f3462caso6744346a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 23:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457804; x=1715062604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dXUl5w05mfr1f7LU3XpFKumiK1QWvaHkw8TSSxDnOOA=;
        b=P2p4gaeYDO70fF+NGFBbaaPjJvB37qNT2d8dGPkC3u7HyojNS2n3+XlT42K+I2mQx4
         Q4NpXDa1aH7O+gbs4rTU4nojFhAA2WaLWwjufwkdzKCM0sanedAPvdulUKPq2zYKJ8Nh
         Nal4oPxzbun3chwRHXTXhH9A7erG5OsQ9FjI8x6C5Ct/OU7zQ5qTInFccVlborbjODKn
         cR0WPm1759ZrS66pYb8WTWX/cXzhn71wTYK6m9v0RUE+kYBft2x06v5m12OmPUiOULT0
         f/mlKMpb3sk2OeAwf5A+UPc5uUwgH/SDUE8k4Qn6HJZG2NpiRub+ULBYchxlgIhalk3C
         +DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457804; x=1715062604;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXUl5w05mfr1f7LU3XpFKumiK1QWvaHkw8TSSxDnOOA=;
        b=Y4w6epTbO17qrB1jNEsqBQqP7kLkrTl6aEdL6vN0Bb02ZTK9DYyCxyveExUHgfCiEL
         ljCYuXvjED/yRnAHg00a9LhzjbNat1hdHG13lVMYJgIu997RphftLSIDUpxq/v4Ny3Cb
         D3au34ymsUiMF8+vt2aGsqGiDPooEdWw0ZXmdXzY9BqwW+2nZ2fNpk0GlfO9fG0LvFrj
         VUy7ffG+KgOY5Ql6hjzPMHshic+uI8cMwl6DAZzoDHrrHQDyO4Z90fB3yl3MabKEh3Q/
         ii0aOcffxK+lrYix5iJbnVmvd/KiCZPVLbHpn2LCYiqgWsKl0LPGb5JbGHlUPUKmwRsu
         VdyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0M+QzW6GWpTgkroyiXt0oOZS/4exoU4dv9rRsAJdrRoqxsgHnVkLUhXHJvVq8bHlj12YLY+XE42TOQA09Q6KO5jY6G3j989Kmnf8E5B3sR98=
X-Gm-Message-State: AOJu0YyGl75HXUvJS6dk+hgM7kwI/FycI5WWDaa5eJmlM2iBidT9mUki
	VEeXjcX0nOSb+T4CpDqRoqrEGn/6ZHhXBHrUMgvnVoeHQTSnfysPiJJxTG4scrA=
X-Google-Smtp-Source: AGHT+IEUIcLKj0a4ZEsXB4H+TFiSNNTIAb064lFNb3xcBFN9buBPo1qpy1IhWRlWhD0j7DtItwqcCg==
X-Received: by 2002:a50:cd9a:0:b0:572:4702:2227 with SMTP id p26-20020a50cd9a000000b0057247022227mr6785671edi.35.1714457804215;
        Mon, 29 Apr 2024 23:16:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id ev9-20020a056402540900b005725de35790sm4095653edb.61.2024.04.29.23.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 23:16:43 -0700 (PDT)
Message-ID: <7b38a91b-d8a4-49c3-8ed4-a4c753e2d4e4@linaro.org>
Date: Tue, 30 Apr 2024 08:16:41 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: exynos: gs101: specify placeholder clocks
 for remaining pinctrl
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240429-samsung-pinctrl-busclock-dts-v1-0-5e935179f3ca@linaro.org>
 <20240429-samsung-pinctrl-busclock-dts-v1-4-5e935179f3ca@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240429-samsung-pinctrl-busclock-dts-v1-4-5e935179f3ca@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/04/2024 22:04, André Draszik wrote:
> The pinctrl instances hsi1, gsactrl, and gsacore need a clock for
> register access to work.
> 
> Since we haven't implemented the relevant CMUs for the clocks required
> by these instances just add placeholder clocks for now so as to make the
> DT pass the validation checks.
> Once the clocks are implmented in the gs101 clock driver, these should
> be updated then.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index f8fcbbb06e7b..6db2c9bbb371 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -180,6 +180,14 @@ HERA_CPU_SLEEP: cpu-hera-sleep {
>  		};
>  	};
>  
> +	/* TODO: Remove this once all pinctrl clocks are implemented  */
> +	clk_placeholder: clock-placeholder {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +		clock-output-names = "placeholder_clk";
> +	};
> +
>  	/* ect node is required to be present by bootloader */
>  	ect {
>  	};
> @@ -1309,6 +1317,9 @@ usbdrd31_dwc3: usb@0 {
>  		pinctrl_hsi1: pinctrl@11840000 {
>  			compatible = "google,gs101-pinctrl";
>  			reg = <0x11840000 0x00001000>;
> +			/* TODO: update once support for this CMU exists */
> +			clocks = <&clk_placeholder>;

<0> does not work for you?

Best regards,
Krzysztof


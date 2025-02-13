Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6AA20A5DA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739432322; cv=none; b=dCbPsssPAdVzrDPHYrTh2PaLYPLGKKlG395vm5z2U4EmviDnzSIq+/kPPy+oodyvsTYNYbchda2L/fLfOTXs6TPcEQbAzgRV23LNBTI/0AVwMNR3nuv393MO4TI90WL+wHmJ/45mI2xquYSJsw1NIYXMnzu7We6afEuIpLApDBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739432322; c=relaxed/simple;
	bh=8jHSN2t8uUr6bZE59ZIgxIuRdzhSTrE+DV+sY0qnFvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kRgaBfTJuxF+mb3uCcb9BSVycomcvaDc2BfdmmowrMZSoMIE1SfIEX1wUbrvFjTDzzrcz2ha6DrAW8LKxOS418coG2DzFIEPZkejXHcT8jcCEXXDAzdGXvW8Ccq09oAD9yL+McdE5wgvzyk+a2UhQSZralQIOHpT0jWWraLdGDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I8ix8+h5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I8ix8+h5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7c501bbecso69552966b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2025 23:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739432318; x=1740037118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vizM0Sdo+SZTTaKpC/1DIJWgscYtW1gDxvN+iGD1EdQ=;
        b=I8ix8+h5HXOpyihMVRUKJsDe3uarftXe8rpi/HxrHsqd0ty9rT6EJTAuH37ihdvqv0
         ecPxyOotLIJjY80eaYTkMR1q2QiSOhi6eYKuQJdhSsXCBb70o5mVUi0vFD57BKsokLhR
         4GR5TenRGEtIqLdU0HOYNIhdCnzlgQ9A6Kc+7lm3r82ig263n70k2h29O/EyuGqzHj/J
         UBbQE/ZAkgyKSuBx87BpPRv/0C8C63ArB8a4FM7lyf7rkVaSnktj7yRi+KgYe4/w6fEn
         oYWLev248td5hbl6OqUZ6L2/aNVOryDt6D9b07dSmVKStnOMEL7dpAW22isBoogtkRTp
         inyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739432318; x=1740037118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vizM0Sdo+SZTTaKpC/1DIJWgscYtW1gDxvN+iGD1EdQ=;
        b=LG80zxEttwS39NWXFJh8XeGL9w6wX518m++M4QIowUnAynEBMYigal23zwvfFZboAI
         kReVvzLVwCKD1PLwPUoZdq/xb6aj2Lve/WT5yuBGOMt0x1c6UohaqHCOSGRPXH44aCg6
         z0ldg2E3hUcPsHZDhCijun/bTuy7TBGVE4Y1sz6ZH1H6G2ldg6ycpvC4YU8/cfEIzDGb
         6S+E4UyIQswhj6div4doY+Y2Qxl0j4VipHsAEamw0+NGWUY/GE/ptJE5ngiDPZzl9jRL
         FtaQ7WpMJ6eir4rsYjIe+La35O7QoBMU8E8tdlyw2/mM/lRDc5qffQj47DmpfM7ixdnH
         1u1A==
X-Forwarded-Encrypted: i=1; AJvYcCVitIHSuU2yVcS5HGZdtbw+0scAlkrcH+/sD62zdH2tLE7p0RX595vMjUey1v+lrT8PRVJHvHDRzukOM1b9vQ8wng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZp5xUT2Wf7uuSTKdkEnDGU/AWk3JrlOeSBekgvcOXFoeWJOd
	vbpvYqmVn2apRMANUA8o2HU5M97QuCuCRSuC53zb4+iUbfJpALo89r5aX7HAVh1Qk4qDv0A9/VJ
	f
X-Gm-Gg: ASbGnctJKLvCmyZcK/RGitRpy4ivO59YIK8kpMZNGPC+imCBor69MBrxgbwsjqZsrb8
	RU+h2hKVwxVLhPZgRjJRVS1FT5/y0vYBI2ran3GFbcfedIIhqXUeA4+Spapzi7iLr1npIm7ypk9
	rYsaP9iycq1Yi4c7Y/5u/vLQYnpR3EBH1p+P3c0cQIUfAAijeZXe29bJzswS+El2ik0AoR9jOBQ
	3we21HWHvLX6MS8s4dXDUKPSqOf7ETkBbS5un3jzJoGcQfLHrarF2ho/m8Rwu6lH0uY812zftX0
	e14TfggeMJvid3/ekJPQILXW
X-Google-Smtp-Source: AGHT+IHDPN30IeTPgZSQ6r4lGFgS4tkcB9qst37osdGIW9i7ciqPaXGYBjTXuWeMR8vFNohAyFOWCQ==
X-Received: by 2002:a17:907:1909:b0:aa6:ac9b:6822 with SMTP id a640c23a62f3a-ab7f3344473mr607557566b.12.1739432317767;
        Wed, 12 Feb 2025 23:38:37 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53259517sm75356766b.65.2025.02.12.23.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 23:38:37 -0800 (PST)
Message-ID: <40370a0e-775b-42e3-bb6c-8cacaa0482cf@linaro.org>
Date: Thu, 13 Feb 2025 07:38:35 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: exynos990: define all PERIC USI nodes
To: Denzeel Oliva <wachiturroxd150@gmail.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, semen.protsenko@linaro.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
 <20250212234034.284-4-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250212234034.284-4-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/12/25 11:40 PM, Denzeel Oliva wrote:
> Universal Serial Interface (USI) supports three types of serial interface
> such as Universal Asynchronous Receiver and Transmitter (UART), Serial
> Peripheral Interface (SPI), and Inter-Integrated Circuit (I2C).
> Each protocols can be working independently and configured as one of
> those using external configuration inputs.
> 
> Exynos990 SoC defines 18 USI nodes in PERIC0/1 blocks.
> Nodes have different depths from 64-256 bytes.

for the reviewer's peace of mind you shall specify whether you tested at
least an i2c, uart and spi node.

> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos990.dtsi | 1693 +++++++++++++++++++++
>  1 file changed, 1693 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
> index aa056fdae..22ec92a45 100644
> --- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/clock/samsung,exynos990.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/samsung,exynos-usi.h>
>  
>  / {
>  	compatible = "samsung,exynos990";
> @@ -248,6 +249,808 @@ sysreg_peric0: syscon@10420000 {
>  			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PCLK>;
>  		};
>  
> +		usi_uart: usi@105400c0 {
> +			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
> +			reg = <0x105400c0 0x20>;
> +			samsung,sysreg = <&sysreg_peric0 0x1000>;
> +			samsung,mode = <USI_V2_UART>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
> +				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
> +			clock-names = "pclk", "ipclk";
> +			status = "disabled";
> +
> +			serial_0: serial@10540000 {
> +				compatible = "samsung,exynos990-uart",
> +					     "samsung,exynos8895-uart";
> +				reg = <0x10540000 0xc0>;
> +				interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&uart0_bus>;
> +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
> +					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
> +				clock-names = "uart", "clk_uart_baud0";
> +				samsung,uart-fifosize = <256>;
> +				status = "disabled";

node properties shall be specified in a specific order. Follow similar
nodes that are already accepted, gs101 is one.

> +			};
> +		};
> +
> +		usi0: usi@105500c0 {

cut

> +
> +			hsi2c_0: i2c@10550000 {

cut

> +
> +			spi_0: spi@10550000 {

cut

> +			serial_2: serial@10550000 {

why not serial_0 since you're in USI0.

> +		};
> +
> +		usi_i2c_0: usi@105600c0 {
> +			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
> +			reg = <0x105600c0 0x20>;
> +			samsung,sysreg = <&sysreg_peric0 0x1008>;
> +			samsung,mode = <USI_V2_I2C>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>,
> +				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>;
> +			clock-names = "pclk", "ipclk";
> +			status = "disabled";
> +
> +			hsi2c_1: i2c@10560000 {
> +				compatible = "samsung,exynos990-hsi2c",
> +					     "samsung,exynosautov9-hsi2c";
> +				reg = <0x10560000 0xc0>;
> +				interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&hsi2c1_bus>;
> +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>,
> +					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>;
> +				clock-names = "hsi2c", "hsi2c_pclk";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};

shouldn't you define serial and SPI too?

> +		};
> +

cut

> +			spi_8: spi@108e0000 {
> +				compatible = "samsung,exynos990-spi";
> +				reg = <0x108e0000 0x30>;
> +				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&spi8_bus>;
> +				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>,
> +					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>;
> +				clock-names = "spi", "spi_busclk0";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				fifo-depth = <256>;

that's a first. Does downstream define any SPI node with 256 bytes
FIFOs? Would you please point me to the downstream sources?

Cheers,
ta

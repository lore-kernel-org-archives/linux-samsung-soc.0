Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA0E38DC8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 06:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739515788; cv=none; b=U1oxf9eOVYIUoM5TAS0Igjlcwf44AIGVu+QLbjleU0DXRLsiQNQnsbmkJXKIGnJ+HQ5M9FDdOo7ZFpy3MkQmDviZh7uoTkNjrzrrcMHYY92vBd0QE4+1mSSL2GOK6900ZAL4QX0/01WnGXMQ0HnFn0/ACyZKHK4H/1pfA16AQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739515788; c=relaxed/simple;
	bh=Xs5or6MPmdNngz9M/73X/9SEiBgnuHt1Tu1I11/i0G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4TtqrT/Xaz5UPyQD6y5teQmRT1DweRj9NCG9K80EdUBDl1fXgBYifmFQOSVRgeuAo4Ex8WZS6HM2nCpUq2bJfeVEYFhPpyT6ujdeSoWreG68G4IemZ+NCo+jcCZCsPueDYBMrOrB3MdiMiNX6MHK9z0Z+oRxFvZkUmkhDaDRd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vs7K4ElC; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vs7K4ElC"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so3133695a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 22:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739515785; x=1740120585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gawkt9In8aJG8h+rAcH7YnbMFtyCA6IgsBVkBeTJrC8=;
        b=vs7K4ElCka9yq4vnbriN9nknHdak8yUnNbebAZITCT30Ha8yFOwL660MHmTzLvfSz/
         lhJlnqR8T/JCjhao58BmeT0iqFFYiOiwTtKJg7dUBTDhDGb/3w7ClCXG9IKVVaU6Nhul
         ntL5vlcBW6tuXFLSnRVuFqxfhUs5JqUEr2QF1f+yQedh7jL3wUVmIJZmsGx4kUegVEM2
         srVs+ncOSsaaMRY4vOTRS5T7tfIgi86bLa6cY607BSwgwA7O1PfeYkXgNyT6Bd6ajTb+
         V5V9lua9e3Cip9k+yUo1tD9VdO0Zymb8i6ZXlveTbT/vrxfDNvR3U7Ace9o3cZ1bD/iv
         GWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739515785; x=1740120585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gawkt9In8aJG8h+rAcH7YnbMFtyCA6IgsBVkBeTJrC8=;
        b=hRjm266RiVhiaaXPBpfrcbBw2o/Zqu3+8UakjujpynApXMINNNku4qWhH6MHY4n2gD
         LZXGFBSY/KQVf5Yaobftz/C8lij42sfAVQbd6YDwGCKTsDe+FZPNbaxxO4rszclR7E3i
         rbUm2ejfLvwmqxcd2DYA4+1/HmnYA+KLl83+G6+Mb0P945bGbLic3qhRqo26zPhXGu9y
         nmMTu/p6Fzno32+qEtx2qUZT02znQ/RzP2xcY1zTGAr24cvUWaCyAr1p8+M3lzleunyY
         5WuZHEgfI9GKCZMaXaLPVsib90mTyzV0+cWbFJy5tH6v+bByehfME1/3AU8U750xJvME
         1wDg==
X-Forwarded-Encrypted: i=1; AJvYcCXbo7b02EMhOM0jvAxCo214uCGByzPCXRDnC5yRLUOML3qA69+W2/Rl4NI/NNZ9yDsGM6EXYswYO491D7nwznwpvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPskhs/4XNYgc2CpL4bH20wtNGo9K+EYGT1uYJTivgzFLxlc3
	7mAha/HU/7//JqBkMbugvOC124Ic3nO6iPK7mxyZ8aN0zJ101Y51IFi1TdOVi6o=
X-Gm-Gg: ASbGncskdIRMz4pDTjlC3hW/CbAJBI12jpuQY3pfrG3Jlpqqdn0veebfscEzZc8IFKJ
	tpQQggaICe7y2E9vFqQ2hsxB6ouJ+adNm2+hcQPaNI/L0c92ZRa3/9/zPlZWCEBuLIcIteiNbsN
	H3PdrVDzUKB0RKMfaai8zb6PvWF7CV8nAQJfyRdNO0iDgohsQMcgQRA/Cnz0C8/CXpgPUoVyu+5
	QUxZ+ycHe4iPnGoJ/JmUsbRwxYlg+uXqW2d0ES4nmAI3CEg91/vOsN6BJXWnbmdV2V03jbRiRCE
	RgvYcu9JPbuuYhETpMRYG4eL
X-Google-Smtp-Source: AGHT+IFxiW3VpQW8qQ1jo57FdhoTZVGZoXp1u38iJkHijnUvtqdcxoOB5BNSokQAT/jC+GtZYlbZyQ==
X-Received: by 2002:a05:6402:274d:b0:5de:5263:ae79 with SMTP id 4fb4d7f45d1cf-5deb08813d5mr8694445a12.12.1739515784670;
        Thu, 13 Feb 2025 22:49:44 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece287cebsm2386431a12.74.2025.02.13.22.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 22:49:43 -0800 (PST)
Message-ID: <2ed6c5d8-b559-4ffc-b08e-412bab1f7917@linaro.org>
Date: Fri, 14 Feb 2025 06:49:41 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: exynos990: define all PERIC USI nodes
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: alim.akhtar@samsung.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 robh@kernel.org, semen.protsenko@linaro.org
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
 <20250212234034.284-4-wachiturroxd150@gmail.com>
 <40370a0e-775b-42e3-bb6c-8cacaa0482cf@linaro.org>
 <Z67f+lDxISVubiJJ@droid-r8s>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <Z67f+lDxISVubiJJ@droid-r8s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/14/25 6:17 AM, Denzeel Oliva wrote:
> On Thu, Feb 13, 2025 at 07:38:35AM +0000, Tudor Ambarus wrote:

>> node properties shall be specified in a specific order. Follow similar
>> nodes that are already accepted, gs101 is one.
> 
> Not all Exynos SoCs will follow the same order

you an fix them then. Please follow
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

> 
>> <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
> 
> Is
> 
> GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_4, "gout_peric0_top0_ipclk_4",
>      "dout_peric0_uart_dbg",
>      CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
>      21, 0, 0), [Mainline CLK]

I don't get this reasoning, sorry.
> 
> You can find it in the cmucal-node.c driver downstream of the kernel. [0]
> 
>>> +			};
>>> +		};
>>> +
>>> +		usi0: usi@105500c0 {

cut

>>> +			serial_2: serial@10550000 {
>>
>> why not serial_0 since you're in USI0.
> 
> Because it is simply displayed in the exynos9830-usi.dtsi [1]

I don't think it matters what downstream specifies for labels. Use what
common sense says.

> 
>>> +		};
>>> +
>>> +		usi_i2c_0: usi@105600c0 {
>>> +			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
>>> +			reg = <0x105600c0 0x20>;
>>> +			samsung,sysreg = <&sysreg_peric0 0x1008>;
>>> +			samsung,mode = <USI_V2_I2C>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>> +			ranges;
>>> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>,
>>> +				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>;
>>> +			clock-names = "pclk", "ipclk";
>>> +			status = "disabled";
>>> +
>>> +			hsi2c_1: i2c@10560000 {
>>> +				compatible = "samsung,exynos990-hsi2c",
>>> +					     "samsung,exynosautov9-hsi2c";
>>> +				reg = <0x10560000 0xc0>;
>>> +				interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
>>> +				pinctrl-names = "default";
>>> +				pinctrl-0 = <&hsi2c1_bus>;
>>> +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>,
>>> +					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>;
>>> +				clock-names = "hsi2c", "hsi2c_pclk";
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				status = "disabled";
>>> +			};
>>
>> shouldn't you define serial and SPI too?
> 
> As shown in the node it only uses i2c which
> corresponds to the exynos9830-usi.dts. [2]

If you can't specify all the protocol modes for all the USI nodes, then
make it clear in the commit message.


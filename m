Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BAF308F10;
	Sat, 16 Aug 2025 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755375936; cv=none; b=YujDUKhZwvp2v3Yup4oRrlcj9De4ww2T6neIaksKsqPYcX8l+W4lMmTgx8CjwJdSxQbxYJIgsx9iqgTNZ1jFTAqMBkkzByn0qD8ctgSs2wXvwDpc7u548V3VYeLCfjN+iE7P0gKNbRCabtuLR5SQX4Z01aZ5slN6ghKArwupZoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755375936; c=relaxed/simple;
	bh=V5sHBvzKiKbyC0HS+C12R2UIv3iy9LB4iNU3ITJUmJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erHf2Ttlw47+BpRWYiWFYpYyN06NkTq5cd1lk+An6P+7ZsC1y9YqJJ7NZEj0uoIcfawhdgiYOJHWHSDAgWQng3wqdePaYarFQ1SHEt6y8hqJJdwO6pkcKcV6/0cMErqURR1b4pCLqSa4aO7nnth8/m8S9OUt0f73uT9TKi0nvFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiM0WFkY; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiM0WFkY"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb72d51dcso430097666b.0;
        Sat, 16 Aug 2025 13:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755375931; x=1755980731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WcD3nugSsGlA7R8ScK+UpMyh1oFcwdgjxZAlDW/hpA=;
        b=FiM0WFkYGqCJDjoniSYcLqkhLG/tF597lhjCzzCJbSOjsS8UUKGzt9Or3o8NwSF5gy
         T/lFQ/DHzTN82w2/ZnEuH4zTr89QMAM0RDRr36A2vrHHe31Aq6Nip36XFjrSz4TyADdU
         WkARl2A6So6kITtJjHEUYxO/dAAft/JMpeUqcg7vz76TaRbwkdCILny0c0NvZcA3MBPD
         LM9wUQ/mj6xWGW0tvFL38FCt5vMXBsFGfnHJcvC7+SU1sgb2mf/mW3Y617/AE0O9dwKQ
         zLowGbsUsTeKL/Z3TcCxGpi1VeIVB/yf2XNg//aCwDWF7JGsnosm45iR3lbvVwCrqBp1
         5jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755375931; x=1755980731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WcD3nugSsGlA7R8ScK+UpMyh1oFcwdgjxZAlDW/hpA=;
        b=fLxAJJoh6pUo9wSDbiBTZ54iTJ3AV3yozA128VqzuYccHiSoIxhoz2MUEvXK+36/fx
         XULG85W+lNYaOUvCnZT+9ERYioVXlktm+e2yqANRJQHaEbRtwNCWSCaCtQsNsETYKqUh
         lPLhFEx3kG4oYAfFnZf2OOW6pdnnhc8zF4hUW8Xkau6ZUpOw+qznXPiJlJL/I4PuROQz
         uilVbUmEumrW1TRg523BQB5HXNnse2El4LPwJ4KIgD578SP0R5O2038OMRlKjBl4NUpC
         Tn/ad7vy6q7A0uWLgH4Bs4Ke+b/R6Voa3Q2ESWQIw46WC13W4cVtGMjcUtm7nmXpTELX
         eDtw==
X-Forwarded-Encrypted: i=1; AJvYcCVDULX3zmjOPXDbmN9fgWBodEUCfM0VJM0Z6rMMQUBNjI4xC7DjCn5VNz95NymSQUiz4rf3KkHMCS56Df5x@vger.kernel.org, AJvYcCVjXSjLqZ9WOHkI2s2YSBexxfKaqPyd+zgdtrpacVPnvAyRUHVMFkdk4pEb883whrETvH3ukrgMSb++XnCUrj1wuyE=@vger.kernel.org, AJvYcCVstGF9UGIszg8iXVT8I0khAFdhJ8iyhD1DDNIaJNeDatYEAACSOtd5LdLg3z7rerIV6woIJnCGxpRO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn+8h+Qrs7PNQGt4A3sLDLlqw9rKcEAuzOM5GOO/TeJIVJq8Ha
	uVVOfMBAhctFQro+0LADYBGi5BXixuVOU3I/QU7Fkph5urLlVBjwNnfE
X-Gm-Gg: ASbGncujDHte6ZlbG56GZdvSWLPXrMF9XTJpQRn4tVHjW4JBj15NPKjIKud0X/t+j3t
	2zAC9sPBi0zunFabGQEYlu/BLisj2SCWqvuxdzpNelSG3m2yl2Gh6IqEFiMdCAJMHkq59lFFNTi
	UF6YDgYpkNPDndO6mKFOgDYqF+G/iYgOKoVk60TkFYtUXSq0anLa3PyEO+PtUaijF2y840hdtZW
	Za1lLnXixfcIlK3xGoCh+w1K5+pbfGRh40qU90g9UvI2DBOVJWzkKd71MbH9UHjADkFADrGtf2U
	oJ6PEOr/z25qAIqsBJ/SExrbLpd431CgPYCIlM/Zy015XBae4QRA2fBSTFsVI+SjcitdCHv5sEH
	/aKRS4d6OGig8vlkeHXhhQU1Y28NXaA2OKw42Ce70IxX9+IaaCiohxa0OTWyj3VFasoYKxvHVcI
	wP
X-Google-Smtp-Source: AGHT+IFk3/a+8Lyt9KnMRBchpPeIe851UYQKa9GGMdx0QhoCr6PDYoRHhxyvXBiyVog0FOF7Lt8Kdg==
X-Received: by 2002:a17:907:3ea6:b0:ae3:5d36:aa6b with SMTP id a640c23a62f3a-afceae2ff9cmr311071466b.36.1755375930355;
        Sat, 16 Aug 2025 13:25:30 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72d5dsm451120166b.37.2025.08.16.13.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 13:25:29 -0700 (PDT)
Message-ID: <b14d8622-1a6b-4e63-ae3b-fbe5f642ab0d@gmail.com>
Date: Sat, 16 Aug 2025 23:25:28 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: exynos2200: define all usi nodes
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
 <20250815070500.3275491-5-ivo.ivanov.ivanov1@gmail.com>
 <CAPLW+4nqB=N1Oa=S=24w-EUvpi6YneOrsLdWUei+mynYQ8QVgw@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4nqB=N1Oa=S=24w-EUvpi6YneOrsLdWUei+mynYQ8QVgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/16/25 21:00, Sam Protsenko wrote:
> On Fri, Aug 15, 2025 at 2:07 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> Universal Serial Interface (USI) supports three types of serial
>> interfaces - uart, i2c and spi. Each protocol can work independently
>> and configured using external configuration inputs.
>>
>> As each USI instance has access to 4 pins, there are multiple possible
>> configurations:
>> - the first 2 and the last 2 pins can be i2c (sda/scl) or uart (rx/tx)
>> - the 4 pins can be used for 4 pin uart or spi
>>
>> For each group of 4 pins, there is one usi instance that can access all
>> 4 pins, and a second usi instance that can be used to set the last 2
>> pins in i2c mode. Such configuration can be achieved by setting the
>> mode property of usiX and usiX_i2c nodes correctly - if usiX is set
>> to take up 2 pins, then usiX_i2c can be set to take the other 2.
>> If usiX is set for 4 pins, then usiX_i2c should be left disabled.
>>
>> Define all the USI nodes from peric0 (usi4), peric1 (usi7-10), peric2
>> (usi0-6, usi11) and cmgp (usi0-6_cmgp, 2 pin usi7_cmgp) blocks, as well
>> as their respective uart and i2c subnodes. Suffix labels for blocks
>> in CMGP instances with _cmgpX, and follow the naming conventions from
>> the vendor kernel to avoid confusion.
>>
> Just a note: upstream kernel community usually doesn't care about
> downstream/vendor kernel implementations, and such references are
> often frowned upon.

Yes, I'm fully aware of that.

> The reason is that the vendor kernel code often
> doesn't meet upstream kernel standards (to put it mildly), so it's
> totally fine to re-implement a feature from scratch before upstreaming
> it, if its implementation in the downstream kernel is subpar (even if
> it's a device tree).
>
> If by saying "to avoid confusion" you mean some ABI can be broken
> (e.g. between kernel and user space), please elaborate. Otherwise I
> don't see a strong need for someone to be able to cross-reference the
> downstream and upstream device trees -- they are usually two
> completely different beasts.

What I mean is that:
- I fully expect people to blame me for introducing broken changes, because they
copy-pasted an i2cX device node from downstream to upstream and it
doesn't probe, even though, yes, upstream does not care about downstream.

- as I said earlier, clocks are already defined, so we'll have stuff like this:
usi8 {
clocks = <&alabala CLK_DOUT_CMGP_USI6>;
...
}

- I think the buses are numbered like that due to their physical pin order rather
than address order, and now that I think about that it makes sense, doesn't it?

But yeah, I think both routes regarding the naming have cons. Very sad that
we have to discuss this, thanks Samsung.

>
>> Spi support will be added later on.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
> The whole node naming scheme here still feels a bit of crazy to me,
> but I don't have any strong objections, so:

It's just naming anyways. I wonder how the TRMs handle names. Probably similarly,
considering s-lk also uses these names?

Thanks!
Best regards,
Ivaylo

>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>
>>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 1361 ++++++++++++++++++++
>>  1 file changed, 1361 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> index b3a8933a4..933ab7818 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> @@ -7,6 +7,7 @@
>>
>>  #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/soc/samsung,exynos-usi.h>
>>
>>  / {
>>         compatible = "samsung,exynos2200";
>> @@ -314,6 +315,76 @@ pinctrl_peric0: pinctrl@10430000 {
>>                         reg = <0x10430000 0x1000>;
>>                 };
>>
>> +               usi4: usi@105000c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x105000c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
>> +                                <&cmu_peric0 CLK_DOUT_PERIC0_USI04>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric0 0x1024>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_8: i2c@10500000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x10500000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric0 CLK_DOUT_PERIC0_USI04>,
>> +                                        <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c8_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_6: serial@10500000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x10500000 0xc0>;
>> +                               clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
>> +                                        <&cmu_peric0 CLK_DOUT_PERIC0_USI04>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart6_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi4_i2c: usi@105100c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x105100c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
>> +                                <&cmu_peric0 CLK_DOUT_PERIC0_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric0 0x1024>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_9: i2c@10510000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x10510000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric0 CLK_DOUT_PERIC0_I2C>,
>> +                                        <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c9_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>>                 cmu_peric1: clock-controller@10700000 {
>>                         compatible = "samsung,exynos2200-cmu-peric1";
>>                         reg = <0x10700000 0x8000>;
>> @@ -336,6 +407,287 @@ pinctrl_peric1: pinctrl@10730000 {
>>                         reg = <0x10730000 0x1000>;
>>                 };
>>
>> +               usi7: usi@109000c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x109000c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
>> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI07>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric1 0x2030>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_14: i2c@10900000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x10900000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric1 CLK_DOUT_PERIC1_USI07>,
>> +                                        <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c14_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_9: serial@10900000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x10900000 0xc0>;
>> +                               clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
>> +                                        <&cmu_peric1 CLK_DOUT_PERIC1_USI07>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart9_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi7_i2c: usi@109100c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x109100c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>,
>> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI07_SPI_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric1 0x2034>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_15: i2c@10910000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x10910000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric1 CLK_DOUT_PERIC1_USI07_SPI_I2C>,
>> +                                        <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c15_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi8: usi@109200c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x109200c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
>> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI08>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric1 0x2038>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_16: i2c@10920000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x10920000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric1 CLK_DOUT_PERIC1_USI08>,
>> +                                        <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c16_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_10: serial@10920000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x10920000 0xc0>;
>> +                               clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
>> +                                        <&cmu_peric1 CLK_DOUT_PERIC1_USI08>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart10_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi8_i2c: usi@109300c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x109300c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>,
>> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI08_SPI_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric1 0x203c>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_17: i2c@10930000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x10930000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric1 CLK_DOUT_PERIC1_USI08_SPI_I2C>,
>> +                                        <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c17_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi9: usi@109400c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x109400c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
>> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI09>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric1 0x2040>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_18: i2c@10940000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x10940000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric1 CLK_DOUT_PERIC1_USI09>,
>> +                                        <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c18_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_11: serial@10940000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x10940000 0xc0>;
>> +                               clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
>> +                                        <&cmu_peric1 CLK_DOUT_PERIC1_USI09>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart11_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi9_i2c: usi@109500c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x109500c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>,
>> +                                <&cmu_peric1 CLK_DOUT_PERIC1_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric1 0x2044>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_19: i2c@10950000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x10950000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric1 CLK_DOUT_PERIC1_I2C>,
>> +                                        <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c19_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi10: usi@109600c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x109600c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
>> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI10>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric1 0x2048>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_20: i2c@10960000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x10960000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric1 CLK_DOUT_PERIC1_USI10>,
>> +                                        <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c20_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_12: serial@10960000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x10960000 0xc0>;
>> +                               clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
>> +                                        <&cmu_peric1 CLK_DOUT_PERIC1_USI10>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart12_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi10_i2c: usi@109700c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x109700c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>,
>> +                                <&cmu_peric1 CLK_DOUT_PERIC1_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric1 0x204c>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_21: i2c@10970000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x10970000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric1 CLK_DOUT_PERIC1_I2C>,
>> +                                        <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c21_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +               };
>> +
>>                 cmu_hsi0: clock-controller@10a00000 {
>>                         compatible = "samsung,exynos2200-cmu-hsi0";
>>                         reg = <0x10a00000 0x8000>;
>> @@ -458,6 +810,496 @@ pinctrl_peric2: pinctrl@11c30000 {
>>                         reg = <0x11c30000 0x1000>;
>>                 };
>>
>> +               usi0: usi@11d000c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11d000c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI00>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric2 0x2000>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_0: i2c@11d00000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11d00000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_USI00>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 704 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c0_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_2: serial@11d00000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x11d00000 0xc0>;
>> +                               clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI00>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 704 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart2_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi0_i2c: usi@11d100c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11d100c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI00_SPI_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric2 0x2004>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_1: i2c@11d10000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11d10000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_USI00_SPI_I2C>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c1_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi1: usi@11d200c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11d200c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI01>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric2 0x2008>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_2: i2c@11d20000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11d20000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_USI01>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c2_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_3: serial@11d20000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x11d20000 0xc0>;
>> +                               clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI01>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart3_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi1_i2c: usi@11d300c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11d300c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI01_SPI_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric2 0x200c>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_3: i2c@11d30000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11d30000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_USI01_SPI_I2C>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c3_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi2: usi@11d400c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11d400c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI02>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric2 0x2010>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_4: i2c@11d40000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11d40000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_USI02>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c4_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_4: serial@11d40000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x11d40000 0xc0>;
>> +                               clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI02>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart4_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <256>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi2_i2c: usi@11d500c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11d500c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric2 0x2014>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_5: i2c@11d50000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11d50000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_I2C>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c5_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi3: usi@11d600c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11d600c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI03>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric2 0x2018>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_6: i2c@11d60000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11d60000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_USI03>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c6_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_5: serial@11d60000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x11d60000 0xc0>;
>> +                               clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI03>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart5_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <256>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi3_i2c: usi@11d700c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11d700c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric2 0x201c>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_7: i2c@11d70000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11d70000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_I2C>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c7_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi5_i2c: usi@11d800c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11d800c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric2 0x102c>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_11: i2c@11d80000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11d80000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_I2C>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c11_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi6_i2c: usi@11d900c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11d900c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric2 0x1004>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_13: i2c@11d90000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11d90000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_I2C>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 713 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c13_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi11: usi@11da00c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11da00c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI11>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric2 0x1058>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_22: i2c@11da0000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11da0000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_USI11>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c22_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_13: serial@11da0000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x11da0000 0xc0>;
>> +                               clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI11>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart13_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi11_i2c: usi@11db00c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11db00c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_peric2 0x105c>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_23: i2c@11db0000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11db0000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_I2C>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c23_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi5: usi@11dd00c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11dd00c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI05>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric2 0x117c>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_10: i2c@11dd0000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11dd0000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_USI05>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c10_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_7: serial@11dd0000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x11dd0000 0xc0>;
>> +                               clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI05>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart7_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <256>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi6: usi@11de00c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x11de00c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI06>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric2 0x1180>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_12: i2c@11de0000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x11de0000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_peric2 CLK_DOUT_PERIC2_USI06>,
>> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c12_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_8: serial@11de0000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x11de0000 0xc0>;
>> +                               clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI06>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart8_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>>                 cmu_cmgp: clock-controller@14e00000 {
>>                         compatible = "samsung,exynos2200-cmu-cmgp";
>>                         reg = <0x14e00000 0x8000>;
>> @@ -485,6 +1327,525 @@ wakeup-interrupt-controller {
>>                         };
>>                 };
>>
>> +               usi_cmgp0: usi@14f000c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14f000c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI0>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_cmgp 0x2000>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_24: i2c@14f00000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14f00000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_USI0>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c24_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_14: serial@14f00000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x14f00000 0xc0>;
>> +                               clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI0>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart14_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_i2c_cmgp0: usi@14f100c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14f100c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_SPI_I2C0>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_cmgp 0x2070>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_25: i2c@14f10000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14f10000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_SPI_I2C0>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c25_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_cmgp1: usi@14f200c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14f200c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI1>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_cmgp 0x2010>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_26: i2c@14f20000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14f20000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_USI1>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c26_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_15: serial@14f20000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x14f20000 0xc0>;
>> +                               clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI1>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart15_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_i2c_cmgp1: usi@14f300c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14f300c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_SPI_I2C1>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_cmgp 0x2074>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_27: i2c@14f30000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14f30000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_SPI_I2C1>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c27_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_cmgp2: usi@14f400c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14f400c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI2>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_cmgp 0x2020>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_28: i2c@14f40000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14f40000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_USI2>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c28_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_16: serial@14f40000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x14f40000 0xc0>;
>> +                               clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI2>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart16_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_i2c_cmgp2: usi@14f500c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14f500c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_cmgp 0x2024>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_29: i2c@14f50000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14f50000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c29_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_cmgp3: usi@14f600c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14f600c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI3>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_cmgp 0x2030>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_30: i2c@14f60000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14f60000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_USI3>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c30_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_17: serial@14f60000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x14f60000 0xc0>;
>> +                               clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI3>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart17_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_i2c_cmgp3: usi@14f700c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14f700c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_cmgp 0x2034>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_31: i2c@14f70000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14f70000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c31_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_cmgp4: usi@14f800c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14f800c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI4>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_cmgp 0x2040>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_32: i2c@14f80000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14f80000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_USI4>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c32_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_18: serial@14f80000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x14f80000 0xc0>;
>> +                               clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI4>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart18_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_i2c_cmgp4: usi@14f900c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14f900c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_cmgp 0x2044>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_33: i2c@14f90000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14f90000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c33_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_cmgp5: usi@14fa00c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14fa00c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI5>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_cmgp 0x2050>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_34: i2c@14fa0000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14fa0000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_USI5>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c34_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_19: serial@14fa0000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x14fa0000 0xc0>;
>> +                               clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI5>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart19_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_i2c_cmgp5: usi@14fb00c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14fb00c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_cmgp 0x2054>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_35: i2c@14fb0000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14fb0000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c35_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_cmgp6: usi@14fc00c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14fc00c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI6>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_cmgp 0x2060>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_36: i2c@14fc0000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14fc0000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_USI6>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c36_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial_20: serial@14fc0000 {
>> +                               compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                               reg = <0x14fc0000 0xc0>;
>> +                               clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI6>;
>> +                               clock-names = "uart", "clk_uart_baud0";
>> +                               interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&uart20_bus_single>;
>> +                               pinctrl-names = "default";
>> +                               samsung,uart-fifosize = <64>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_i2c_cmgp6: usi@14fd00c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14fd00c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_cmgp 0x2064>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_37: i2c@14fd0000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14fd0000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c37_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               usi_i2c_cmgp7: usi@14fe00c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x14fe00c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>,
>> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,mode = <USI_MODE_I2C>;
>> +                       samsung,sysreg = <&syscon_cmgp 0x2080>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_38: i2c@14fe0000 {
>> +                               compatible = "samsung,exynos2200-hsi2c",
>> +                                            "samsung,exynosautov9-hsi2c";
>> +                               reg = <0x14fe0000 0xc0>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               clocks = <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
>> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_USER>;
>> +                               clock-names = "hsi2c", "hsi2c_pclk";
>> +                               interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                               pinctrl-0 = <&hsi2c38_bus>;
>> +                               pinctrl-names = "default";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>>                 cmu_vts: clock-controller@15300000 {
>>                         compatible = "samsung,exynos2200-cmu-vts";
>>                         reg = <0x15300000 0x8000>;
>> --
>> 2.43.0
>>
>>


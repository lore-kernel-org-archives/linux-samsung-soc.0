Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DA4C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 11:09:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiF2LJI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 07:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiF2LJG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 07:09:06 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F15F36328
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 04:09:05 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id mf9so31949149ejb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 04:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=foG60lhNannT8P9dwW6kOYADdXZ/flWXxg5inptG7Kk=;
        b=fOqmOi1CSnXz7riHqPSZPrFn2IWlV4hfw0pYjQPy5LkPoB3mqXKSLx2Nc1qRyI+pT3
         ijTo0bflkgH6otLqB34F1P4BviJwWuPt0NcEMGguEEwqwYvfWwl1H8VTBvl2Vyy7wNVn
         0rX6JnCqrwZFKl9kxgOZnDETW8QeqEUCgAwkDJY3V1yQzXxf41HlH5bSPvD3ux0yFoZ5
         ZPjiOG8erfdIwHve8fhCGBPLQ19LqDjR/8j2qCx/rK0wQYbnnlrJhmkXdjIWPftZERTZ
         5htviNG37n6y6bhmbWk+GqOHbCKRYY54eVuiyPcQgit0vFaOgifBZY0Zzo091U5LUugs
         hE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=foG60lhNannT8P9dwW6kOYADdXZ/flWXxg5inptG7Kk=;
        b=gjBnVDHLkOXIEEUw78dsUHgC31riUT8a8/tB4MWbPwH/PXxpbJE3ZDCxI5RwdIg5wl
         K8Veh2yUwp0VzU7/XqoocO8GgqTz8bA+7amHBHf9OmVc91o9yIUOIVHf9cKPCZQbPE+R
         2vydYymPPlhKmWQl1N3qemfiOB0PWYJuiwrpu5zjcDuGHvOcrrWTdPXB5gxxzwDxVMRt
         b3yk4a8a74vpjGN2rBR0T8e7qGSWpSMPHSq+kZCljEiA4wV3KLx916Y06R1jm/5irkie
         pGCFytJKYbSmmLpCUr5v2RSF0cJz/hncPK9EDD+beZPIkP5Zaiyd2lbIWs5Vw3bVRwxy
         TfnA==
X-Gm-Message-State: AJIora8llcumHDS/DeUwkJlCU44Jm6M9pDNo0QFHr+HjW332zBIIoMEm
        LGKWBhZgtZfxpyV/bLJN4ClDTA==
X-Google-Smtp-Source: AGRyM1tAc75CObf54+Dn1EXYo9rv7I8KdZ7F32RpNsq1ifASqeuEyIi397CtnC3Ibo8I2EE97xCsdw==
X-Received: by 2002:a17:907:3dac:b0:722:e6ab:8d9 with SMTP id he44-20020a1709073dac00b00722e6ab08d9mr3076325ejc.20.1656500943955;
        Wed, 29 Jun 2022 04:09:03 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a23-20020aa7d757000000b00437df2444f5sm174712eds.11.2022.06.29.04.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 04:09:03 -0700 (PDT)
Message-ID: <eb7275a0-3883-176f-fab0-b5cab5bb09ee@linaro.org>
Date:   Wed, 29 Jun 2022 13:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] arm64: dts: exynosautov9: add exynosautov9-usi.dtsi
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
        'Rob Herring' <robh+dt@kernel.org>
Cc:     'Alim Akhtar' <alim.akhtar@samsung.com>,
        'Sam Protsenko' <semen.protsenko@linaro.org>,
        'Jaewon Kim' <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220629015650.138527-1-chanho61.park@samsung.com>
 <CGME20220629015913epcas2p1dcfcc81c026aa524a1f35c8e393be4f0@epcas2p1.samsung.com>
 <20220629015650.138527-3-chanho61.park@samsung.com>
 <acf6fb6d-46da-48f6-f064-1a08d323b0f1@linaro.org>
 <025601d88b9d$332049b0$9960dd10$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <025601d88b9d$332049b0$9960dd10$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/06/2022 11:47, Chanho Park wrote:
>> On 29/06/2022 03:56, Chanho Park wrote:
>>> Universal Serial Interface (USI) supports three types of serial
>>> interface such as Universal Asynchronous Receiver and Transmitter
>>> (UART), Serial Peripheral Interface (SPI), and Inter-Integrated Circuit
>> (I2C).
>>> Each protocols can be working independently and configured as one of
>>> those using external configuration inputs.
>>> Exynos Auto v9 SoC support 12 USIs. When a USI uses two pins such as
>>> i2c and 3 wire uarts(RX/TX only), we can use remain two pins as i2c mode.
>>> So, we can define one USI node that includes serial/spi and hsi2c.
>>> usi_i2c nodes can be used only for i2c mode.
>>>
>>> We can have below combinations for one USI.
>>> 1) The usi node is used either 4 pin uart or 4 pin spi  -> No usi_i2c
>>> can be used
>>> 2) The usi node is used 2 pin uart(RX/TX) and i2c(SDA/SCL)  -> usi_i2c
>>> should be enabled to use the latter i2c
>>> 3) The usi node is used i2c(SDA/SCL) and i2c(SDA/SCL)  -> usi_i2c
>>> should be enabled to use the latter i2c
>>>
>>> By default, all USIs are initially set to uart mode by below setting.
>>> samsung,mode = <USI_V2_UART>;
>>> You can change it either USI_V2_SPI or USI_V2_I2C.
>>>
>>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>>> ---
>>>  .../boot/dts/exynos/exynosautov9-usi.dtsi     | 1127 +++++++++++++++++
>>>  1 file changed, 1127 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
>>
>> Put all this directly in exynosautov9.dtsi, because this is not a re-
>> usable piece among different DTSI.
> 
> Okay. I'll move them in the exynosautov9.dtsi. I thought they're too long to put in the exynosautov9.dtsi and I also found a similar case such as exynos5433-bus.dtsi and exynos5433-tmu.dtsi.

Indeed we did like that... The tmu maybe was meant to be re-used,
although it references specific clusters. But the split of bus I don't
understand - it does not help.

I don't think it improved readability.

> 
>>
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
>>> b/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
>>> new file mode 100644
>>> index 000000000000..0e4c6332770b
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
>>> @@ -0,0 +1,1127 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Samsung's ExynosAutov9 SoC USI device tree source
>>> + *
>>> + * Copyright (c) 2022 Samsung Electronics Co., Ltd.
>>> + *
>>> + * Samsung's ExynosAutov9 SoC USI(Universal Serial Interface,
>>> +uart/spi/i2c)
>>> + * are listed as device tree nodes in this file.
>>> + */
>>> +
>>> +/* PERIC0 USIs */
>>> +&soc {
>>> +	syscon_peric0: syscon@10220000 {
>>> +		compatible = "samsung,exynosautov9-sysreg", "syscon";
>>> +		reg = <0x10220000 0x2000>;
>>> +	};
>>> +
>>> +	usi_0: usi@103000c0 {
>>> +		compatible = "samsung,exynos850-usi";
>>
>> We should start adding dedicated compatible, so:
>> "samsung,exynosautov9-usi", "samsung,exynos850-usi"
> 
> So, I need to add the compatible to the Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml, right?
> 
> - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
> 
> To be>
> - samsung,exynos850-usi
> - samsung,exynosautov9-usi


  compatible:

    oneOf:
     - items:
         - const: samsung,exynosautov9-usi
         - const: samsung,exynos850-usi
     - enum:

         - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)

> 
>>
>>> +		reg = <0x103000c0 0x20>;
>>> +		samsung,sysreg = <&syscon_peric0 0x1000>;
>>> +		samsung,mode = <USI_V2_UART>;
>>> +		#address-cells = <1>;
>>> +		#size-cells = <1>;
>>> +		ranges;
>>> +		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
>>> +			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
>>> +		clock-names = "pclk", "ipclk";
>>> +		status = "disabled";
>>> +
>>> +		/* USI: UART */
>>
>> Skip the comments, they are obvious from device node name. Long time ago I
>> was not advocating this, but I see it's benefits - much easier to
>> introduce changes to DTS or binding in case of some differences.

Eh, I think my reply got mixed up. The last sentence was about
compatible, so it should be:

We should start adding dedicated compatible, so:
"samsung,exynosautov9-usi", "samsung,exynos850-usi".
Long time ago I was not advocating this, but I see it's benefits - much
easier to introduce changes to DTS or binding in case of some differences.

and here only about the comment.

> I'll drop them.

Yes, please.

> 
>>
>>> +		serial_0: serial@10300000 {
>>> +			compatible = "samsung,exynos850-uart";
>>
>> Here as well.
> 
> I'll add "samsung,exynosautov9-uart" to the yaml file.
> 
>>

Best regards,
Krzysztof

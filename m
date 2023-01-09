Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8274C61DB3
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Jan 2023 08:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233909AbjAII3I (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Jan 2023 03:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236723AbjAII2N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Jan 2023 03:28:13 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9892C13F2C
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Jan 2023 00:28:06 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso1603203wms.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Jan 2023 00:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ZCewxmSxLwjuTUJjEP99Um0ViA3Vm33HjXmtOQ3d/o=;
        b=jitoHFJbmjiTIgBjF94+6C4mHCdkBTWpEBDFRG+XnntFVfdzHO6T7D1eTrh+7TM2/y
         Vvugxax3ToI1qdUcBuGahhS7fbScrkCCKAWEnVBugBrjN4tw31/zXEF43PJNNg3mJE8v
         dI9OImeuaVWxgYsIlZbiELfYd1buuZZogSKQjUORsfkQJefdNbtw0lAhiICXOza2CK1H
         0XfShVdC/8tI7JsCjhcFyn7k/7KHtIrIt0hoApyDqtOcER7HwkZVN6/bNtX/8oTVDtwg
         qelTOd47vaFwIs07eN6K95FnTG8P1jZidrczdEME93VoX5Poftl+5kmelWRxEdvYutuf
         CUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZCewxmSxLwjuTUJjEP99Um0ViA3Vm33HjXmtOQ3d/o=;
        b=I8c5GBPRfZpzU1Hu/1+tjTkDuAVlXeYkOkkHI42OHtkEzo0XXWT+MIII6zlOF+Egnf
         qBBDbgyy3AoBBx3ENX42Ep62BjD7phU+UOPBucyly/vzsgZ7wS40bnQPZ8T30hnBnRPg
         SeqD3Cd/QaH4sYgbNvAs/ijrdBou0mPYuGQSCutiOHB2ODBsoIIM+ZnsiZr8ly6GJ6js
         puwNRzQCeOm9nrQ/jYiLn9havvF1oG4NTDGdU6smmBLboukgcg9hHAL54spIWjlV1q5S
         JPInOLI3UoFxKtgf5zDkvYzSFNVE055TAtOmHZXdsJfjCsAF6jSPkxBx/I8LWv+CFLNv
         CzAA==
X-Gm-Message-State: AFqh2koyfTRwIR2sC7STk2QATYl7v8ouNLlfqX/8OL2DL422+z+g+jyE
        tTVh5H2/49ELeiUd9wPNuo2iKg==
X-Google-Smtp-Source: AMrXdXsW4Y6VQtOfBMg1ixd+skEs/6VaeQjIOiffrpDts1lV+k5r/dn+S5QZUFVgYhyTLtDMaIsXqA==
X-Received: by 2002:a05:600c:4fc6:b0:3d3:4a47:52e9 with SMTP id o6-20020a05600c4fc600b003d34a4752e9mr45041342wmq.15.1673252885142;
        Mon, 09 Jan 2023 00:28:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f11-20020a05600c4e8b00b003d04e4ed873sm16855748wmq.22.2023.01.09.00.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 00:28:04 -0800 (PST)
Message-ID: <a0c06803-450c-eb44-8789-8a48c577389d@linaro.org>
Date:   Mon, 9 Jan 2023 09:28:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/5] arm64: dts: fsd: Add sound card node for Tesla FSD
Content-Language: en-US
To:     Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com,
        perex@perex.cz, tiwai@suse.com, pankaj.dubey@samsung.com,
        alim.akhtar@samsung.com, rcsekar@samsung.com,
        aswani.reddy@samsung.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045706epcas5p14f2f951d162899234c7f5f7a0998ab6b@epcas5p1.samsung.com>
 <20230103045613.100309-6-p.rajanbabu@samsung.com>
 <2c6950c9-3489-c2d4-2ca8-cb723195f75b@linaro.org>
 <051601d923df$a0e7b840$e2b728c0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <051601d923df$a0e7b840$e2b728c0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/01/2023 05:05, Padmanabhan Rajanbabu wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>> Sent: 03 January 2023 04:43 PM
>> To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>;
>> lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
>> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
>> alim.akhtar@samsung.com; rcsekar@samsung.com;
>> aswani.reddy@samsung.com
>> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org
>> Subject: Re: [PATCH v2 5/5] arm64: dts: fsd: Add sound card node for Tesla
>> FSD
>>
>> On 03/01/2023 05:56, Padmanabhan Rajanbabu wrote:
>>> Add device tree node support for sound card on Tesla FSD board
>>>
>>> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
>>> ---
>>>  arch/arm64/boot/dts/tesla/fsd-evb.dts | 37
>>> +++++++++++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> b/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> index e2fd49774f15..ce726bddfb50 100644
>>> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> @@ -29,6 +29,43 @@
>>>  		device_type = "memory";
>>>  		reg = <0x0 0x80000000 0x2 0x00000000>;
>>>  	};
>>> +
>>> +	sound {
>>> +		compatible = "simple-audio-card";
>>> +
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +
>>> +		simple-audio-card,name = "FSD Audio Card";
>>> +		simple-audio-card,widgets =
>>> +			"Line", "Line Out",
>>
>> I don't think you need to break the line after '='.
> 
> Okay, will change the same in the next patch set.
> 
>>
>>> +			"Line", "Line In";
>>> +		simple-audio-card,routing =
>>> +			"Line Out", "LLOUT",
>>> +			"Line Out", "RLOUT",
>>> +			"MIC2L", "Line In",
>>> +			"MIC2R", "Line In";
>>> +
>>> +		status = "okay";
>>
>> Why?
> 
> Okay, I understood that if there is no status entry, it is
> treated as "okay". I'll update the same in the next
> patch set.
> 
>>
>>> +
>>> +		simple-audio-card,dai-link@0 {
>>> +			reg = <0>;
>>> +			format = "i2s";
>>> +			bitclock-master = <&tlv320aic3x>;
>>> +			frame-master = <&tlv320aic3x>;
>>> +
>>> +			cpu0 {
>>
>> Does not look like you tested the DTS against bindings. Please run `make
>> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
>> for instructions).
> 
> I did not encounter any error while running dtbs_check for fsd-evb.dts
> 
> This is the command I executed
> make dtbs_check > output.txt 2>&1
> 
> dt-mk-schema --version: 2022.11
> 
> Please let me know if I'm missing anything here.

You are right. I misread the pattern in simple-card.yaml. I'll fix the
file, so let's make these nodes: cpu-0 and cpu-1.

Best regards,
Krzysztof


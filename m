Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D87C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Feb 2022 14:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbiBVOZ3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Feb 2022 09:25:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiBVOZ2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 09:25:28 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED11160FEB
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:25:01 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7AC6D3F1F3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645539900;
        bh=oLmgNElh3QDEmFp83m0Fp5tLvQ90LkYaGsTK1HcNipU=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=UL8lWb72vSrKHJxl0Rrd36NGjFuCicV3aAe5JhepiQVXti/gALqjd8MyfIRRKSt/4
         ArsEgC2whhRO8GkejfNKV3L7XhNHKIj9igCd6DoctVs0cbCVKq5CGBedqLv/5utLwW
         LJPs2FWe6/qgGPc8+GSzmDwCYFPpGp30r1P+4pPGimEO/j55PHetFHwkfInLHXZpEX
         PSF3yQdSkTpNrYBZ35pnNz8ZHpIUV6PJShD/9lxvUA2q1xvfGdG/ccVcmSmMWwluSY
         MfAVOUBeZyZxqWjtbwWrWWnzDX8c/5AQIKkGj4H3ZmVjOLAF/PFw9kPaKsHhIeLkP+
         pBHOFaWsTkmLg==
Received: by mail-ed1-f71.google.com with SMTP id f9-20020a0564021e8900b00412d0a6ef0dso7057478edf.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oLmgNElh3QDEmFp83m0Fp5tLvQ90LkYaGsTK1HcNipU=;
        b=wQFYQV/ARfO1vusJNkqybiGJPJ+L/eaZbBWWNUDd/bJk+lBT+hsj1RpWJMpz2iPd+Z
         MY6kAiL5/6rIQTpAbgFxcIOpBRIYLOALxPaBK+UYV1hwxkSOREPviIjU0dLWVhTGHg+g
         +gzMTlhO44xrpuLSNUS2EqTyewNieQtKw1R4sgcO3W4vOIfSkWPZX/GNTV2xSGf769e+
         ybdiu9injY6hR8yMgdZI83c+0FO9E7AGOLmOGm5h14MTe7muCvStMM+TX8Bt6FuFtkmF
         bcS3mpO/GREMGYi7heP5XLywydZstl+o11LknvKKLwgGw2Y0ag3HDC1/vUMU5AzLn4de
         vEvg==
X-Gm-Message-State: AOAM532uF9PkuSUZ1gmbKq4PT/kO1aGDudpJOUqPPVklK/kZxyfqHfIG
        a3wEmdZ5mDlDl2+eDzPWHkZ6EVNTr+G1uZdBMaoEMLZAv5UKygEkQbUVyt40bnQf9jJGFrOEcr8
        4hbWrXA7kXnUlAHr35ApvEUwtvcpMyCwh5o6dNyJpLCf9cwmO
X-Received: by 2002:a17:906:585b:b0:6b7:73bc:5395 with SMTP id h27-20020a170906585b00b006b773bc5395mr19613922ejs.519.1645539900136;
        Tue, 22 Feb 2022 06:25:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxl0yq1XSLXZ0+HDlfLiBmXD2SvohoRTlnHKcrDqgm19cQZEHXWv5q9E/EvTn/sgLY68mRXog==
X-Received: by 2002:a17:906:585b:b0:6b7:73bc:5395 with SMTP id h27-20020a170906585b00b006b773bc5395mr19613910ejs.519.1645539899914;
        Tue, 22 Feb 2022 06:24:59 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id v24sm6274735ejf.7.2022.02.22.06.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 06:24:59 -0800 (PST)
Message-ID: <4401de4a-caab-c5a1-f415-d30e99260404@canonical.com>
Date:   Tue, 22 Feb 2022 15:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 8/8] arm64: dts: ti: use 'freq-table' in UFS node
Content-Language: en-US
To:     Nishanth Menon <nm@ti.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jan Kotas <jank@cadence.com>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220219184224.44339-1-krzysztof.kozlowski@canonical.com>
 <20220219184554.44887-1-krzysztof.kozlowski@canonical.com>
 <20220221131340.q3hjpjevqrfvhggv@specimen>
 <19705501-2391-14a4-0eac-4b2b647a9735@canonical.com>
 <20220222140721.bzbspfcethml2psm@running>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220222140721.bzbspfcethml2psm@running>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/02/2022 15:07, Nishanth Menon wrote:
> On 14:20-20220221, Krzysztof Kozlowski wrote:
>> On 21/02/2022 14:13, Nishanth Menon wrote:
>>> On 19:45-20220219, Krzysztof Kozlowski wrote:
>>>> The 'freq-table-hz' property is deprecated by UFS bindings.
>>>> The uint32-array requires also element to be passed within one <> block.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>> ---
>>>>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>>>> index 599861259a30..c3afef0321ae 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>>>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>>>> @@ -1257,7 +1257,9 @@ ufs@4e84000 {
>>>>  			compatible = "cdns,ufshc-m31-16nm", "jedec,ufs-2.0";
>>>>  			reg = <0x0 0x4e84000 0x0 0x10000>;
>>>>  			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
>>>> -			freq-table-hz = <250000000 250000000>, <19200000 19200000>, <19200000 19200000>;
>>>> +			freq-table = <250000000 250000000
>>>
>>> <min max> is much more readable and less error prone in case of a large
>>> set.
>>
>> Pairs are easily visible if split per line, so readability is similar.
>> Not much is lost.
>>
>>>
>>>> +				      19200000 19200000
>>>> +				      19200000 19200000>;
>>>
>>> are you sure the removal of the tuple adds value?
>>
>> DT schema requires it, or rather: I do not know how to express uint32
>> tuples in DT schema. All my tries failed.
> 
> https://www.kernel.org/doc/Documentation/devicetree/bindings/opp/opp-v1.yaml
> comes to mind..

This works nice, thanks!


Best regards,
Krzysztof

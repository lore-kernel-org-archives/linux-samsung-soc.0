Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A442DC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Mar 2022 12:00:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239247AbiCDMBc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Mar 2022 07:01:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbiCDMBb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 07:01:31 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B661AAA72
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 04:00:42 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 494CB3F5FD
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 12:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646395241;
        bh=UrJN5AN1a+sk4or2TpxPGO7Gz6uzi1pVJsgwdCKsk30=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=VcJwoyvvI7pxnT8TemvW6OD/XrQ71YN3Iy1V6mB+PkPmkHaDS3Fp/FDmG4I3izii8
         gLdAcKr2pLvYnHXxlhpIbNfa2jS+vtoNd4Ap7wgd3G+2mF1n+Bv77WekcOFEpmbWph
         6h99LboXo3iPb7V0ukhuG9QsZXMMSXhg75L7e9sXrHLh59Zz1OTJ4kRqN7JoLDg/uc
         4XoOewu3uu+W8z0NgaRBZ7UxBY+QiFE9puFuhx8l3LTqMHuhBeVp5dxfDtyDP3FL9d
         z9eXKRyfsS7Ce9l/GGrTB1uiK/8axtXIK0RKglWhNFGOuirIeLDAHc0FnDek+9GRZq
         us0we+fXI/oqQ==
Received: by mail-ej1-f72.google.com with SMTP id r18-20020a17090609d200b006a6e943d09eso4274073eje.20
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Mar 2022 04:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UrJN5AN1a+sk4or2TpxPGO7Gz6uzi1pVJsgwdCKsk30=;
        b=zdNk3jzfPXLLd16rEGZHZyqWPPFXKae7o4iTc8FBweQZTTKJe3cpCZTDramINZR5TG
         v90+AyA7QeoizUTYnhkjEt/IR7iEoTjFowwvYBE/FkUQJmL5wWxm/Lc9f57mj3n/1EwK
         zx4DRRPIvsVapChzTDhACsFmXXM5bYqCugb1FnsnzTv4rZrv0YG40zvRc09Cmagwa0J+
         avHlIHXnwet/UHXYvxsD5Bnqm0W6QMU8qWLhhSS44jiNoARVF0hN3ZzNvsqFbiFHfrvM
         XoLfzCA3W2sSriBFOu97jXSKrUjuafEfn5XS3fUpdZL9EJm/OpKieUm4hm7uIZgJXmsS
         /9pw==
X-Gm-Message-State: AOAM532NHueY4v0dUd5dFpIwRbAFFKexQ023QtnnQTY7Ts9LKDFdSnfC
        oiInoY6PuheXEL6vqNDmZ2CLxEyLT6FCz6qpeaxYRB5KHyhg1Q0LJhgTx4NoNG3BgjcwV4IYxvN
        2tcX/Ohqr1/9jHhGY/N4CyYHCUpXhPzYrAEv2/Jn2szlBih33
X-Received: by 2002:a05:6402:5107:b0:412:8530:3ba9 with SMTP id m7-20020a056402510700b0041285303ba9mr38867811edd.264.1646395238743;
        Fri, 04 Mar 2022 04:00:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwI7OQeP0JPom8EPn2tKAhFBCBK+BonDWpzzmv+CL9Xbt+L/Z8IeRUd83dFajGjOSo8dY104Q==
X-Received: by 2002:a05:6402:5107:b0:412:8530:3ba9 with SMTP id m7-20020a056402510700b0041285303ba9mr38867791edd.264.1646395238510;
        Fri, 04 Mar 2022 04:00:38 -0800 (PST)
Received: from [192.168.0.138] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id bt10-20020a170906b14a00b006d89fc82497sm1682564ejb.126.2022.03.04.04.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 04:00:37 -0800 (PST)
Message-ID: <747fc6f2-0d9e-d0d4-877a-cb3d4bfda6bd@canonical.com>
Date:   Fri, 4 Mar 2022 13:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] arm64: dts: exynos: add a specific compatible to MCT
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        'Daniel Lezcano' <daniel.lezcano@linaro.org>,
        'Thomas Gleixner' <tglx@linutronix.de>,
        'Rob Herring' <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220225153650.289923-1-krzysztof.kozlowski@canonical.com>
 <CGME20220225180502epcas5p4a8126555d09513b92fb1947669529176@epcas5p4.samsung.com>
 <20220225153650.289923-3-krzysztof.kozlowski@canonical.com>
 <000201d82fb6$9b672090$d23561b0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <000201d82fb6$9b672090$d23561b0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/03/2022 11:57, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Friday, February 25, 2022 9:07 PM
>> To: Daniel Lezcano <daniel.lezcano@linaro.org>; Thomas Gleixner
>> <tglx@linutronix.de>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com>; Alim Akhtar
>> <alim.akhtar@samsung.com>; linux-kernel@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org
>> Subject: [PATCH 3/3] arm64: dts: exynos: add a specific compatible to MCT
>>
>> One compatible is used for the Multi-Core Timer on most of the Samsung
> Exynos
>> SoCs, which is correct but not specific enough.  These MCT blocks have
> different
>> number of interrupts, so add a second specific compatible to Exynos5433 and
>> Exynos850.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>> arch/arm64/boot/dts/exynos/exynos5433.dtsi | 3 ++-
>> arch/arm64/boot/dts/exynos/exynos850.dtsi  | 3 ++-
>> 2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> index 661567d2dd7a..017ccc2f4650 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> @@ -806,7 +806,8 @@ tmu_isp: tmu@1007c000 {
>> 		};
>>
>> 		timer@101c0000 {
>> -			compatible = "samsung,exynos4210-mct";
>> +			compatible = "samsung,exynos5433-mct",
>> +				     "samsung,exynos4210-mct";
> 
> Just a though, do we still need to keep Samsung,exyno4210-mct compatible?
> In anyway:
> 
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Yes, otherwise we break all other projects using DTS from Linux kernel.
Also keeping it allows to apply DTS patches independently without
breaking bisectability.


Best regards,
Krzysztof

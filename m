Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC1EC6FD1F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Mar 2023 18:52:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbjCVSwI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Mar 2023 14:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjCVSwH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Mar 2023 14:52:07 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825BC5CED3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Mar 2023 11:52:04 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id eh3so76936979edb.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Mar 2023 11:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679511123;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GnjO6rB3SMaI0uKBlHaw5KyPPgQbtexYN9gxy05p5aY=;
        b=LwmKdT33gNG+cHesYJ8XPo4wg5n/IVM8caN4Q2w/p2FNVUPZxfFRE5CQuJTwySkaPC
         K5FYrGfNcF/eIvWJqbuDGszEAO26zdOZz1rC+f9/AIeXm9HwdW80VDB6rbGZmzHV0oU7
         1akxISTeiF7IHocsleSChlGq0OOcpTaYRGBjREJYCu/raYF+FAaEF2LdaXWevAKNw/iv
         SDCx14/bbarRXMhWHaecA/dH/AC8ssKfGJaqMfNRz+E8hbnddid7K6p07H5/0DFJzymI
         PykG3eAJZ+gHGSwNG0CTs4Gpb0lwFt4guN1JZdtS272wV/NPXvjYimfZg+q3/mJrGAUw
         b4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679511123;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnjO6rB3SMaI0uKBlHaw5KyPPgQbtexYN9gxy05p5aY=;
        b=G+HLEl4kffCCYBNzmOGAyJDtU+mYHawY0VcUFjiRSz0CCuQerMvdvHL/YTX8486FCl
         DLXtCZOMrf4omk8FKBVEo9cTRliK1H+15Qo4zm4fhSHvLUe5xFpQpO2ASBPof8NCf2mO
         bamcO9ll7CjO2eeIHa4tygvbPC1fV83YaP+W6XCmma/mpqoGWmQUbDYDXq+8XIdotSf7
         +ejK0yXZAMuZLLwR4uaJgmeBJJDz8HdwvvDtEZvNzi+SHf2xkRS2aJN25u0z6gyYN0cP
         OAp6Zd1O52XnWyvy7wDE29u2hTJxBmYGPMRIAgT93ZsxrFft14IeDnKpWRR6BwGCP+zI
         7TuA==
X-Gm-Message-State: AO0yUKU14qVk/P7tcoKMTPkOHLw87R4JrGhxW3ArBTDnGqS0vxQiOL+O
        ob0bXd6ubLpQ7xQJhz/duSaOgA+EvKJIl4uqmY0=
X-Google-Smtp-Source: AK7set8npBgIvh/DrCLdGVF950rfc9GOaTWVRjawslYNv08Gyvwt5UjbPR/x7DDmPnXT85CMyaoo/A==
X-Received: by 2002:a17:906:fa16:b0:933:3fda:94fb with SMTP id lo22-20020a170906fa1600b009333fda94fbmr8029802ejb.10.1679511123002;
        Wed, 22 Mar 2023 11:52:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906248700b0093408d33875sm4784451ejb.49.2023.03.22.11.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 11:52:02 -0700 (PDT)
Message-ID: <3d4b66b7-b86b-3ff2-1076-33a16a8014f8@linaro.org>
Date:   Wed, 22 Mar 2023 19:52:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/6] soc: samsung: pm_domains: Add Exynos850 support
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <CGME20230308230935eucas1p1e919f4d4b020e3386ce0eac8b4c8d299@eucas1p1.samsung.com>
 <20230308230931.27261-1-semen.protsenko@linaro.org>
 <d1175c3e-301d-1cbc-607c-e94051780806@samsung.com>
 <611fe922-1937-d37d-a2ce-cc0a13aed9e0@linaro.org>
 <CAPLW+4=Yd0KfaMp+oSA=rOrqJfUotHjB=QOKpaPitMh3V2fMrA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPLW+4=Yd0KfaMp+oSA=rOrqJfUotHjB=QOKpaPitMh3V2fMrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/03/2023 18:57, Sam Protsenko wrote:
> 
> Did a bit of research, looked at how it's implemented on other
> platforms. Before I start reworking it, want to check with you on a
> couple of decisions, to avoid unnecessary resubmissions later, if it's
> ok:
> 
> 1. Instead of actually merging PD driver into PMU driver, guess it
> might be better to create a new power-controller driver (e.g.
> drivers/soc/samsung/exynos-power.c). This is how it's implemented for
> the most of platforms, and this way we can neatly separate it from
> what we already have in the PMU driver (not really power controller
> related things). This way, in device tree we'll have a
> power-controller node under PMU node, and this node can be referenced
> further as a phandle in power-domains properties of users.

Whether you want separate driver is different from wanting separate
device node in DT. About the Devicetree, the PMU node is the power
management unit responsible for:
1. power domains,
2. system power.

Thus separate device node rather does not fit here. This is one bigger
device which can have sub-blocks (e.g. system-reboot), but power domain
handling does not look like separate from it. It is its core.

Now about driver - whatever creates readable and maintainable code :)

> 
> 2. After moving PD implementation into a new power-controller driver
> (with new compatibility string), 
> the old one (pm_domains.c) should be
> probably removed. Is it reasonable, e.g. from point of view of
> compatibility with out-of-tree (downstream) dts's? 

You must not break the ABI, so existing bindings and driver must stay.
The power domain cells in PMU node will be the trigger for using new code.

> Also, if I remove
> the PD driver, probably all existing (upstream) Exynos dts's should be
> reworked to use the new power-controller compatibility string?
> 
> 3. Where to keep offsets for each power domain (inside of PMU register
> area). Can be done in dts (a separate child node of power-controller
> for each power domain), or in the power-controller driver. 

Just like in clock or reset drivers, this should be in the driver.

> I saw both
> of those ways for different platforms actually. 

Then share examples, because maybe I think about something else...

> But I guess offsets
> are more like internal details, and should be kept inside the driver,
> for each supported SoC.
> 
> 4. Specifying particular power domain in power-domains property. Guess
> the best way would be to have some indexes defined in dt-bindings
> header, and use those like this:
> 
>         power-domains = <&power_controller EXYNOS850_PD_G3D>;

Yes.

> 
>    Those constants can be also used then in the driver, to keep PD
> offsets in the array, etc.

Yes.

> Another way would be to use reg offsets,
> but indices look better: can provide more flexibility in the driver in
> future, e.g. if we'd need to add some more details other that offsets
> later.

Right, use logical IDs and driver will do the translation.

> 
> Please let me know what you think. At the moment I have to switch to
> another task temporarily. When I get back to this one, discussing the
> above items would help me a great deal.


Sure, thanks for the work, keep safe and strong!

Best regards,
Krzysztof


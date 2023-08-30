Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A8DC83F19
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 30 Aug 2023 18:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjH3S3M (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241370AbjH3GxL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 30 Aug 2023 02:53:11 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D827B19A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Aug 2023 23:53:07 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso555114666b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Aug 2023 23:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693378386; x=1693983186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pOJN0Q6wkLvMewxsTy82PsqahQrqDIj24ECvJdWCSo=;
        b=hFPOrGSG6AL5SBXwq3saM68KoWP6qmzTIlrRUhkIZiCAhFd0j0qZMLGk++XHS8YnRp
         ad9FAeprO9wlMAJQHLbQBCXJ4eh6hBlJlopnXZ/uG86awguRGOgC7F1HZfjic/mWPSnp
         6t2sHZkEvhhen+BDjtvgocdIJiBH5MRC+7pnzsqSjUcZTy2CPt5/mYC7xBLyzJmI1WAx
         8jpKOckvpWLodIDixV0UI0kHjuCsiE+K9XbYDT3k/VE6mGus2LPwKwpbzRb4BPgDNy34
         rauVepznllVEFvjA1v+lbNT7p4Z9ATbdNSodIfevbfNwMhonpzUkO4XCkC/r0ljVGfBX
         J63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693378386; x=1693983186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pOJN0Q6wkLvMewxsTy82PsqahQrqDIj24ECvJdWCSo=;
        b=bo286SVe9wIGgSKJ2/hZmJEoNEb3n1zQggy2CQozJ64FJCsBLXMCEjPRZ6d3oSFwiS
         S8P54fs46EvrGT/N0ihhAnb5wA0zsBrYvKRzsFc8zEn/kZq9Rghtx3zRTi/yQZ5q25S2
         Uphc3jWgMJ9OdavtKVqfO5UC561s6ej59cPlkAnw863HeqAFdkTFLJB71gbHBY6dBPwM
         Y6LN7LhSbHQscwjpiqYLoM93uAQIiVz943gV+xWoDoqozvarfp2BYE/TPCQS8lBnAMuk
         hNLLo7QB8X7zQXj9fsZ/Nk2ze29xdttSI8mjQWfuq07JNE5rca70Cm+hwJUOMDKdxV9Y
         94hg==
X-Gm-Message-State: AOJu0YzxTPQKzzqGLdy2/npem1ECbgunrFHQkJYUQo4WIoYX3825WOEr
        uHtfzp/gNskXDTPCRX9wGaN8sA==
X-Google-Smtp-Source: AGHT+IH7By/K8X7TFjmuxWQpjwkhFG9OOMBqvVumSGucfH7kiTRm0wx4GZG99lfl8UxbibAn1Rk6Wg==
X-Received: by 2002:a17:907:7750:b0:9a1:9284:11b with SMTP id kx16-20020a170907775000b009a19284011bmr990508ejc.7.1693378386280;
        Tue, 29 Aug 2023 23:53:06 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id d12-20020a170906344c00b00982a92a849asm6833731ejb.91.2023.08.29.23.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 23:53:05 -0700 (PDT)
Message-ID: <90723ba8-c511-f90c-3a1a-3c33215fe27b@linaro.org>
Date:   Wed, 30 Aug 2023 08:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 0/2] arm64: dts: exynos: Enable USB for E850-96 board
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        JaeHun Jung <jh0801.jung@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230825215445.28309-1-semen.protsenko@linaro.org>
 <6fd3a9ab-667d-934b-f1c2-03776be93d4d@linaro.org>
 <CAPLW+4njcwODXoA3Gj=48E-DPOqofcPnJkYMv6yzF5JjyOshDA@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPLW+4njcwODXoA3Gj=48E-DPOqofcPnJkYMv6yzF5JjyOshDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/08/2023 02:44, Sam Protsenko wrote:
> On Sat, Aug 26, 2023 at 1:10 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 25/08/2023 23:54, Sam Protsenko wrote:
>>> This patch series enables USB gadget, USB host and Ethernet support for
>>> E850-96 board. The most major change was done in USB PHY driver, as the
>>> register layout of PHY block in Exynos850 is very different from
>>> Exynos5 one.
>>>
>>> Changes in v2:
>>
>> Thank you for the patch. Looks good.
>> It is too late in the cycle for me to pick it up. I will take it after
>> the merge window.
>>
> 
> Thanks, Krzysztof! So we can expect these to get into v6.6, correct?

No, this is v6.6 merge window and it already started. I will take it
after, thus v6.7.

> Also, I'm trying to keep track of all my patches, so please let me
> know if you are going to apply this series to your trees soon, and
> which exactly (I presume krzk/linux-dt.git/for-next?).

I always send confirmation of applied patches with reference to repo and
commit (although not branch).

Best regards,
Krzysztof


Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FE4C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Nov 2022 14:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbiKYOr0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Nov 2022 09:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbiKYOrY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 09:47:24 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AACDE3B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:47:22 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j16so7196028lfe.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=osoEBytHjlQAPUyZve5rkRqahTmWVeqKGttLOtMjR3Y=;
        b=usClvSs3mC6FvIhfguF/sEt/gkxumcuZsEzXV26BLwCRWyr07wpUDcacmF61zVLKPR
         4b46+DrsjeGTpJs4Rz6cKLkXOJNviO0ZeBoqcGZGt6PWmxFN+kR+a96LaG8VwLpSqDkx
         goU+yxqpDJ/wWC5qZvAINZkaHs5Yqu6Dyn/gkN36gYSpsynBgMP78DiVuICmU5IoYSDu
         ZSN5X5Za9PqaptEEca8OmXdQ9gvV5B+AF+roHy6kclTYwEc+dAsg6/RiBrprc8VtRRtb
         ue6EdI+9kSpsFmIkikRBiN+RbXp81fj4XYloUMa16gJjB+8ssQrKA0NK0EVWlEfJjx5e
         wKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osoEBytHjlQAPUyZve5rkRqahTmWVeqKGttLOtMjR3Y=;
        b=kb4IyqudNjxInhESxKZvQELaIkHerTwfybdbknUl/4HLIFHutN0h5WDlaV5nBLzGPZ
         wyAZ/A0MFx7e8kP0yLDCqY7vD2iCgGVCa1k8y9+pFXhHE3jf4bBbJS/QTfmhUsFgvwvv
         g0wQeHNeriYpbFHmyGqCv/MfWWswaBZzSmkpCml/KEpG5ZN0L9vtG+UOlyREv1R1y6Ew
         F6YTObt1rBk60mGE4CBeKnR3QIUMxp+1CNHS3iwKISXwreE8LA5RlSDFs3AnmF0EXyqB
         o211cXCeTBR2YpJTbAf8XzcZX3Sa1FaSyTQMohx0qtstd/q/hq/h31zUkdtvCtts1mDc
         XhyQ==
X-Gm-Message-State: ANoB5pnme+RhP27A+EiGn9uV1tUxImYymhbS0jQlnALtBNYwEzHVPlqu
        AHGqCdvJyQ/GyA0abkTseEA6NA==
X-Google-Smtp-Source: AA0mqf4JdsPg2OacWHAZHBS95kHhrvSJgsXU9oA5FBTdtRat1RDp/3S8jHWNMMuKkVsrI0TT4mXz8A==
X-Received: by 2002:ac2:4843:0:b0:4a2:1169:3934 with SMTP id 3-20020ac24843000000b004a211693934mr13530237lfy.279.1669387640881;
        Fri, 25 Nov 2022 06:47:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w10-20020a05651234ca00b00494942bec60sm557057lfr.17.2022.11.25.06.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 06:47:20 -0800 (PST)
Message-ID: <dfd956d5-d62d-52ac-c485-afc71c441df5@linaro.org>
Date:   Fri, 25 Nov 2022 15:47:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/4] dt-bindings: soc: samsung: exynos-sysreg: add
 dedicated SYSREG compatibles to Exynos5433
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
 <20221125112201.240178-3-krzysztof.kozlowski@linaro.org>
 <CAPLW+4kwFCLaiowajdCnA09eT4emOB-3d-6cbA=ZYyRLwYuCxw@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPLW+4kwFCLaiowajdCnA09eT4emOB-3d-6cbA=ZYyRLwYuCxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/11/2022 15:22, Sam Protsenko wrote:
> On Fri, 25 Nov 2022 at 05:22, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Exynos5433 has several different SYSREGs, so use dedicated compatibles
>> for them.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Cc: Sriranjani P <sriranjani.p@samsung.com>
>> Cc: Chanho Park <chanho61.park@samsung.com>
>> Cc: Sam Protsenko <semen.protsenko@linaro.org>
>> ---
> 
> Hi Krzysztof,
> 
> Just curious: what is the rationale for adding those more specific
> sysregs? AFAIR, e.g. in Exynos850, different SysReg instances have
> pretty much the same register layout.
> 

On Exynos5433 all these blocks have different registers. Are you saying
that Exynos850 has four (or more) sysregs which are exactly the same?
Same registers? Why would they duplicate it?

Best regards,
Krzysztof


Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF05C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 08:27:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8856D61209
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 08:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbhIOI2v (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 04:28:51 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52872
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236796AbhIOI2a (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 04:28:30 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 076C54026A
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631694431;
        bh=c0ktSqPBV6zrAWdMe5+J2g1bcwqmTCFhZ2hdgWxJG/Q=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=UEurLKUIsXLvUTtX7fgg0+OvprC1m2huN7eaHBM1GWUH37l75AGKkXWXmuv0YEXdt
         k6R5Z4AbaFO2RSLw8JzHslo7LFMj55XJMoxOjTVIMYRaZmbVf65KDI/Wv8LAmZH8QM
         YMIuK2mEegmjhRB8pJD5UUzEJiYKaG82GE/KweZgabNRtkIthSjbLfaOMP8ve/d4KJ
         eaktkQd6h5SwmhOD6asNXeSGRcCmLtk/mRYGp5Tv+FJbPWKsl6XZ69DiOITCdPzkIA
         1+xPN7N8omtlGxdCucM7FETLTAI0NTC95dynkTC8qhL9UoXpAXYhyHFaLL49nfrCyG
         iU/pLMfGJwphQ==
Received: by mail-ed1-f69.google.com with SMTP id y19-20020a056402441300b003cd8ce2b987so1168373eda.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 01:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c0ktSqPBV6zrAWdMe5+J2g1bcwqmTCFhZ2hdgWxJG/Q=;
        b=niIuWlynw9U0QdQLdPAyTjAmEr+r5hCIZWObZA8yizsIUgceeXva2Z8ykx7WDSQD2x
         jZQR0wiWPJRZvTs7SNjTB0AUSiLcbri6WSY9Jq9iWTExRJki7zzDm5Wsw+WYP1OgPeoJ
         ivP/kDfiN5VAcEKrr/05lbF3TnwViV5coC97WJdPu3Zx/z+i6ykP+kUBTr0mirT4VuGt
         bHmk1Gt3n8tWybFyVDG26ph+w8CrfFcdMYMIWP8Wa9UeUyeM5a3tfKu4O5zvB0Yw0W3M
         KjVJuclwus3iu9P2ZiI9RhXZzXVZqCXK690FxRWDdlhLlg6QDxDd6CbBq+w8xHHHrkB/
         w8PA==
X-Gm-Message-State: AOAM532ZTcefwR/DLP/j4H//k89L/bEbHAmuRqQrnPTgCNpSiw/9qWQF
        GN/D18hlHedGZzsOhO9XLQHvNSKmVzTZfWVd0vEpus2IjIqVE/x9VLI8CoggA7sHf5Ct0tkmmkk
        TJYHT6nNS/dsAy+kEKFUk+q4KAkUfAZhyGX+RXFTSy5sNwsPg
X-Received: by 2002:a05:6402:42d4:: with SMTP id i20mr18825620edc.348.1631694430005;
        Wed, 15 Sep 2021 01:27:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJujQjYVHel2sNKzotlRkaiyjwxk4PvbAgB7ek3KN7SaHfnHfWRFV7KrDrr/6Z5D4w/Nh3Zw==
X-Received: by 2002:a05:6402:42d4:: with SMTP id i20mr18825590edc.348.1631694429780;
        Wed, 15 Sep 2021 01:27:09 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id l22sm4804830eds.58.2021.09.15.01.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 01:27:09 -0700 (PDT)
Subject: Re: [PATCH 4/6] dt-bindings: clock: Add bindings definitions for
 Exynos850 CMU
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-5-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <396f1761-567f-0407-7d95-acd7bbd38de9@canonical.com>
Date:   Wed, 15 Sep 2021 10:27:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-5-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/09/2021 17:56, Sam Protsenko wrote:
> Clock controller driver is designed to have separate instances for each
> particular CMU. So clock IDs in this bindings header also start from 1
> for each CMU.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  include/dt-bindings/clock/exynos850.h | 72 +++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 include/dt-bindings/clock/exynos850.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

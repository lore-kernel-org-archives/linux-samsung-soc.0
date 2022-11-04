Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C1BC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Nov 2022 13:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiKDNrs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Nov 2022 09:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbiKDNrp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 09:47:45 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199FC2F662
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Nov 2022 06:47:45 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id mi9so3200303qvb.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Nov 2022 06:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CM7N46suxjlkNYhX9NO4Ul3ikAd8Rqs9FVmxwGAUjTo=;
        b=Lsg9EiySkerNQ8AIhUxxP3jKQBEMlVQj/ClzJkwgQbruf4Dl+KPoYEqo+a4fsHWo/e
         ATJoivLfCbI/0J1brbVayBQBWzr913NspfeAmBvmu46LKpU6Jtutlv7olOlq+43cUp+j
         OwJA0rxDljKtR43cyqm2Q3REHnGCYNeWlhy6H+3Gb5TeFX6idbTr4tzhW8u2uom6eSuy
         C8Pyeat3SmnUjAo4kNsvedcJ1ZgXDa9UMwG7EXqITUjpv42fCn9GocKh2epQBRZBikDK
         YSfvmRAK4iK9XM6KQP7M+I4Gyq+0B7OFfxdXxzPjtlB4iMyTrpMBDKVqrDXYO54PjZm1
         ZLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CM7N46suxjlkNYhX9NO4Ul3ikAd8Rqs9FVmxwGAUjTo=;
        b=MgcdqitCj6lzoWgLZ287M/IBPcoLAzwSawnvhM/5pOw5ySp6M0dbVBt3oqnz71B/g4
         1s71FvKexcHO79Bz7IYXz49XapOAvxGjfaP6kfgRn5xph7AHMBPFuLuWVNsKm1xVpBFy
         0TdJiS8eW5V4KhanSUkQsToKwWOVDjUrZhZXMLIM7ehZWaLsrYh9ItBgOUZZSFQfCohC
         kIeJN47QuaUli/Km0kSqcMZS8hvS5r2JcbDKkW+krsq1b6l/uHWUPNEGENQNJtYHASI7
         dLxHgECkJP751JJsNGfV7K6RmAFas+3pniVIlbEVt62fkld4Z+mN2rkUMCtOON/wsL2J
         svzw==
X-Gm-Message-State: ACrzQf1/JuPfZHlJBzplI+JVohlH/c/wKnMQW4K9nRh/25hrB0GYz4YA
        eSRK8GLy9wjLCTZ36D1/eHqy7w==
X-Google-Smtp-Source: AMsMyM77AReF/wBx0e6gFLt/5xpjtSZ5rKtqgb9PYOOUDM7YkHUM9Wbi3IQYP/3CMGCV3p95uw2Vwg==
X-Received: by 2002:a05:6214:4119:b0:4b1:af7a:7f67 with SMTP id kc25-20020a056214411900b004b1af7a7f67mr299221qvb.67.1667569664302;
        Fri, 04 Nov 2022 06:47:44 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id bi6-20020a05620a318600b006bb366779a4sm2931211qkb.6.2022.11.04.06.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 06:47:43 -0700 (PDT)
Message-ID: <fa4e1af2-8b6c-b7cd-d20d-eacb17ff51ae@linaro.org>
Date:   Fri, 4 Nov 2022 09:47:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/6] iommu/exynos: Rearrange the platform driver code
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20221103195154.21495-1-semen.protsenko@linaro.org>
 <20221103195154.21495-6-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103195154.21495-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/11/2022 15:51, Sam Protsenko wrote:
> Move the platform_driver code to the bottom of the driver, as it's a
> canonical form for that. No functional change.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Fixed checkpatch style suggestion with "--strict" flag
> 
>  drivers/iommu/exynos-iommu.c | 361 +++++++++++++++++------------------


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


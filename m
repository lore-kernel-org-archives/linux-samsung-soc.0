Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28322ECAAD8
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 21 Sep 2022 15:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbiIUPYR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 21 Sep 2022 11:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiIUPYP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 21 Sep 2022 11:24:15 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21065883E1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Sep 2022 08:24:15 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a8so9741101lff.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Sep 2022 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IkfBzR1pPL4sqH+SzuxDp3p3OntI0w5vunqXgMMZcmo=;
        b=rNBsowUvNyhij2xBv5rDeBpR/yfpdhLrm03ppABwWh8FFbkd/2LG/aHo3skupAQDvq
         56axzEakXeiqhXDy7AL26VkZtFfcHWwtdDe7XC+F2XHK6QeAcQYI7YriAKuk8Q5jXif8
         DSg6iPIcvh4ipe9t90qFpASbcrJ0LsjFYGLGCwAKGqQAH5wJ8z6tI3sV883v1vc4yrKZ
         nmAO6qHeNrD0KQbj8HPcIqlCkJSHP8ftl1/rhz9RsJo/kohlgbdJNfP/ruplDpE9Bkxz
         AemZrWm0VrxTeapXQRFbKWRNUqYeR3p5PgqWvjDHhYb+59d84pFwkPxkmCMupiX/jFmN
         kq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IkfBzR1pPL4sqH+SzuxDp3p3OntI0w5vunqXgMMZcmo=;
        b=Xe6t634O6KeQR/38boW5oEgQKKqbaLDNn2Qy1d/DFBsYScIivNlhFpyU8Jqf4fczrl
         XuysP4fxLwC+WTHGbCHfdyhbPH8IAOQ+BJbfD1tp5EgPxIx2rX7b32J7ssEUB2R2QWYY
         x3woo2GzUUup5BgIkg7YcmjW5sgZCa1dmQAeGq7B/9EC27BMMI5Sf7suopVKIrbsXXX1
         pR2A180jkHORerBH2OMdCc0+ofrtFLo0DuPjXAyULN+iM3RGt6b+W0lZFFVU8Bb1KlU7
         htsYp6jYpcfU6zkyMoG16xpweg+KaAqJOlOAov9AMJSTZBZJRg/CXHrMoE/8ZKEi+Oee
         cT5w==
X-Gm-Message-State: ACrzQf3en2jdY5oXp9QzmaARmzz/4agOGbFMtEQIGy71CLAHIZVmVcfG
        f4vYVOqdC6Dcvcy99j0JIZnmaw==
X-Google-Smtp-Source: AMsMyM6t3a9lk8UQZAxKjOsgUpQi1lKsFwa3+vxfPNHOsjx9aGEV8R/rZQ6AF7qqASbhYiSJ3jVZyA==
X-Received: by 2002:a05:6512:c13:b0:49f:9a2f:8b86 with SMTP id z19-20020a0565120c1300b0049f9a2f8b86mr6452173lfu.413.1663773853473;
        Wed, 21 Sep 2022 08:24:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z18-20020a19f712000000b0049adbc24b99sm483777lfe.24.2022.09.21.08.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 08:24:13 -0700 (PDT)
Message-ID: <a1ec1143-6340-8572-c46b-0a4f923d7a92@linaro.org>
Date:   Wed, 21 Sep 2022 17:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 10/30] thermal/drivers/exynos: Replace
 of_thermal_is_trip_valid() by thermal_zone_get_trip()
Content-Language: en-US
To:     Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "open list:SAMSUNG THERMAL DRIVER" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>
References: <20220921094244.606948-1-daniel.lezcano@linaro.org>
 <20220921094244.606948-11-daniel.lezcano@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921094244.606948-11-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/09/2022 11:42, Daniel Lezcano wrote:
> The thermal_zone_get_trip() does the same check as
> of_thermal_is_trip_valid(). Replace the call to
> of_thermal_is_trip_valid() by thermal_zone_get_trip().
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


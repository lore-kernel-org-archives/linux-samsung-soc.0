Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AC8C6FA82
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Sep 2022 17:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbiIWRlS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Sep 2022 13:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbiIWRlD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Sep 2022 13:41:03 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF495EE64C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Sep 2022 10:40:03 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id n12so1028644wrx.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Sep 2022 10:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=QsuVOjPfclMcwP8wqLr3n2RY9nvNNr77YjobAM/HIYY=;
        b=H6L0D+4TyYrNgvSkApP3b4Z76j95XxG1wzK/98bF4r5NxPIgb62i0rFLWy7lMOvkkM
         K2wKnBfWNguTP9RlvxCX+D4ylUt5GJa0LqaNUv0DJ3zuoCyYFXgtkt2AXeFUmiHCKY/K
         gjLm0jcN5dNBLqMBFXrapcKnM2pQeBGr/KnQVNCl5SZRMln4rlMnRWaUemU8Qb17FQkj
         fjQpHq8KhbN+kc+zF7Mpy3qB/F+2rNMjisawq2BnM3J2jNh+krf58RpFbN+6xuh4emUl
         Zbv6JjQ2T0654GYpBj6vO1bpT46YsgrRhNKP5zsILNm/pDUJUESMuZARa9VFTWeTsYeo
         2BoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QsuVOjPfclMcwP8wqLr3n2RY9nvNNr77YjobAM/HIYY=;
        b=ZO939OJMynJvzY1r65r46HqsZoPHkbLM2+6sUGfwD88B6OL5l3YeObxszgR+Jb6fg2
         uFl5kLfzoK/B8W9qjcvTzeuBUeNdZNWzG69HsMI/lpDgyc8+nfX9/AjZy87HKZafaqS8
         udcD/awoi9oh++1s6yn/IPFuMDdLm9tpRTHi98wc7/knEYJn0kjxtyXtTRArDCGS3/lF
         md6k4g/CqN4ipM+61RNiYH/lEM3Anxd2wNBs9pX0HgZm+sN1dbviO5BMhJ3VwbzCxMKQ
         akvx4/0Noiyi208XpNf1IFR1DCyqmplHZn/Gp1l5ifx+GSVxzu37RYEBwqGj6DmmlDwv
         9BKw==
X-Gm-Message-State: ACrzQf3loffbsKLScQCItOUoj/zGfAsFb9gpbWCRhqgCWPcl7y6VKCfC
        ehFcrwzW54M53uLAqYpsue/dfw==
X-Google-Smtp-Source: AMsMyM7yk1FJy6WdVruMMyboi96UzFPD0vgB/hJC1F1S3+IGXF1csrbyA/C+3skWQY7oeMXIBuh/oQ==
X-Received: by 2002:adf:f80b:0:b0:228:dbb9:5bdf with SMTP id s11-20020adff80b000000b00228dbb95bdfmr5974312wrp.327.1663954802047;
        Fri, 23 Sep 2022 10:40:02 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id e6-20020adfdbc6000000b00228dc37ce2asm7648551wrj.57.2022.09.23.10.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 10:40:01 -0700 (PDT)
Message-ID: <cdbe5e4b-b0b1-3539-2a9a-bbf87a4d8e92@linaro.org>
Date:   Fri, 23 Sep 2022 19:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 10/30] thermal/drivers/exynos: Replace
 of_thermal_is_trip_valid() by thermal_zone_get_trip()
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "open list:SAMSUNG THERMAL DRIVER" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>
References: <20220921094244.606948-1-daniel.lezcano@linaro.org>
 <20220921094244.606948-11-daniel.lezcano@linaro.org>
 <CGME20220923140903eucas1p180002df0deb308d5148cc6004aef7efe@eucas1p1.samsung.com>
 <bc3a5137-b2be-0bfe-003a-db201a7a50e8@samsung.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <bc3a5137-b2be-0bfe-003a-db201a7a50e8@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


Hi Marek,

thanks for reporting

On 23/09/2022 16:09, Marek Szyprowski wrote:

[ ... ]

> Exception stack(0xf082dfb0 to 0xf082dff8)
> 
> [deadlock]
> 
> Something is wrong in locking in the functions from the above stacktrace.

Are you sure this deadlock is coming from this patch? Does a revert of 
this patch solve the issue ?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

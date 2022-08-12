Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4396C28B2C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 Aug 2022 10:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237342AbiHLKDH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 12 Aug 2022 06:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238009AbiHLKDF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 12 Aug 2022 06:03:05 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9565BA5C77
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Aug 2022 03:03:04 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id u1so692143lfq.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Aug 2022 03:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7XCMouDowcv3LrNhIXPQ3Y5PTFI9QQ/MPyoPgacMrBE=;
        b=rhZ1Y8wuTv6tETnnEUcu4kXuxhUVCd0Qjj2ZcY6rurXdhS0cLI1z94igGIm1ACF9CQ
         eI6hgdo1Qcy7RHQWrPDQq8qKRYy79Rg7NCZfQqcjXDPQx+bd7NsgAOChY7HIwgjrDQ/A
         m3XCgqp6t4YfllXTM4SSGuEjUd7FPs7E26XM9jtnd1xIxFSQlwNZx2gCGeTVTZrVaLmp
         lZjFMuDC3Gtr7WtmrzP8hlATvkxtQJn3MUyPZ/32g7w0cixe0KS6a6ArHfsrREbTQMoV
         PXD6UNO7f1+eoOijDjSFWQziCeRYlpR2qQuNorYAmPQS3WvJk2CRQZLwXZWNVKh+bKUr
         G9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=7XCMouDowcv3LrNhIXPQ3Y5PTFI9QQ/MPyoPgacMrBE=;
        b=vQXi9UjUjCMi50NcP5aKuWd3HVQzr7AcblWgHByr3whc6b9qGRwYE91cBRaQ/Ph9JS
         TQlUY5DusTuH85HELcJNiW2z3EV8xuTzyLWq6pQeF0TkrKIfKQz5aVcI+Mu8Mgcog7yz
         QnDkJ7AwLqWEk7a8YHPZSav7EJJisoH7/fsnEI50GfnlnxUlle6fg9dP6rcNdnrQQEb7
         vIX/BttTH6NLLcQ0DmYbHrXFEyp3PqON9AK5ouqphJs/CP1M//wnQh9cbCT/vHN76sRR
         K+ud4ApnUarLqVax1XZ5+u4s8O+a+hoYOFRh6CW7w4q8+ZIqUJxegkiyrr6R/lrfuGGw
         qneQ==
X-Gm-Message-State: ACgBeo0deTacfd9tj8olvnSBY8udSQGhQKtijKl7efDQhLG8ofQOjjt8
        hxmzELB6RW6tLgWAgFy5K4mYJg==
X-Google-Smtp-Source: AA6agR4Q2zKJuK5lITEVBPgcjvjTJoOGAyrwneRqBBawJ91Q6mMigIMsYYnZ8xwOnk8YuaziOl5CDQ==
X-Received: by 2002:a05:6512:a8f:b0:48b:685b:4ebc with SMTP id m15-20020a0565120a8f00b0048b685b4ebcmr976744lfu.258.1660298582823;
        Fri, 12 Aug 2022 03:03:02 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id l6-20020a19c206000000b0048a9f1933f2sm155333lfc.247.2022.08.12.03.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 03:03:02 -0700 (PDT)
Message-ID: <a9a0e625-6476-02b4-18ba-9ab2e4e9925b@linaro.org>
Date:   Fri, 12 Aug 2022 13:02:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 18/26] thermal/drivers/exynos: Replace
 of_thermal_is_trip_valid() by thermal_zone_get_trip()
Content-Language: en-US
To:     Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc:     rui.zhang@intel.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "open list:SAMSUNG THERMAL DRIVER" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>
References: <20220809220436.711020-1-daniel.lezcano@linaro.org>
 <20220809220436.711020-19-daniel.lezcano@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220809220436.711020-19-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/08/2022 01:04, Daniel Lezcano wrote:
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Missing commit msg.

> ---
>  drivers/thermal/samsung/exynos_tmu.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)



Best regards,
Krzysztof

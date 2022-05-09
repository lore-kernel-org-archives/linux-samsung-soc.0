Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA3AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 May 2022 07:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbiEIHXJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 May 2022 03:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234464AbiEIHEa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 May 2022 03:04:30 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1ED2F1
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 May 2022 00:00:35 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id m20so24892324ejj.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 May 2022 00:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=10+UzFhJUXUE/m7JFftwGBDXxzJS2yQN7xf9L3FQsJY=;
        b=fu5e+GgqRHJzTtZ3kal25qzqR+wfPA2xl9VjVKrAtR/wf9GRNhxSBe77yHnT8WTjV7
         LvfJ9+OhI1+9+RpMfAkZX9QU5PXGu70Lp9qgQb64riRZRAypCNolfEjJZxeU2ORhh+t2
         k8s5Y5TyxC/V+py89mZdkZCMXLTpCTrXAbv+SKRogomeGxBcPPoCOHnfg6/aVl8zrxdo
         nHctqvSeXt2ygsFKcyrF2tl0lHORk2XWaWHFDtkcVeedHPoue2SQWRrFomzPOxOMoZYA
         uGlNCNflJD8XFYbYV8JzaYE4EsOtromc7hr3AWu0Fv5Cxwrzinhm60hC0WO3PjweozLl
         tRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=10+UzFhJUXUE/m7JFftwGBDXxzJS2yQN7xf9L3FQsJY=;
        b=LAzinbhXZjb+Jozd3nzlWvnBIodAUukIWA+jZbBwjOWWZT6MtKKCYDEfYSGEsa98Mn
         6Rw7womNo9Kk4MQtI6ygvltac17eiqlugJQUgcY6MSCF7hdWuKR1CKthqbxeJay5e0dO
         yTSHKFx+36eLrjJ4XyJrClDvQx7NKWykwQ8kqY0BFkn5n75s/c7S0tQwwdVpgJt8Hcd5
         KyfCIVPvZOrKmzr79YMflaz6ixyvr1u6eBA39kksL0IFJjMO9O258yC/KUarVntwipIp
         oxi8ciIfjPA/xl2+ctY3q9CPEtrCf06G/1tQYGOqO5wKoo9FY1UN+sFDz8qX5abMiN+i
         Jg8Q==
X-Gm-Message-State: AOAM530P+wECOVxIlxZA1MD6jG4GU/aRmdXQcZWTRlDt6S3EspOdw1Lq
        13VYtLS7GteA4TXbNFClf4tm1Q==
X-Google-Smtp-Source: ABdhPJx+W8N0wDBux4Nviec94vEc13Cct6fPOWv1Zrt8QYQrOJjntM1uzd1nkPPpUe1+c7WPTHRJ3w==
X-Received: by 2002:a17:906:a2c2:b0:6e7:efc2:17f2 with SMTP id by2-20020a170906a2c200b006e7efc217f2mr12668739ejb.542.1652079633872;
        Mon, 09 May 2022 00:00:33 -0700 (PDT)
Received: from [192.168.0.242] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y5-20020a50f1c5000000b0042617ba63afsm5909016edl.57.2022.05.09.00.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 00:00:33 -0700 (PDT)
Message-ID: <84d8e292-1bae-6088-5a06-88c635275672@linaro.org>
Date:   Mon, 9 May 2022 09:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 02/14] thermal/core: Add a thermal sensor structure in
 the thermal zone
Content-Language: en-US
To:     Daniel Lezcano <daniel.lezcano@linexp.org>,
        daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     khilman@baylibre.com, abailon@baylibre.com,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:RENESAS R-CAR THERMAL DRIVERS" 
        <linux-renesas-soc@vger.kernel.org>,
        "open list:SAMSUNG THERMAL DRIVER" 
        <linux-samsung-soc@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
References: <20220507125443.2766939-1-daniel.lezcano@linexp.org>
 <20220507125443.2766939-3-daniel.lezcano@linexp.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220507125443.2766939-3-daniel.lezcano@linexp.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/05/2022 14:54, Daniel Lezcano wrote:
> The thermal sensor ops is directly defined in the thermal zone but
> still its data structuration makes the sensor ops and the thermal zone
> too much interconnected for multiple sensors per thermal zone.
> 
> Create a dedicated structure for the thermal sensor to be included in
> the thermal zone structure so these components are clearly separated.
> 
> Cc: Alexandre Bailon <abailon@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc; Eduardo Valentin <eduval@amazon.com>

You have a ';' typo here.

> Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
> ---
>  drivers/thermal/broadcom/bcm2835_thermal.c |  2 +-
>  drivers/thermal/gov_bang_bang.c            |  6 +--
>  drivers/thermal/gov_fair_share.c           |  6 +--
>  drivers/thermal/gov_power_allocator.c      | 18 ++++----
>  drivers/thermal/gov_step_wise.c            |  4 +-
>  drivers/thermal/rcar_gen3_thermal.c        |  6 +--
>  drivers/thermal/samsung/exynos_tmu.c       |  6 +--

For Samsung:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

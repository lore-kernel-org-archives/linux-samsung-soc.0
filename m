Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FBDC38145
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Sep 2022 11:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbiIGLHV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Sep 2022 07:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiIGLHU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Sep 2022 07:07:20 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E40082FA3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Sep 2022 04:07:19 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bn9so15524304ljb.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Sep 2022 04:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lvtJG6I12xIUOgfdF4widnYZYk9JagVGFuN0/DDPLdU=;
        b=XiMUPBPxPc9IhVA1ZGgRlWRAegNFsU/EoUpWrSg+v+nbt/y4HeQi6x3+iXihRNL0le
         f5hjw/1+TTM/t3tu0+/8hOZezVP6Lhs7dAs4s+s73Hh4bKpPxt8Rnne8DypzDTXnXwvH
         ORkltv3XCpDUtqh9stWnUzrufQAFeNfQmnRvjP5OiYgAUKWhKZxaZQk4v9Wzk/ARalCt
         2jKDWi8fDljjmo745pzpdZb2djh1xhuYIhOCWcvOM6J2nIHPGDXP8tWkU1BAx98Aolec
         vvRdZui0sxbt2CvsDohKkqUTKb1a0zuTVB+ldLst4l9APdKAdaUwwNVl68txorng1xHO
         S+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lvtJG6I12xIUOgfdF4widnYZYk9JagVGFuN0/DDPLdU=;
        b=ehD0nrtswisU7/dL2vbaTJ/Hox0OZKSkW1IzLIGOot6Iy85TA829iW0B5lus5ctrgF
         R+basW5MDx0JtkX0kUwF+gRD+gYCMWTZrcRX5qoThorfQXbBsOlwKlJ9wAZWYW53cupA
         /CmrkIep6CePPnWnlX/11iUtiVJdV9KpgzeMVI30XKsMN7+mA0sCUz7KW7KDGlaIv0Ki
         x2Sh22Juw/N9HBmZKW3bn/eI3qq5JVi9hjsMCdOHLO16r31I6S2+MqrQJdkQOfWpYpU7
         82uOvxLEiynASPPqB2BKhXruT90WEbTxDJwby/aS4LP4QxjowCKUBLKV6W0dM57nk5pu
         2A/A==
X-Gm-Message-State: ACgBeo2V72Bqi2Hza+ssc3x8aaPiiPouJ1TUpbdtDmiXsP1/EM6mymRV
        EEGQyk1VljRxzF6ZjtxlgsIkZw==
X-Google-Smtp-Source: AA6agR4BsvretTiQT3ouMfvY5Cv6ZwiSK/2diedXXx6s6LwAJ8VnnPNgBRPXt6owZeAN/Boc80yIxg==
X-Received: by 2002:a2e:3002:0:b0:26a:b199:46df with SMTP id w2-20020a2e3002000000b0026ab19946dfmr766144ljw.304.1662548837711;
        Wed, 07 Sep 2022 04:07:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b0048b18700dddsm2407812lfr.106.2022.09.07.04.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 04:07:17 -0700 (PDT)
Message-ID: <da1178da-bb0c-fb7e-9ff9-ee4e3caaf222@linaro.org>
Date:   Wed, 7 Sep 2022 13:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 10/30] thermal/drivers/exynos: Replace
 of_thermal_is_trip_valid() by thermal_zone_get_trip()
Content-Language: en-US
To:     Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "open list:SAMSUNG THERMAL DRIVER" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>
References: <20220906164720.330701-1-daniel.lezcano@linaro.org>
 <20220906164720.330701-11-daniel.lezcano@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906164720.330701-11-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/09/2022 18:47, Daniel Lezcano wrote:
> The thermal_zone_get_trip() does the same check as
> of_thermal_is_trip_valid(). Replace the call to
> of_thermal_is_trip_valid() by thermal_zone_get_trip().
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index 91e6860b5ec4..5e6bb74c67f0 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -554,13 +554,15 @@ static void exynos4210_tmu_control(struct platform_device *pdev, bool on)
>  {
>  	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
>  	struct thermal_zone_device *tz = data->tzd;
> +	struct thermal_trip trip;
>  	unsigned int con, interrupt_en = 0, i;
>  
>  	con = get_con_reg(data, readl(data->base + EXYNOS_TMU_REG_CONTROL));
>  
>  	if (on) {
>  		for (i = 0; i < data->ntrip; i++) {
> -			if (!of_thermal_is_trip_valid(tz, i))
> +
> +			if (thermal_zone_get_trip(tz, i, &trip))

No need for empty line before. Ditto in other places.

Best regards,
Krzysztof

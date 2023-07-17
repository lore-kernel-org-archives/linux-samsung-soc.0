Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031BFC001E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Jul 2023 05:59:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjGQF7A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Jul 2023 01:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjGQF67 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 01:58:59 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22A1E48
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jul 2023 22:58:57 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso5411844a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jul 2023 22:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689573536; x=1692165536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k631ugiro94uqzvQOpxnR6/BSCvO3zY6daW5g9o+b4c=;
        b=noOLwLxY+8VAm0GPn80Qt4djj2hliItvWMeuYPZ/VfTfgfhYBFycibxIxgGcwk33Lp
         u/O3HL17SUAbD3NcKuxcc6GjqP8tSLuRaKgSgG1C0grYZbJQGXkDJJjX4j6ZSGYaGHi+
         RrI2unE/l6vQZUTdCLbShqcRYz09++k5rEqKdfWyJ4FCoBUPP8QLlc4AfAFYENcTPHT3
         8hE3Vin1cthOnb/8miTb6ChvPIEE/pNB/iIOSunjO8Qc/P1jkAxi/qZraRM2bYVRH0CT
         LCXha+Mc32qhmi7/0nra1k3eMBcBWDtXkT26BiBP54XoiDsMuRbE4TmkvSThBhHoBMIO
         1MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689573536; x=1692165536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k631ugiro94uqzvQOpxnR6/BSCvO3zY6daW5g9o+b4c=;
        b=UUxwM5CW+/XiCVzR+pu90+m6GXYredHApK4/onF7Zc7V6rWJ2wYxnvSw0xeVr5YElO
         urBNH0f9t/8PzBINdJPRDT5XwfGCqZlz0FfzlBWwxFvgXaF0/165VJtIq8n7TnQ4B2AK
         iifPiM5NIHkv53eRx0T0DVJMMytNA0r2PyvvswnsBweuSCC0P//VgtUPP4DyFuENNrBN
         z8zmXPAEhAOyUKL04/GBllgpFnJ8V4ChJKzXA3WBPHwLEPE+3bEbUoj6R519TSugVi4v
         Q6NtJ2kOyZXCGhHp14aGwO268hoIqq51JLHhUz0bPz9nFu49XlhE1CCTBY1/+r0bMY6W
         hy9w==
X-Gm-Message-State: ABy/qLanGh+BFCcGaWN5bEV7cCAme8HLo7/pDhHFWJO1GaMcp1P2yE7q
        RJzC9U/NRHA3hrWk/enp2znHBQ==
X-Google-Smtp-Source: APBJJlHgKqIdlmRkFNftYeegIddWrsGKkE5tQaWsbAjoEdQ4qunH1DIhrT2XP16EPef81XkUgI71JQ==
X-Received: by 2002:a17:906:74c4:b0:993:fba5:cdfa with SMTP id z4-20020a17090674c400b00993fba5cdfamr9395356ejl.26.1689573536167;
        Sun, 16 Jul 2023 22:58:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s7-20020a1709064d8700b00993004239a4sm8678232eju.215.2023.07.16.22.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 22:58:55 -0700 (PDT)
Message-ID: <31af3a96-7e98-8bb1-f9e9-53ccb0441310@linaro.org>
Date:   Mon, 17 Jul 2023 07:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] pwm: samsung: Add compatible for ExynosAutov9 SoC
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
References: <20230714100929.94563-1-jaewon02.kim@samsung.com>
 <CGME20230714101434epcas2p3e2475698c527ca72dee797225d3dad37@epcas2p3.samsung.com>
 <20230714100929.94563-3-jaewon02.kim@samsung.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714100929.94563-3-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/07/2023 12:09, Jaewon Kim wrote:
> Add new compatible string to support ExynosAutov9 SoC.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  drivers/pwm/pwm-samsung.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
> index e8828f57ab15..50a88565c440 100644
> --- a/drivers/pwm/pwm-samsung.c
> +++ b/drivers/pwm/pwm-samsung.c
> @@ -513,6 +513,7 @@ static const struct of_device_id samsung_pwm_matches[] = {
>  	{ .compatible = "samsung,s5p6440-pwm", .data = &s5p64x0_variant },
>  	{ .compatible = "samsung,s5pc100-pwm", .data = &s5pc100_variant },
>  	{ .compatible = "samsung,exynos4210-pwm", .data = &s5p64x0_variant },
> +	{ .compatible = "samsung,exynosautov9-pwm", .data = &s5p64x0_variant },

That's not what I asked for. You do not need entry here. Devices are
compatible.

Best regards,
Krzysztof


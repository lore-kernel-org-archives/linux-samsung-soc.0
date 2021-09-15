Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46731C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 16:37:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28B0460FA0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 16:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhIOQjQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 12:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhIOQjP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 12:39:15 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0374CC061574;
        Wed, 15 Sep 2021 09:37:57 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id q68so3262509pga.9;
        Wed, 15 Sep 2021 09:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iOr6zcjMaLs0KTnNS9eDKxY/oi2/iWBDb8WhSTtIqNc=;
        b=TwImoFinOGFJOCMBCRwV0eIxPyqA+atDqHF9BZ6hf+a1adRn+2HGrq/D/pCbBbMbxR
         A6e7OAm/LpFYCeIXr1QQi96L3XsCAiX4874o/d1ffYzMiwQKEL5Xsot5tkMMzLzfCk05
         +LGoeWTQY271gJhSpGHlfOaNpfizJ8vAXgLvWjyKBzGilmx2c8P0M8bZpcjgFTLARqz4
         BmkDwD4UpPjPYdO22/zhUzarlv3EzKCzPzvPogPurJWLKUPJaMpF1L93svPXqjSFSeRW
         0yAc4EnZS5+oekvBMKgWrS5JhONVjD2DOlH5Mv7+ORRkt8EUk2eb3b6nfxhQDYZci8bb
         dsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iOr6zcjMaLs0KTnNS9eDKxY/oi2/iWBDb8WhSTtIqNc=;
        b=LXkrLLlum2MIXgMdGEa2U7IBGIPmzvKazRq78cmedK33L53lQP7wzqsavZDs7TSA2u
         aaYyN+mLNgtHYqJC+mImgwvoqOiuoF2Vr+AZDm48ueZaxStCvHc1B2/OGmbj5POW9Bz8
         BEyxnQVAwQVSGRD6IaLEDQTrL7dDNaIOO4MhSTCxeNTz08dvIM/dP57FgIWtb0tAXBvZ
         2uJubm9ashkz76Ek9RtNNYAu7bstygejpi3vldlKngeS3FGwfzyxqUwre+2HGkR30zPL
         6hxI54ChqusHFqvaVDmgoFVipJUNxmGtCQ6dqIaAIMTGrrLcca5cSjmWtUisS2le81Hy
         uwQA==
X-Gm-Message-State: AOAM531hRFB2j01vQF7GqcfmRfUvzeCUZ5JJvQUoIH0wjF2U8YZ5Q83D
        pz0qGfgjwB5G0FYTobYXGgmqtpJuUWo=
X-Google-Smtp-Source: ABdhPJxSWhfeQzYcwgH8HF2m56rKPh1NaF52beQNswXHQfHhAlcica/XpQGaQn8O5ddQLp/+shJcfQ==
X-Received: by 2002:aa7:8d58:0:b0:439:d68:b405 with SMTP id s24-20020aa78d58000000b004390d68b405mr598896pfe.2.1631723875989;
        Wed, 15 Sep 2021 09:37:55 -0700 (PDT)
Received: from [172.30.1.2] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id b29sm478926pgn.53.2021.09.15.09.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 09:37:55 -0700 (PDT)
Subject: Re: [PATCH 4/6] dt-bindings: clock: Add bindings definitions for
 Exynos850 CMU
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <96e5587e-aca7-248e-6448-8edfc70784b7@gmail.com>
Date:   Thu, 16 Sep 2021 01:37:49 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-5-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

You don't add clock ids for the all defined clocks in clk-exynos850.c.
I recommend that add all clock ids for the defined clocks if possible.

If you want to change the parent clock of mux or change the clock rate
of div rate for some clocks, you have to touch the files as following:
- include/dt-bindings/clock/exynos850.h
- drivers/clk/samsung/clk-exynos850.c
- exynos850 dt files

If you define the clock ids for all clocks added to this patchset,
you can change the parent or rate by just editing the dt files.

But, I have no strongly objection about just keeping this patch.


On 21. 9. 15. 오전 12:56, Sam Protsenko wrote:
> Clock controller driver is designed to have separate instances for each
> particular CMU. So clock IDs in this bindings header also start from 1
> for each CMU.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>   include/dt-bindings/clock/exynos850.h | 72 +++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
>   create mode 100644 include/dt-bindings/clock/exynos850.h
> 
> diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
> new file mode 100644
> index 000000000000..2f0a7f619627
> --- /dev/null
> +++ b/include/dt-bindings/clock/exynos850.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 Linaro Ltd.
> + * Author: Sam Protsenko <semen.protsenko@linaro.org>
> + *
> + * Device Tree binding constants for Exynos850 clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_EXYNOS_850_H
> +#define _DT_BINDINGS_CLOCK_EXYNOS_850_H
> +
> +/* CMU_TOP */
> +#define DOUT_HSI_BUS			1
> +#define DOUT_HSI_MMC_CARD		2
> +#define DOUT_HSI_USB20DRD		3
> +#define DOUT_PERI_BUS			4
> +#define DOUT_PERI_UART			5
> +#define DOUT_PERI_IP			6
> +#define DOUT_CORE_BUS			7
> +#define DOUT_CORE_CCI			8
> +#define DOUT_CORE_MMC_EMBD		9
> +#define DOUT_CORE_SSS			10
> +#define TOP_NR_CLK			11
> +
> +/* CMU_HSI */
> +#define GOUT_USB_RTC_CLK		1
> +#define GOUT_USB_REF_CLK		2
> +#define GOUT_USB_PHY_REF_CLK		3
> +#define GOUT_USB_PHY_ACLK		4
> +#define GOUT_USB_BUS_EARLY_CLK		5
> +#define GOUT_GPIO_HSI_PCLK		6
> +#define GOUT_MMC_CARD_ACLK		7
> +#define GOUT_MMC_CARD_SDCLKIN		8
> +#define GOUT_SYSREG_HSI_PCLK		9
> +#define HSI_NR_CLK			10
> +
> +/* CMU_PERI */
> +#define GOUT_GPIO_PERI_PCLK		1
> +#define GOUT_HSI2C0_IPCLK		2
> +#define GOUT_HSI2C0_PCLK		3
> +#define GOUT_HSI2C1_IPCLK		4
> +#define GOUT_HSI2C1_PCLK		5
> +#define GOUT_HSI2C2_IPCLK		6
> +#define GOUT_HSI2C2_PCLK		7
> +#define GOUT_I2C0_PCLK			8
> +#define GOUT_I2C1_PCLK			9
> +#define GOUT_I2C2_PCLK			10
> +#define GOUT_I2C3_PCLK			11
> +#define GOUT_I2C4_PCLK			12
> +#define GOUT_I2C5_PCLK			13
> +#define GOUT_I2C6_PCLK			14
> +#define GOUT_MCT_PCLK			15
> +#define GOUT_PWM_MOTOR_PCLK		16
> +#define GOUT_SPI0_IPCLK			17
> +#define GOUT_SPI0_PCLK			18
> +#define GOUT_SYSREG_PERI_PCLK		19
> +#define GOUT_UART_IPCLK			20
> +#define GOUT_UART_PCLK			21
> +#define GOUT_WDT0_PCLK			22
> +#define GOUT_WDT1_PCLK			23
> +#define PERI_NR_CLK			24
> +
> +/* CMU_CORE */
> +#define GOUT_CCI_ACLK			1
> +#define GOUT_GIC_CLK			2
> +#define GOUT_MMC_EMBD_ACLK		3
> +#define GOUT_MMC_EMBD_SDCLKIN		4
> +#define GOUT_SSS_ACLK			5
> +#define GOUT_SSS_PCLK			6
> +#define CORE_NR_CLK			7
> +
> +#endif /* _DT_BINDINGS_CLOCK_EXYNOS_850_H */
> 


-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E327C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 20 Feb 2022 10:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243656AbiBTKC2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 20 Feb 2022 05:02:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiBTKC1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Feb 2022 05:02:27 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DA436E2E
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 02:01:57 -0800 (PST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0B98C3F1F6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645351316;
        bh=h/yuAaqPGQGM7QsM1OKmPTsCKWn2XUQ3eAZ4j+I7pq4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=nxdqog6rDrpVm/v/cIlq4KnwJmzd6cModN+cBDGMRdtBqgOL50N4M0qk46a+CTsjf
         awK9wAXNbLZjDEFVrbA3dZ0QGlafetpqUX/0Vl9OtpsTBoJIqh5g71rhM6JMOs9ZxX
         E5c2aM32fSfAvMfOad0stRWrrm9/lEpML0U+yetc46kx/sgMhO/55H6V4lF3nKCCl3
         9epUl2Xd7GMvFY9S05Q4qswX032l9X07owfud6ry+8iGJO2AcDl2o23XzABBwkqCuS
         DklLv4dYjBTyoPoq3VPcAxZWtRHjvs7Yz8UjdMsR2KFZQDeZpjFw5wUhf2T0tuoMFZ
         EnTudo3J1coqA==
Received: by mail-wr1-f71.google.com with SMTP id q21-20020adfab15000000b001e57c9a342aso5710125wrc.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 02:01:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h/yuAaqPGQGM7QsM1OKmPTsCKWn2XUQ3eAZ4j+I7pq4=;
        b=YveCGMLgO6Z++EZROM5DtiHVyWII/JsoyGPNL5rCrJ1VSpjH+u8wRWnzSr53v3CcFj
         gL/dO8zO3m9zM17T1kshl8mcFf8sYDrlOcYKl79Zz3sYPVOGNSQfDXCWWUoP/AEFfVzB
         Z8w14PJTEEKsmEfjjuKfIe4xxLqaJq1vlspxdEC6p/8fRrs6JmSijPeKH3vR2+MJgtDE
         0/BpZ6mSQy7ZpaD20XKDQ/jgUl2SrmgKq3VQ4IHUWOLRzZEspT+rMcPe2qBgvHw0+557
         TO7ao/IWOZkYRLux2E+i4Rpq3B7H9dl1XOL0agLzPAZlmCz374ZF3Z7COIacxWYnD/6X
         0qpQ==
X-Gm-Message-State: AOAM530nUjCeRSXOFtBsmSgkZKDHwCtfkhBmL923lpk6p7f5JgYnV+iv
        s/09OOCjsQ3nA1RodfmJ8dXsfA0oPUvN+c9j9bN2FG71riVsN+8wbgjbMpQyL6Bp3U+HhtdyDBY
        5DDMbO7s9Sf/mc7lG0Zfk8B/goqTjhrczvQtkZm9z5JbUDfXT
X-Received: by 2002:a05:6000:1a8f:b0:1e8:3301:1273 with SMTP id f15-20020a0560001a8f00b001e833011273mr11914048wry.707.1645351315040;
        Sun, 20 Feb 2022 02:01:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrFTR0DbwozDQn/7295tKObTgtOU/PyXe0N9s9UQMlz1DetvYZfo7VjgXm21EZ015Z8nTbUg==
X-Received: by 2002:a05:6000:1a8f:b0:1e8:3301:1273 with SMTP id f15-20020a0560001a8f00b001e833011273mr11914034wry.707.1645351314863;
        Sun, 20 Feb 2022 02:01:54 -0800 (PST)
Received: from [192.168.0.117] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id f14sm4884389wmq.3.2022.02.20.02.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 02:01:54 -0800 (PST)
Message-ID: <72848f6c-adc7-2d36-edcd-9a5fac655bbc@canonical.com>
Date:   Sun, 20 Feb 2022 11:01:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Remove mct interrupt
 index enum
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, pankaj.dubey@samsung.com,
        m.szyprowski@samsung.com
References: <CGME20220219175832epcas5p399b652e6da610ada233376651694b42c@epcas5p3.samsung.com>
 <20220219181003.12739-1-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220219181003.12739-1-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/02/2022 19:10, Alim Akhtar wrote:
> MCT driver define an enum which list global and local timer's
> irq index. Most of them are not used but MCT_G0_IRQ and
> MCT_L0_IRQ and these two are at a fixed offset/index.
> Get rid of this enum and use a #define for the used irq index.
> 
> While at it, bump-up maximum number of MCT IRQ to match the
> binding documentation. And also change the name variable to be
> more generic.
> 
> No functional changes expected.

There is a functional change - you increase MCT_NR_IRQS from 12 to 20
which affects size of mct_irqs. Can you increase it in separate commit?

> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clocksource/exynos_mct.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> 
> - currently tested on exynos7 platform, appreciate testing on
>  exynos-{3,4,5} platforms
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 6db3d5511b0f..4aea9cd3f7ba 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -60,27 +60,18 @@
>  #define MCT_CLKEVENTS_RATING		350
>  #endif
>  
> +/* There are four Global timers starting with 0 offset */
> +#define MCT_G0_IRQ	0
> +/* Local timers count starts after global timer count */
> +#define MCT_L0_IRQ	4
> +/* Max number of MCT IRQ as per binding document */
> +#define MCT_NR_IRQS	20
> +
>  enum {
>  	MCT_INT_SPI,
>  	MCT_INT_PPI
>  };
>  
> -enum {
> -	MCT_G0_IRQ,
> -	MCT_G1_IRQ,
> -	MCT_G2_IRQ,
> -	MCT_G3_IRQ,
> -	MCT_L0_IRQ,
> -	MCT_L1_IRQ,
> -	MCT_L2_IRQ,
> -	MCT_L3_IRQ,
> -	MCT_L4_IRQ,
> -	MCT_L5_IRQ,
> -	MCT_L6_IRQ,
> -	MCT_L7_IRQ,
> -	MCT_NR_IRQS,
> -};
> -
>  static void __iomem *reg_base;
>  static unsigned long clk_rate;
>  static unsigned int mct_int_type;
> @@ -89,7 +80,7 @@ static int mct_irqs[MCT_NR_IRQS];
>  struct mct_clock_event_device {
>  	struct clock_event_device evt;
>  	unsigned long base;
> -	char name[10];
> +	char name[MCT_NR_IRQS - 1];

This does not look related MCT_NR_IRQS and using here MCT_NR_IRQS
confuses. This is a "mct_tick%d" with number of local timers, so maybe
make it just 11?

>  };
>  
>  static void exynos4_mct_write(unsigned int value, unsigned long offset)


Best regards,
Krzysztof

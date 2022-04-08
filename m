Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3545C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Apr 2022 08:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbiDHIE7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Apr 2022 04:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbiDHIEz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Apr 2022 04:04:55 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C534616E
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Apr 2022 01:02:51 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a6so15815532ejk.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2022 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=R9Md63+7fr/H3jBSeDn6jW2GcrFtPS6wpqfkErlWzYs=;
        b=wXNxS+sXTeFjGclx/evzx327C3xVpMS4QBc7+yw9rYbeVDC6oSkDRn2RkOVSaDK1TG
         8oUK0NAPDSS9UkzMn/f/WFIEszV7CK8uaO0JW/+RpG6BS1CbB8x9HdS0iRJanDEOGIp9
         2TT8iErw0dgR2GNxrXRIM1iJPzExQIlNw4C5D3OGi11+813vRdDoUgQAMOv6P6KC3e/r
         MdwjRfX6NvAkIZbttaCDTBtxgD+zAN9AcqJRFUiindDTpv+99wYVETna4uuzl5aflirm
         QWep79zBfnF+J+YcL7EPP4o8guH7DcN6oJlpXVBbr2EhX8DXWyvxHSvam/gu5XdKE941
         RVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R9Md63+7fr/H3jBSeDn6jW2GcrFtPS6wpqfkErlWzYs=;
        b=e0Zh4VkobzP4w1RImHQYHDoh2xP2UYc7QxqHJk30w1KR5V0kMvdxZGvEO9koYuWHRA
         wLM0MLcD5hdkBozhMQiBKk8UNRlkyv2v+J1GpJH/PLqWmkJB1MjGmZuhHbQ9yd5I4q/K
         q1dxSrpSELieC5vp5QvZ2CeCB2TV2yXeE8st0XgxcSmXQ3O7hWHABg0BswZ8nCeCkYds
         J/M2HDA1ShmDqatbx2D30FiZFm7EE1DMc5Lbm4q6GYUuttUHfQB52EU6o21M2LGwF+vW
         AhDh/0Tvx3Yvtr/og3VybwFKdrkkNBlWTLEO0dI27bxJl7gYExlSYaVdNSqNGz5VfWAp
         xB2A==
X-Gm-Message-State: AOAM533d9t2kPk4qyrAkM9x8qXKZz3cjhUM3bHoRhiIX5/WjheZEL7y+
        GSo6n9o0yDcFPHKymvQtHvyTVA==
X-Google-Smtp-Source: ABdhPJw2gfzBuf2XdCtgNaMTM0ghNsz5J1dYtRJ4Ror0ozVjlCbuufkcCCmi2st+vP5tn+jNhrRFWw==
X-Received: by 2002:a17:907:1c0c:b0:6e0:9b15:29d5 with SMTP id nc12-20020a1709071c0c00b006e09b1529d5mr17347893ejc.416.1649404969626;
        Fri, 08 Apr 2022 01:02:49 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id d7-20020a170906174700b006e80a7e3111sm3826217eje.17.2022.04.08.01.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 01:02:49 -0700 (PDT)
Message-ID: <d3cd6d0c-26b7-c870-ee30-361ef4e11f35@linaro.org>
Date:   Fri, 8 Apr 2022 10:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/4] clocksource/drivers/exynos_mct: Support
 local-timers property
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        tglx@linutronix.de, daniel.lezcano@linaro.org
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org
References: <20220407074432.424578-1-vincent.whitchurch@axis.com>
 <20220407074432.424578-4-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407074432.424578-4-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2022 09:44, Vincent Whitchurch wrote:
> If the device tree indicates that the hardware requires that the
> processor only use certain local timers, respect that.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 
> Notes:
>     v3:
>     - Use array in devicetree
>     - Remove addition of global variable
>     - Split out FRC sharing changes
> 
>  drivers/clocksource/exynos_mct.c | 51 ++++++++++++++++++++++++++++----
>  1 file changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 12023831dedf..4093a71ff618 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -33,7 +33,7 @@
>  #define EXYNOS4_MCT_G_INT_ENB		EXYNOS4_MCTREG(0x248)
>  #define EXYNOS4_MCT_G_WSTAT		EXYNOS4_MCTREG(0x24C)
>  #define _EXYNOS4_MCT_L_BASE		EXYNOS4_MCTREG(0x300)
> -#define EXYNOS4_MCT_L_BASE(x)		(_EXYNOS4_MCT_L_BASE + (0x100 * x))
> +#define EXYNOS4_MCT_L_BASE(x)		(_EXYNOS4_MCT_L_BASE + (0x100 * (x)))
>  #define EXYNOS4_MCT_L_MASK		(0xffffff00)
>  
>  #define MCT_L_TCNTB_OFFSET		(0x00)
> @@ -66,6 +66,8 @@
>  #define MCT_L0_IRQ	4
>  /* Max number of IRQ as per DT binding document */
>  #define MCT_NR_IRQS	20
> +/* Max number of local timers */
> +#define MCT_NR_LOCAL	(MCT_NR_IRQS - MCT_L0_IRQ)
>  
>  enum {
>  	MCT_INT_SPI,
> @@ -456,7 +458,6 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
>  		per_cpu_ptr(&percpu_mct_tick, cpu);
>  	struct clock_event_device *evt = &mevt->evt;
>  
> -	mevt->base = EXYNOS4_MCT_L_BASE(cpu);
>  	snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
>  
>  	evt->name = mevt->name;
> @@ -528,7 +529,9 @@ static int __init exynos4_timer_resources(struct device_node *np)
>  }
>  

Document the arguments, especially focusing on the keys and the contents
of local_idx. The code is getting to a state with 3 or 4 variables
having similar meaning (IRQ number, local IRQ number, local IRQ index).

>  static int __init exynos4_timer_interrupts(struct device_node *np,
> -					   unsigned int int_type)
> +					   unsigned int int_type,
> +					   u32 *local_idx,

const u32 *

> +					   size_t nr_local)
>  {
>  	int nr_irqs, i, err, cpu;
>  
> @@ -561,13 +564,19 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>  	} else {
>  		for_each_possible_cpu(cpu) {
>  			int mct_irq;
> +			unsigned int irqidx;

irq_idx

>  			struct mct_clock_event_device *pcpu_mevt =
>  				per_cpu_ptr(&percpu_mct_tick, cpu);
>  
> +			if (cpu >= nr_local)
> +				break;
> +
> +			irqidx = MCT_L0_IRQ + local_idx[cpu];
> +
>  			pcpu_mevt->evt.irq = -1;
> -			if (MCT_L0_IRQ + cpu >= ARRAY_SIZE(mct_irqs))
> +			if (irqidx >= ARRAY_SIZE(mct_irqs))
>  				break;
> -			mct_irq = mct_irqs[MCT_L0_IRQ + cpu];
> +			mct_irq = mct_irqs[irqidx];
>  
>  			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
>  			if (request_irq(mct_irq,
> @@ -583,6 +592,15 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>  		}
>  	}
>  
> +	for_each_possible_cpu(cpu) {
> +		struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> +
> +		if (cpu >= nr_local)

It looks like an error condition, so this should not be handled silently
because later base==0 will be used. Probably old code has similar problem...


Best regards,
Krzysztof

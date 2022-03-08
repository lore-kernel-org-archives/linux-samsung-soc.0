Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3348CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Mar 2022 14:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347682AbiCHO67 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Mar 2022 09:58:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347685AbiCHO66 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 09:58:58 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861301A816
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 06:58:01 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CB8423F60B
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646751477;
        bh=M+eTcz2ZJB0TWZjmJsyZ2iJjNCL5gmxwdz8k344Fvsc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=WezBv0fU4KJz4CL/iY4A/wqgoLPXKZqt6P2oWAOXyaHEGly9SFE2T3OcT7uhwpB0a
         ne0lXfkkGnsFFSwxYNgN2/40nujdfa0diW+QPh1xJ/wiYqjklAxRxGmB5L+Zv1/Yib
         WRaKhXafOlG0vLwxcHxGq8+chtOfiB+M45xO4dvPC5YLdNAe8iOBqnYCrBeGz+NExz
         haxDzS15U8ySU5gHT4YLX/PtZhpaqcgN3ZNRv6ZcA2Cg7LpfhUp3fea2NjhqtoMEjH
         yyEBnyFHDhmC2NwQMQ4vx50XqGbnIINFjsa8duBOkfLiKDZ5TkGjc3AcL3VFDlEabH
         Nk+assVmoBwAA==
Received: by mail-ej1-f71.google.com with SMTP id lf15-20020a170906ae4f00b006da86a43346so7670900ejb.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Mar 2022 06:57:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=M+eTcz2ZJB0TWZjmJsyZ2iJjNCL5gmxwdz8k344Fvsc=;
        b=jTDGZZ1CxvAfSd2QpLcGPrRqxlRIF4RS8FEzon2O0D4Q2SFRrog+ex1zn37bSLcY9g
         M1EiVjCMvjaC94A6AKKv6EihWFK/2hI7NVTQHS/AXmbtlti8JTBsXjNI+x9tRIlQmJQz
         Y44Kc7sa+jT38oYcd+GrzzRc4UX+r2vuWxRifaapWzfK0/4Kn06488EIxqTdS//X3tMy
         Ir1VKqWJihwRn6k4cRbmOlkqKzsfOOYwGgJwGOYX9/xSmI7uCScuV6lpQMmu1NGn7vN3
         M/T9fcrqZgdKGZxL2TCCVTOvUzcQEotOweV2XudNykdnbNCxWNcYPj4ee8NiQPEolwpM
         kuAQ==
X-Gm-Message-State: AOAM533hp+vJiRHOKBhGmZUu/zfTNMnaGD9PhooSTOksNAczyT5K2H7L
        n0GNC0SaFe+axbsQkgFrlgC6hzrdf3H9Q6Vj4T/bm8y6hwGRuys1bgOXHJI9xKeavLjPFf2VatQ
        36TuuJxMVfBE/cB8/JMohRNFSDxa+TbMyA9lQQyjLy52LmhGK
X-Received: by 2002:a05:6402:4396:b0:412:b131:fca6 with SMTP id o22-20020a056402439600b00412b131fca6mr16313391edc.133.1646751477454;
        Tue, 08 Mar 2022 06:57:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW3LeLqYr6ohDHFWba3PRj6ALdZOOjvivTY4gXILqMMuwH12l+7+o10CTTALaZRhZm/QtJpg==
X-Received: by 2002:a05:6402:4396:b0:412:b131:fca6 with SMTP id o22-20020a056402439600b00412b131fca6mr16313376edc.133.1646751477274;
        Tue, 08 Mar 2022 06:57:57 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id w19-20020a17090633d300b006ce3d425b22sm5950808eja.1.2022.03.08.06.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 06:57:56 -0800 (PST)
Message-ID: <226dcb1b-d141-f0d3-68c4-11d2466ca571@canonical.com>
Date:   Tue, 8 Mar 2022 15:57:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/4] clocksource/drivers/exynos_mct: Support
 local-timer-index property
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        tglx@linutronix.de, daniel.lezcano@linaro.org
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        alim.akhtar@samsung.com, robh+dt@kernel.org
References: <20220308142410.3193729-1-vincent.whitchurch@axis.com>
 <20220308142410.3193729-4-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220308142410.3193729-4-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/03/2022 15:24, Vincent Whitchurch wrote:
> Support the documented semantics of the local-timer-index property: Use
> it as the first index of the local timer, ensure that global timer clock
> events device is not registered, and don't write to the global FRC if it
> is already started.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 
> Notes:
>     v2: Use devicetree property instead of module parameter.
> 
>  drivers/clocksource/exynos_mct.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index f29c812b70c9..5f8b516614eb 100644
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
> @@ -75,6 +75,7 @@ enum {
>  static void __iomem *reg_base;
>  static unsigned long clk_rate;
>  static unsigned int mct_int_type;
> +static unsigned int mct_local_idx;

No more static variables. This was wrong design, happens, but let's not
grow the list.

I propose to conditionally (depending on property samsung,frc-shared)
assign .resume callback to NULL or exynos4_frc_resume. The init can
receive an argument whether to call frc_start().


>  static int mct_irqs[MCT_NR_IRQS];
>  
>  struct mct_clock_event_device {
> @@ -157,6 +158,17 @@ static void exynos4_mct_frc_start(void)
>  	u32 reg;
>  
>  	reg = readl_relaxed(reg_base + EXYNOS4_MCT_G_TCON);
> +
> +	/*
> +	 * If the FRC is already running, we don't need to start it again.  We
> +	 * could probably just do this on all systems, but, to avoid any risk
> +	 * for regressions, we only do it on systems where it's absolutely
> +	 * necessary (i.e., on systems where writes to the global registers
> +	 * need to be avoided).
> +	 */
> +	if (mct_local_idx && (reg & MCT_G_TCON_START))

This contradicts your intentions in commit #2 msg, where you described
that A53 will be started first.

1. If A53 is always started first, is it possible to be here from A5?
2. If above is possible, how do you handle locking? For example:
a. A53 started with some delay, entered exynos4_mct_frc_start() pass
this check;
b. A5 gets to exynos4_mct_frc_start(), check is still false, so A5
enables the FRC,
c. A53 also enables the FRC.

Having here relaxed reads and writes makes it even worse, unfortunately.

Best regards,
Krzysztof

Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3525C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 09:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbiCGJH0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 04:07:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbiCGJHY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 04:07:24 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49E760CFC
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 01:06:29 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BFA653F222
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646643988;
        bh=G51+HVosbAlITb0w/6sHZUM0ANYY++zOL8WxDgsCYfY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=G8eIwcfymiLjI4UP/+bgFnNldoZP3YBBK0e2ZX34NR5BzHNII7vICiL67nuKfCRZa
         wej0W7/rI+C2Nafcd9n420CGxOhPqU1clgLNN2LstbOvGNivEaMUzMtOL6VHZwT2DB
         A25gyzMS338rHAUVngZYWp7KcuHxy4g98ATcOfrytcuHAAwZ9eJNw95P1nnz9Xkvlj
         oRmsVBNCoW1EoBsxmMfpQnaKmk4CfSflAU0uLtUfCq4KykEo6wd75PkE486mJVGMkS
         K3s5YI9oQAZbTw+4nqBW3cjyNaK6X1QUu1GQ07/hwcfAB+kTjzq0Jp9mZJ2ADJJs9K
         nsnBWgsBLp48w==
Received: by mail-ej1-f70.google.com with SMTP id nb1-20020a1709071c8100b006d03c250b6fso6683644ejc.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 01:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=G51+HVosbAlITb0w/6sHZUM0ANYY++zOL8WxDgsCYfY=;
        b=F8IyvXqCSwjIGuMRRCC5Kxn2qaNs1/BpA255jiPJ9yvKf/3gZ+0aGx1ME8qwtTgMDg
         tjNdQdphgNnFDdjgtN/XyQrkj9cky4IVrOvQsevYNU7LzO+sAEZxDIY+l5rH2FkY0w5w
         C3gn3WSnmLqmSSu3Ue6nH/qqgpDvd+YaykNdnCp0/NEKgVtNZreAYlv+AQm4BxbcC9zy
         Tf8EOYqxdIcGRXL2oDW+KK3yId8R7atqPAtfjwqY9l0JzAXoPXku1yYuzef3E2GklLE/
         22jPWqj19eP0sH+66z+OuKGh4vmFuVlO0tjhOUjROV9VFUgSK+/IoCBVe3X+LHsc/9KY
         uk8g==
X-Gm-Message-State: AOAM530GuiXcz/kcqJDAhGrj552AjlhBegXFnjzpogUPSXISp1Brwkpb
        VlZXS8TyYL2SjB4Vk2xY6xcsIF1WH/X/wgNax2SkbkvkSocS2D22yXX/MsBoatlVTaeX7htgjv8
        FSxNJwhVtp8ZK24EIXYeENUh4V/zCCw0dKFvnHc4uRn6a7Dns
X-Received: by 2002:a17:907:2a53:b0:6ce:e4fe:3f92 with SMTP id fe19-20020a1709072a5300b006cee4fe3f92mr8082885ejc.389.1646643988273;
        Mon, 07 Mar 2022 01:06:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxi1G8DMQgsmoK6atV2WQRzLw7W9EhtbGU1zQQMO5T3xle7xKCpGd4S3PplzpSJImoDfIfUbQ==
X-Received: by 2002:a17:907:2a53:b0:6ce:e4fe:3f92 with SMTP id fe19-20020a1709072a5300b006cee4fe3f92mr8082873ejc.389.1646643988071;
        Mon, 07 Mar 2022 01:06:28 -0800 (PST)
Received: from [192.168.0.141] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id p14-20020aa7cc8e000000b0040f13865fa9sm5909820edt.3.2022.03.07.01.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 01:06:27 -0800 (PST)
Message-ID: <08992f48-6cb6-8dc0-33d2-f18f942d2bee@canonical.com>
Date:   Mon, 7 Mar 2022 10:06:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Support using only local
 timer
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     kernel@axis.com, Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220307083255.1577365-1-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307083255.1577365-1-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/03/2022 09:32, Vincent Whitchurch wrote:
> The ARTPEC-8 SoC has a quad-core Cortex-A53 and a single-core Cortex-A5
> which share one MCT with one global and eight local timers.
> 
> The Cortex-A53 boots first and starts the global FRC and also registers
> a clock events device using the global timer.  (This global timer clock
> events is usually replaced by arch timer clock events for each of the
> cores.)
> 
> When the A5 boots, we should not use the global timer interrupts or
> write to the global timer registers.  This is because even if there are
> four global comparators, the control bits for all four are in the same
> registers, and we would need to synchronize between the cpus.  Instead,
> the global timer FRC (already started by the A53) should be used as the
> clock source, and one of the local timers which are not used by the A53
> can be used for clock events on the A5.
> 
> To support this, add a module param to set the local timer starting
> index.  If this parameter is non-zero, the global timer clock events
> device is not registered and we don't write to the global FRC if it is
> already started.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  drivers/clocksource/exynos_mct.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)

This should not be send separately from the previous patch.

> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index f29c812b70c9..7ea2919b1808 100644
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
> @@ -77,6 +77,13 @@ static unsigned long clk_rate;
>  static unsigned int mct_int_type;
>  static int mct_irqs[MCT_NR_IRQS];
>  
> +/*
> + * First local timer index to use.  If non-zero, global
> + * timer is not written to.
> + */
> +static unsigned int mct_local_idx;
> +module_param_named(local_idx, mct_local_idx, int, 0);

No, it's a no go. Please use dedicated compatible if you need specific
quirks.

> +
>  struct mct_clock_event_device {
>  	struct clock_event_device evt;
>  	unsigned long base;
> @@ -157,6 +164,17 @@ static void exynos4_mct_frc_start(void)
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
> +		return;

I don't get it. exynos4_mct_frc_start() is called exactly only once in
the system - during init. Not once per every CPU or cluster (I
understood you have two clusters, right?).

Best regards,
Krzysztof

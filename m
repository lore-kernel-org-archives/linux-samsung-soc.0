Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F62C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 09:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238511AbiCGJw0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 04:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239969AbiCGJu2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 04:50:28 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343FA723E0
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 01:43:57 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DA1703F222
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 09:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646646224;
        bh=iBR4PX+oGP38NiU1odaqND+HsFxr+kkdimwXNBXKUU0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=V0ft0enGlxG0nQiFLgEbz/5j2D8As3lQ+H9wcRWc5t2mnHrqBEjz8LgZsQpvmNU+R
         cwSuPyJKCQr00DqYXFHSKlq0egtfx5hU6amL2w/RgJ1y/O5ojaBCIYGGQtZuAdoOge
         AnZ/fythIQ+Vc/PLuZmuH6qlDs1oPJwYq0KHWlEibi5K/ZV6trso5X4UiD178fAMIP
         dZai++5nLpDTPf7xRjnQYyihZ7sRKveia88rI1XOodrBlu0IY1Ym6RUsvxJNnsdx8d
         TLXjcvFCda8ErzHCGPTPsRQFdO2i2aRn/+n8YLRSWIZqo5Q2Ewjk9ZROlIXBvTsy8Y
         ItvOUtDX0afRQ==
Received: by mail-ed1-f70.google.com with SMTP id b24-20020a50e798000000b0041631767675so2397607edn.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 01:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iBR4PX+oGP38NiU1odaqND+HsFxr+kkdimwXNBXKUU0=;
        b=NYoxWTMECHyQj/9sdfYbPk32VGWXuAdzYuaX4xiPZQ5TmXiS6hwYj+laH1SW46DMXm
         VU5NH/r5QaXsLA2NFcxzFTwxY87DWxT0gIDq+Uhau5S/XsXuHp/QAK0ZRrP0TIbcFROF
         x0SZYvnz8QmYy+ggpKRODF/l0MAzTadmGTFzSdgu4eYnzvHOpe7X4q6rNzc9PW2UmTKO
         IiwpPF/p39njiKtkx/JlWm9kvgwCEmUHbUMYTUXm8IO5KNZ8BU1yu5QtMBfiAQH38FXi
         t9E0eqXdl2gsj21pdvAXFYfp88HQ5zZK/bbKIfhApYCaWKzELXWjzmHrdD2yvybXpqVn
         RpwQ==
X-Gm-Message-State: AOAM531na/ALVYkTUkO9ajuMlnAVx9USGAkXYB5/uAlnzcQ0lJsEu/W7
        6gZplggkxbgiuG+uxSCCWeqnKXJmjrUo7Ea2J00Z+wzR/3IzVRAMnxhHhwccJEM/5g4NK6gZ/ll
        tPfeIbywu+QIf6241mjYbRgzdXPaLdFcdTkw7l54gbOtRX4Ek
X-Received: by 2002:a17:907:3ea3:b0:6da:6f16:bd9b with SMTP id hs35-20020a1709073ea300b006da6f16bd9bmr8484394ejc.308.1646646224516;
        Mon, 07 Mar 2022 01:43:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvFkrpQ2abZZeyYkoh/uqZU+SVmzZg0o9SDWnyA32nfxIrSpfTRWoUGqWl5FxqsWOJFmS2Cw==
X-Received: by 2002:a17:907:3ea3:b0:6da:6f16:bd9b with SMTP id hs35-20020a1709073ea300b006da6f16bd9bmr8484380ejc.308.1646646224286;
        Mon, 07 Mar 2022 01:43:44 -0800 (PST)
Received: from [192.168.0.141] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id n9-20020a05640205c900b00415fbbdabbbsm4758620edx.9.2022.03.07.01.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 01:43:43 -0800 (PST)
Message-ID: <71f2c22b-e037-3bb4-e7e1-e226d3243536@canonical.com>
Date:   Mon, 7 Mar 2022 10:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Support using only local
 timer
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>, kernel <kernel@axis.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
References: <20220307083255.1577365-1-vincent.whitchurch@axis.com>
 <08992f48-6cb6-8dc0-33d2-f18f942d2bee@canonical.com>
 <20220307092437.GA32457@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307092437.GA32457@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/03/2022 10:24, Vincent Whitchurch wrote:
> On Mon, Mar 07, 2022 at 10:06:26AM +0100, Krzysztof Kozlowski wrote:
>> On 07/03/2022 09:32, Vincent Whitchurch wrote:
>>> The ARTPEC-8 SoC has a quad-core Cortex-A53 and a single-core Cortex-A5
>>> which share one MCT with one global and eight local timers.

Please mention that this is a two-OS case (or without cache coherency),
because usual design is different - two clusters being cache coherent.

>>>
>>> The Cortex-A53 boots first and starts the global FRC and also registers
>>> a clock events device using the global timer.  (This global timer clock
>>> events is usually replaced by arch timer clock events for each of the
>>> cores.)
>>>
>>> When the A5 boots, we should not use the global timer interrupts or
>>> write to the global timer registers.  This is because even if there are
>>> four global comparators, the control bits for all four are in the same
>>> registers, and we would need to synchronize between the cpus.  Instead,
>>> the global timer FRC (already started by the A53) should be used as the
>>> clock source, and one of the local timers which are not used by the A53
>>> can be used for clock events on the A5.
>>>
>>> To support this, add a module param to set the local timer starting
>>> index.  If this parameter is non-zero, the global timer clock events
>>> device is not registered and we don't write to the global FRC if it is
>>> already started.
>>>
>>> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
>>> ---
>>>  drivers/clocksource/exynos_mct.c | 29 ++++++++++++++++++++++++-----
>>>  1 file changed, 24 insertions(+), 5 deletions(-)
>>
>> This should not be send separately from the previous patch.
> 
> OK, I will put it in a series.
> 
>>
>>>
>>> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
>>> index f29c812b70c9..7ea2919b1808 100644
>>> --- a/drivers/clocksource/exynos_mct.c
>>> +++ b/drivers/clocksource/exynos_mct.c
>>> @@ -33,7 +33,7 @@
>>>  #define EXYNOS4_MCT_G_INT_ENB		EXYNOS4_MCTREG(0x248)
>>>  #define EXYNOS4_MCT_G_WSTAT		EXYNOS4_MCTREG(0x24C)
>>>  #define _EXYNOS4_MCT_L_BASE		EXYNOS4_MCTREG(0x300)
>>> -#define EXYNOS4_MCT_L_BASE(x)		(_EXYNOS4_MCT_L_BASE + (0x100 * x))
>>> +#define EXYNOS4_MCT_L_BASE(x)		(_EXYNOS4_MCT_L_BASE + (0x100 * (x)))
>>>  #define EXYNOS4_MCT_L_MASK		(0xffffff00)
>>>  
>>>  #define MCT_L_TCNTB_OFFSET		(0x00)
>>> @@ -77,6 +77,13 @@ static unsigned long clk_rate;
>>>  static unsigned int mct_int_type;
>>>  static int mct_irqs[MCT_NR_IRQS];
>>>  
>>> +/*
>>> + * First local timer index to use.  If non-zero, global
>>> + * timer is not written to.
>>> + */
>>> +static unsigned int mct_local_idx;
>>> +module_param_named(local_idx, mct_local_idx, int, 0);
>>
>> No, it's a no go. Please use dedicated compatible if you need specific
>> quirks.
> 
> I could add a compatible, but please note that the hardware itself does
> not have any quirks, it's only the usage of the hardware from one of the
> Linux kernels (see the explanation below) which is different.  Is it
> correct to use a compatible to distinguish between these kind of
> software-determined usage differences?
> 
>>
>>> +
>>>  struct mct_clock_event_device {
>>>  	struct clock_event_device evt;
>>>  	unsigned long base;
>>> @@ -157,6 +164,17 @@ static void exynos4_mct_frc_start(void)
>>>  	u32 reg;
>>>  
>>>  	reg = readl_relaxed(reg_base + EXYNOS4_MCT_G_TCON);
>>> +
>>> +	/*
>>> +	 * If the FRC is already running, we don't need to start it again.  We
>>> +	 * could probably just do this on all systems, but, to avoid any risk
>>> +	 * for regressions, we only do it on systems where it's absolutely
>>> +	 * necessary (i.e., on systems where writes to the global registers
>>> +	 * need to be avoided).
>>> +	 */
>>> +	if (mct_local_idx && (reg & MCT_G_TCON_START))
>>> +		return;
>>
>> I don't get it. exynos4_mct_frc_start() is called exactly only once in
>> the system - during init. Not once per every CPU or cluster (I
>> understood you have two clusters, right?).
> 
> Not quite.  The Cortex-A53 and the Cortex-A5 do not have cache-coherency
> between them, so they are not run in an SMP configuration.  From the
> Cortex-A53's perspective, the Cortex-A5 looks like any other hardware
> block.  The Cortex-A5 could just as well have run some other operating
> system, but I run Linux on it.  So there are two separate, independent
> Linux kernels running on the SoC.

I see, thanks for explanation. In such case it might not be a separate
compatible (programming model is the same) but rather dedicated property
or properties in DTS to indicate that some parts are shared with other
system. If property is present, you skip FRC initialization and use
local timers. You actually might need two properties - one for A53 and
one for A5. Or some kind of map to assign subset of local interrupts to
each of the systems.

I think still that DTS is the right place for it because it is a
property of hardware and it's too early in system boot to use some
remote-proc or mailbox...

Best regards,
Krzysztof

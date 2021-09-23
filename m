Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBBEC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 13:27:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E71961164
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 13:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhIWN3U (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 09:29:20 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:40901 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231380AbhIWN3U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 09:29:20 -0400
Received: by mail-wr1-f42.google.com with SMTP id t28so3821860wra.7;
        Thu, 23 Sep 2021 06:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/wLuOTGOM2923erGAXxPQ9YurX8bSLtQ7+eKGtfZWYs=;
        b=YKhmK3HcG+Bs+P8lY25OI+CSW1hq2GLyozXvd1c90e4WD7DaiDtVPyPC0QwzLgQqLD
         HC+S/gxfK9WNmeFwo9KAFu6onf0hRctAmZvWh7vWs4lzERQMTrV4pA6+84RcXe7t45D5
         0PV/UOlJw7dAOOCGSA4a+EBJCpF/s5VQoKCdepuXt5JcfX8eJ+om1w4P2ZAHShq159C+
         3K00LQaQr0ClDoUnA9RBoioRosDzFHBQBeTMcusvZDiNRTZ7CGERblo6A2NrVCESvfxE
         xf0q6woy4WeWlTVs7SEzV+4twTo0+uDzVToMuxneykROThNLhk2OM/Jvn4RNwVCkhOlP
         uF3w==
X-Gm-Message-State: AOAM532m2Ye5DBL3A8S2EEDUYEDMzD7MXJY0UgDB/ev4fGinT8AoLjDg
        YJDWSrG2VKY9nZijnwEzZGA1QrQeo32n4g==
X-Google-Smtp-Source: ABdhPJxzbpr0WNXSLMFzPeFPqNvzQRU/+GHoYsE1TmQ7rQ7ma/BL93UnfJOiMlt4n1Z+t5zWQUQkAg==
X-Received: by 2002:adf:f486:: with SMTP id l6mr4929948wro.375.1632403666666;
        Thu, 23 Sep 2021 06:27:46 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.googlemail.com with ESMTPSA id u1sm2570543wmc.29.2021.09.23.06.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 06:27:45 -0700 (PDT)
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-2-willmcvicker@google.com>
 <a8d40b96-bcb2-5eb6-b0e5-c20c14471c8a@kernel.org>
 <CAMuHMdWdHF49qj+qV-DnbDDv14J3y98TPHd_6y_i7o7_azhErg@mail.gmail.com>
 <2c8a79f7-711a-b075-745f-ea77b82a1117@canonical.com>
 <CABYd82bzKh=QQHyk-kPXekzCKx+Uy-z2TY5qAQQNfuew=h=O-w@mail.gmail.com>
 <001cd621-53d1-fe22-0eaa-d13137827297@canonical.com>
 <YUx5uhKW/Jy2r3lv@google.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 1/4] clk: samsung: change COMMON_CLK_SAMSUNG default
 config logic
Message-ID: <30a1d0f3-a17c-bf87-2519-542063a7a663@kernel.org>
Date:   Thu, 23 Sep 2021 15:27:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUx5uhKW/Jy2r3lv@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/09/2021 14:57, Lee Jones wrote:
> On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> 
>> On 21/09/2021 19:58, Will McVicker wrote:
>>> On Tue, Sep 21, 2021 at 1:35 AM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>>
>>>> On 21/09/2021 09:50, Geert Uytterhoeven wrote:
>>>>> On Tue, Sep 21, 2021 at 9:31 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>> On 20/09/2021 21:03, Will McVicker wrote:
>>>>>>> COMMON_CLK_SAMSUNG is selected by ARCH_EXYNOS which forces this config
>>>>>>> to be built-in when ARCH_EXYNOS is enabled. Switch the logic to use a
>>>>>>> "default y if ARCH_EXYNOS" to provide flexibilty for vendors to disable
>>>>>>> or modularize this driver.
>>>>>>
>>>>>> The clock drivers are essential, you cannot disable them for a generic
>>>>>> kernel supporting ARCH_EXYNOS. Such kernel won't work properly on platforms.
>>>>>
>>>>> Obviously it's not gonna work if the clock driver is not enabled
>>>>> at all.  But does it work if you make the clock driver modular, and
>>>>> put it with all other essential driver modules in initramfs?  Debugging
>>>>> would be hard, as the serial console driver also relies on clocks
>>>>> and PM Domains etc.
>>>>
>>>> The kernel could boot without clock drivers (default settings from
>>>> bootloader), probe clocks from initramfs and proceed with rootfs from
>>>> eMMC/SD/net.
>>>>
>>>> In theory.
>>>>
>>>> However I have no reports that it ever worked. If there is such working
>>>> upstream configuration, I don't mind here. Just please explain this in
>>>> the commit msg.
>>>>
>>>>>
>>>>> If not, this patch should be NAKed, until it works with a modular
>>>>> clock driver.
>>>>>
>>>>> If yes, perhaps another line should be added (_before_ the other line)?
>>>>>
>>>>>   + default m if ARCH_EXYNOS && MODULES
>>>>>     default y if ARCH_EXYNOS
>>>>>
>>>>> However, many developers may want MODULES=y, but not want to bother
>>>>> with an initramfs.  So perhaps we need a new symbol
>>>>> MINIMUM_GENERIC_KERNEL or so, protected by EXPERT, and make the
>>>>> driver default to m if that is enabled?
>>>>
>>>> Yeah, that's indeed a problem to solve. For most users (and distros)
>>>> building kernel for Exynos this should be built-in by default.
>>>>
>>>> Anyway, the option is non-selectable so it cannot be converted to "m" or
>>>> disabled. And this is claimed in the commit msg:
>>>> "provide flexibilty for vendors to disable or modularize this driver."
>>>>
>>>> The commit does not achieve it.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> Thanks for the reviews! As Lee has explained in his replies, the
>>> intent of this series is to provide config flexibility to create a
>>> defconfig that allows us to move out SoC specific drivers in order to
>>> create a generic kernel that can be used across multiple devices with
>>> different SoCs.
>>
>> That's quite generic statement... or let me put it that way - we already
>> have this ability to create a generic kernel supporting different SoCs.
>> Exynos and other ARMv7 and ARMv8 platforms are multiplatform.
>>
>> Task is done.
> 
> multi_v7_defconfig and ARMv8's defconfig are bloated monoliths which
> provide limited flexibility.  Good for testing and messing around -
> not much good for real products.

I am not saying about defconfigs. I am saying that ARMv8 platform is
multiplatform so we already solved the problem Will mentioned. :)

> 
>> Please be more specific about use case and describe what exactly in
>> current upstream multiplatform kernel is missing, what is not
>> multiplatform enough.
> 
> The use-case is GKI.  A realistic middle-ground between fully open
> source and real-world usage of the Linux kernel in a competitive
> technical arena.  GKI aims to be as close to Mainline as possible,
> whilst allowing hardware vendors to supply their own software
> containing their perceived competitive edge and/or supporting
> not-yet-released hardware platforms.

<grumpy mode>
Therefore the use case is to not contribute anything upstream around
ARCH_EXYNOS but use it in millions of devices downstream with hundreds
of out-of-tree modules. The use case is to make life easy for the vendor
and out-of-tree code, not for the upstream. Instead of promoting
upstreaming, or leaning towards usptream in some balanced way, the use
case is to entirely go to out-of-tree.

I am not thinking here about edge or not-yet-released platforms but
"ancient" in terms of current SoC business, e.g. 3-5 years old.
</grumpy mode>

> 
> If you end up over-constraining the ability to configure the kernel in
> useful/meaningful ways, that makes one of the main (best intention)
> aims of GKI, (i.e. to have an upstream first ethos in order to be as
> close to upstream as possible) much more difficult.

GKI encourages core kernel changes to be upstreamed but it is
effectively the nail in the coffin of upstreaming vendor SoC changes.
There is simply no incentive for less-cooperative vendor to upstream
it's modules (except usual benefits like code quality and user support
which are not important for less-cooperative vendors).

The kernel should be configured mainly towards mainline platforms. Not
the other way around. This of course does not stop it for supporting
out-of-tree code, but I guess you also know that what's out-of-tree, it
does not exist. :)

> 
> I put in a lot of effort to ensure GKI doesn't end up as just another
> fork of the Linux kernel.  So far, so good, but flexibility and
> understanding is key.
> 
>>> I'm sorry I added confusion by mentioning
>>> modularization. All of these drivers that I am modifying in this
>>> series can be modularized which is an ongoing effort, but is not
>>> addressed here and I don't believe that modularizing them should be a
>>> requirement before supporting enabling/disabling them.
>>
>> Since the disabling the driver for a kernel supporting Exynos does not
>> make any sense, then making it at least modular unfortunately it is a
>> requirement.
> 
> I can go with that.
> 
>>> I will update the series with my patch that refactors the Samsung SoC
>>> drivers menuconfig to make these visible as well.
>>
>> I would first recommend to really describe your use case because my
>> questions about this are still unanswered.
> 
> Hopefully my replies have helped somewhat.
> 
> Happy to discuss further if required.
> 
> If all else fails, feel free to ping me on IRC (lag).

Thanks Lee, you described the use case. In general I like it and support
it, except for what I wrote in the other mail.

Vendor does not contribute much therefore there is no balance in
upstreaming. Since none of other vendor's platforms are supported, I am
looking only at what is supported. From that perspective - the change
proposed by Will and previous guys, does not have much sense.

My perspective probably would change a lot if vendor did contribute some
of its non-edge platforms (3-5 years old)... especially that unlike few
community guys (e.g. PostmarketOS), vendor has shit-tons of money and
the hardware manuals. :)

Instead of pushing this change, please let's give some incentive to the
vendor for upstreaming anything.

Best regards,
Krzysztof

Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BDDC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Sep 2021 13:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D32461425
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Sep 2021 13:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349191AbhI3NKS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Sep 2021 09:10:18 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38786
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350302AbhI3NKL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Sep 2021 09:10:11 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A528F402C9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633007306;
        bh=hUl4AzMPgOLZrORvQmrSxH7LjjpDiFvnLVFli7UcmE4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=g4blcrIOznhYm3kComtzSMOi5fPys2jYnfW2R4L0wO9PXcI39EC0bxATKQDG37A5x
         qN4gSwZ7l9qfqXLc66LsW9+UobDBo/JCVe/bNbk+1erwG53MJ6cd8EtHpG43bfzIhj
         zXPPeYziqkFZXcHzfar418q/ibqxB8cU7jSdph0Wjcnnke/qcz0kmZl/Z9fVRpZyps
         VEkRnjPv6fwQuR+SB9K5oHuUClr3t/w28/KkOgnaQr6xzCrfdbFMOggxiysgePjJNu
         B2X4L+1gaO5kh04iWXhzJE89ScecsNzW3qiuev/71dyvd/Qf0HL7s1BxtneEQLh28n
         u122ga0O8ho0w==
Received: by mail-lf1-f70.google.com with SMTP id d16-20020a056512369000b003fca9e038ddso5574048lfs.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 06:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hUl4AzMPgOLZrORvQmrSxH7LjjpDiFvnLVFli7UcmE4=;
        b=T5kLZcL7TADEPYdwMvqLm20/JtNKer9IqhaapbYPPM26afONN/qxLLk9je2YIbl9oN
         ZD9IBnlYvu5GYTpWiWll46I6TDT2IPfVXgEHQn89kuaa+FanomzVbhCWxHcXFJiyaSVx
         aTNyRIWW/N8XJyDOPeC57KJlYRNmr7MIIGO3m4N+XxtNRGgBW8+DNy0hX4TmePanMd6t
         DcSa8cg6PCAHF33se+WfG5lvaDatO7gIc6SPFvNKOYLPu+5m8yDucIZk1hrpOrE8v4cg
         5saRYwfBLy1GjuLaUW/iW0E0tD1obtM0wWHQhAQv0e3XLU1tl9o87mj32PA3swyS/yM6
         kNnQ==
X-Gm-Message-State: AOAM531K1ooUgkSYs5Qp+BX2DS1H/LCAArHrEKvCODcdOrr4w1IGfJoT
        hKsx8gdSvlj8yMivz8YPQmGM1dmWTVYkOORSXFWUb729keZT8rrkUz+5RBnhaLjArz9VeXiDwY6
        /hU/g1cdTIKReP3CRHHSIhIE4Bfxdj91Cgi149cjuAe5TiDbA
X-Received: by 2002:a05:6512:3093:: with SMTP id z19mr5967987lfd.242.1633007305688;
        Thu, 30 Sep 2021 06:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjm3vd0EFvqL7ckfqAQvq9Lo79q9lkx+VOJUC5cK4B1tRx3+/dBYuyWUn8tO852nNIwX6f3w==
X-Received: by 2002:a05:6512:3093:: with SMTP id z19mr5967946lfd.242.1633007305455;
        Thu, 30 Sep 2021 06:08:25 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id r3sm367245lfc.131.2021.09.30.06.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 06:08:24 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <YVWCK5QO331rfhJJ@google.com>
 <72d27a82-9d4d-1f91-bd1f-ebead3b75ffa@canonical.com>
 <YVWwBz8jrznqXah4@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8d260548-176e-d76b-6f05-d4d02ddd4f67@canonical.com>
Date:   Thu, 30 Sep 2021 15:08:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVWwBz8jrznqXah4@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/09/2021 14:39, Lee Jones wrote:
> On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> 
>> On 30/09/2021 11:23, Lee Jones wrote:
>>> [0] Full disclosure: part of my role at Linaro is to keep the Android
>>> kernel running as close to Mainline as possible and encourage/push the
>>> upstream-first mantra, hence my involvement with this and other sets.
>>> I assure you all intentions are good and honourable.  If you haven't
>>> already seen it, please see Todd's most recent update on the goals and
>>> status of GKI:
>>>
>>>   Article: https://tinyurl.com/saaen3sp
>>>   Video:   https://youtu.be/O_lCFGinFPM
>>>
>>
>> Side topic, why this patchset is in your scope or Will's/Google's scope?
>> Just drop it from Android main kernel, it will not be your problem. I
>> mean, really, you don't need this patchset in your tree at all. The only
>> platform which needs it, the only platform which will loose something
>> will be one specific vendor. Therefore this will be an incentive for
>> them to join both discussions and upstream development. :)
> 
> How would they fix this besides upstreaming support for unreleased
> work-in-progress H/W?
> 
> Haven't I explained this several times already? :)

Either that way or the same as Will's doing but that's not my question.
I understand you flush the queue of your GKI patches to be closer to
upstream. Reduce the backlog/burden. you can achieve your goal by simply
dropping such patch and making it not your problem. :)


Best regards,
Krzysztof

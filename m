From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v4 06/10] rtc: max77686: Add max77802 support
Date: Wed, 27 Jan 2016 01:37:02 -0300
Message-ID: <CABxcv=n56YU4fFzdQkVD1EOdc9Q7Dfm1Qa0u5v9HPw1BYev8mg@mail.gmail.com>
References: <1453865806-4661-1-git-send-email-javier@osg.samsung.com>
	<1453865806-4661-7-git-send-email-javier@osg.samsung.com>
	<56A84636.2000107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f193.google.com ([209.85.160.193]:35062 "EHLO
	mail-yk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751697AbcA0EhD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 23:37:03 -0500
Received: by mail-yk0-f193.google.com with SMTP id a85so16234195ykb.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jan 2016 20:37:02 -0800 (PST)
In-Reply-To: <56A84636.2000107@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello Krzysztof,

On Wed, Jan 27, 2016 at 1:23 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 27.01.2016 12:36, Javier Martinez Canillas wrote:

[snip]

>>
>> +     if (!info->drv_data->separate_i2c_addr)
>> +             info->max77686->rtc_regmap = info->max77686->regmap;
>> +
>
> At this stage I don't like the idea of messing with parent's state
> structure. The driver should not modify any of parents data (the best
> way would be to take a pointer to const). In this patch this looks like
> breaking the encapsulation. If the parent is responsible for regmaps,
> then the parent should set rtc_regmap for children (parent also knows
> what type device it is working on).
>
> ...but I am assuming that a new patch will be following this one - the
> patch moving ownership of i2c dummy and regmap to the RTC driver. In
> that case this code makes a lot more sense. Am I thinking correctly?
>

You assumption is correct.

Modifying the parent's state is indeed a layering violation but I did
this to keep the changes self contained in the RTC subsystem and avoid
touching the MFD driver.

But this will be cleaned by Laxman once he moves the regmap
initialization from the MFD driver to the RTC.

> Best regards,
> Krzysztof

Best regards,
Javier

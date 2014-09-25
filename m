From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 0/5] pinctrl: samsung: Data structure clean-up
Date: Thu, 25 Sep 2014 11:58:14 +0200
Message-ID: <CABxcv=nWddbECGxBEZCa1K3KDeR5uhNWaEzFsuTfNxC1xq2gFQ@mail.gmail.com>
References: <1411499141-26551-1-git-send-email-tomasz.figa@gmail.com>
	<542271E8.4020606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:65327 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752109AbaIYJ6P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 05:58:15 -0400
Received: by mail-we0-f179.google.com with SMTP id q58so528770wes.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2014 02:58:14 -0700 (PDT)
In-Reply-To: <542271E8.4020606@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Tomasz,

On Wed, Sep 24, 2014 at 9:25 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>>
>> This series should not introduce any functional changes.
>>
>> Tested on S3C6410-based Mini6410 board, booting with device tree.
>>
>> Marek, Bart, could you do some testing on Exynos-based boards,
>> just to make sure?
>
>
> Works fine on Exynos4412 based OdroidU3+ and Exynos4210 Universal C210.
>
> For the whole patchset:
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>

I tested this series on an Exynos5250 Snow and an Exynos5420 Peach Pit
Chromebook and both were working fine.

Tested by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier

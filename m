From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 6/6] pinctrl: exynos: Handle suspend/resume of GPIO EINT registers
Date: Fri, 17 May 2013 14:18:39 -0700
Message-ID: <CAD=FV=XiWET3Xptfk2CVWMw=xVCE4zUJhJtgXHbhiND12rJGnQ@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-7-git-send-email-t.figa@samsung.com>
	<CAD=FV=WKCeW=3BFnmnyXB70VCjXHGrzarXbj8cBfq4-ENA-Y2w@mail.gmail.com>
	<18754346.1REWN52J0K@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:34069 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756612Ab3EQVSm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 17:18:42 -0400
Received: by mail-la0-f54.google.com with SMTP id eg20so2139033lab.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 14:18:40 -0700 (PDT)
In-Reply-To: <18754346.1REWN52J0K@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Tomasz,

On Fri, May 17, 2013 at 1:34 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Slight nit to add this before the call to irq_domain_add_linear().
>> demv() will handle freeing your memory but nothing will handle undoing
>> the irq_domain_add_linear() if you return an error.
>
> I'm a bit sceptical when it is about error handling in such cases.
> Basically if interrupt initialization fails, something is seriously wrong,
> either with your kernel config or with some code.
>
> Since such case has been already unhandled in the driver (with nr_banks >
> 1 = always), so I didn't bother to add any undoing here.

Yeah, not all drivers handle it well.  I'm always surprised by the
number of drivers that seem have it right, though.  Certainly it seems
awfully unlikely that allocating a small number of bytes in a probe
function would fail.

...but changing the order doesn't hurt anything and would make it more
correct, even if it's not fully correct.


>> Optional: debug statements:
>>
>> pr_debug("%s:     con %#010x => %#010x\n", bank->name,
>>   readl(regs + EXYNOS_GPIO_ECON_OFFSET + bank->eint_offset),
>>   save->eint_con);
>> pr_debug("%s: fltcon0 %#010x => %#010x\n", bank->name,
>>   readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET + 2 * bank->eint_offset),
>>   save->eint_fltcon0);
>> pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
>>   readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET + 2 * bank->eint_offset + 4),
>>   save->eint_fltcon1);
>
> OK. I wonder if this could be added in a separate patch or I should rather
> send v2 on Monday?

Definitely optional to add these, so up to you whether to spin the
patch, ignore my suggestion, or do a separate patch.  :)


Thanks for sending all of these up, by the way!  If things look good
next week I'll probably revert my local version of this (the V2 of my
original series) and pull in your series to keep us on the same page.
:)


-Doug

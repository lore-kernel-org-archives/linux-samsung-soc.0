From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH V2] ARM: EXYNOS: Move arm core power down clock to exynos5250
 common clock
Date: Mon, 21 Oct 2013 05:10:15 -0700
Message-ID: <20131021121015.11944.4344@quantum>
References: <1381470134-29410-1-git-send-email-amit.daniel@samsung.com>
 <4953642.S7P9jyspGP@amdn883> <52644C65.3040805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:57565 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753085Ab3JUMKY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Oct 2013 08:10:24 -0400
Received: by mail-pd0-f179.google.com with SMTP id y10so4481732pdj.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2013 05:10:23 -0700 (PDT)
In-Reply-To: <52644C65.3040805@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Amit Daniel Kachhap <amit.daniel@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org

Quoting Kukjin Kim (2013-10-20 14:34:29)
> On 10/11/13 16:33, Tomasz Figa wrote:
> > Hi Amit,
> >
> > On Friday 11 of October 2013 11:12:14 Amit Daniel Kachhap wrote:
> >> Now with common clock support added for exynos5250 it is necessary to move
> >> this code to exynos5250 common clock driver as clock registers should be
> >> handled there. This change is tested in exynos5250 based arndale platform.
> >>
> >> Cc: Abhilash Kesavan<a.kesavan@samsung.com>
> >> Cc: Thomas Abraham<thomas.abraham@linaro.org>
> >> Acked-by: Kukjin Kim<kgene.kim@samsugn.com>
> >
> > nit: Typo in samsung. Probably something that Kukjin can fix up when
> > applying, though.
> >
> >> Reviewed-by: Bartlomiej Zolnierkiewicz<b.zolnierkie@samsung.com>
> >> Signed-off-by: Amit Daniel Kachhap<amit.daniel@samsung.com>
> >> ---
> >>
> >> Changes in V2:
> >> * Rebased against linux-next tree.
> >> * Removed un-used macros in regs-clock.h
> >>
> >>   arch/arm/mach-exynos/cpuidle.c                 |   35 --------------------
> >>   arch/arm/mach-exynos/include/mach/regs-clock.h |   16 ---------
> >>   drivers/clk/samsung/clk-exynos5250.c           |   42 ++++++++++++++++++++++++
> >>   3 files changed, 42 insertions(+), 51 deletions(-)
> >
> > Otherwise
> >
> > Acked-by: Tomasz Figa<t.figa@samsung.com>
> >
> Mike, do you want me to pick this patch into Samsung tree?

I'll take it through clk-next.

Thanks,
Mike

> 
> - Kukjin

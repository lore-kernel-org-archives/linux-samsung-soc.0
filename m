From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/9] clk: samsung: exynos4: Move suspend/resume handling to
 SoC driver
Date: Thu, 17 Oct 2013 16:16:29 +0200
Message-ID: <1821539.dxQ3vs372W@amdc1227>
References: <1381921698-5060-1-git-send-email-t.figa@samsung.com>
 <1381921698-5060-4-git-send-email-t.figa@samsung.com>
 <CAKew6eV7Hd1x1+YLR9rjzNgYu0t=9Q8BG23VUvhPJTf77bsRXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:31369 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755703Ab3JQOQd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 10:16:33 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUT00M7FGYU26B0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Oct 2013 15:16:31 +0100 (BST)
In-reply-to: <CAKew6eV7Hd1x1+YLR9rjzNgYu0t=9Q8BG23VUvhPJTf77bsRXQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>

On Thursday 17 of October 2013 19:12:08 Yadwinder Singh Brar wrote:
> Hi Tomasz,
> 
> [ ... ]
> >  /*
> >   * list of controller registers to be saved and restored during a
> >   * suspend/resume cycle.
> > @@ -288,6 +299,70 @@ static unsigned long exynos4_clk_regs[] __initdata = {
> >         GATE_IP_CPU,
> >  };
> >
> > +static int exynos4_clk_suspend(void)
> > +{
> > +       samsung_clk_save(reg_base, exynos4_save_common,
> > +                               ARRAY_SIZE(exynos4_clk_regs));
> 
> a doubt here, Is sizeof(exynos4_clk_regs) works with
> exynos4_clk_regs[] as __initdata ?

Hmm, this is a compile time constant, so I don't see why it couldn't work.

> > +
> > +       if (exynos4_soc == EXYNOS4210)
> > +               samsung_clk_save(reg_base, exynos4_save_soc,
> > +                                       ARRAY_SIZE(exynos4210_clk_save));
> 
> [ ... ]
> > +static void exynos4_clk_sleep_init(void)
> 
> I think, this fuction can be placed in __init section.

That's right. Thanks for pointing this out.

Best regards,
Tomasz

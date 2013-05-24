From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [RESEND PATCH 0/5] Add generic set_rate clk_ops for PLL35XX and
 PLL36XX for samsung SoCs
Date: Fri, 24 May 2013 12:08:18 +0200
Message-ID: <2190833.1fWNPGSC64@amdc1227>
References: <1369374919-6214-1-git-send-email-vikas.sajjan@linaro.org>
 <16501955.nOvJQZzRlQ@amdc1227>
 <CAKew6eWTrRsZP3w88_RTgZ-fz2Bxk2442=zicwdhOitMytgi6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:14710 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752971Ab3EXKI0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 06:08:26 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MNA00ILFS462K30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 24 May 2013 11:08:24 +0100 (BST)
In-reply-to: <CAKew6eWTrRsZP3w88_RTgZ-fz2Bxk2442=zicwdhOitMytgi6Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org, dianders@chromium.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org

Hi Yadwinder,

On Friday 24 of May 2013 15:30:58 Yadwinder Singh Brar wrote:
> 
> 
> Hi Tomasz,
> 
> 
> All the patches are delivered properly in 2nd attempt to linux-samsung-soc 
mailing list as seen bellow:

Sure, they are delivered to this mailing list, but don't have any other 
recpients, which makes it impossible to properly reply to them.

> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg18357.html
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg18362.html
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg18358.html
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg18359.html
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg18360.html
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg18361.html
> 
> 
> Please let me know if you still want us to resend series again 3rd time.

Please resend the series again with all the necessary recipients, including 
this list, linux-arm-kernel list and all the applicable people on CC.

Also please do _not_ send HTML messages to mailing lists. Only plain text is 
accepted on most of them and even some people block HTML messages, since most 
of the SPAM is sent as HTML.

See http://vger.kernel.org/majordomo-info.html for general rules of lists at 
vger.kernel.org .

Best regards,
Tomasz

> Regards,
> 
> Yadwinder
> 
> 
> 
> 
> 
> 
> 
> 
> 
> On Fri, May 24, 2013 at 2:57 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> 
> Hi,
> 
> 
> On Friday 24 of May 2013 11:25:14 Vikas Sajjan wrote:
> > This patch series does the following:
> >
> >  1) Factors out possible common code, unifies the clk strutures used
> >     for PLL35XX & PLL36XX and usues clk->base instead of clk->con0
> >
> >  2) Defines a common rate_table which will contain recommended p, m, s and 
k
> > values for supported rates that needs to be changed for changing
> > corresponding PLL's rate
> >
> >  3) Adds set_rate() and round_rate() clk_ops for PLL35XX and PLL36XXX
> >
> > Is rebased on branch kgene's "for-next"
> > https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=
> > for-next
> >
> > And tested these patch on chromebook for EPLL settings for Audio on our
> > chrome tree.
> >
> > Vikas Sajjan (2):
> >   clk: samsung: Add set_rate() clk_ops for PLL36XX
> >   clk: samsung: Add EPLL and VPLL freq table for exynos5250 SoC
> >
> > Yadwinder Singh Brar (3):
> >   clk: samsung: Use clk->base instead of directly using clk->con0 for
> >     PLL3XXX
> >   clk: samsung: Add support to register rate_table for PLL3XXX
> >   clk: samsung: Add set_rate() clk_ops for PLL35XX
> >
> >  drivers/clk/samsung/clk-exynos4.c    |   10 +-
> >  drivers/clk/samsung/clk-exynos5250.c |   29 +++-
> >  drivers/clk/samsung/clk-pll.c        |  243
> > ++++++++++++++++++++++++++++++---- drivers/clk/samsung/clk-pll.h        |
> > 27 +++-
> >  4 files changed, 272 insertions(+), 37 deletions(-)
> 
> 
> Could you please send the series properly, with all patches arriving to all
> necessary mailing lists and with all important people on CC?
> 
> This and your previous attempts fail to meet this requirement, making it
> impossible to properly review and comment the patches.
> 
> Also please add linux-arm-kernel@lists.infradead.org , as it is the primary
> list for sending clock-related patches (see the MAINTAINERS file).
> 
> Best regards,
> --
> Tomasz Figa
> Linux Kernel Developer
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" 
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
> 
> 
> 

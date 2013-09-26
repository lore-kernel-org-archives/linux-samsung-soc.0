From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RFC] clk: samsung:  Remove old clock drivers for s5pc100 and
 s5pv210
Date: Thu, 26 Sep 2013 14:48:12 +0900
Message-ID: <02fb01ceba7b$fd0e9c60$f72bd520$%kim@samsung.com>
References: <1380043160-16824-1-git-send-email-m.krawczuk@partner.samsung.com>
 <02f401ceba7b$6dc16e20$49444a60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17625 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750933Ab3IZFsO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 01:48:14 -0400
In-reply-to: <02f401ceba7b$6dc16e20$49444a60$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mateusz Krawczuk' <m.krawczuk@partner.samsung.com>
Cc: linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, t.figa@samsung.com, m.szyprowski@samsung.com, 'Kyungmin Park' <kyungmin.park@samsung.com>

Kukjin Kim wrote:
> 
> Mateusz Krawczuk wrote:
> >
> > This patch removes old clock management code for S5PC100 and
> > S5PC110/S5PV210,
> > since the platform has been already moved to the new clock driver
> > using Common Clock Framework.
> >
> > Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> > This patch series require
> > S5PC100 and S5PV210 patch series moving to common clock framework.
> >
> >  arch/arm/mach-s5pc100/Kconfig  |    2 +-
> >  arch/arm/mach-s5pc100/Makefile |    1 -
> >  arch/arm/mach-s5pc100/clock.c  | 1361
----------------------------------
> -
> > ----
> >  arch/arm/mach-s5pv210/Kconfig  |    2 +-
> >  arch/arm/mach-s5pv210/Makefile |    1 -
> >  arch/arm/mach-s5pv210/clock.c  | 1365
----------------------------------
> -
> > -----
> >  6 files changed, 2 insertions(+), 2730 deletions(-)
> >  delete mode 100644 arch/arm/mach-s5pc100/clock.c
> >  delete mode 100644 arch/arm/mach-s5pv210/clock.c
> >
> In this case, would be easier to review with using "-D" for format-patch.
> 
> And this should be followed by moving common clk series for
> s5pc100/s5pv210.
> See s3c64xx common clk patches in v3.13-next/common-clk-s3c64xx branch as
> a
> reference.
> 
> And I have never seen common clk stuff for s5pc100. In addition, I'm not

Oh, I found, there is series for common clk s5pc100 :)

> sure we _still_ need to support s5pc100 in mainline.
> 
Thanks,
Kukjin

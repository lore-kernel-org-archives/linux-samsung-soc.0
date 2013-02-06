From: Sangsu Park <sangsu4u.park@samsung.com>
Subject: RE: [RESEND][PATCH] ARM: EXYNOS: Add clocks for EXYNOS I2S and PCM I/F
Date: Wed, 06 Feb 2013 14:42:49 +0900
Message-ID: <003601ce042c$cc599c60$650cd520$@samsung.com>
References: <003201ce0429$c15e8350$441b89f0$@samsung.com>
 <CAK9yfHwZ6JOxtSEd1960v_Zb2QkpTQz7RG6NcSrJMCLzVWjJEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39865 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751309Ab3BFFmv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 00:42:51 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHS0012YAHTZCM0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 14:42:49 +0900 (KST)
Received: from DOSANGSU4UP02 ([12.23.118.226])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHS00IARAJD6F70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 14:42:49 +0900 (KST)
In-reply-to: <CAK9yfHwZ6JOxtSEd1960v_Zb2QkpTQz7RG6NcSrJMCLzVWjJEg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Kukjin Kim' <kgene.kim@samsung.com>, sbkim73@samsung.com, 'Tushar Behera' <tushar.behera@linaro.org>

On 6 February 2013 11:00, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> On 6 February 2013 10:51, Sangsu Park <sangsu4u.park@samsung.com> wrote:
> > Audio Subsystem has own clocks for I2S0 and PCM0 in all EXYNOS series.
> > This patch add clocks for I2S0 and PCM0 I/F.
> >
> > Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
> > ---
> >  arch/arm/mach-exynos/Makefile      |    1 +
> >  arch/arm/mach-exynos/clock-audss.c |   64
> ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 65 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm/mach-exynos/clock-audss.c
> >
> [snip]
> > diff --git a/arch/arm/mach-exynos/clock-audss.c
> > b/arch/arm/mach-exynos/clock-audss.c
> > new file mode 100644
> > index 0000000..8260185
> > --- /dev/null
> > +++ b/arch/arm/mach-exynos/clock-audss.c
> > @@ -0,0 +1,64 @@
> [snip]
> > +static void __iomem *clk_audss_base = 0;
> > +
> > +static int exynos_clk_audss_ctrl(struct clk *clk, int enable)
> > +{
> > +       if (!clk_audss_base)
> > +               return ENOMEM;
> 
> Return value should be negative (-ENOMEM).

Thanks for your comment.
I'll fix it.

> 
> 
> 
> --
> With warm regards,
> Sachin

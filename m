From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Fix MSHC clocks instance names
Date: Tue, 18 Dec 2012 19:38:20 -0800
Message-ID: <002101cddd9a$4bd206d0$e3761470$@samsung.com>
References: <1355501608-2955-1-git-send-email-tobetter@gmail.com>
 <CAJuYYwS-+x9=V5z+POGYCHL8TkUDjrRB663Mys6ppCBXRASxFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:38864 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754071Ab2LSDiY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Dec 2012 22:38:24 -0500
In-reply-to: <CAJuYYwS-+x9=V5z+POGYCHL8TkUDjrRB663Mys6ppCBXRASxFQ@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Dongjin Kim' <tobetter@gmail.com>
Cc: 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Thomas Abraham wrote:
> 
> On 14 December 2012 21:43, Dongjin Kim <tobetter@gmail.com> wrote:
> > Replace clock instance name of MSHC controller for BIC and CIU of
> Exynos4412.
> >
> > Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> > ---
> >  arch/arm/mach-exynos/clock-exynos4.c |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-
> exynos/clock-exynos4.c
> > index efead60..bbcb3de 100644
> > --- a/arch/arm/mach-exynos/clock-exynos4.c
> > +++ b/arch/arm/mach-exynos/clock-exynos4.c
> > @@ -529,7 +529,7 @@ static struct clk exynos4_init_clocks_off[] = {
> >                 .enable         = exynos4_clk_ip_fsys_ctrl,
> >                 .ctrlbit        = (1 << 8),
> >         }, {
> > -               .name           = "dwmmc",
> > +               .name           = "biu",
> >                 .parent         = &exynos4_clk_aclk_133.clk,
> >                 .enable         = exynos4_clk_ip_fsys_ctrl,
> >                 .ctrlbit        = (1 << 9),
> > @@ -1134,7 +1134,7 @@ static struct clksrc_clk exynos4_clksrcs[] = {
> >                 .reg_div = { .reg = EXYNOS4_CLKDIV_MFC, .shift = 0,
.size = 4 },
> >         }, {
> >                 .clk    = {
> > -                       .name           = "sclk_dwmmc",
> > +                       .name           = "ciu",
> >                         .parent         = &exynos4_clk_dout_mmc4.clk,
> >                         .enable         = exynos4_clksrc_mask_fsys_ctrl,
> >                         .ctrlbit        = (1 << 16),
> > --
> 
> Acked-by: Thomas Abraham <thomas.abraham@linaro.org>
> 
Thanks, applied.

- Kukjin

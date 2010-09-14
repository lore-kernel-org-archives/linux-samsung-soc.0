From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 1/6] ARM: S5PC110: update framebuffer setup information for
 Goni
Date: Tue, 14 Sep 2010 07:38:19 +0200
Message-ID: <002f01cb53cf$0c682a80$25387f80$%szyprowski@samsung.com>
References: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
 <1284103403-10696-2-git-send-email-m.szyprowski@samsung.com>
 <000401cb50cd$8b3f72a0$a1be57e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42443 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752005Ab0INFi0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Sep 2010 01:38:26 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8Q00GWY2C1QC40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Sep 2010 14:38:25 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8Q00AGC2BXMJ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Sep 2010 14:38:25 +0900 (KST)
In-reply-to: <000401cb50cd$8b3f72a0$a1be57e0$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Hello,

On Friday, September 10, 2010 11:50 AM Kukjin Kim wrote:

> Marek Szyprowski wrote:
> >
> > Change the default upper_margin and vsync_len to get rid of repeated last
> > line on the display.
> >
> How about Aquila board? Maybe same in my thinking.

Yes, I will send a similar patch once I do a test. Had no access to Aquila
board that time.

> And it'd better that another stuff like removing pixclock is in different
> patch.

Well, Goni machine was the last one that had pixelclock defined. All other
boards had pixel clock definition already removed, so I thought that it would
be a good opportunity to fix this together with screen definition update.
 
> Anyway, looks ok to me...will apply.

Thx

> 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/mach-s5pv210/mach-goni.c |    5 ++---
> >  1 files changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5pv210/mach-goni.c
> b/arch/arm/mach-s5pv210/mach-
> > goni.c
> > index d9fe739..b0ae208 100644
> > --- a/arch/arm/mach-s5pv210/mach-goni.c
> > +++ b/arch/arm/mach-s5pv210/mach-goni.c
> > @@ -88,13 +88,12 @@ static struct s3c2410_uartcfg goni_uartcfgs[]
> __initdata = {
> >  /* Frame Buffer */
> >  static struct s3c_fb_pd_win goni_fb_win0 = {
> >  	.win_mode = {
> > -		.pixclock = 1000000000000ULL /
> > ((16+16+2+480)*(28+3+2+800)*55),
> >  		.left_margin	= 16,
> >  		.right_margin	= 16,
> > -		.upper_margin	= 3,
> > +		.upper_margin	= 2,
> >  		.lower_margin	= 28,
> >  		.hsync_len	= 2,
> > -		.vsync_len	= 2,
> > +		.vsync_len	= 1,
> >  		.xres		= 480,
> >  		.yres		= 800,
> >  		.refresh	= 55,
> > --
> > 1.7.2.2
> 

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center

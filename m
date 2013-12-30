From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos4: Correct SRC_MFC register
Date: Mon, 30 Dec 2013 18:50:04 +0100
Message-ID: <28945056.75J9o12lTX@amdc1227>
References: <1385097668-24620-1-git-send-email-sw0312.kim@samsung.com>
 <4859492.2SOgx7UbdE@amdc1227> <20131219042310.23538.98799@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:24312 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755634Ab3L3Ru2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 12:50:28 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MYM00IICS833T10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Dec 2013 17:50:27 +0000 (GMT)
In-reply-to: <20131219042310.23538.98799@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

On Wednesday 18 of December 2013 20:23:10 Mike Turquette wrote:
> Quoting Tomasz Figa (2013-12-18 06:54:30)
> > On Friday 22 of November 2013 14:21:08 Seung-Woo Kim wrote:
> > > The SRC_MFC register was incorrect. This patch corrects it.
> > > 
> > > Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> > > ---
> > >  drivers/clk/samsung/clk-exynos4.c |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > > 
> > > diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> > > index ad5ff50..1a7c1b9 100644
> > > --- a/drivers/clk/samsung/clk-exynos4.c
> > > +++ b/drivers/clk/samsung/clk-exynos4.c
> > > @@ -39,7 +39,7 @@
> > >  #define SRC_TOP1             0xc214
> > >  #define SRC_CAM                      0xc220
> > >  #define SRC_TV                       0xc224
> > > -#define SRC_MFC                      0xcc28
> > > +#define SRC_MFC                      0xc228
> > >  #define SRC_G3D                      0xc22c
> > >  #define E4210_SRC_IMAGE              0xc230
> > >  #define SRC_LCD0             0xc234
> > > 
> > 
> > Applied into samsung-clk fixes branch.
> 
> It's always nice when a fix for the -rc cycle includes a description of
> the user-visible regression that it fixes.

I have updated the description when applying.

Best regards,
Tomasz

From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: samsung: exynos4: Correct SRC_MFC register
Date: Wed, 18 Dec 2013 20:23:10 -0800
Message-ID: <20131219042310.23538.98799@quantum>
References: <1385097668-24620-1-git-send-email-sw0312.kim@samsung.com>
 <4859492.2SOgx7UbdE@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gg0-f182.google.com ([209.85.161.182]:38626 "EHLO
	mail-gg0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751008Ab3LSEXP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 23:23:15 -0500
Received: by mail-gg0-f182.google.com with SMTP id d2so180970ggn.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 20:23:15 -0800 (PST)
In-Reply-To: <4859492.2SOgx7UbdE@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

Quoting Tomasz Figa (2013-12-18 06:54:30)
> On Friday 22 of November 2013 14:21:08 Seung-Woo Kim wrote:
> > The SRC_MFC register was incorrect. This patch corrects it.
> > 
> > Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> > ---
> >  drivers/clk/samsung/clk-exynos4.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> > index ad5ff50..1a7c1b9 100644
> > --- a/drivers/clk/samsung/clk-exynos4.c
> > +++ b/drivers/clk/samsung/clk-exynos4.c
> > @@ -39,7 +39,7 @@
> >  #define SRC_TOP1             0xc214
> >  #define SRC_CAM                      0xc220
> >  #define SRC_TV                       0xc224
> > -#define SRC_MFC                      0xcc28
> > +#define SRC_MFC                      0xc228
> >  #define SRC_G3D                      0xc22c
> >  #define E4210_SRC_IMAGE              0xc230
> >  #define SRC_LCD0             0xc234
> > 
> 
> Applied into samsung-clk fixes branch.

It's always nice when a fix for the -rc cycle includes a description of
the user-visible regression that it fixes.

Regards,
Mike

> 
> Best regards,
> Tomasz
> 

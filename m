From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] GPIO: Samsung: fix broken configuration for Exynos4 GPIO
 banks
Date: Mon, 26 Sep 2011 13:22:24 +0900
Message-ID: <00d201cc7c03$e4913750$adb3a5f0$%kim@samsung.com>
References: <1316685759-14401-1-git-send-email-m.szyprowski@samsung.com>
 <20110922170556.GH17168@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10977 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902Ab1IZEW0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Sep 2011 00:22:26 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS4003W043IO2L0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Sep 2011 13:22:24 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS400GZ445C6V50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 26 Sep 2011 13:22:24 +0900 (KST)
In-reply-to: <20110922170556.GH17168@ponder.secretlab.ca>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Grant Likely' <grant.likely@secretlab.ca>, 'Marek Szyprowski' <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Angus Ainslie' <angus.ainslie@linaro.org>

Grant Likely wrote:
> 
> On Thu, Sep 22, 2011 at 12:02:39PM +0200, Marek Szyprowski wrote:
> > Commit 1b39d5f2cc introduced new common gpio driver for all Samsung GPIO
> > SoCs. The new driver doesn't work correctly on Samsung Exynos4 SoC. It
> > fails to set configuration for all but external interrupt pins. This
> > patch fixes this issue.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> 
> > ---
> >  drivers/gpio/gpio-samsung.c |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> > index 36f3675..be13580 100644
> > --- a/drivers/gpio/gpio-samsung.c
> > +++ b/drivers/gpio/gpio-samsung.c
> > @@ -446,6 +446,8 @@ static struct samsung_gpio_cfg s3c24xx_gpiocfg_banka
> = {
> >  static struct samsung_gpio_cfg exynos4_gpio_cfg = {
> >  	.set_pull	= exynos4_gpio_setpull,
> >  	.get_pull	= exynos4_gpio_getpull,
> > +	.set_config	= samsung_gpio_setcfg_4bit,
> > +	.get_config	= samsung_gpio_getcfg_4bit,
> >  };
> >
> >  static struct samsung_gpio_cfg s5p64x0_gpio_cfg_rbank = {
> > --
> > 1.7.1.569.g6f426
> >

Oops :(
You're right, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

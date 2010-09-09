From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/5] rtc: rtc-s3c: Fix on RTC initialization method
Date: Thu, 09 Sep 2010 10:04:41 +0900
Message-ID: <000501cb4fba$fe13c150$fa3b43f0$%kim@samsung.com>
References: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
 <1283837381-9575-5-git-send-email-kgene.kim@samsung.com>
 <4C86C9C2.20603@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24322 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756145Ab0IIBE3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Sep 2010 21:04:29 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8G00LY0GBFZV50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 10:04:27 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8G004FUGBFBK@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 10:04:28 +0900 (KST)
In-reply-to: <4C86C9C2.20603@fluff.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, 'Wan ZongShun' <mcuos.com@gmail.com>, a.zummo@towertech.it, 'Changhwan Youn' <chaos.youn@samsung.com>

Ben Dooks wrote:
> 
> On 07/09/10 06:29, Kukjin Kim wrote:
> > From: Changhwan Youn <chaos.youn@samsung.com>
> >
> > This patch changes RTC initialization method on probe() as
> > per Wan ZongShun's suggestion. The 'rtc_valid_tm(tm)' can
> > check whether RTC BCD is valid or not.
> >
> > And should be changed the method of check because previous
> > method cannot validate RTC BCD registers properly.
> >
> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > Cc: Wan ZongShun <mcuos.com@gmail.com>
> > ---
> >  drivers/rtc/rtc-s3c.c |   16 +++++++++++-----
> >  1 files changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> > index c078548..7f15073 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > @@ -458,8 +458,8 @@ static int __devexit s3c_rtc_remove(struct
> platform_device *dev)
> >  static int __devinit s3c_rtc_probe(struct platform_device *pdev)
> >  {
> >  	struct rtc_device *rtc;
> > +	struct rtc_time rtc_tm;
> >  	struct resource *res;
> > -	unsigned int tmp, i;
> >  	int ret;
> >
> >  	pr_debug("%s: probe=%p\n", __func__, pdev);
> > @@ -540,11 +540,17 @@ static int __devinit s3c_rtc_probe(struct
> platform_device *pdev)
> >
> >  	/* Check RTC Time */
> >
> > -	for (i = S3C2410_RTCSEC; i <= S3C2410_RTCYEAR; i += 0x4) {
> > -		tmp = readb(s3c_rtc_base + i);
> > +	s3c_rtc_gettime(NULL, &rtc_tm);
> >
> > -		if ((tmp & 0xf) > 0x9 || ((tmp >> 4) & 0xf) > 0x9)
> > -			writeb(0, s3c_rtc_base + i);
> > +	if (rtc_valid_tm(&rtc_tm)) {
> > +		rtc_tm.tm_year	= 100;
> > +		rtc_tm.tm_mon	= 0;
> > +		rtc_tm.tm_mday	= 1;
> > +		rtc_tm.tm_hour	= 0;
> > +		rtc_tm.tm_min	= 0;
> > +		rtc_tm.tm_sec	= 0;
> > +
> > +		s3c_rtc_settime(NULL, &rtc_tm);
> 
> I think a dev_warn() in this path is good to alert the user
> to bad things happening, esp if the system should have a valid
> time, it marks he posibility the rtc battery has gone.

Ok...will address comment from you.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] rtc: rtc-s3c: Add BCD register initialization codes
Date: Fri, 23 Jul 2010 16:04:49 +0900
Message-ID: <004301cb2a35$6d3b30a0$47b191e0$%kim@samsung.com>
References: <1279702666-13021-1-git-send-email-kgene.kim@samsung.com>
 <1279702666-13021-4-git-send-email-kgene.kim@samsung.com>
 <4C47074C.703@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10256 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750838Ab0GWHFR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jul 2010 03:05:17 -0400
Received: from epmmp1. (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6000L9Z10R5W80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jul 2010 16:05:15 +0900 (KST)
Received: from kgenekim (unknown [12.23.103.96])
 by mmp1.samsung.com (Sun Java(tm) System Messaging Server 7u3-15.01 64bit
 (built Feb 12 2010)) with ESMTPA id <0L600004H10R9L50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jul 2010 16:05:15 +0900 (KST)
In-reply-to: <4C47074C.703@ru.mvista.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, 'Taekgyun Ko' <taeggyun.ko@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it

Sergei Shtylyov wrote:
> 
> Hello.
> 
Hi :-)

> Kukjin Kim wrote:
> 
> > From: Taekgyun Ko <taeggyun.ko@samsung.com>
> 
> > RTC needs to be initialized when BCD registers have invalid value.
> 
> > Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> [...]
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> > index 2040017..e96e109 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > @@ -536,10 +536,20 @@ static int __devinit s3c_rtc_probe(struct
> platform_device *pdev)
> >
> >  	s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
> >
> > -	if (s3c_rtc_cpu_type == TYPE_S3C64XX)
> > +	if (s3c_rtc_cpu_type == TYPE_S3C64XX) {
> >  		rtc->max_user_freq = 32768;
> > -	else
> > +
> > +		/* Check RTC Time */
> > +
> > +		for (i = S3C2410_RTCSEC; i <= S3C2410_RTCYEAR; i += 0x4) {
> > +			tmp = readb(s3c_rtc_base + i);
> > +
> > +			if (((tmp & 0xf) > 0x9) || (((tmp >> 4) & 0xf) >
0x9))
> 
>    There is no need to have parens around > operations.
> 
Ok...you're right. will fix it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

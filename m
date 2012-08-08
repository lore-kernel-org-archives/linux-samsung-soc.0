From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/4] ARM: SAMSUNG: Add API to set platform data for s5p-tv
 driver
Date: Wed, 08 Aug 2012 13:54:14 +0900
Message-ID: <0a5201cd7521$db8501b0$928f0510$%kim@samsung.com>
References: <1341218932-15846-1-git-send-email-sachin.kamat@linaro.org>
 <1341218932-15846-2-git-send-email-sachin.kamat@linaro.org>
 <147701cd63c5$a6c8ff70$f45afe50$%kim@samsung.com>
 <5004DCF4.1090409@linaro.org>
 <195901cd6601$ab971c60$02c55520$%kim@samsung.com> <500916A7.7090803@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46970 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751012Ab2HHEyP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Aug 2012 00:54:15 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8F002EK6XYHYI0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Aug 2012 13:54:14 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8F00JJY6YD7030@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Aug 2012 13:54:14 +0900 (KST)
In-reply-to: <500916A7.7090803@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, patches@linaro.org, a.sim@samsung.com, jiun.yu@samsung.com, june.bae@samsung.com

Tushar Behera wrote:
> 
> On 07/20/2012 04:26 AM, Kukjin Kim wrote:
> >

[...]

> >>
> > Yeah, I know the situation, but I don't know why we should having the
> same
> > i2c channel is included in different platform_data. I need to talk about
> > this approach to hdmi guys in my team, I'll let you know as soon as
> > possible.
> >
> 
> While configuring all the i2c channels, we need to pass the channel
> number. Since the channel number is not fixed for hdmiphy, it was
> updated as per respective CPUs.
> 
> The same would be done for other I2C channels also, we pass channel
> number in platform data (s3c_i2c0_set_platdata) and then specify the bus
> number as the first parameter in i2c_register_board_info(...) while
> adding i2c devices.
> 
> It would be great if we can find a resolution on this before the merge
> window. HDMI support in mainline kernel is broken since 3.4-rc1 and we
> would love to get this fixed during 3.6.
> 
OK, firstly let's fix its working. But I'm still thinking we need to sort
this out next time.

Will apply this series, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

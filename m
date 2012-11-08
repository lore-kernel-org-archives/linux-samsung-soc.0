From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Make s3c_device_i2c0 always use id 0
Date: Thu, 08 Nov 2012 13:52:24 +0900
Message-ID: <0ced01cdbd6c$d81f9b00$885ed100$%kim@samsung.com>
References: <4039915.8GOx0SKq2B@amdc1227> <509AA23C.6000704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19302 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753467Ab2KHEwZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 23:52:25 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD5007CQK6EEYH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 13:52:24 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD500A54K7CRD60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 13:52:24 +0900 (KST)
In-reply-to: <509AA23C.6000704@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, 'Tomasz Figa' <t.figa@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, jhkim@insignal.co.kr, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Sylwester Nawrocki wrote:
> 
> On 11/07/2012 02:00 PM, Tomasz Figa wrote:
> > This patch removes compatibility definitions added long time ago when
> > clock ids were used instead of devnames that were needed for platforms
> > with only one i2c controller with id -1 (some s3c24xx's).
> >
> > Because currently devname field is used for matching device instances to
> > clocks and if no devname is provided (as in clock-s3c2412.c and
> > common-s3c2443.c for i2c clock, both in arch/arm/mach-s3c24xx) the clock
> > is being matched only by name, so s3c_device_i2c0 can always have id 0.
> >
> > This patch solves the issue with i2c0 broken on boards where its the
> > only i2c controller used, tested on Origen.
> >
> > Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

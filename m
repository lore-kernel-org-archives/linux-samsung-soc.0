From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 1/6] Samsung SoC ADC: use regulator (VDD for ADC).
Date: Wed, 20 Jul 2011 21:23:26 +0900
Message-ID: <069501cc46d7$d355f2c0$7a01d840$%kim@samsung.com>
References: <1309420175-10301-1-git-send-email-myungjoo.ham@samsung.com>
 <1309420175-10301-2-git-send-email-myungjoo.ham@samsung.com>
 <201106301122.50800.anarsoul@gmail.com>
 <20110630160501.GG3249@opensource.wolfsonmicro.com>
 <037301cc4376$3d7f5a20$b87e0e60$%kim@samsung.com>
 <20110719154003.GK9652@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19268 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751006Ab1GTMX1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 08:23:27 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOM00M36T32NR80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jul 2011 21:23:26 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOM00618T32LH@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jul 2011 21:23:26 +0900 (KST)
In-reply-to: <20110719154003.GK9652@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Vasily Khoruzhick' <anarsoul@gmail.com>, linux-arm-kernel@lists.infradead.org, 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com, 'Ben Dooks' <ben-linux@fluff.org>

Mark Brown wrote:
> 
> On Sat, Jul 16, 2011 at 02:07:13PM +0900, Kukjin Kim wrote:
> > Mark Brown wrote:
> 
> > > If there isn't a separate supply for the regulators on S3C24xx devices
> > > then I guess the best option is to provide that supply as a dummy
> > > regulator in the s3c24xx core code.
> 
> > OK, but it means I can't apply this until adding a dummy regulator for
> > S3C24XX?
> 
> That could always come later as a bug fix :)  The regulator API does
> have a couple of methods of substituting in a dummy regulator itself,
> though it does complain a bit, so it should mostly be a simple config
> change to work around on affected systems.

OK, I agree with your opinions.

Thanks :)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

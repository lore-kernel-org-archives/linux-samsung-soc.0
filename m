From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 1/6] Samsung SoC ADC: use regulator (VDD for ADC).
Date: Sat, 16 Jul 2011 14:07:13 +0900
Message-ID: <037301cc4376$3d7f5a20$b87e0e60$%kim@samsung.com>
References: <1309420175-10301-1-git-send-email-myungjoo.ham@samsung.com>
 <1309420175-10301-2-git-send-email-myungjoo.ham@samsung.com>
 <201106301122.50800.anarsoul@gmail.com>
 <20110630160501.GG3249@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54087 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733Ab1GPFHW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Jul 2011 01:07:22 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOE00FYSU88WM60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 14:07:20 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOE000X2U88OM@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 14:07:20 +0900 (KST)
In-reply-to: <20110630160501.GG3249@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Vasily Khoruzhick' <anarsoul@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, 'Jassi Brar' <jassi.brar@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com, 'Ben Dooks' <ben-linux@fluff.org>, 'Seungwhan Youn' <sw.youn@samsung.com>, 'Changhwan Youn' <chaos.youn@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Mark Brown wrote:
> 
> On Thu, Jun 30, 2011 at 11:22:50AM +0300, Vasily Khoruzhick wrote:
> > On Thursday 30 June 2011 10:49:30 MyungJoo Ham wrote:
> 
> > > +	adc->vdd = regulator_get(dev, "vdd");
> > > +	if (IS_ERR(adc->vdd)) {
> > > +		dev_err(dev, "operating without regulator \"vdd\" .\n");
> > > +		ret = PTR_ERR(adc->vdd);
> > > +		goto err_alloc;
> > > +	}
> > > +
> 
> > NACK. Make it optional, otherwise it breaks s3c24xx.
> 
> No, the above code is how the regulator API should be used.  The API
> will stub itself out if not in use so unless the s3c24xx platforms are
> using regulators and there's a couple of options in the regulator API
> for handling partially defined hookups of regulators on the board.
> 
> If there isn't a separate supply for the regulators on S3C24xx devices
> then I guess the best option is to provide that supply as a dummy
> regulator in the s3c24xx core code.

OK, but it means I can't apply this until adding a dummy regulator for
S3C24XX?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

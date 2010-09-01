From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] MAX8952 PMIC Driver Initial Release
Date: Wed, 01 Sep 2010 09:15:36 +0900
Message-ID: <011b01cb496a$cfa773d0$6ef65b70$%kim@samsung.com>
References: <1282283036-12641-1-git-send-email-myungjoo.ham@samsung.com>
 <20100820095351.GD13668@rakim.wolfsonmicro.main>
 <1282301229.3084.152.camel@odin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61375 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752155Ab0IAAPZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Aug 2010 20:15:25 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L81004ZPKPOZ560@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Sep 2010 09:15:24 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8100J9KKPOYI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Sep 2010 09:15:24 +0900 (KST)
In-reply-to: <1282301229.3084.152.camel@odin>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Liam Girdwood' <lrg@slimlogic.co.uk>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, 'MyungJoo Ham' <myungjoo.ham@samsung.com>, myungjoo.ham@gmail.com, linux-arm-kernel@lists.infradead.org, 'Changhwan Youn' <chaos.youn@samsung.com>

Mark Brown wrote:
> 
> On Fri, 2010-08-20 at 10:53 +0100, Mark Brown wrote:
> > On Fri, Aug 20, 2010 at 02:43:56PM +0900, MyungJoo Ham wrote:
> > > MAX8952 PMIC is used to provide voltage output between 770mV - 1400mV
> > > with DVS support. In this initial release, users can set voltages for
> > > four DVS modes, RAMP delay values, and SYNC frequency.
> > > Controlling FPWM/SYNC_MODE/Pull-Down/Ramp Modes and reading
> CHIP_ID
> > > is not supported in this release.
> > >
> > > If GPIO of EN is not valid in platform data, the driver assumes that
it
> > > is always-on. If GPIO of VID0 or VID1 is invalid, the driver pulls
down
> > > VID0 and VID1 to fix DVS mode as 0 and disables DVS support.
> > >
> > > We assume that V_OUT is capable to provide every voltage from 770mV to
> > > 1.40V in 10mV steps although the data sheet has some ambiguity on it.
> > >
> > > Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >
> > Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> 
> Applied.
> 
Sorry for late opinion...just wondering...

Seems almost same between the operation of max8649 and max8952 except output
voltage range.

How do you think that can support max8952 with small modifying max8649?


> Thanks
> 
> Liam
> --
> Freelance Developer, SlimLogic Ltd
> ASoC and Voltage Regulator Maintainer.
> http://www.slimlogic.co.uk
> 

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

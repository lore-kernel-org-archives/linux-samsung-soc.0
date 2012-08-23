From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C64XX: Update configuration for WM5102 module
 on Cragganmore
Date: Thu, 23 Aug 2012 18:45:19 +0900
Message-ID: <1d5901cd8114$023550f0$069ff2d0$%kim@samsung.com>
References: <1344535549-4371-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <0db901cd76b4$7daf1730$790d4590$%kim@samsung.com>
 <20120810100713.GH24328@opensource.wolfsonmicro.com>
 <0eff01cd777f$4c9d1f90$e5d75eb0$%kim@samsung.com>
 <20120813122359.GA13446@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48939 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752732Ab2HWJpW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Aug 2012 05:45:22 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M970080ZCE0QZ50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Aug 2012 18:45:20 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9700GWICFJII30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Aug 2012 18:45:20 +0900 (KST)
In-reply-to: <20120813122359.GA13446@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> On Sat, Aug 11, 2012 at 02:08:09PM +0900, Kukjin Kim wrote:
> 
> > BTW, don't you need to enable your Cragganmore board in the defconfig?
> 
> Well, it doesn't really matter that much to us - it's more a question
> for whoever uses the defconfig.

Yeah, actually SoC defconfig in mainline doesn't cover _real_ requirements
for (mass) product. But I think, it's time we need to sort out the
defconfigs so that we could use them efficiently on product. BTW, if
enabling board in defconfig, at least, unexpected build breakages could be
detected by testing defconfig before merge for mainline...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

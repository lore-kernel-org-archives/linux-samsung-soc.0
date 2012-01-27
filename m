From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/4] Pending S3C64xx updates
Date: Fri, 27 Jan 2012 10:33:24 +0900
Message-ID: <016501ccdc93$ae158190$0a4084b0$%kim@samsung.com>
References: <20120124213127.GH1135@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49113 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751301Ab2A0Bdg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jan 2012 20:33:36 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYF0007VOBZS270@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 10:33:35 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYF00MTQOBWL920@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 10:33:35 +0900 (KST)
In-reply-to: <20120124213127.GH1135@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
Hi Mark,

> This patch series is a collection of s3c64xx updates I've had hanging
> round in my tree for varying lengths of time that it'd be good to get
> merged.  There's no particularly relationship between them except that
> they're all for s3c64xx.
> 
OK, see my comments below.

> Mark Brown (4):
>       ARM: S3C64XX: Make s3c64xx_init_uarts() static

As I commented, I have pushed this into rmk's patch system but not applied
yet. I discarded that just now in there so that I can apply this in my tree.

>       ARM: S3C64XX: Define some additional always off clocks

Hmm, I know there were discussions about this with Tomasz Figa and I was
waiting for his submitting. But now this looks ok to me so will apply this.

>       ARM: S3C6410: Use device names for both I2C clocks

OK, will apply and let me sort out the #ifdef in Samsung stuff for single
zImage later.

>       ARM: S3C64XX: Add hookup for Tomatin module on Cragganmore

Already in my next/board-samsung.

> 
>  arch/arm/mach-s3c64xx/clock.c                |  106
> ++++++++++++++++++++++++++
>  arch/arm/mach-s3c64xx/common.c               |    2 +-
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |   27 ++++++-
>  arch/arm/mach-s3c64xx/mach-crag6410.c        |   11 +++-
>  4 files changed, 143 insertions(+), 3 deletions(-)


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

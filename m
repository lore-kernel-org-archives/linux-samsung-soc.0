From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V4 0/4] Add SPI clkdev support
Date: Wed, 02 Nov 2011 20:23:17 +0900
Message-ID: <004a01cc9951$d1eca790$75c5f6b0$%kim@samsung.com>
References: <1320268004-4545-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15454 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751655Ab1KBLXT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Nov 2011 07:23:19 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU100B0Z6AUHB20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2011 20:23:18 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LU100GF96AT5F80@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2011 20:23:18 +0900 (KST)
In-reply-to: <1320268004-4545-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk

Padmavathi Venna wrote:
> 
> This patchset modifies the existing clkdev to make SPI driver
> independent of the clock names send from platform data. This
> patches enables the SPI driver to request SPI bus clocks
> using generic connection ID.
> 
> Link to V1:
>         http://www.spinics.net/lists/arm-kernel/msg141671.html
> 
> V2 Changes:
>         -Add newly introduced CLKDEV_INIT macro for creating clk_lookup
>         structure as suggested by Russell King
>         V2 patches series are:
>         http://www.spinics.net/lists/arm-kernel/msg142733.html
> 
> V3 Changes:
>         -Reworked the patches as per the following link. Patch series in
>         the following link removed & and , from the macro declaration and
added
>         in the macro defination.
>         http://www.spinics.net/lists/arm-kernel/msg143663.html
> 
> V4 Changes:
> 	Rebased to next-samsung-dt.
> 
> Padmavathi Venna (4):
>   ARM: S3C64XX: Add SPI clkdev support
>   ARM: S5PC100: Add SPI clkdev support
>   ARM: S5P64X0: Add SPI clkdev support
>   ARM: S5PV210: Add SPI clkdev support
> 
>  arch/arm/mach-s3c64xx/clock.c         |   80 +++++++++++++--------
>  arch/arm/mach-s5p64x0/clock-s5p6440.c |   61 ++++++++---------
>  arch/arm/mach-s5p64x0/clock-s5p6450.c |   49 ++++++++-----
>  arch/arm/mach-s5pc100/clock.c         |  124
+++++++++++++++++++----------
> ----
>  arch/arm/mach-s5pv210/clock.c         |   50 ++++++++-----
>  5 files changed, 210 insertions(+), 154 deletions(-)

Applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

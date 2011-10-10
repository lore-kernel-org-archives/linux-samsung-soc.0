From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3 0/4]: ARM: SAMSUNG: Add SPI clkdev support
Date: Mon, 10 Oct 2011 18:42:52 +0900
Message-ID: <039c01cc8730$fb130750$f13915f0$%kim@samsung.com>
References: <1318233789-19882-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21767 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753097Ab1JJJmx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 05:42:53 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSU0043TGB31VV0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 18:42:52 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSU002K2GBGNH90@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 18:42:52 +0900 (KST)
In-reply-to: <1318233789-19882-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk

Padmavathi Venna wrote:
> 
> This patchset modifies the existing clkdev to make SPI driver
> independent of the clock names send from platform data. This
> patches enables the SPI driver to request SPI bus clocks
> using generic connection ID.
> 
> V1 patch series are:
> 	http://www.spinics.net/lists/arm-kernel/msg141671.html
> 
> Changes since V1:
> 	-Add newly introduced CLKDEV_INIT macro for creating clk_lookup
> 	structure as suggested by Russell King
> 	V2 patches series are:
> 	http://www.spinics.net/lists/arm-kernel/msg142733.html
> 
> Changes since V2:
> 	-Reworked the patches as per the following link. Patch series in
> 	the following link removed & and , from the macro declaration and
added
> 	in the macro defination.
> 	http://www.spinics.net/lists/arm-kernel/msg143663.html
> 
> Padmavathi Venna (4):
>   ARM: S3C64XX: Add SPI clkdev support
>   ARM: S5PC100: Add SPI clkdev support
>   ARM: S5P64X0: Add SPI clkdev support
>   ARM: S5PV210: Add SPI clkdev support
> 
>  arch/arm/mach-s3c64xx/clock.c         |   98 ++++++++++++++++--------
>  arch/arm/mach-s5p64x0/clock-s5p6440.c |   57 +++++++++-----
>  arch/arm/mach-s5p64x0/clock-s5p6450.c |   57 +++++++++-----
>  arch/arm/mach-s5pc100/clock.c         |  132 ++++++++++++++++++++--------
> -----
>  arch/arm/mach-s5pv210/clock.c         |   58 ++++++++++-----
>  5 files changed, 259 insertions(+), 143 deletions(-)
> 
> --
> 1.7.4.4
Looks ok but this needs 'CLKDEV_INIT' patch. Please wait until it can be
sent to upstream for this patch.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

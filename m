From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Mark most Cragganmore initdata devinitdata
Date: Thu, 19 Jul 2012 15:48:06 +0900
Message-ID: <184601cd657a$73c1f940$5b45ebc0$%kim@samsung.com>
References: <1341245579-29007-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9724 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751717Ab2GSGsI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 02:48:08 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7E00LVWAW711P0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jul 2012 15:48:07 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7E00LZLAW7LTA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jul 2012 15:48:07 +0900 (KST)
In-reply-to: <1341245579-29007-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: patches@opensource.wolfsonmicro.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Mark Brown wrote:
> 
> With the greater use of deferred probes we need to be more sure that
> initdata is actually used only at system init rather than being used
> by devices when they probe (which could happen after the main kernel
> init has completed and is much more likely to now).
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/mach-crag6410.c |   68
++++++++++++++++-------------
> ----
>  1 file changed, 34 insertions(+), 34 deletions(-)
> 
[...]

Looks OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

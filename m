From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] Add audio platform device to S5PV210 and Exynos4 boards
Date: Thu, 12 Jul 2012 18:11:17 +0900
Message-ID: <0faf01cd600e$4b56f0d0$e204d270$%kim@samsung.com>
References: <1341478918-6602-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29172 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933483Ab2GLJLS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:11:18 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7100G3VITEUSW0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:11:17 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M71004CCIUTPI40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:11:17 +0900 (KST)
In-reply-to: <1341478918-6602-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, patches@linaro.org

Sachin Kamat wrote:
> 
> The following patch added snd_soc_register_card() functionality
> instead of creating a "soc-audio" platform device in smdk_wm8994.c file.
> 
> http://www.spinics.net/lists/linux-samsung-soc/msg11232.html
> 
> After using snd_soc_register_card(), the sound card is registered as a
> platform driver and it needs related platform device entry in machine
file.
> 
> Thus this patch series is dependent on the above patch.
> This series is based on Kukjin Kim's for-next branch.
> 
> Sachin Kamat (3):
>   ARM: EXYNOS: Add audio platform device in SMDKV310 board
>   ARM: S5PV210: Add audio platform device in Aquila board
>   ARM: S5PV210: Add audio platform device in Goni board
> 
>  arch/arm/mach-exynos/mach-smdkv310.c |    7 +++++++
>  arch/arm/mach-s5pv210/mach-aquila.c  |    7 +++++++
>  arch/arm/mach-s5pv210/mach-goni.c    |    7 +++++++
>  3 files changed, 21 insertions(+), 0 deletions(-)
> 
> --
> 1.7.4.1

Looks ok, applied with Sangbeom's ack.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

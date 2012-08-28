From: Sangsu Park <sangsu4u.park@samsung.com>
Subject: [RESUBMIT PATCH] ASoC: SAMSUNG: Change Kconfig to support all SAMSUNG
 ASoC
Date: Tue, 28 Aug 2012 17:55:49 +0900
Message-ID: <003301cd84fa$eb8a6b20$c29f4160$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39348 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751640Ab2H1Izu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 04:55:50 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9G00I2WJH1Q960@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Aug 2012 17:55:49 +0900 (KST)
Received: from DOSANGSU4UP02 ([12.23.118.226])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9G004K3JH1V930@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Aug 2012 17:55:49 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lrg@ti.com, sbkim73@samsung.com, ben-linux@fluff.org

All SAMSUNG ASoC needs SND_SOC_SAMSUNG configuration.
This patch change Kconfig to support all SAMSUNG ASoC.

Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
---
 sound/soc/samsung/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index f17dd25..e7b8317 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -1,6 +1,6 @@
 config SND_SOC_SAMSUNG
 	tristate "ASoC support for Samsung"
-	depends on ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_S5P64X0 || ARCH_EXYNOS4
+	depends on PLAT_SAMSUNG
 	select S3C64XX_DMA if ARCH_S3C64XX
 	select S3C2410_DMA if ARCH_S3C24XX
 	help
-- 
1.7.1

On 08/28/12 8:00, Kukjin Kim wrote:
> On 08/27/12 11:08, Mark Brown wrote:
> > On Mon, Aug 27, 2012 at 11:06:47AM -0700, Kukjin Kim wrote:
> >
> >> Hmm, all of Samsung stuff is available...so how about?
> >>
> >> +	depends on PLAT_SAMSUNG
> >
> > Yes, that's a very good idea!
> 
> Mark, thanks.
> 
> Sangsu, could you please re-submit as per my suggestion?
> 
> Thanks.
> 

Kukjin, thanks. 
This is re-submit patch. In fact, I'd wanted to submit your idea :)
Thanks.

> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer, SW Solution Development Team, Samsung
> Electronics Co., Ltd.

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 00/17] ARM: S5P64X0, S5PC100: no more support in mainline
Date: Tue, 01 Jul 2014 06:32:10 +0900
Message-ID: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62589 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752526AbaF3NTH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:19:07 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Z00D5BGZTWS90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Jun 2014 22:19:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This series removes S5P64X0 and S5PC100 related codes in mainline,
because no more user now. And if its supporting is required later,
it will be done with using device tree.

[PATCH 01/17] ARM: S5P64X0: no more support S5P6440 and S5P6450 SoCs
[PATCH 02/17] gpio: samsung: remove s5p64x0 related gpio codes
[PATCH 03/17] spi: s3c64xx: remove s5p64x0 related spi codes
[PATCH 04/17] ASoC: samsung: no more support for S5P6440 and S5P6450
[PATCH 05/17] pwm: samsung: remove s5p64x0 related pwm codes
[PATCH 06/17] video: fbdev: s3c-fb: remove s5p64x0 related fimd
[PATCH 07/17] serial: samsung: no more support for S5P6440 and
[PATCH 08/17] ARM: S5PC100: no more support S5PC100 SoC
[PATCH 09/17] gpio: samsung: remov s5pc100 related gpio codes
[PATCH 10/17] spi: s3c64xx: remove s5pc100 related spi codes
[PATCH 11/17] pwm: samsung: remove s5pc100 related pwm codes
[PATCH 12/17] serial: samsung: no more support for S5PC100 SoC
[PATCH 13/17] ata: pata_samsung_cf: removes s5pc100 related ata
[PATCH 14/17] mtd: onenand: remove s5pc100 related onenand codes
[PATCH 15/17] video: fbdev: s3c-fb: remove s5pc100 related fimd and
[PATCH 16/17] [media] exynos4-is: removes s5pc100 related fimc codes
[PATCH 17/17] ASoC: Samsung: remove s5pc100 related codes

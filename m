From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/3] i2c: exynos5: bus recovery implementation
Date: Thu, 30 Nov 2017 15:30:04 +0100
Message-ID: <20171130143007.30258-1-a.hajda@samsung.com>
References: <CGME20171130143017eucas1p172b94622814eff172a27176c82f6e6fe@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36133 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751288AbdK3OaV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 09:30:21 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Andi Shyti <andi.shyti@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS
        ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Hi,

This patchset adds bus recovery functionality to Exynos HSI2C, it is used in
case of transmission timeouts.
Internal tests shows that it significantly improves I2C transmissions.

Andi, could you take a look at it/test, feedback welcome.

Later, I will post also patches to MHL chip which uses this functionality.
MHL chip has known bug of being in incorrect state after hard reset,
I2C bus recovery cures it.

Regards
Andrzej


Andrzej Hajda (3):
  i2c: exynos5: change internal transmission timeout to 100ms
  i2c: exynos5: implement bus recovery functionality
  i2c: exynos5: do not check TRANS_STATUS in case of Exynos7 variant

 drivers/i2c/busses/i2c-exynos5.c | 52 +++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 8 deletions(-)

-- 
2.15.0

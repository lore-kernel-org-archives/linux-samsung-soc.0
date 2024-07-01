Received: from cmccmta2.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F213512FF6E;
	Mon,  1 Jul 2024 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719833133; cv=none; b=eOeI+iuNf2BNrQPTkX+Y9TanzSgIpD7OHaBJYHKxFlEF5c9FArBozC9GOzEsYOsM7x2r1HaAcQE2Sw3wjU9iMF8SKHd7d2fDeTZBk0rSd79HRVyBE8bV8uy6AstonFdpfY/zBQag0/UZpDtp1TBHWPe2UUNSl9G6N+V+GVPHXO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719833133; c=relaxed/simple;
	bh=GWrW1oQPTdiRxF/D78u75slQVuk180CrQTKkCjUdOuE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f3nzAdq2PKVAoiQpbJk0bMziTin8wso8esju6Tps3Nm84IMYOQoSJhz2RwGoPe6aKT+M/KaJadeo6ipmbCdmsg7hegdlk37ieVK2QUT9NCfM33is9zi+FtoGRrDSEAsY45JekjYrgXgS79r0mN5kjmT7XhjYC7zF0eeS5KR6eDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66682921b3b3-aec6d;
	Mon, 01 Jul 2024 19:25:19 +0800 (CST)
X-RM-TRANSID:2ee66682921b3b3-aec6d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain.localdomain (unknown[10.54.5.252])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56682921ea41-69f87;
	Mon, 01 Jul 2024 19:25:19 +0800 (CST)
X-RM-TRANSID:2ee56682921ea41-69f87
From: Liu Jing <liujing@cmss.chinamobile.com>
To: s.nawrocki@samsung.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] phy: Fix the cacography in phy-exynos5250-usb2.c
Date: Mon,  1 Jul 2024 19:25:17 +0800
Message-Id: <20240701112517.6597-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The word 'swtich' is wrong, so fix it.

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
 drivers/phy/samsung/phy-exynos5250-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos5250-usb2.c b/drivers/phy/samsung/phy-exynos5250-usb2.c
index e198010e1bfd..21b06072f866 100644
--- a/drivers/phy/samsung/phy-exynos5250-usb2.c
+++ b/drivers/phy/samsung/phy-exynos5250-usb2.c
@@ -121,7 +121,7 @@
 #define EXYNOS_5420_USB_ISOL_HOST_OFFSET	0x70C
 #define EXYNOS_5250_USB_ISOL_ENABLE		BIT(0)
 
-/* Mode swtich register */
+/* Mode switch register */
 #define EXYNOS_5250_MODE_SWITCH_OFFSET		0x230
 #define EXYNOS_5250_MODE_SWITCH_MASK		1
 #define EXYNOS_5250_MODE_SWITCH_DEVICE		0
-- 
2.33.0




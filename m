Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B28274FCD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344824; cv=none; b=NDol1NmMhC9pZiJG7KzYqkRl8pre/Jl02UuQWe6bCwNzpdat38y8O0XWOCT7y7lxXenbUWTva0I8Y27FS9m+HT31sstkTryf4N47YeJzRIdTymmRY94eWzPrCfOXTpU/qEB+Y5uGQUzBpEkEE1OnH79essavCm95ybW3/cOpH0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344824; c=relaxed/simple;
	bh=l1zppUoGsgYQuvWfeE9ZII+mvExfI8uZ5tf9ENz9M9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=pHzOUqJXJwfyNZmXUb3A/kDZ8rQKx359bSDql5Z0PmJAZTZH7Nlb4F5iOPiutLixcfVOr2WRZWTqjqlTiOqpNwwiVcc0v1tPxCk20vZrKsB3CwCCs9c/CKvdKq9W9luZcroE8TEHN3CnWiZZ3ojx3Nd1PMNlFjnX27NU/CWNObk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AXm13xJe; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AXm13xJe"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250724081339epoutp0356dacdb51f891ec42148d81aba648c5c~VIdLHuj4v0030000300epoutp03-
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 08:13:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250724081339epoutp0356dacdb51f891ec42148d81aba648c5c~VIdLHuj4v0030000300epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753344819;
	bh=iF7XGLKPcudkWLwpYz/z12ZVFINWFvDEkKGpP/Zh/5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AXm13xJeTCW/AiCRFHqspPSGPJO+CCfEUCo8UX/K8dEy1wuTnM0v4YDZhW6GTiU8Y
	 0gXBlCxq2Zt6ZJwrxp1TZpZqqb2oZ8IoqfZ+wPS1hs1NdQCIBOvYHzaRtxyze2B1wN
	 GEN0azR/OXydwJt/PIntC0jc3KTAww4fHyYFN0U0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250724081338epcas2p1c5b87ad2c7f81672871aa73c3c54b2b9~VIdKS6ZcI2457124571epcas2p1V;
	Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bnkKY41TSz2SSKX; Thu, 24 Jul
	2025 08:13:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epcas2p31c2e3cbed1d3a7bf30a9fb664e6cb92b~VIdJDvoPV0904009040epcas2p3O;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epsmtip1409ff895c9cab7adc3f5a208f246cd16~VIdI95Fg-2042020420epsmtip1S;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, khwan.seo@samsung.com,
	dongil01.park@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v4 1/4] watchdog: s3c2410_wdt: Replace hardcoded values with
 macro definitions
Date: Thu, 24 Jul 2025 17:08:51 +0900
Message-Id: <20250724080854.3866566-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250724080854.3866566-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250724081336epcas2p31c2e3cbed1d3a7bf30a9fb664e6cb92b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081336epcas2p31c2e3cbed1d3a7bf30a9fb664e6cb92b
References: <20250724080854.3866566-1-sw617.shin@samsung.com>
	<CGME20250724081336epcas2p31c2e3cbed1d3a7bf30a9fb664e6cb92b@epcas2p3.samsung.com>

Modify the code to utilize macro-defined values instead of hardcoded
values. The value 0x100 in the s3c2410wdt_set_heartbeat function represents
S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
difficult to understand and reducing code readability.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 40901bdac426..95f7207e390a 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -587,7 +587,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	if (count >= 0x10000) {
 		divisor = DIV_ROUND_UP(count, 0xffff);
 
-		if (divisor > 0x100) {
+		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
 			return -EINVAL;
 		}
-- 
2.25.1


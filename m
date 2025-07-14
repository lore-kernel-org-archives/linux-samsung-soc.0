Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5277920F087
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2025 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752472744; cv=none; b=HLvez3ePezaXjqJ2nNt3o20f5LNgTF0ffaxWhYlcuCC5rgYa7eTyqFAO+ykBrSAO2uRT5l0m+5oOuR5A1yQlL07eriIzeI3CdoDo6TC05zfZx5SPKLvCoXY0geFbIpcjllbkS58s4U5TcwnLxsL+fAJFhnuPAVBkXzngLcwCTjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752472744; c=relaxed/simple;
	bh=eA8fW0D4S9/fahe/LSdY6vP0wbZlz0Lx4LhA/cw+8XM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=rVxSqSJ0FANloy8MAhwU/NqSxLYutLeU9S8CN59cF3BRhtg+jZAGeXhy06XTmi5ZAVG3B7/7JQRGf2oi0Eqw7G2zWj30kbiNHq6RQULyxOkqdQavPm0BfMvoB0c5LTnjq9v9Mt811xNbHKo18zP8p8tBLJKDRLXo3bppGCrmiP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qvSnWaCw; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qvSnWaCw"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250714055855epoutp02ea5c59e413a06e08865827be91762620~SCKrsxjk61586915869epoutp02Y
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2025 05:58:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250714055855epoutp02ea5c59e413a06e08865827be91762620~SCKrsxjk61586915869epoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472735;
	bh=DEE4uWjAAvqGbGNHuZIiAusKYEx36zda62ZjOAcwkGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qvSnWaCw4mtPSN1I6zh82H/gfllGlf5eEwLhF0c+cOoi6vfsVoOK56aSD5oCz3k8W
	 4TsXspk5i4zMey6rYOd4oZ3FJo4Hl+QbLUoSB0N+Apq5BbJOHXU3vUv0K+KkPurNSC
	 /P3sx2C7Y/UxgC4JLYCAfmU1L9C1mlWHDC7Ah4Ds=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250714055854epcas2p2e7f656b05ffb32038de95175d9c4017f~SCKrQ0r0m1945019450epcas2p27;
	Mon, 14 Jul 2025 05:58:54 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bgWpk1994z6B9mH; Mon, 14 Jul
	2025 05:58:54 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9~SCKqPDzbx1936819368epcas2p1H;
	Mon, 14 Jul 2025 05:58:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055853epsmtip19fb52d10a7006a5d55c0744d4b862c49~SCKqJ1vbW0366003660epsmtip1M;
	Mon, 14 Jul 2025 05:58:53 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 1/5] watchdog: s3c2410_wdt: Replace hardcoded
 values with macro definitions
Date: Mon, 14 Jul 2025 14:54:36 +0900
Message-Id: <20250714055440.3138135-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714055440.3138135-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9@epcas2p1.samsung.com>

Modify the code to utilize macro-defined values instead of hardcoded
values. The value 0x100 in the s3c2410wdt_set_heartbeat function represents
S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
difficult to understand and reducing code readability.

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


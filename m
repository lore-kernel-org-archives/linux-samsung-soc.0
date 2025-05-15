Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED1428643D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296194; cv=none; b=rL6XZTv5lXPlM9lorQgCT8oqXrPUv6tUAAUcQOs1jmCW4ZqXETtRZEDL7Wallpkcd9I3qT8ilG+R/dyYeR3PgqTu7FhbWtGW5Y7C9rUNjBweIXWYCgSE4N9+pLVdl9LQy+h3pMlyqAYSMoO6Q6HnIKhPPjnRX/CuqMURBT0UrXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296194; c=relaxed/simple;
	bh=1lEyv2C31kOucrORJbfvZ1JMD4KJHOoFDzImrxOR6ck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=qlEs/JGqVCCUewLvRdvkWmVSoL5IViD+hVXZLYuWYaj0vZjUlysaKzy22LXmTFVSCJtkoRFQ0XIcWpkgYjmyAD1/gpyuCUuPiiluzJ2KSTjT4aiI64h1rYVGlE3qFETbo/XOhcc8ZJjglGZJXq0cIVYANkBO2/srbX0XwXAfGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gakzh3y5; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gakzh3y5"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250515080309epoutp018d453822b31ef95292d9b2a06a47e72e~-pKCJjsfE0980109801epoutp01M
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 08:03:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250515080309epoutp018d453822b31ef95292d9b2a06a47e72e~-pKCJjsfE0980109801epoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747296189;
	bh=kI99l7mtGn0iNk2KRSiHV06bFYTxVJP1UnDWIzaZPlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gakzh3y5xGISBmh2amH1f6Pto/3sNmtZooOvr4RUsW0xcrp2Xf7gVPvxsu6yALsH8
	 0tOXaEGA3faxQDPMR0nzwW47xySRz3iMs/dEYtIMvI8QV0iZs4RyiQu+Ck07BytF7h
	 J/Nkg0+SWQoeXHZPdtx94nynsBDli4nOLD+HNuks=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250515080307epcas2p3fb15f30d7cfc984881505e4768f9aeba~-pKAWgJmN2780027800epcas2p3O;
	Thu, 15 May 2025 08:03:07 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.68]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZyjPl45wkz3hhTB; Thu, 15 May
	2025 08:03:07 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080307epcas2p2898fb938ccf5c9a43d3f58098982dbdd~-pJ-h66rY1485714857epcas2p2O;
	Thu, 15 May 2025 08:03:07 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250515080307epsmtrp1049858c66d76c4b541895c4a7062b8f2~-pJ-hIC8h2250622506epsmtrp1-;
	Thu, 15 May 2025 08:03:07 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-fc-68259fba9856
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	3C.77.19478.ABF95286; Thu, 15 May 2025 17:03:06 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080306epsmtip20d5991e9a7419b91a6608246d0dfef9d~-pJ-T4uaV1291312913epsmtip2v;
	Thu, 15 May 2025 08:03:06 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Thu, 15 May 2025 16:53:47 +0900
Message-Id: <20250515075350.3368635-3-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515075350.3368635-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSvO6u+aoZBt27rCwezNvGZnH+/AZ2
	i02Pr7FaXN41h81ixvl9TBY31u1jt3iy8AyTxYzFJ9ksHr/8x+zA6bFpVSebx8o1a1g9Ni+p
	99j5vYHdo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0SuDK27O9jL/jJWbH30l+2BsbNHF2MnBwS
	AiYS/fvfs3cxcnEICWxnlDg+4wtLFyMHUEJK4t0zS4gaYYn7LUdYIWo+MEqsONDICpJgE9CR
	mP7vNguILSIQJ3GsfTMzSBGzwE5GiZbpv5lBEsICYRK3Lq8As1kEVCWW7ZsM1sArYCux88FF
	dogN8hIzL30HszkF7CQmXtzFCGILAdUc3vOEDaJeUOLkzCdgvcxA9c1bZzNPYBSYhSQ1C0lq
	ASPTKkbR1ILi3PTc5AJDveLE3OLSvHS95PzcTYzgUNcK2sG4bP1fvUOMTByMhxglOJiVRHiv
	ZylnCPGmJFZWpRblxxeV5qQWH2KU5mBREudVzulMERJITyxJzU5NLUgtgskycXBKNTDNK62y
	DjtnEva3/WXNsnsbit6uSXE5I+zxKMJnfvWNsJLe/Q/C8uuEpbakbptbyL28yPq1zmn9qMgX
	AjcFrnzXaJdfeerdzqMM5Y9TX4bycSezqfQs8VeM4THyCdv9KdDrWcwvj8jZS1XibB/OzPdg
	yPx+asW6XQvE5P+sv1+zrbNA5+mZogYRQYHwd5f2LJ5fGi8Vodcy2fb+cplt6yo2ZbEu++ls
	ekaogKVdwn5vvG5LOueG6b2bCh49Xzf3TnfGqm3istfiQowO7NZjnhq/vkROMEC+6S7PDIUz
	m5Y+3Z0Ta9Z7xe3U5YcPPGRvOH4xiujxPez/qy74pnhLWH5H46Ka3bXR71d/P1Vs1K7EUpyR
	aKjFXFScCABlPnLY5AIAAA==
X-CMS-MailID: 20250515080307epcas2p2898fb938ccf5c9a43d3f58098982dbdd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250515080307epcas2p2898fb938ccf5c9a43d3f58098982dbdd
References: <20250515075350.3368635-1-sw617.shin@samsung.com>
	<CGME20250515080307epcas2p2898fb938ccf5c9a43d3f58098982dbdd@epcas2p2.samsung.com>

Fix the issue of max_timeout being calculated larger than actual value.
The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
S3C2410_WTCON_MAXDIV is smaller than the actual value because the remainder
is discarded during the calculation process. This leads to a larger
calculated value for max_timeout compared to the actual settable value.
A ceiling operation is applied in the calculation process to resolve this.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 228f86d83663..c6166d927155 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -379,8 +379,8 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 
-	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
-				       / S3C2410_WTCON_MAXDIV);
+	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
+		(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
 }
 
 static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
-- 
2.40.1


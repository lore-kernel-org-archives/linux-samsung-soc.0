Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C925DD0F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216426; cv=none; b=GX8cPkQhS9kDHLdvmX0wImSbhe/5SwOW3oG2CYvqWPwYuVtpr4G/nm4Kr9v0OnCO2h7QAuwdaKT+A8OoPLD7YWZy2eGcJ2g2qFFn9Qa7t6BMeLZmCtZpeGH8AX3tA0kvLsALiB3Eo28021FLlDS7fsXXv1nxq56ScQk7LyvAmAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216426; c=relaxed/simple;
	bh=IyXTrHkH71Jaj6qRL7zMPPW/Tqq1aNW/n4YHk6qZxmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=mU8QjU6KgQZHtQ+uNxjGRtBE7DgLlCVatZnY0ULF6Fw2fQUpZTZeWOFvH5sqf79pI1jw3EppB1iUvAfqmPqnV/NcP0VwuKpudChbCfmXmNr+hJNlMWbMvIgbvCWBeyCuSIl5dcIIqimVz5rF2jGt73X9zVsMjxTItVi2/2SHrYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VX06KiTs; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VX06KiTs"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250514095337epoutp03a56c7486f332a2870a638323dbe125f0~-XBMMzCk51458014580epoutp03C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 09:53:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250514095337epoutp03a56c7486f332a2870a638323dbe125f0~-XBMMzCk51458014580epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747216417;
	bh=JVyto71w61vrp7yw23DVq8t5lbwhvGzxNZd2g0nOgRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VX06KiTs8bC5wpUDjqhVIG7sLoo03yCicEfpzWr5lqnDW2wUhBZa26DHDT0b4aASo
	 3rrXLyjCjqyQfzK9uMFvIuAl/wrza0heSAJswBlVy4IIIUl8ZguMAM59LLQIA9iJ0a
	 O+eIXtn747YPbylQ+/Q+uDa2YqciFGUK4u6WfhWE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250514095336epcas2p4f5bbf7c6386516c792c82a0073c306e9~-XBLuGcfg0187001870epcas2p4Q;
	Wed, 14 May 2025 09:53:36 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.97]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zy7vh1ZMsz3hhT7; Wed, 14 May
	2025 09:53:36 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095335epcas2p139710b146aaf4709a0a7aafcabe2f7c7~-XBKib47P3022730227epcas2p1I;
	Wed, 14 May 2025 09:53:35 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095335epsmtrp14926ba4f054b27b3fb411a1af425d0b4~-XBKetToL1996119961epsmtrp1P;
	Wed, 14 May 2025 09:53:35 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-ce-6824681f3306
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	68.55.19478.F1864286; Wed, 14 May 2025 18:53:35 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095335epsmtip18ba7a072d9f13ba0d6fb49eff0a3815c~-XBKNbQAH0078100781epsmtip1z;
	Wed, 14 May 2025 09:53:35 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH v2 1/5] watchdog: s3c2410_wdt: Replace hardcoded values with
 macro definitions
Date: Wed, 14 May 2025 18:42:16 +0900
Message-Id: <20250514094220.1561378-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250514094220.1561378-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSnK58hkqGwd9LIhYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZXQsbmEt+MZecfrmDsYGxsts
	XYycHBICJhJPLn9nB7GFBLYzSnw55dXFyAEUl5J498wSokRY4n7LEdYuRi6gkg+MEkdO/wDr
	ZRPQkZj+7zYLiC0iECdxrH0zM0gRs8AjRokr83qYQBLCQInpd44wg9gsAqoSW44tAmvmFbCV
	uLl6HgvEBnmJmZcgjuAUsJOY29LKBnKEEFBN03YPiHJBiZMzn4CVMwOVN2+dzTyBUWAWktQs
	JKkFjEyrGEVTC4pz03OTCwz1ihNzi0vz0vWS83M3MYIDXitoB+Oy9X/1DjEycTAeYpTgYFYS
	4b2epZwhxJuSWFmVWpQfX1Sak1p8iFGag0VJnFc5pzNFSCA9sSQ1OzW1ILUIJsvEwSnVwCR0
	33/vFJ7HE/wVzpqW8t0zKIv24056ru+1MHfvJ48HmxP4C67t6D/8SDzleUbVFcaWUIv3t89t
	nJYXc9K22ND+2tLrEw9UvPWK/75lzaTbx7qX/MxavlC2olXN72jTyu7d1/YmeAq/PXYg6+7Z
	+OfnXZaoTW/nbZzNIqBkqr/6glXubVnzwtlBy0WYffbN9alaMyMv6o+k4FqBaWnvgs+48/Wb
	ZCw0ODgrV+P0doUjm66smalhnhn7uTBE6g57S0L8qxctAuqL/KPmHGNcaLHLVMi/ZWpaiOeF
	r8XG5juiJjcf47Svupay1HxOY/oN1d5jv+4++5z9TaX05IKezNSrOwPU5u2cbMc0eWlh/Dcl
	luKMREMt5qLiRAC9p4jL5wIAAA==
X-CMS-MailID: 20250514095335epcas2p139710b146aaf4709a0a7aafcabe2f7c7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095335epcas2p139710b146aaf4709a0a7aafcabe2f7c7
References: <20250514094220.1561378-1-sw617.shin@samsung.com>
	<CGME20250514095335epcas2p139710b146aaf4709a0a7aafcabe2f7c7@epcas2p1.samsung.com>

Modify the code to utilize macro-defined values instead of hardcoded
values. The value 0x100 in the s3c2410wdt_set_heartbeat function represents
S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
difficult to understand and reducing code readability.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index bdd81d8074b2..228f86d83663 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -555,7 +555,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	if (count >= 0x10000) {
 		divisor = DIV_ROUND_UP(count, 0xffff);
 
-		if (divisor > 0x100) {
+		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
 			return -EINVAL;
 		}
-- 
2.40.1


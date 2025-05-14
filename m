Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BE125DD11
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216427; cv=none; b=JnTdviyaXv8RHhtLrw+RE0imp3kguEqsihBnGulBgBC/qg5Vvt9qRbnPEtmipi1eNHvVwbTYRbS74Mbkcg07B4IyNTRQWXX+CSY1PsyRZE+BiIAGMgP2/vL7cgnZzsk9v2pwtre5WR5k5YkI1b59+6/S5/z1cz9cXH0FF0i+3Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216427; c=relaxed/simple;
	bh=Ursjan50Qcf7QoJQKjSZMoQdbTh05KFYWyeXrspZMNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=pxj1bNpMMJ721fGEqJjGqUIWHfwYxTGCkSbXwlZCMCpy+2vot8ugZYDAw6R2X3ZnMqMSZBcTy9WbqvJiMu/3rXqqg5uzA9aaa8FGGgHQ9fbmMVmF+XF0VR2VQYaGER1jH+/dVpex4AKg42D1c7UwK+WeKR3Ve0yxf3uYAjLabPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=j+UPB3sa; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="j+UPB3sa"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250514095342epoutp0156196f7c5ead252a90ee6ef1fba4d010~-XBRUqWGc1875718757epoutp01P
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 09:53:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250514095342epoutp0156196f7c5ead252a90ee6ef1fba4d010~-XBRUqWGc1875718757epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747216422;
	bh=F9nR+4yjOvh1XbA9AsmONTB28VO11laEZY8Ec+hddHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j+UPB3saAahHjPu1LaWVZL6z3lnKcijMlonRVnlK7J5sW73Kf/jWNtTK0cyxsXBKP
	 KTxuqjusrBNz17XrqQ2FxoJutCX987ppQXGRl2AJloQfXlTL0PqlSTe2TZLFAC2OWF
	 EgoJB4C4N7yXCavavzKfPyoBufKxDuC6PYIi5Vn8=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250514095342epcas2p4e93a4c35b70d89577b32214afeef708d~-XBQ0Y1Mo0421404214epcas2p4E;
	Wed, 14 May 2025 09:53:42 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zy7vn67Dkz3hhT9; Wed, 14 May
	2025 09:53:41 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250514095341epcas2p4f4bb6da7fa61f19610e63ee605eea94c~-XBPyMg9h0421404214epcas2p4D;
	Wed, 14 May 2025 09:53:41 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095341epsmtrp16ccda6f6dbd6411a230b3289924ab0b0~-XBPxhGW-1996219962epsmtrp1R;
	Wed, 14 May 2025 09:53:41 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-15-68246824de58
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B8.C4.07818.42864286; Wed, 14 May 2025 18:53:41 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095340epsmtip1ab4469196d723c53a1b1d9ac55153c78~-XBPh6vsY3233232332epsmtip1Y;
	Wed, 14 May 2025 09:53:40 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH v2 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_MAXCNT
Date: Wed, 14 May 2025 18:42:19 +0900
Message-Id: <20250514094220.1561378-5-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250514094220.1561378-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRmVeSWpSXmKPExsWy7bCSnK5qhkqGwerFzBYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZTQuOste8IOzYurTa6wNjFs5
	uhg5OSQETCTuX1vC1MXIxSEksJtR4k/zU5YuRg6ghJTEu2eWEDXCEvdbjrCC2EICHxglLs6p
	B7HZBHQkpv+7zQJiiwjESRxr38wMModZ4BGjxJV5PUwgCWGBGInGCZfAbBYBVYmfn56wgdi8
	ArYSV6Z9ZYJYIC8x89J3dhCbU8BOYm5LKxvIDUJANU3bPSDKBSVOznwCtosZqLx562zmCYwC
	s5CkZiFJLWBkWsUomVpQnJuem2xYYJiXWq5XnJhbXJqXrpecn7uJERz4Who7GN99a9I/xMjE
	wXiIUYKDWUmE93qWcoYQb0piZVVqUX58UWlOavEhRmkOFiVx3pWGEelCAumJJanZqakFqUUw
	WSYOTqkGJudvG2cdMmZmdWpwPOP7mXWP7gNNgz+3p+kVzvnMu/8Z58PO+AJ7P4MEU6abGeZ6
	n87Ku+3s2KEurzhRUDJE1amslPul/4XyMONZqvLuLmIsaZuOtD01Z4kP+XPO55tmUdzbyV9e
	7996SuawlKrys1OT7dnW806zvK7iJiL8iG+P40mNBd9XFQnLq02+sia3SHTu67KX5UIh0uvm
	rFCqs6jpFvBf/EAvhSW5cP7EoIyLtkk3uR88OaD2elmspssX51xpZp95RVHVMrd7391278qy
	rNv5X8BWM8Pu5Jvtib/2uzyIlGteVyf8SsTXKrbIQav/lWBOS8v5+CnPVMQqPgsc6dro3WX+
	4NiiziAlluKMREMt5qLiRADbeOu/6wIAAA==
X-CMS-MailID: 20250514095341epcas2p4f4bb6da7fa61f19610e63ee605eea94c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095341epcas2p4f4bb6da7fa61f19610e63ee605eea94c
References: <20250514094220.1561378-1-sw617.shin@samsung.com>
	<CGME20250514095341epcas2p4f4bb6da7fa61f19610e63ee605eea94c@epcas2p4.samsung.com>

Enable QUIRK_HAS_32BIT_MAXCNT to ExynosAutov920 SoC which has 32-bit WTCNT.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 1c7299deec5d..3c12a3ae50f8 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -326,7 +326,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -339,7 +339,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
-- 
2.40.1


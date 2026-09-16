Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692924F30C2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561444; cv=none; b=hpAbLJoa6X9PeWZTITjSdd1p+kxQ2YX5hAyyIDsC60A5PHRQLHo9sF7I1Wo+/4ViGUe19YlxnZ14lFVpss/QIv9Lp7BNttDbq6Znm4iiIhxfdbiMsLbONY9Z94DwnLspwlORnXkTxKkNjhV2NXOpWk3EnG8GGDN9KQuIU7u2eJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561444; c=relaxed/simple;
	bh=gsiJC+8KYfKWnEm6drxojd2SA0aWwriaMc4BSfAPcEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=H0IoINFT1lKdyhcjfH1GvTzlr2SDaDoyNZO98XfidpJKT2cxWHOp7EkK5EY+lR7qZxpjnOWZ4lT1onYurHqe7k6X6udhsc+X6csG7xDPmxf9pCHXJVfCN6FqLKH1GAN6eWmQ8bX22XeudBqxdMECFuJ89SRmstOGd061d0FCwf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RUu6s6C1; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RUu6s6C1"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260916122359epoutp0215734943525f3ca58c7b896ef596221d~VzKXtKET62007920079epoutp02x
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 12:23:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260916122359epoutp0215734943525f3ca58c7b896ef596221d~VzKXtKET62007920079epoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789561440;
	bh=fKL6HImdTiqBULRthcBWF6Nv0t3+2obCrlxnJAI24Vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RUu6s6C1rO3r03Ron2UQrDWMzfW4zswX+fH56Yv6sXAlsj5s7250UDMScV2X0IZR6
	 V9fCYpdjJE2bYEgs7bJvWS+lqgXw8iPQ8wTTF2iybXq1EWtdFql7WukjqMr4n3HNV7
	 MsIOudhtDT7TsvWGaaOnCIIiW3InnsdVmv1wmBsk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260916122359epcas5p4d7652fb157b69e8523d96d7139a526d4~VzKXLNoit2123921239epcas5p47;
	Wed, 16 Sep 2026 12:23:59 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hlJ322qQlz3hhT8; Wed, 16 Sep
	2026 12:23:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883~VzKVr2h4q1679016790epcas5p32;
	Wed, 16 Sep 2026 12:23:57 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260916122354epsmtip23a7f3a74468b642496b307c223b4c8c2~VzKS51nxf2261622616epsmtip2_;
	Wed, 16 Sep 2026 12:23:54 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, mani@kernel.org, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v2 3/3] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Date: Wed, 16 Sep 2026 17:52:29 +0530
Message-Id: <20260916122229.2604003-4-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260916122229.2604003-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Add the "samsung,snps-dwc3" compatible string to dwc3-generic-plat so
the Exynos8855 USB3 DWC3 controller can probe through the generic DWC3
platform glue. While at it, alphabetically reorder the existing entries.

The "samsung,snps-dwc3" string is used as a generic fallback to support
any Exynos SoC that utilizes a flattened model instantiation. This
fallback allows multiple Exynos SoCs to be supported by the generic
platform driver simply by adding the fallback compatible to their
respective device tree nodes.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..10c1146564b7 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -232,10 +232,11 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
+	{ .compatible = "samsung,snps-dwc3", },
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
-	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
-	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
 	{ /* sentinel */ }
 };
-- 
2.17.1


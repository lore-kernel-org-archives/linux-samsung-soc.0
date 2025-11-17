Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E5230EF97
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763369511; cv=none; b=HIfl4FUEr7djxlLHRBvNnubiZgfLKQUPEVFfGP+VETx0YMbT9Sq4ZmGIVujQkQrIQ/RvGNvNTlzhzc0RL9vJARReXIiHt2ms2dHplbN1CdaXwWPoQwybquDrrGmxOTxyabGBicBF/p/rGEZSN3Jh6TveePli16+kCgdY+gINGaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763369511; c=relaxed/simple;
	bh=a1W6uBLXiqwbAFyl26ECJdV4ZF299y7Km7D7nhkQoxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=hPWlMjnVexbiNPpNnXvDzgwVMu8Gq1oueqqt2+sJNKUnv25zYZ5E8Axm4tDKf+M5AH+NbveEyJAZk3uhMHXd7iWnK6HEB4ER1WaWzSvdZ2QD+ohNYchYCvxkcx+WBSdJsp3iyiJKQLUhca9a3DU4OK8TKgca4ypyJwdMI6IGPqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=R6ro7SP/; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="R6ro7SP/"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251117085148epoutp028401c970aeb1195f1b733f02203f940c~4vzmWfYSU0811808118epoutp02i
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 08:51:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251117085148epoutp028401c970aeb1195f1b733f02203f940c~4vzmWfYSU0811808118epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763369508;
	bh=4Po68KLFilpwQWxw9CyNZz80qkVt9zVydR1HkDC6YYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R6ro7SP/uVIy08FCBGge7FFMpyYl/Q3JQ1Ss6cWaztVveaHPL2GUjcZGZfH/imkG3
	 N7Uyavx9ZaZAUyjJTGfYGnuFoBXazH8C0VzNF2j6/whXGgneslNo2iD+42HkaZS5HZ
	 jZoYanSI0Z4gY6tSsmqQME7+Yw0oVVsPddjnxpz0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251117085147epcas2p1ebcf36f3e432afff989618d27be2b9ed~4vzl7TCqP1904419044epcas2p1E;
	Mon, 17 Nov 2025 08:51:47 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.200]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4d91h31mlMz2SSKf; Mon, 17 Nov
	2025 08:51:47 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20251117085146epcas2p303931d9501af51f08639b17ab7cbe34b~4vzlDi_I40905809058epcas2p3V;
	Mon, 17 Nov 2025 08:51:46 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251117085146epsmtip1200bd454c4056f613a7b44c0d3c5cb85~4vzk8nAYQ0481504815epsmtip1N;
	Mon, 17 Nov 2025 08:51:46 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com, Sanghoon Bae <sh86.bae@samsung.com>
Subject: [PATCH 1/1] dt-bindings: soc: samsung: exynos-sysreg: add hsi0 for
 ExynosAutov920
Date: Mon, 17 Nov 2025 17:51:33 +0900
Message-ID: <20251117085134.289371-2-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251117085134.289371-1-sh86.bae@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251117085146epcas2p303931d9501af51f08639b17ab7cbe34b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117085146epcas2p303931d9501af51f08639b17ab7cbe34b
References: <20251117085134.289371-1-sh86.bae@samsung.com>
	<CGME20251117085146epcas2p303931d9501af51f08639b17ab7cbe34b@epcas2p3.samsung.com>

Add hsi0 compatible for ExynosAutov920 PCIe settings for:
- PCIe PHY power control
- PLL settings for PCIe
- PCIe device direction (RC/EP)

Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d27ed6c9d61e..a44fd24ed0ea 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,7 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynosautov920-hsi0-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
-- 
2.45.2


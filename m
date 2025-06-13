Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B758A27510B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798617; cv=none; b=uy0PVVyBNrMQWlwtLwBD9bBolb7UDTbJX7TvUjFYI1N/agjXPE+5v+CkxC0Arr49qz7OhRXKWY1zQFNPa67wQSBGTexCR4IfY/5rvCLdUbogr23ffv7whr95tx9ysB7gIYmLLZfiyWlxF20Caw08R0VYol2Ee+GvP8Xk16G+Xx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798617; c=relaxed/simple;
	bh=GTs5A9x4hDtLjVMDn3YvdSCTGpgbn6+4AsoDhD4ysr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=CrTH2QiN8MmO/mRy16+tryQcQJcKLyxCrH97wwjNGkN+dGWO5bJIZGJEK62LFIGdPZ+mIB/3OGkOST9D0QIttRVTROr6JkBtJ8Ph+ssi7eIryxzCPbQ0d28w87mePJ6g6WjP/uifZtUtbQUOllwjgUjWkMVlSSwYGbDMidQmh+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=C/UlYquD; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="C/UlYquD"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250613071012epoutp02060e784a5dea1c9f15097bb0c203b62a~IiJFQ1yGB0780007800epoutp02C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:10:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250613071012epoutp02060e784a5dea1c9f15097bb0c203b62a~IiJFQ1yGB0780007800epoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798612;
	bh=WT3+OA7xbIRPQyDTFFQo2fANnLJO9FZ0B+dE0jn8FdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C/UlYquDakeVKB2xeeNw1J+Lu1bLQgqNJf4pxX4Cy4et3mgGOmrGZqstAsuqcIR9E
	 O1cLGKxCTJtnD6P6yvjai0ppdn84kKzZBF9+g9yEax/Fg3ud0nylVESu/Vz1D9mlUJ
	 P1PWfkQp1ff00IKeBifjWIZ56jO27wCUVTIM44BE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250613071012epcas5p3afb22a58b1c9df45f359239ee34da87e~IiJEiwpSi0170401704epcas5p3f;
	Fri, 13 Jun 2025 07:10:12 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.178]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bJVsF75j8z2SSKj; Fri, 13 Jun
	2025 07:10:09 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250613055050epcas5p3f995a6696ccf4f7eeb0b5d76382f71f7~IhDxlUrs13253332533epcas5p3P;
	Fri, 13 Jun 2025 05:50:50 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055047epsmtip1f04e1592f84c83b804209cfdc697af15~IhDu36OMJ0400204002epsmtip1M;
	Fri, 13 Jun 2025 05:50:47 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v3 4/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo HS phy
Date: Fri, 13 Jun 2025 11:26:08 +0530
Message-Id: <20250613055613.866909-5-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055050epcas5p3f995a6696ccf4f7eeb0b5d76382f71f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055050epcas5p3f995a6696ccf4f7eeb0b5d76382f71f7
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055050epcas5p3f995a6696ccf4f7eeb0b5d76382f71f7@epcas5p3.samsung.com>

Add a dedicated compatible string for USB combo HS phy found in this
SoC. The devicetree node requires two clocks, named "phy" and "ref".

This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is added
to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
These two phys are combined to form a combo phy.

Add schema only for 'Add-on USB2.0' HS phy.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 71db17d93c6a..26660799e3ca 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -33,6 +33,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
   clocks:
@@ -218,6 +219,7 @@ allOf:
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
-- 
2.34.1


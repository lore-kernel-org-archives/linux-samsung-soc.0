Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DF225393B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798597; cv=none; b=GICumwY4AVIfSJ4ARICdsSql+f8TLqd5fuaUUDN+b5BE6RheFR67bJOgh6zFV3/rRr4ST6Uei8tqyQ/jaSFo9hGFobeHcIZMP8TqoudCqcs1fQ8ZJnZ6dq1ANv2t7x5zIcmkF0LCPYu/kXWDDC0vjsGNs1WPuhGSzWEtB/owyqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798597; c=relaxed/simple;
	bh=OF9C70Op6jeQApfN9bL+aJV/Iljt+9XeMuFFHl7sZAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=DNcO9dtNk21Gt+42dCcSYZ2F9ei7G3AvoXLhVyZyTaYzMiTpnCOP3sFGXbSmaBFAnbVSgB4FJy6kbKMMQY7Osbl41dUPFiDG4nDOv75w3ZlT4WwNLfVRCC/ntE5Pb93utTxGQ5Fx5X5+5zBKl2x20dDDchOesFip9N0Lzq4RYDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dVhGyv7E; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dVhGyv7E"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250613070952epoutp0403de6877bd5f5d79ed597cfda6146314~IiIyZH5Nr2221522215epoutp04M
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:09:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250613070952epoutp0403de6877bd5f5d79ed597cfda6146314~IiIyZH5Nr2221522215epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798592;
	bh=/BRy9T3GJRyRf9B/1o6vliSFsXzSoe+6lNyeT9l/lCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dVhGyv7E4bH4IcN/CvjW3XdsuoMJEplVpr43Z1rP/59ZIsI/O/UJhu+bTKVhTPglf
	 pzHyjQ5FyMOQKFM/p63MsEj0Xx9Lj7Y2cifpxxAP6J96ePq3VKU4UzQwPYhTBPy5w3
	 ZbI3hheVjlEohR+YmbcVibTum7s8rhgAi1P2GxeQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250613070951epcas5p1fdc2bff451059aec05b30db2383871db~IiIxZ79nR0357803578epcas5p1e;
	Fri, 13 Jun 2025 07:09:51 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.178]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bJVrs4Gtzz3hhTC; Fri, 13 Jun
	2025 07:09:49 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a~IhDouBZAM2143021430epcas5p3H;
	Fri, 13 Jun 2025 05:50:40 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055037epsmtip108ea6972ed6eff7d92b617765eca97a2~IhDlulA8s0439404394epsmtip1N;
	Fri, 13 Jun 2025 05:50:37 +0000 (GMT)
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
Subject: [PATCH v3 1/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Fri, 13 Jun 2025 11:26:05 +0530
Message-Id: <20250613055613.866909-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a@epcas5p3.samsung.com>

Add a dedicated compatible string for USB HS phy found in this SoC.
The devicetree node requires two clocks, named "phy" and "ref"
(same as clocks required by Exynos850).

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index cc60d2f6f70e..71db17d93c6a 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -33,6 +33,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-phy
 
   clocks:
     minItems: 1
@@ -217,6 +218,7 @@ allOf:
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
         clocks:
-- 
2.34.1


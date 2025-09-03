Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21022DCF6A
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884588; cv=none; b=FUbh5FSb98Pv2nXy2/QhQFnLzymf7X/MU26Y0uU8ztANOA/vlOexdWoniEup/O7DAvCIPPkiIBWIAh4vixtsQqbSqekdzHlBc7ec2y+3kxRU/dDatqt1oPGuPaFVXIqQ3YURxP2OZVj3nKiX3kwCYgHoC2mmcv4cxB8nYic4ruw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884588; c=relaxed/simple;
	bh=AccgHMjhdT5b8PhDHeBEe8SY7qfzk70Mw1MG6hqDEo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=YxEmbX++tg+/7uTdvIb/xq+w1NH6XstbqiCj+gqk98CesEQWUkdpAJuYKG0UZ233CsNkwZnoAFn7S9VQjsrGgMf8l+zEox6U2/2mJfvUwYkYnuLw9q6u7W8waFe8avJCzBP4O6J9p4zbUwESiA+3RKCeBdNmlv/LuzCM838vNhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=I0Dze26X; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="I0Dze26X"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250903072945epoutp04a7d262c58564c351d9f02fb3d6a86ebe~htTjGsn1m0137101371epoutp04a
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 07:29:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250903072945epoutp04a7d262c58564c351d9f02fb3d6a86ebe~htTjGsn1m0137101371epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756884585;
	bh=U8biUgrbmhqoy6ImwYHNZ85z7bDPbo86mIUx8VSMBxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I0Dze26XPryFpTCs+1wxaIKAifxm8NmL2jCygMKbFw/KQy7Jb0aOAMn+tUCc5tZV4
	 jV0o3ykGLexR+OA1rCpjMM8+ztOFPT16O0+jHX9PiCNYBwEx3Qz3aPTf+1Zu2Q0irj
	 f/smhA90zhg36xVn7nivtMqUC1KpQCYi9pgCz/ZI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250903072944epcas5p31eb60c88907761fda0defbcfa85ee83e~htTiY2_Cu2293822938epcas5p31;
	Wed,  3 Sep 2025 07:29:44 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cGvPz2T8Yz3hhTD; Wed,  3 Sep
	2025 07:29:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250903072942epcas5p2154a85b45152af50e2714248c38c5adc~htTg3bZdO1236712367epcas5p2g;
	Wed,  3 Sep 2025 07:29:42 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250903072939epsmtip2455dc285a7eb49093c51aabf1e508bac~htTeA3VNU2549225492epsmtip2G;
	Wed,  3 Sep 2025 07:29:39 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v8 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo hsphy
Date: Wed,  3 Sep 2025 13:08:24 +0530
Message-Id: <20250903073827.3015662-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903073827.3015662-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250903072942epcas5p2154a85b45152af50e2714248c38c5adc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072942epcas5p2154a85b45152af50e2714248c38c5adc
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072942epcas5p2154a85b45152af50e2714248c38c5adc@epcas5p2.samsung.com>

The USBDRD31 5nm controller consists of Synopsys USB2.0 femptophy and
USBSS combophy. Add-on USB20 femptophy is required to support USB20 data
rates along with USBSS phy. Document support for the USB2.0 femptophy
found on combophy of the this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 8d8114eb5660..4a8bcf63cd91 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
   clocks:
@@ -229,6 +230,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
@@ -252,6 +254,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       required:
-- 
2.34.1


Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05623273D66
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760079659; cv=none; b=fL46GRBMZcdefpJnvNMlfwntv92byVUemtMTA2F6PNMRRyW0tP7A27MocpJgeqFZq7LT6YV1fELg39XSQyDQH/PqELYJDMTsBTFOBxzJlbam6DZBoDqabalsYw1HD2VuAUukNWDmYqIMNVXcK/HJXxtq1mK8UFFmCWm3htlDANw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760079659; c=relaxed/simple;
	bh=LOm5YVXWKwI+w/w86Ro50CxqC0QIK6b2CCWMZJiH7Po=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=m1425JFvfHcW5XH/DvueXOi8mhFbedyOf0pH1HfPS2QeBQ5ce7xkP1mSg9DpgrQ2qwTFIptDqbxMZP1D6PVpFAl5gsDHC/jC6XfbQltwzdhmOHviwWwIqpvtQJ8bgCc45sxy1qsVBwPpJCoONsQQPY8o8jhG2F9cTswVka5KIA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZbOWmgWN; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZbOWmgWN"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251010070055epoutp0376125dfcaaa926018f9f0d0e90b35f7f~tDx8k9SvA1713217132epoutp03O
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:00:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251010070055epoutp0376125dfcaaa926018f9f0d0e90b35f7f~tDx8k9SvA1713217132epoutp03O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760079655;
	bh=CoEsBSUs3IlWDZJ+Mn282VTDP277IdfsFRG7aJRcQZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZbOWmgWN/1g8/oLz7kH9zxiz5MG16QSLoIO84r+jaSG2i8znps/RRP5JfGdgBvBdK
	 eBlKLqrdG3woAGbPZdtTodv+ZxpWTcTYVvDFeAvOxt83ZXsyL9Z+TgabHLToFM8ip3
	 a3WJj3p+BbVEcpKeQn6FjScWwcSLHigHeZdlvusY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251010070055epcas5p14dc15910e0de39afe49642b539cb8ada~tDx79Q84U2549825498epcas5p1J;
	Fri, 10 Oct 2025 07:00:55 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cjd1f1X6Gz6B9mG; Fri, 10 Oct
	2025 07:00:54 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251010070053epcas5p454e7414d50369bfe7e8e417b91bcbaef~tDx6lc11V1813618136epcas5p4O;
	Fri, 10 Oct 2025 07:00:53 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251010070047epsmtip25579faf740db3bf4aac812c5811f7d02~tDx1GVk120573805738epsmtip28;
	Fri, 10 Oct 2025 07:00:47 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	johan@kernel.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo hsphy
Date: Fri, 10 Oct 2025 12:39:09 +0530
Message-Id: <20251010070912.3758334-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010070912.3758334-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251010070053epcas5p454e7414d50369bfe7e8e417b91bcbaef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251010070053epcas5p454e7414d50369bfe7e8e417b91bcbaef
References: <20251010070912.3758334-1-pritam.sutar@samsung.com>
	<CGME20251010070053epcas5p454e7414d50369bfe7e8e417b91bcbaef@epcas5p4.samsung.com>

The USBDRD31 5nm controller consists of Synopsys USB2.0 femptophy and
USBSS combophy. Add-on USB20 femptophy is required to support USB20 data
rates along with USBSS phy. Document support for the USB2.0 femptophy
found on combophy of the this SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
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


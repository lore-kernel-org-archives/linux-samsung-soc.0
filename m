Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293A527586C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798633; cv=none; b=fctHysageVdNVFV4guAR8CmHmP44eYBYLJ4NV6rhGpo4yymeOFE9/mYAEcswFim8M1Pc0w74GA6gz2vee41BxhIU0+dCxS9cZm3DS+0dFbUYzIZ6+FiRYU9FkIKhCYw2uwz5tN7+nVSM+5bnkppKcUtQrwtpujix7q4yjOuADIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798633; c=relaxed/simple;
	bh=sNKtx6isdfqTQ7GdqiBNgNgQ++zH0Gt1vrjt7tJy00s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=GJGQy+xcaBeOY1GB/4i5f4EejQv/0eorWTbrghNeBeh0gvRIau8UsMylMzo5YMZXIzXtUFszHDXTrwFrTQrD8fQai+M4W6H897HFmosqgLEdtQKKPpm3R0UFrdr3CEbMVlvR4t3yO5d1ZVNrWf4jzuNyMq9sQa6xdTqZ86AneBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qu9WvxSB; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qu9WvxSB"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250613071029epoutp03494ce96b52257319822ec1fedb53b4aa~IiJUnSVlM2274422744epoutp03N
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:10:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250613071029epoutp03494ce96b52257319822ec1fedb53b4aa~IiJUnSVlM2274422744epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798629;
	bh=jIzgwrmtIZVgUQM7G/vlslTlX66wNwtzyffxYrtcguU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qu9WvxSBfx0NFlz/AEMMNUyNSCTRYALfrwQ5IWTIGNOKWUBck5/iShmkx3Umys38k
	 HpmBeeXMJFtDY4lMb/fI5Ixo1EGieuuC1QcTJH/oQD+/V+iGfz8D23iXDW/Y4SW+PP
	 T1dWuRfOLzhYPNb15NZSJvnUj7uxwpBzpc7hShrM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250613071025epcas5p4d69d7c0229ffbe35da7923ff45e3226a~IiJRXlt1z2402624026epcas5p4O;
	Fri, 13 Jun 2025 07:10:25 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.181]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bJVsW6yZyz6B9m5; Fri, 13 Jun
	2025 07:10:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250613055059epcas5p28b26f4ccb0f58e1bfb172e92f9903a08~IhD6fR3Kq1469914699epcas5p2N;
	Fri, 13 Jun 2025 05:50:59 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055056epsmtip1719e57bbf20b6d5bd9cead39b3a2f125~IhD3x2vw70398103981epsmtip1j;
	Fri, 13 Jun 2025 05:50:56 +0000 (GMT)
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
Subject: [PATCH v3 7/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo SS phy
Date: Fri, 13 Jun 2025 11:26:11 +0530
Message-Id: <20250613055613.866909-8-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055059epcas5p28b26f4ccb0f58e1bfb172e92f9903a08
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055059epcas5p28b26f4ccb0f58e1bfb172e92f9903a08
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055059epcas5p28b26f4ccb0f58e1bfb172e92f9903a08@epcas5p2.samsung.com>

Add a dedicated compatible string for USB combo phy found in this SoC.
The devicetree node requires two clocks, named "phy" and "ref".

This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is required
to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
These two phys are combined to form a combo phy.

Add schema only for 'USB3.1 SSP+' SS phy in this commit.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 26660799e3ca..5dd68c21c133 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -35,6 +35,7 @@ properties:
       - samsung,exynos850-usbdrd-phy
       - samsung,exynosautov920-usbdrd-hsphy
       - samsung,exynosautov920-usbdrd-phy
+      - samsung,exynosautov920-usb31drd-ssphy
 
   clocks:
     minItems: 1
@@ -221,6 +222,7 @@ allOf:
               - samsung,exynos850-usbdrd-phy
               - samsung,exynosautov920-usbdrd-hsphy
               - samsung,exynosautov920-usbdrd-phy
+              - samsung,exynosautov920-usb31drd-ssphy
     then:
       properties:
         clocks:
-- 
2.34.1


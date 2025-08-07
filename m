Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D821027603C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754563866; cv=none; b=tnkdeDpqn9duioVidkvyt7c8cjF6euFnka2GGIrsSGAIRDAkMFHOJRBWo1c995bulZhE2wH2hR6oFcMXgjih6xy+EatOurvEeKWUa3ecUoWUM4zNykIZ2zbZpPTEXYj7IIU1rW6o8A9VPRHrjoFu6ysUAGyt9IUcRb4G++APuJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754563866; c=relaxed/simple;
	bh=UI+Jpa61XS8xbFdTqQjvA5B3Hc10GwuDxlT/0gigxfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=T16HbBxocgYjL+EUre0sjkTbPe2RoyrP39rChBnk+/BTmX/hup2KB9ZgiGd2HLI5FO19f3qUeUmr+8/YlXKPbcSXKzcrvPOZXtJ/qQ2lPlB3tCZ7gkfl3EwZYHqYvqVfBKmNZE27W2jS/rkYraAuxU7EGpJwTUOFj2z3Xz1zMao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NCbLZAX0; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NCbLZAX0"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250807105102epoutp034b992ee0de8f8b48bc22f5a27e16166b~ZdomLs1Ut0650606506epoutp03L
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 10:51:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250807105102epoutp034b992ee0de8f8b48bc22f5a27e16166b~ZdomLs1Ut0650606506epoutp03L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754563863;
	bh=QeYmHJbAcraa4oR8NIDOEHzeZux8HN2nitX+I6qSl8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NCbLZAX0/lzisr7vUgBKHnBQkm1jbyUhnNIafxSOG++FckUkJdmBQXAcqeVjC2y7/
	 +HKB/lmXHMxeUEbtNrWWsTX6ZaAkT2e3GrpDxPQWlnxZc0KbYcn9wHHf+K4GuRTx6Z
	 nkuSIBRC51l031xnKQmOgX5b2LfSL6yj5SZpYnZs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250807105102epcas5p463e3d89457468fa2d83c4f67297f380f~Zdolm5Rmt0998009980epcas5p4D;
	Thu,  7 Aug 2025 10:51:02 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4byP8j2zZxz3hhT8; Thu,  7 Aug
	2025 10:51:01 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250807032511epcas5p118f9d82ef2f0dd7e433cc7f715a13d53~ZXjTsLkNB1726417264epcas5p1A;
	Thu,  7 Aug 2025 03:25:11 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032509epsmtip286e1609f87de49f575b61a1fceda495f~ZXjRu14Yb1700017000epsmtip2b;
	Thu,  7 Aug 2025 03:25:09 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 03/10] ARM: dts: samsung: exynos5250: Use SoC-specific
 compatible string for MFC
Date: Thu,  7 Aug 2025 08:54:42 +0530
Message-ID: <20250807032449.92770-4-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032511epcas5p118f9d82ef2f0dd7e433cc7f715a13d53
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032511epcas5p118f9d82ef2f0dd7e433cc7f715a13d53
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032511epcas5p118f9d82ef2f0dd7e433cc7f715a13d53@epcas5p1.samsung.com>

Modify the MFC device tree node to use a SoC-specific
compatible string instead of a generic one.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos5250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos5250.dtsi b/arch/arm/boot/dts/samsung/exynos5250.dtsi
index b9e7c4938818..c4d9a4a3f78d 100644
--- a/arch/arm/boot/dts/samsung/exynos5250.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250.dtsi
@@ -316,7 +316,7 @@ watchdog@101d0000 {
 		};
 
 		mfc: codec@11000000 {
-			compatible = "samsung,mfc-v6";
+			compatible = "samsung,exynos5250-mfc";
 			reg = <0x11000000 0x10000>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&pd_mfc>;
-- 
2.49.0


Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9554D1DF96F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 06:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752215789; cv=none; b=afJ6OPPzprwpqnuAP0Qdgf1AqjoYezOuR62/WPy8vzaz9yw5bfzkTnm5WRca+Ln6KqY0mXbimdQ8tCX5jZpTc8JcNSMh+8JxDBk1d6sqGv/h1xsz1BflokE7f8IAH4AkKxr4JysUgSX+nqgAHeVHinfN8LGlEauoJd5rPZqYFSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752215789; c=relaxed/simple;
	bh=OXGzAwofQUptjCd7Sayvo2QK+pSVtRlEPsxrP8p9prA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Tlrcoztrabccpm9ExSP/uC0cxI5Exfw3s4ojQnpCbythYxfXxVs3K8yfff9XtcOMKr/2CaWQ7kY1JlA2PodiYXRw/z+T2sOeKROeMEEKWFe2fRALjte4p+7PV5sgz+3PnSwDIUsKasFCZ9d0csRonD1gEs98qNNsyz/bIZSQnG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=MeRlB3yb; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MeRlB3yb"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250711063625epoutp02a446d2d1f21c9c3af5cc25e2bb3af7f2~RHvkzKf8F2074320743epoutp02H
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 06:36:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250711063625epoutp02a446d2d1f21c9c3af5cc25e2bb3af7f2~RHvkzKf8F2074320743epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752215785;
	bh=GFDyMbCkO2ZwbHpRqQKoKj9ZE4qcw7HW3UuqnlBlvfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MeRlB3yb1Bbfqs555VrbWIvza6o8vxQFUQTIuazCHXsZWUBilkMpFwATvqgZFCZPT
	 GvOMQbJHclpxJmjVNrBxfG2NgjO4k/1XM+XLPXugi6snOMB+nuE+4cdjPJK8gC/DsJ
	 +dJfY9JCD7ROK2t5HC9Cu+9yBHs/+wsCMfg8V2yw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250711063624epcas5p3398f1d9b43f4dd34f41b8367e7cc6607~RHvj82xRm0433604336epcas5p3-;
	Fri, 11 Jul 2025 06:36:24 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.176]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bdhnL5YzVz3hhTM; Fri, 11 Jul
	2025 06:36:22 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250710082538epcas5p2556f80b4193a046262808ae7742675be~Q1lpZdY_s0977409774epcas5p2X;
	Thu, 10 Jul 2025 08:25:38 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710082536epsmtip12dd8cd863df7974d872c656c4082f2fa~Q1ln5BXAh0693006930epsmtip12;
	Thu, 10 Jul 2025 08:25:36 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynosautov9: add RTC DT node
Date: Thu, 10 Jul 2025 14:04:34 +0530
Message-Id: <20250710083434.1821671-4-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710083434.1821671-1-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250710082538epcas5p2556f80b4193a046262808ae7742675be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082538epcas5p2556f80b4193a046262808ae7742675be
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082538epcas5p2556f80b4193a046262808ae7742675be@epcas5p2.samsung.com>

Add DT node for on-chip RTC for ExynosAutov9

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts |  4 ++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi     | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index de2c1de51a76..5f5167571f7a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -106,6 +106,10 @@ &pwm {
 	status = "okay";
 };
 
+&rtc {
+	status = "okay";
+};
+
 &serial_0 {
 	pinctrl-0 = <&uart0_bus_dual>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 66628cb32776..afa6b258153c 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -1633,6 +1633,16 @@ pwm: pwm@103f0000 {
 			clock-names = "timers";
 			status = "disabled";
 		};
+
+		rtc: rtc@10540000 {
+			compatible = "samsung,exynosautov9-rtc";
+			reg = <0x10540000 0x100>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&xtcxo>;
+			clock-names = "rtc";
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.34.1


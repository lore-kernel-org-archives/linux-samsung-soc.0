Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAF0213E9F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753065988; cv=none; b=oYaXqR2LRlj/LAY4Mbjmr+NPawKA/PF0j0W2fBX/M8An9NgkxlY3FedaZe2FLGggNBxbIW9LiymjHJHmPCp7QxS6ifsvEHKGCF8XG7XCLAKpJTQZfKBMT9uflsSaZZOSVZ4u0HMU1etP/nrOtTse00HlaguHMnDpCWytHSxhGUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753065988; c=relaxed/simple;
	bh=Yp0SllRdusqgJyxonU0VQHNCgNAh8E5lRlBWURyWECE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=mlbQKqqQGTIohen340zreF/FRjRBKY6Gs8y0dBtChxkSTzPTFDl7JWgO0poGvkPl6gD8bF6jvaYR6OiI1fOdgFTbKypn+kOmNPQwfUO0NNMRurty3BxTn1/i0r3l3ltoEPuR8T9xVJ0kYmIXzOm81nBh9aWuUc/QoqwN3hxt+6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uu7zrEBI; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uu7zrEBI"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250721024614epoutp01276a41924bdbd8281ed7fdf649f1abbe~UJDcgAXyO1459614596epoutp01q
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250721024614epoutp01276a41924bdbd8281ed7fdf649f1abbe~UJDcgAXyO1459614596epoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065974;
	bh=9xdRpUkb59hPYj3kEu7Gas8PW1qqllLhl/3sruAzKY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uu7zrEBIXaZS6VosTDdaWJ7UmNC/AyqwRHjNI2THW88dRjMzjMbizFwUyfQ/ANcgq
	 8HrEI87IJ3sMaSEQhTkoC7OS+2DrPD20zXjKcipZAaKKsGgAG83yGF9cR/tnaMlPf8
	 DDhBS33SfEw2a5iQ/oV0297x3MjcZDLTCj6oH/vc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p2178701927789dbdba7b20ded87e037ba~UJDbrOeBY2376923769epcas2p2b;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bllC82fq3z6B9m4; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p37ecbc204ea695d97f6477c04712a9974~UJDaAki2L2776827768epcas2p3r;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip297a1d6768ee8f430d3cbb41409f3f62b~UJDZ8EDVK1443514435epsmtip2E;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 2/9] arm64: dts: exynosautov920: add abox_generic dt node
Date: Mon, 21 Jul 2025 11:30:45 +0900
Message-Id: <20250721023052.3586000-3-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p37ecbc204ea695d97f6477c04712a9974
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p37ecbc204ea695d97f6477c04712a9974
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024611epcas2p37ecbc204ea695d97f6477c04712a9974@epcas2p3.samsung.com>

Add device tree node for the abox_generic platform driver to enable
its registration as a platform device. This node does not represent
direct hardware resources but is necessary for driver initialization
and platform device binding.

Properties added in the device tree node:

- samsung,num-pcm-playback (uint32):
  Maximum number of supported PCM playback devices.
  Here, PCM playback devices refer to ALSA PCM devices.

- samsung,num-pcm-capture (uint32):
  Maximum number of supported PCM capture devices.
  Here, PCM capture devices refer to ALSA PCM devices.

- samsung,num-i2s-dummy-backend (uint32):
  Maximum number of supported I2S dummy backend devices.

The node is declared disabled by default in the main device tree source,
and enabled via board-specific DTS overlays by setting status = "okay".

This device tree binding document will be added under
Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml

to describe the node properties and usage.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |  4 ++++
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index a397f068ed53..a870c0b6847f 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -86,3 +86,7 @@ &usi_0 {
 &xtcxo {
 	clock-frequency = <38400000>;
 };
+
+&abox_generic {
+	status = "okay";
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..4f086a7a79c8 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1126,6 +1126,16 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	abox_generic: abox_generic {
+		compatible = "samsung,abox_generic";
+		samsung,num-pcm-playback = <32>;
+		samsung,num-pcm-capture = <32>;
+		samsung,num-i2s-dummy-backend = <5>;
+		status = "disabled";
+		#address-cells = <2>;
+		#size-cells = <1>;
+	};
 };
 
 #include "exynosautov920-pinctrl.dtsi"
-- 
2.25.1


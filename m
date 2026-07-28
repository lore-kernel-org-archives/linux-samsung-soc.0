Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9104302E9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239603; cv=none; b=a/zwIi/Y+2+4vyRiaIMX/SPOAfWbaq853Rnllm6SnypmJ+vYi9Xp+QTjUjEVrg59bq3R4vCA+6BbNtYeDwpHHZWDg7alciW8ZW0UxMnBceRNkD4FO7uvq9oU4HvSzIGEcwtDlqp/F0kimFUnQMwGAJh0VlzC48KWL8eKyG1TFWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239603; c=relaxed/simple;
	bh=7NJXJPoYqysCDdFK6BAw5/opfDkXx95c0EbsI/6O8wA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=K6rPKaXEwRoG9W1Lo46N/JoRz0STRSKrUldUfkkYnLWfQx9AZS7JeFHDTGGnvkitSO8KoktmQWEjEN+FPfbk+Vf3ZZxp+AYOJ0rUS46EQua2U7z5dE8m1pLbSrb2ydTkCFv+BiKLK8aQfDsopC5kS8+u9nUuZAwBoZbOLwUZUAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=DD05TOWg; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DD05TOWg"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260728115320epoutp016f5e9b049cddedca081d9b1b6c22d402~GcfU2-yRy1238612386epoutp01m
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260728115320epoutp016f5e9b049cddedca081d9b1b6c22d402~GcfU2-yRy1238612386epoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239600;
	bh=3MuKqCTX8wUc8D0yWHLuHtbxhtT0zWIl/VKBsnrZrL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DD05TOWgEJS7Jcm6fMBwj1lZP647Wkr5GiQ/udCPp07FG71KuPsd/3UfCSWcRRJJh
	 OD3vTzIfJlUOZJrbeldi/i9CJIU7HNzRC5xGzJoNABI6s9hdD2sO4L+Za4pscp1Px2
	 1yw/XPK69dOIyUpsQJuvAWb9QuQGPOBKFtA0lzHE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260728115319epcas5p219e868ea0c3cfe9567a69bce15e8f2ff~GcfT41o4a0977209772epcas5p29;
	Tue, 28 Jul 2026 11:53:19 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4h8Ykk1T3wz6B9m4; Tue, 28 Jul
	2026 11:53:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115317epcas5p1ddf7db929ab923b9c22cf1a455edcb0f~GcfSiiO412742927429epcas5p1B;
	Tue, 28 Jul 2026 11:53:17 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115314epsmtip18673c55f782880caf86086b70994b1e9~GcfPdAe3y2345623456epsmtip1f;
	Tue, 28 Jul 2026 11:53:14 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 10/13] arm64: dts: exynos8855: add cmu_hsi clock DT nodes
Date: Tue, 28 Jul 2026 17:41:08 +0530
Message-Id: <20260728121111.2077860-11-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115317epcas5p1ddf7db929ab923b9c22cf1a455edcb0f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115317epcas5p1ddf7db929ab923b9c22cf1a455edcb0f
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115317epcas5p1ddf7db929ab923b9c22cf1a455edcb0f@epcas5p1.samsung.com>

Add required dt node for cmu_hsi block

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index a8f5ff0a7f1a..ad66eda62e31 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -220,6 +220,19 @@ pinctrl_pericmmc: pinctrl@154f0000 {
 			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi: clock-controller@17000000 {
+			compatible = "samsung,exynos8855-cmu-hsi";
+			reg = <0x17000000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_HSI_NOC>,
+				 <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "ufs_embd";
+		};
+
 		pinctrl_hsi_ufs: pinctrl@17040000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x17040000 0x1000>;
-- 
2.34.1


Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF23431A35
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239613; cv=none; b=LkZ6C5daCo44+j8qScC+5cYmnL3ASXBdt0ZF45oZ3vkQXhJ1FBaivJ9CYxa31vC5ehzoUvtbeoysCw1c9NecUtiK1+WD7Rp+98XS8fiT35YDAI/MB6rP+Vh3JwW8m41UMi3dsX22QQGmsWtcnVzieXDasY6/mW33rb3P+EndUmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239613; c=relaxed/simple;
	bh=dTj/J7Ft+49Tep2pcR8hl24yVDmFyGaWCpUyuq3dWow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=S4nnCafhjqoLWIKtoFN4Cl3RXurXKhsEwG/IoSKVB0Q7KpgsHEC/GYP1tkL7V9uffeSX4TbR5ZSZPZkC791k2VkUnibCgfOQVOtD8jjfgyqo70wyAPx6uKsRq9JtsNO/WujbNM7G/jFQBPj5GYKgIxbAG7URtYW5mMRXLBxA+ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=l7+siXat; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="l7+siXat"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260728115330epoutp028ac38643c78953961af00b08e1a4f8ac~GcfeJQ1hA2459424594epoutp02V
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260728115330epoutp028ac38643c78953961af00b08e1a4f8ac~GcfeJQ1hA2459424594epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239610;
	bh=nGdFgKVHT5d7trumovJAx3ZEYhB41GpI+KF8NOCrb0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l7+siXatWjNuBiOmvgGysgieqTaqhy+0Hwezvdsy7Zqt7pALfKvJf3yz2t5LNDSHw
	 reFIYsxUXLDO7ra/XwYVK9i0G+hmpHqyL+LYQVARuOyNjLwLtMmYhQpH09QpLklBTh
	 UKWgmofSf+JPL/pDEoxSB3s6rZ91yjKD1dV/gA+A=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260728115329epcas5p3421e42f3c745c65280f1c24dfd7e9df6~GcfdPpHlm3026330263epcas5p3v;
	Tue, 28 Jul 2026 11:53:29 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4h8Ykw1Dd7z2SSKd; Tue, 28 Jul
	2026 11:53:28 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260728115326epcas5p333e4a5d4d0777a1d064565b5c2c400d3~Gcfa3a2wA1872318723epcas5p37;
	Tue, 28 Jul 2026 11:53:26 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115324epsmtip145b72fcbda2f5a399b462edbb25a80c0~GcfYapAD32235622356epsmtip1i;
	Tue, 28 Jul 2026 11:53:23 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 13/13] arm64: dts: exynos8855: add cmu_usb clock DT nodes
Date: Tue, 28 Jul 2026 17:41:11 +0530
Message-Id: <20260728121111.2077860-14-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115326epcas5p333e4a5d4d0777a1d064565b5c2c400d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115326epcas5p333e4a5d4d0777a1d064565b5c2c400d3
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115326epcas5p333e4a5d4d0777a1d064565b5c2c400d3@epcas5p3.samsung.com>

Add required dt node for cmu_usb block

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index ad66eda62e31..040ca9afe8e6 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -179,6 +179,19 @@ pinctrl_cmgp: pinctrl@12030000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_usb: clock-controller@13000000 {
+			compatible = "samsung,exynos8855-cmu-usb";
+			reg = <0x13000000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_USB_NOC>,
+				 <&cmu_top CLKCMU_DOUT_USB_USB20DRD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "usb20drd";
+		};
+
 		cmu_top: clock-controller@13900000 {
 			compatible = "samsung,exynos8855-cmu-top";
 			reg = <0x13900000 0x8000>;
-- 
2.34.1


Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2242B1B4137
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Dec 2024 12:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733315050; cv=none; b=kxlXkXELXh32GYAegrhVAVGTkPHbaxEavYm8WbvROcUr+Uu3XNNIvQnFbwETsktiEHvm1b2n8NcB/72y+nH4FDFIlP6mr1Lb2p5sf8+DxzGKO+oCgdLBxJFTgaEskoS0JrL6XZkqtSXhAKE9NfrJGsw/Qh993AikeM2/7CZJzAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733315050; c=relaxed/simple;
	bh=KcvPpGsThQgqGhk3avKFBDqxzwqGLab5Y2VPLCGea9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=pN2siisWhfjyjKT5YDk7h6wPaiTllxidiGl5U2OVzUBveRMMKEFASaY/hFyh2nI6D0dsjtk5rPi4PaNh51781yaz0OZgHMzwejA8zKkg0JJtvbXY+5y5YpxMKqu17Du0f83apOrN8prFGZcYQwAG+urJLk4T5DjGMyunlnRfRG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TIXch/mP; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TIXch/mP"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241204122404epoutp0237bd04eddae153ca161b23f60d59ca91~N_NmGo9-c2078520785epoutp02C
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Dec 2024 12:24:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241204122404epoutp0237bd04eddae153ca161b23f60d59ca91~N_NmGo9-c2078520785epoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733315044;
	bh=QHoak+DAlOsJtw7x9Uk039N2Dy921OWTKaiSGrIqjss=;
	h=From:To:Cc:Subject:Date:References:From;
	b=TIXch/mPG1e1jcxis0t6Seif/txYXcrF7SVDBWlSJk1ybuxKLlPv4uHYQXr2aI+g/
	 cbEsg0Ai+etwOxKUnGWlPRbQwjxGNMc2x+pnFiqTO+M7z7c1MvhzUEGbj/wz0BoTSK
	 umtTQm87AkniOKO3vRshWhTORD4+ZVotCtXiUVlQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20241204122404epcas5p40b0d35f3c998ef8d9134e52773f132da~N_NlzaCIE1722817228epcas5p4F;
	Wed,  4 Dec 2024 12:24:04 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Y3Gsb1Jz0z4x9Pv; Wed,  4 Dec
	2024 12:24:03 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B6.AA.20052.3E940576; Wed,  4 Dec 2024 21:24:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83~N_NkY05II2017620176epcas5p2d;
	Wed,  4 Dec 2024 12:24:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241204122402epsmtrp1839c92f7780120490f36c8bcc3e4589f~N_NkYEtcn0966909669epsmtrp1N;
	Wed,  4 Dec 2024 12:24:02 +0000 (GMT)
X-AuditID: b6c32a49-3d20270000004e54-96-675049e3ce50
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9E.B0.18729.2E940576; Wed,  4 Dec 2024 21:24:02 +0900 (KST)
Received: from INBRO002811.samsungds.net (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241204122401epsmtip1446cfb0295879960c574501808b4dcc4~N_NirDjZs0260902609epsmtip1E;
	Wed,  4 Dec 2024 12:24:00 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com,
	rosa.pila@samsung.com, Faraz Ata <faraz.ata@samsung.com>
Subject: [PATCH] arm64: dts: exynosautov920: add DMA nodes
Date: Wed,  4 Dec 2024 17:53:33 +0530
Message-ID: <20241204122335.1578-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMKsWRmVeSWpSXmKPExsWy7bCmuu5jz4B0g9PP2S0ezNvGZjH/yDlW
	i2s3FrJbvJx1j81i0+NrrBYzzu9jsvi/Zwe7xZefD5gdODw2repk89i8pN6jb8sqRo/Pm+QC
	WKKybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOArlBS
	KEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgU6BUn5haX5qXr5aWWWBkaGBiZAhUm
	ZGcsaH7EVjBHrGLj7xb2BsZGoS5GTg4JAROJ5S/3s3QxcnEICexmlJi++QM7hPOJUeLE5h9s
	EM43Rol7P2+zwbVMWcMKYgsJ7GWUWH81E6LoO6PE32UrGEESbALqEjNvHGEBsUUEMiTmbH0E
	1sAsUCux5OdHsBphASuJwxs3g9WwCKhKbGn9CWbzClhKzOjdwwyxTFNi7d49TBBxQYmTM5+w
	QMyRl2jeOhuq5hy7RGt3AYTtIrHr+i6oQ4UlXh3fwg5hS0m87G+Dsn0kJh/9BnQDB5CdIXFn
	rQhE2F5i9YIzrCBhZqC163fpQ2zik+j9/YQJoppXoqMNGnCqEqcaL0Mtkpa4t+QaK4TtIXGx
	cxMTJHRiJZ5sa2KZwCg3C8n9s5DcPwth2QJG5lWMkqkFxbnpqcWmBYZ5qeXwmEzOz93ECE59
	Wp47GO8++KB3iJGJg/EQowQHs5IIb5B2QLoQb0piZVVqUX58UWlOavEhRlNgoE5klhJNzgcm
	37ySeEMTSwMTMzMzE0tjM0Mlcd7XrXNThATSE0tSs1NTC1KLYPqYODilGph2/Njqkl/3Y8q1
	ze6Xyg99DglJUk25fSbe+OVmufQF6z0S52imSIh90OrZER3pc85wpaffl83+B/462W66ZNR8
	6cTC/yF5Dz0LOXbx/WWdHKNz+Uvq9bs3V6ubrMl5xKS7Kac3/+7DfVd4PF/aytxcfWKmgvE5
	zidFnQyT/xy4H9M82/m1xo309VsnsmUvDFedI3p55QXTkr1cSZwMLvmLivSWOyn8ufsoqYVr
	bt2WRzWlXzR2/fn4eTf3sVrG+O3vfvwK3bn028emqle3y3LCHy17XstqID9BZNLOnAnu7zha
	F8/Nmf3me8uzq+oMS9vXvp445Vpf9MLJZwXyjN5/epYxb7f5/PJgN1fWxlXCSkosxRmJhlrM
	RcWJAHc9vwgGBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWy7bCSnO4jz4B0g7apRhYP5m1js5h/5Byr
	xbUbC9ktXs66x2ax6fE1VosZ5/cxWfzfs4Pd4svPB8wOHB6bVnWyeWxeUu/Rt2UVo8fnTXIB
	LFFcNimpOZllqUX6dglcGQuaH7EVzBGr2Pi7hb2BsVGoi5GTQ0LARGL5lDWsXYxcHEICuxkl
	LjxvY4NISEu8ntXFCGELS6z895wdougro8S13j1gRWwC6hIzbxxhAbFFBHIkXpxpYgIpYhZo
	ZJTYMb+DCSQhLGAlcXjjZrAiFgFViS2tP8FsXgFLiRm9e5ghNmhKrN27hwkiLihxcuYTsBpm
	AXmJ5q2zmScw8s1CkpqFJLWAkWkVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZwmGpp
	7mDcvuqD3iFGJg7GQ4wSHMxKIrxB2gHpQrwpiZVVqUX58UWlOanFhxilOViUxHnFX/SmCAmk
	J5akZqemFqQWwWSZODilGph8LghdWdhkZPvn8Jnrt7hd5laIcCx7vsfs0b1s1r+/pr38uWNj
	w9oj89zPR5Zmi0oy9USGZv1rN1qZFmKiaPHmQMrblyKvnizmXynxeeWmOmNjHYdvJ23rE98t
	by9Xeqe5x1LztP2H/gz/JJuTU+SMz93Te6z237V990m1G/9mFzi9qKqMKtVLrXXPPXnNrV8n
	vvrt+d3+3CLlr7SOTJBnfjFX8MY60w+Sb39++HvkvDtjrWVa/tGs/fPvbpPJW7PLZu3DoOw5
	e75kqbWc/NBjUVZyYF/5KZHsx1eFVmV0CbKec8wPkUtYfvZZamXHnc23opx04tNY6rx2cTby
	fdpVXNyxl9W8MfxS04a5+5iVWIozEg21mIuKEwE39B5lwgIAAA==
X-CMS-MailID: 20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83
References: <CGME20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83@epcas5p2.samsung.com>

ExynosAutov920 SoC has 7 DMA controllers. Two secure DMAC
(SPDMA0 & SPDMA1) and five non-secure DMAC (PDMA0 to PDMA4).
Adds the required dt node for the same.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c759134c909e..e65be0c97f7e 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -193,6 +193,69 @@ gic: interrupt-controller@10400000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spdma0: dma-controller@10180000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x10180000 0x1000>;
+			interrupts = <GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		spdma1: dma-controller@10190000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x10190000 0x1000>;
+			interrupts = <GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		pdma0: dma-controller@101A0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x101A0000 0x1000>;
+			interrupts = <GIC_SPI 916 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		pdma1: dma-controller@101B0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x101B0000 0x1000>;
+			interrupts = <GIC_SPI 915 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		pdma2: dma-controller@101C0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x101C0000 0x1000>;
+			interrupts = <GIC_SPI 914 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		pdma3: dma-controller@101D0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x101D0000 0x1000>;
+			interrupts = <GIC_SPI 913 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		pdma4: dma-controller@101E0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x101E0000 0x1000>;
+			interrupts = <GIC_SPI 912 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
 		cmu_peric0: clock-controller@10800000 {
 			compatible = "samsung,exynosautov920-cmu-peric0";
 			reg = <0x10800000 0x8000>;
-- 
2.34.1


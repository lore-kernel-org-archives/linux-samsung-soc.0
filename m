Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F94615AADA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724054153; cv=none; b=gcI4zzy+QCwaRnKbP2l8uJsS6PatFACrwfY58QK5ZU31EbA86b5ssP2i70EpYebzOXCCLcIUI1XmvGbUK5Y1N0d7revoj0UFvu/j57YjDLiT4j1fHbGgoaYGEoUicvJmyZniXBZjnHVDIU5as+VUEJOg7doKO4Q8vzARATaX7G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724054153; c=relaxed/simple;
	bh=kyEbx6ibDZGx/X2pRkFBT+/a03Am0KiBDmf3wAm174U=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type:
	 References; b=DAADfasgK8JqD3HG5516zlMw1vrZM0blNyvs6vbwqB3Ps43j7Y3rScvggYYGWrvtqsVFnDYpjv8xSoNZA9Dy9uWA4B2P9KnYrr/PYfH4hrvCPT9XkzRU9lijtu1mmsIQbnsEN5zMbaPUzX7O/UN/9bMcSYpZvkU4AFliwYixELc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ljwon32A; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ljwon32A"
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240819075548epoutp0218dcd3e6fa6cbe99754e6da4590d83ac~tEh0SCuGK2897628976epoutp02p
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 07:55:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240819075548epoutp0218dcd3e6fa6cbe99754e6da4590d83ac~tEh0SCuGK2897628976epoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724054148;
	bh=Hjrkn7sNLsF4gXJ9ZddxaEKR99G9ymy3PSHCuYlbsQM=;
	h=From:Date:Subject:To:Cc:References:From;
	b=Ljwon32AqACzx/Dw9PTC0n2fULiRDA9Fyrl1e42jtIwvYfxT8fGxhH/3FLC0yd+Xv
	 krXOxXD+fDdKnbdq8IrZgx6rPl5DtHWMvr2q9zqqTUcVGbri38vDC44yOK80MIFRY/
	 +jqZqKCFqaGJCer3stKWJ2EEwykXzotEh3A+Jk9I=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20240819075547epcas1p332bd669f297c04a6f6aa3ae76c97058c~tEhzzL15o0478604786epcas1p3u;
	Mon, 19 Aug 2024 07:55:47 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.231]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WnPzQ4tgyz4x9Q3; Mon, 19 Aug
	2024 07:55:46 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	34.A0.08992.28AF2C66; Mon, 19 Aug 2024 16:55:46 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20240819075546epcas1p355a3c85ffcea2c43e8f1b2c69a0f3b4e~tEhySLDy-1899818998epcas1p3c;
	Mon, 19 Aug 2024 07:55:46 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240819075546epsmtrp183c4ee2adb89210c9ef1fda81d97c672~tEhyRXFQA0521805218epsmtrp1j;
	Mon, 19 Aug 2024 07:55:46 +0000 (GMT)
X-AuditID: b6c32a33-96dfa70000002320-20-66c2fa82e119
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	35.21.08964.28AF2C66; Mon, 19 Aug 2024 16:55:46 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240819075546epsmtip25b31c4fc2d63e23398132ff3af59e6ce~tEhyE9Pmc2794427944epsmtip2X;
	Mon, 19 Aug 2024 07:55:46 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Mon, 19 Aug 2024 16:55:45 +0900
Subject: [PATCH] arm64: dts: exynosautov9: Add dpum SysMMU
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20240819-add_sysmmu-v1-1-799c0f3f607f@samsung.com>
X-B4-Tracking: v=1; b=H4sIAID6wmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
	vPSU3UzU4B8JSMDIxMDC0NL3cSUlPjiyuLc3FJdw0QLSzNDw5SU1FQTJaCGgqLUtMwKsGHRsbW
	1AEUgyg9cAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,  Kwanghoon
	Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmk+LIzCtJLcpLzFFi42LZdlhTT7fp16E0gym75C0ezNvGZrFm7zkm
	i/lHzrFa9K65ymTxctY9NotNj6+xWlzeNYfNYsb5fUwW//fsYHfg9Ni0qpPNY/OSeo++LasY
	PT5vkgtgicq2yUhNTEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXL
	zAE6RUmhLDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYFqgV5yYW1yal66Xl1piZWhg
	YGQKVJiQnbHvX03BH4GKC+u2sTUw/uHtYuTgkBAwkWjZbdnFyMUhJLCDUeLy9WOMEM4nRonj
	bx6xQTjfGCWmtl1h6WLkBOtov/WZHSKxl1Gi9cMlJgjnFaPE1409zCBVbALqEkva1rKD7GAR
	UJV4N6MGJCwsYCVxtuckO4jNKyAocXLmE7ChzALyEtvfzmGGiNtL/Hi0CGyBhMAKRon/r8+B
	LRARmMEocXPXNLAMs8BaRolvMy5A3SQs8Xn3GjaIlr/sEtfvL2KDSLhIbGpfzQxT9Or4FnYI
	W0riZX8blJ0tcfTjXqj6EonrsxaxQtjGEvuXTmYCeYFZQFNi/S59iFP5JN597WGFhB6vREeb
	EIQpL3GrsxyiUVTizNOPUAM9JC4t2ssIYgsJxEpsuP2aaQKj/Cwk/89C8v8shF0LGJlXMYql
	FhTnpqcmGxYYwiM1OT93EyM4NWoZ72C8PP+f3iFGJg7GQ4wSHMxKIrzdLw+mCfGmJFZWpRbl
	xxeV5qQWH2I0BUbCRGYp0eR8YHLOK4k3NLE0MDEzMjaxMDQzVBLnPXOlLFVIID2xJDU7NbUg
	tQimj4mDU6qBacrKx692tv5MXHD/U43j0m2z3lk/1fvgP7slWKn3B1PJ8okmRhmNKfdu/pBO
	6u9+xhjwmP/roTi5hO8Vcv5S/cu1/9sE1m3zadpn0ZwnI88iPNOP9eyuCib2I9fUuz/Kp9//
	ca1HyMJMX+jtEs3cTx3tmWl155frfri5ewVTjOGkW5+ytzz/UbDnToLV/BR5R06BKRZZj1at
	jdBc/pfTLO3O22VXZ7/KmFB0QO/tkjcHdjHnCycYF575+rfkzXW+mKkrLjtMMSpsX7b8Ctf8
	J7PqdyjXGJ32b2U4YLBTZa/9i682J8Q/P73JYf/oe4rUmcebr37qc8mcvtN2ToXow7Oxm75Z
	cdYIN95wrLwbUabEUpyRaKjFXFScCAAFBiLRFgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSvG7Tr0NpBt82c1k8mLeNzWLN3nNM
	FvOPnGO16F1zlcni5ax7bBabHl9jtbi8aw6bxYzz+5gs/u/Zwe7A6bFpVSebx+Yl9R59W1Yx
	enzeJBfAEsVlk5Kak1mWWqRvl8CVse9fTcEfgYoL67axNTD+4e1i5OSQEDCRaL/1mR3EFhLY
	zShx6X4WRFxUouNyI2MXIweQLSxx+HBxFyMXUMkLRon7hx+D1bMJqEssaVvLDlLDIqAq8W5G
	DUhYWMBK4mzPSbASXgFBiZMzn7CAlDALaEqs36UPEmYWkJfY/nYOM0SJvcSPR4vYQcZLCKxg
	lNh2u50FxBERmMkoMWdDExuIwyywjlHi/a+brBDHCUt83r2GbQKjwCwkS2YhLJmFZMkCRuZV
	jJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBAa+luYNx+6oPeocYmTgYDzFKcDArifB2
	vzyYJsSbklhZlVqUH19UmpNafIhRmoNFSZxX/EVvipBAemJJanZqakFqEUyWiYNTqoFpppJb
	24rqOd8T9MOerFgmOFt9eY3J5kvmiboFlzi9Ta85TGKW8Pjhx/hjr5n9Pm3W1t8WH1afXWtV
	+Fi0O2cF3//rbrHxkdPK9hxTF3g8Nc2vTMZcK/XZ8/M/F/5hOpjEoGkX8+w/W/Be3dJTHTFW
	z85Eu7PtqRRRnNd6w758bWD1lZz//D1mL452zpTOPujn2rpqUduW5dIbbY9rz8/T3sytcOjS
	J8HCGfND8jJVpue9kGz+1rFj6vNFwXVZV7VD1K9Me7Tj9F+ZzQtWHM582TrBQ3nRXuYVwV0K
	Zgvvlk1bJfWm71lfTZWlueyH+EU5D31lr71Zt/6ngIH/CT92lvz6zRlzbK8v+KWpvstTiaU4
	I9FQi7moOBEA1ghNhOcCAAA=
X-CMS-MailID: 20240819075546epcas1p355a3c85ffcea2c43e8f1b2c69a0f3b4e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819075546epcas1p355a3c85ffcea2c43e8f1b2c69a0f3b4e
References: <CGME20240819075546epcas1p355a3c85ffcea2c43e8f1b2c69a0f3b4e@epcas1p3.samsung.com>

Add System Memory Management Unit(SysMMU) for dpum also called iommu.

This sysmmu is version 7.4, which has same functionality as exynos850.

DPUM has 4 dma channel, each channel is mapped to one iommu.

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 599e72824875..b36292a7db64 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -261,6 +261,42 @@ cmu_dpum: clock-controller@18c00000 {
 			clock-names = "oscclk", "bus";
 		};
 
+		sysmmu_dpum_0: sysmmu@18c80000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x18c80000 0x10000>;
+			interrupts = <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_dpum CLK_GOUT_DPUM_SYSMMU_D0_CLK>;
+			clock-names = "sysmmu";
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_dpum_1: sysmmu@18c90000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x18c90000 0x10000>;
+			interrupts = <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_dpum CLK_GOUT_DPUM_SYSMMU_D1_CLK>;
+			clock-names = "sysmmu";
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_dpum_2: sysmmu@18ca0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x18ca0000 0x10000>;
+			interrupts = <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_dpum CLK_GOUT_DPUM_SYSMMU_D2_CLK>;
+			clock-names = "sysmmu";
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_dpum_3: sysmmu@18cb0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x18cb0000 0x10000>;
+			interrupts = <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_dpum CLK_GOUT_DPUM_SYSMMU_D3_CLK>;
+			clock-names = "sysmmu";
+			#iommu-cells = <0>;
+		};
+
 		cmu_core: clock-controller@1b030000 {
 			compatible = "samsung,exynosautov9-cmu-core";
 			reg = <0x1b030000 0x8000>;

---
base-commit: 367b5c3d53e57d51a5878816804652963da90950
change-id: 20240819-add_sysmmu-1a89611ddee4

Best regards,
-- 
Kwanghoon Son <k.son@samsung.com>


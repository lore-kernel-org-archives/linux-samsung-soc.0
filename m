Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B38265CAE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840168; cv=none; b=MvgwqF6u/qx56r4RbEjOe1FDMq+HhCK3lSP7giAl+2u5XJxnD26MDxHjK4/avb5tC+5FL2x2dyOvx2OTNqqKIoNreabDlF3vXZFuFxtLx3eGSE9Hp5woxRfGwBGw4VpnG0wL92j0YwHAKz7DBlch5PYCr3GrI0oGB9Sfl+i2b+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840168; c=relaxed/simple;
	bh=iFzGuACWvPdMTtprDZH7JP48uol6IThkiaU/81eK7TE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=XDGIU97DJsDhR2fwdaxvkqrKZuHSnC3019Ha+eLjVSfd4dQ55a2CLDTw/qljWWYxc77b8mSMJT76xrWB4k9sgpKbKu3nivYnIVQXBd3n/l+wtMGCzyCyS712JHle2QwQ2Lzx8/fNcAPqA+p9JwRz/axi4ZoK4N4QzSvykRUwiTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lPpCZLDI; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lPpCZLDI"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250428113604epoutp041d5b0c0f91205f079657f4d763859a6f~6eGEkPOZC2157521575epoutp04E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 11:36:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250428113604epoutp041d5b0c0f91205f079657f4d763859a6f~6eGEkPOZC2157521575epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745840164;
	bh=kwb6sfk/OTplMs5Q5TACguVNBchZ6pfP8g0wZXekkjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lPpCZLDIff1q2oKnuSmDHtO8V42DTn+TP/uzSfVE/kKhA16aixdcpat8OFXEh1Fsn
	 72TvxUnRi54A7WjoVMAliNFPpKIDYyABzfZl/bl32hg8AUtEKink8qfsVt8MW+neJ4
	 ontBljpLB7D4nDpCZGsyQROo0RpTmL4nOlvWtF0o=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250428113603epcas2p13937f174d10c6c05cc45520937c39e4b~6eGD75Q4j2806628066epcas2p1Q;
	Mon, 28 Apr 2025 11:36:03 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.97]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmLxH15qcz3hhT4; Mon, 28 Apr
	2025 11:36:03 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250428113601epcas2p11d09d84944957018da75aa548d3ecb2c~6eGCaGrX92806628066epcas2p1I;
	Mon, 28 Apr 2025 11:36:01 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428113601epsmtrp1483b9611127238a5c9ac08eb6fb2dbf0~6eGCYm6R13238632386epsmtrp1G;
	Mon, 28 Apr 2025 11:36:01 +0000 (GMT)
X-AuditID: b6c32a52-f0cb424000004c16-e5-680f6821b457
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	69.BF.19478.1286F086; Mon, 28 Apr 2025 20:36:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428113601epsmtip1f20bfdd6b40288a13924357ae4dc7945~6eGCLAJIa2519925199epsmtip14;
	Mon, 28 Apr 2025 11:36:01 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: exynosautov920: add cpucl1/2 clock DT
 nodes
Date: Mon, 28 Apr 2025 20:35:17 +0900
Message-ID: <20250428113517.426987-5-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428113517.426987-1-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnK5iBn+GwYRLOhYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYjH5+FpWi6Zl65kc+D3e32hl99i0qpPNY/OSeo++LasYPT5vkgtgjeKySUnNySxLLdK3
	S+DKeHFKqOAtV8XOxslsDYwnOLoYOTkkBEwkJu6exdrFyMUhJLCdUeLH5p9sEAkJicMzJjBC
	2MIS91uOQBW9Z5RYMv0ZSxcjBwebgKrEpt/yIHERgbdMEsv/H2ACaWAWOM0osfOMDIgtLOAv
	8fn5RlYQmwWo/tbOG8wgNq+AlcTr18fYQOZICMhL9HdIgIQ5BawlPl1cB1YiBFQy4fEZNohy
	QYmTM5+wQIyXl2jeOpt5AqPALCSpWUhSCxiZVjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIE
	x4VW0A7GZev/6h1iZOJgPMQowcGsJMJbZcCfIcSbklhZlVqUH19UmpNafIhRmoNFSZxXOacz
	RUggPbEkNTs1tSC1CCbLxMEp1cBkeOLauWO6Z2yq+ma0sYRtsOo1/HnWS8zWcoHAOfUZ+RxX
	Quos2wQ37V359oyt4OSzi0T5wjc90Ft40YinNWpS0L2i8mj2FkHNP3an7sXmb3i7yvJJxdz1
	S2Z4RaafuLMhu7t/huq+nWkrOGZ9eHZIs0ytL4+bJV19b/WRWu64bCn+Utn+d/a3b9XsquQ4
	vfDo7IC5Iezt25yS5nf4vGYOl9g2a89+g6eaz5zrlZeedM6buLjGtkeTIUXH7tteKc6Pya8j
	gucf63929sYThlldxezz3spJlguJdstwT5l48qeb14aVFzieL/Q8vZtnhcu0sypBhyTYg9sl
	dabJxB9em3dyuqfQO59ZN79v3btPiaU4I9FQi7moOBEA1wK8afoCAAA=
X-CMS-MailID: 20250428113601epcas2p11d09d84944957018da75aa548d3ecb2c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428113601epcas2p11d09d84944957018da75aa548d3ecb2c
References: <20250428113517.426987-1-shin.son@samsung.com>
	<CGME20250428113601epcas2p11d09d84944957018da75aa548d3ecb2c@epcas2p1.samsung.com>

Add cmu_cpucl1/2(CPU Cluster 1 and CPU Cluster 2) clocks
for switch, cluster domains respectively.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 9350c53f935e..2cb8041c8a9f 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1090,6 +1090,32 @@ cmu_cpucl0: clock-controller@1ec00000 {
 				      "cluster",
 				      "dbg";
 		};
+
+		cmu_cpucl1: clock-controller@1ed00000 {
+			compatible = "samsung,exynosautov920-cmu-cpucl1";
+			reg = <0x1ed00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_CPUCL1_SWITCH>,
+				 <&cmu_top DOUT_CLKCMU_CPUCL1_CLUSTER>;
+			clock-names = "oscclk",
+				      "switch",
+				      "cluster";
+		};
+
+		cmu_cpucl2: clock-controller@1ee00000 {
+			compatible = "samsung,exynosautov920-cmu-cpucl2";
+			reg = <0x1ee00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_CPUCL2_SWITCH>,
+				 <&cmu_top DOUT_CLKCMU_CPUCL2_CLUSTER>;
+			clock-names = "oscclk",
+				      "switch",
+				      "cluster";
+		};
 	};
 
 	timer {
-- 
2.49.0


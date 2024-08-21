Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD7183CA4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 23:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724282822; cv=none; b=mR7Dz/D0MDloJv3SHqizYWHm07yuIof+Bk3SbHP6+bJzBJm0sMM5r7PW3w9xl+v7BK6Z7569bqZW5SFEXr0mNVTtghF2hW76XI50h6CL+iQYbY7r13F69OepjPLGhqH8r6psyQuWLoICL93PcDd27ZEjoc+JEEMoNPf3A0VojIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724282822; c=relaxed/simple;
	bh=AkyWJ9I6Hd2zktck1kauTocadzukvCDLU9FEN2IAB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=t4lYqMTIfzwFytwUJ+nxUCWPE+6P4X5uZWlrk2jsE5S8V4pXJ9j+QFk00PNSPFFeAJFvRe1zQ2zHxGBkyY0kAytId01j1i1WZ1ErulNHAQpKAbX0LFSAEp12ZOYCz5iewSuAY2+wcrNgetBY3ZdGW2GnEvOvMg2LUzBWHIUJmBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=kQeCA95M; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kQeCA95M"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240821232658epoutp04665ce749b8c1167e56b29ac2b130da38~t4hZbRAIm1797617976epoutp04e
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 23:26:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240821232658epoutp04665ce749b8c1167e56b29ac2b130da38~t4hZbRAIm1797617976epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724282818;
	bh=bAiZEbXYaEhIP7FM2a6MyvX2CrU3Y1JE6JPzxHX7HAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kQeCA95MMiYRFfeKGnLp3xB3B4S/BJyzWlKWUeqVNIvHt2A2W2SDkpqn7Jgmmcw9y
	 3IRurznpQPsULt6I4SK22RINMeFEvq2jG67fSOSU43j06Z7QK93OZljjyD5fFVOQrP
	 hsN6aA7p7MwXWSIMvc4rYwDPNFUg020YyzHMahk4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240821232657epcas2p2950879b32cd29898d3f0de520c1a46ed~t4hY3zcKJ1271312713epcas2p2a;
	Wed, 21 Aug 2024 23:26:57 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.91]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Wq2Xw65bBz4x9Q0; Wed, 21 Aug
	2024 23:26:56 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	36.9B.10012.0C776C66; Thu, 22 Aug 2024 08:26:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240821232656epcas2p2fa72bd9565570c26616aaa640d75eef3~t4hXz4YCY1271312713epcas2p2P;
	Wed, 21 Aug 2024 23:26:56 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240821232656epsmtrp148026be62d9184da0a166cb9eb9a10fc~t4hXy2Dke2876228762epsmtrp1X;
	Wed, 21 Aug 2024 23:26:56 +0000 (GMT)
X-AuditID: b6c32a47-4dfd9a800000271c-0d-66c677c0490f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	40.89.19367.0C776C66; Thu, 22 Aug 2024 08:26:56 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240821232655epsmtip2d25e9c0de5ff2d4c0d36d17bb5ebeb33~t4hXjwPck2250822508epsmtip2R;
	Wed, 21 Aug 2024 23:26:55 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v9 2/4] arm64: dts: exynos: add initial CMU clock nodes in
 ExynosAuto v920
Date: Thu, 22 Aug 2024 08:26:50 +0900
Message-ID: <20240821232652.1077701-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821232652.1077701-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmue6B8mNpBtNW6Fg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7YuuYPW0GLeEXThk3sDYxL
	hboYOTkkBEwkDs4/zNbFyMUhJLCDUWLvpG4o5xOjxMSG38xwzsbpL9m7GDnAWrpnmEDEdzJK
	/Lh5kQnC+cgose/AEiaQIjYBXYk//xxA4iICe5gktpxfAlbELHCWUeLunAXsIMuFBWIkWn+u
	ZANpYBFQlTi4yxskzCtgL/Hu0it2iPvkJS6uec4GYnMKOEhMnX6MHaJGUOLkzCcsIDYzUE3z
	1tlgl0oIzOSQmNV1kQ2i2UVi1/npUIOEJV4d3wJlS0m87G+DsvMlJl9/ywTR3MAoce1fNzNE
	wl5i0ZmfYC8zC2hKrN+lD/G9ssSRW1B7+SQ6Dv+FBgqvREcbNEjVJD5duQw1REbi2IlnULaH
	xO23rYyQsJrMKDFlzmqmCYwKs5C8MwvJO7MQFi9gZF7FKJZaUJybnlpsVGAMj+Hk/NxNjOB0
	q+W+g3HG2w96hxiZOBgPMUpwMCuJ8CbdO5omxJuSWFmVWpQfX1Sak1p8iNEUGNYTmaVEk/OB
	CT+vJN7QxNLAxMzM0NzI1MBcSZz3XuvcFCGB9MSS1OzU1ILUIpg+Jg5OqQYmyYZLTIKXNkr7
	dUz8p7+moTN3x7299WV8oidXzmO04tt/9P7hg/KfvjF2T1m50jHpseDEGI25kZunBXE1vDzB
	uOsPv7nauf7Ev98Cs48wVqifYlhVslGGX7zB4255O2v6+XvvuWrOxJ8pnROdpV/ceuLJ5x+R
	N5LdL33ueCJ40GvppBz5pwGVzN2ztdKkFDTvnuBKlm/ouK9Upfc6oMV3iuQM1/M8abt87Q4v
	tDKbM+m0wKrztm7Gy/+tCNQKZnRnnD9B3m7V8zOrNth/ctM/ptLg116rZ/v8gU/DQp3iWyKK
	+jMDSo1veWg88C4If5GcNVsn4tS8N++4mttfFgYcSj6b2hebwurpXV+fWKrEUpyRaKjFXFSc
	CAC90BeyQAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSvO6B8mNpBif3c1o8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZWxd
	84etoEW8omnDJvYGxqVCXYwcHBICJhLdM0y6GLk4hAS2M0rMfXWNuYuREyguI7Gx4T87hC0s
	cb/lCCtE0XtGiTsXljGCNLMJ6Er8+ecAEhcROMQkMfHzUxYQh1ngMqPEsbuTwSYJC0RJfNra
	xwLSwCKgKnFwlzdImFfAXuLdpVdQC+QlLq55zgZicwo4SEydfgwsLgRUs3d5OwtEvaDEyZlP
	wGxmoPrmrbOZJzAKzEKSmoUktYCRaRWjaGpBcW56bnKBoV5xYm5xaV66XnJ+7iZGcDxoBe1g
	XLb+r94hRiYOxkOMEhzMSiK8SfeOpgnxpiRWVqUW5ccXleakFh9ilOZgURLnVc7pTBESSE8s
	Sc1OTS1ILYLJMnFwSjUwOW2u5EmL3vz3jETE1W2Xd7XPP+Qc+T/86Y/KBaVpuSv9E4TCDtTX
	pXdXdH7b63/h9KOaMOWt6aIJkz9bpzyfvDLrZuNpbo0kkV67/g37Plhf8cx6+C3QQ8I95syj
	ks1TwrMYuN+vvvLwzcOtwWqrPJgX2EVdWbVV99x141kP7+w8tZk35PP8z3c1X9rcmyIQImdZ
	/O7M3pu/ZbY1u7E3Cp1R+eB54UbqrE/RWfdm52yv+/+iSl+84tmRxMvxL7vXLbiQoMxtLrz8
	y4XLMvP/fljjaGmq0BpWN/+2RtC6i+EKTAuWhVyOC80XXRyesLSaKdgub93S+y6OPm8vpzNv
	vSx48R7fp7AXV942/BfYE6bEUpyRaKjFXFScCADda73r9gIAAA==
X-CMS-MailID: 20240821232656epcas2p2fa72bd9565570c26616aaa640d75eef3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240821232656epcas2p2fa72bd9565570c26616aaa640d75eef3
References: <20240821232652.1077701-1-sunyeal.hong@samsung.com>
	<CGME20240821232656epcas2p2fa72bd9565570c26616aaa640d75eef3@epcas2p2.samsung.com>

Add cmu_top, cmu_peric0 clock nodes and
switch USI clocks instead of dummy fixed-rate-clock.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 40 +++++++++++++------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c1c8566d74f5..91882b37fdb3 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -6,6 +6,7 @@
  *
  */
 
+#include <dt-bindings/clock/samsung,exynosautov920.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
@@ -38,17 +39,6 @@ xtcxo: clock {
 		clock-output-names = "oscclk";
 	};
 
-	/*
-	 * FIXME: Keep the stub clock for serial driver, until proper clock
-	 * driver is implemented.
-	 */
-	clock_usi: clock-usi {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <200000000>;
-		clock-output-names = "usi";
-	};
-
 	cpus: cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -192,6 +182,19 @@ gic: interrupt-controller@10400000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric0: clock-controller@10800000 {
+			compatible = "samsung,exynosautov920-cmu-peric0";
+			reg = <0x10800000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
+				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
+			clock-names = "oscclk",
+				      "noc",
+				      "ip";
+		};
+
 		syscon_peric0: syscon@10820000 {
 			compatible = "samsung,exynosautov920-peric0-sysreg",
 				     "syscon";
@@ -213,7 +216,8 @@ usi_0: usi@108800c0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-			clocks = <&clock_usi>, <&clock_usi>;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
 			clock-names = "pclk", "ipclk";
 			status = "disabled";
 
@@ -224,7 +228,8 @@ serial_0: serial@10880000 {
 				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&uart0_bus>;
-				clocks = <&clock_usi>, <&clock_usi>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
 				status = "disabled";
@@ -254,6 +259,15 @@ pinctrl_peric1: pinctrl@10c30000 {
 			interrupts = <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_top: clock-controller@11000000 {
+			compatible = "samsung,exynosautov920-cmu-top";
+			reg = <0x11000000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>;
+			clock-names = "oscclk";
+		};
+
 		pinctrl_alive: pinctrl@11850000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x11850000 0x10000>;
-- 
2.45.2


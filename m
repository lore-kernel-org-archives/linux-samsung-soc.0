Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010432;
	b=kNg/RKjDbCOUqCnD8+7YpSaggmMZXDSe22JjLiAdkxrkRi/9SowrzoKWAHAyAFFs2dsu
	 v5WjFVwnxw9WW5LFTxc+aHqxRnyI3GmcLLbMhZatky/0lmASflfXXPNNMn2p+ATADyuyq
	 kJs6t9ZBuUf7gdvY6MIQtLLZ1eG/AlHoxB4aocrWpslV3POVJE9f00+XSd95ud6DvByQU
	 rLsXclBRpp6vlBLxn9QqoDmiQwfap4Rxoz/34dItFc0K8Xo77neyoO0YIXWLMYvqRlMlu
	 TJuuPIsIu9EIUuE8dY9ULqES0QeJrXgKZQ6hPDqzwHQWAJaQc3wiax8VxCeE5w8TAxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010432;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=L3zCdzaFnqr92HqxOIhABiGtfnkKrxT8Qw7ZJF1heKw=;
	b=pV6bLXeR0pFPd4orUiKcFrVbA0bUVkhkTl1TN6FGctoFhpD6szhvFrmtwVHjryit+ITr
	 hux25gIFD4A3bJMy4+5ig+u5NRimYJQXTe+bmS4i0htJSxfklKEowLAxh8c/YuFQ/y3fH
	 7E/3Sn7+bxnl3ySrM7/q3E/QYf32ACQ48VO2pIwCL9OS2UIMC3HBZNRa75Lb3ugHOqfZ5
	 uMBFTC6P4vnnFmbtZqhC0XihIgjHvTMbLQzxNUxGEnVA7dXnVblRHu8adHTGeDnbOh/hM
	 D3h+nP88iPMUfHWa6/XrDdcViqdynofqg36DOCIpTeYZsBISYNRnncA/IGo5mFsabsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=LrkZ8iSw;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDAB606A31B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 10:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDAB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=LrkZ8iSw
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261026102709euoutp019c72e36c8686166d7b16d2e7d64a28fe~iDXxDTPqW0622506225euoutp01f
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 10:27:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261026102709euoutp019c72e36c8686166d7b16d2e7d64a28fe~iDXxDTPqW0622506225euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793010429;
	bh=L3zCdzaFnqr92HqxOIhABiGtfnkKrxT8Qw7ZJF1heKw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=LrkZ8iSwOszR4NcMtsPP2aWOJnLz90WDXpwkIn9O68o/EQ618ZXCiMb5RsKm0sr+E
	 Qd0g3GZW8/s7J4vAbpiULUvApHqGsHehIkTyKrxXXFIpLtiXACkx54qcL/A4OlbFFK
	 1D0TJz+gZg/8iFTnQAmd+aAWWcB5KU2bMylfmNUo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261026102708eucas1p1dd4e054f4891f6ec94a16e9e53aa30b0~iDXwqqTkk1006410064eucas1p1s;
	Mon, 26 Oct 2026 10:27:08 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261026102708eusmtip1cf9e71e47f149c4cde88c1788875cc34~iDXwRgeER0779707797eusmtip1M;
	Mon, 26 Oct 2026 10:27:08 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO
 properties
Date: Mon, 26 Oct 2026 11:26:56 +0100
Message-ID: <20261026102658.968138-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261026102708eucas1p1dd4e054f4891f6ec94a16e9e53aa30b0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261026102708eucas1p1dd4e054f4891f6ec94a16e9e53aa30b0
X-EPHeader: CA
X-CMS-RootMailID: 20261026102708eucas1p1dd4e054f4891f6ec94a16e9e53aa30b0
References: <CGME20261026102708eucas1p1dd4e054f4891f6ec94a16e9e53aa30b0@eucas1p1.samsung.com>

The wm5110 audio-codec node uses the legacy "wlf,reset" and
"wlf,ldoena" property names without the standard "-gpios" suffix.
gpiolib-of.c only recognizes these bare names as aliases for the
correct "wlf,reset-gpios"/"wlf,ldoena-gpios" properties, and that
alias support is compiled in only when CONFIG_MFD_ARIZONA and
CONFIG_REGULATOR_ARIZONA_LDO1 are enabled. When those options are
disabled, devm_gpiod_get() fails to find the GPIOs, leaving the
codec without a working reset/LDO enable line.

Rename the properties to the proper "-gpios" suffixed form so the
GPIOs are found unconditionally via the standard gpiolib lookup,
matching what drivers/mfd/arizona-core.c and
drivers/regulator/arizona-ldo1.c actually request.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 79eb47441819..e9ff42c4764c 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -1374,8 +1374,8 @@ wm5110: audio-codec@0 {
 		wlf,gpsw = <0x1>;
 		wlf,inmode = <2 0 2 0>;
 
-		wlf,reset = <&gpc0 7 GPIO_ACTIVE_HIGH>;
-		wlf,ldoena = <&gpf0 0 GPIO_ACTIVE_HIGH>;
+		wlf,reset-gpios = <&gpc0 7 GPIO_ACTIVE_HIGH>;
+		wlf,ldoena-gpios = <&gpf0 0 GPIO_ACTIVE_HIGH>;
 
 		/* core supplies */
 		AVDD-supply = <&ldo18_reg>;
-- 
2.43.0


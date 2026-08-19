Received: from vsmx004.tt.xion.oxcs.net (vsmx004.tt.xion.oxcs.net [153.92.124.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F82F549F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=153.92.124.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145421; cv=none; b=BQaRCu2w7UsIbkZhCfr2voV9yr+nGfxalY/61KKoQPkVhWoI0KydeiBJLRknSRK4E5INfY2aoHsmJqVa4iSlXm7ImzELRf8rkD5b4825o6wkaCMzCGNtESYG2FubgwYHqj3wTxmW4yWkA4/5EuYeO0ocO49Be9J60oszxerddgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145421; c=relaxed/simple;
	bh=KpS4iszTeWa4U/ZO4HavgmVIGS5AySyW+ou5T8jhwWI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=l7jRWxrAOM5aPWbb6PRsdeQaNt1mPPqjdn1k8hWUvfmkppG3ftsd4SdzdyNU06oHPD1S59Eqh17p+jUruTRbsxXtkw/X+4njYN6RcpeFfWGptZbIrEE8/hgkD/4Z37pMBNESOdaAhrdnnI3579ZrEHQeTQVHCbz4xW6dw2JmMhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=talktalk.net; spf=pass smtp.mailfrom=talktalk.net; dkim=pass (2048-bit key) header.d=talktalk.net header.i=@talktalk.net header.b=AtEcsLBe; arc=none smtp.client-ip=153.92.124.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=talktalk.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=talktalk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=talktalk.net header.i=@talktalk.net header.b="AtEcsLBe"
Received: from vsmx004.tt.xion.oxcs.net (unknown [185.27.183.176])
	by mx-out.tt.xion.oxcs.net (Postfix) with ESMTP id F1851A8077B;
	Wed, 19 Aug 2026 13:07:27 +0000 (UTC)
Received: from proxy-15 (proxy-15.proxy.shared.ham.xion.oxcs.net [52.98.183.21])
	by mx-out.tt.xion.oxcs.net (Postfix) with ESMTPA id 7A7EBA80143;
	Wed, 19 Aug 2026 13:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=talktalk.net;
	s=mail1; t=1787144847;
	bh=ip7RpmKhZLesXAXFn4NiUEFRQG2/dpi2/xLPnSIQi20=;
	h=From:To:CC:Subject:Date:From;
	b=AtEcsLBejQSI6BjWE8JvQuF196t185JikAIP/KP/ammsXo3rs/DfgPtP5sEL9yxCU
	 eNj8BqgL8D0v6NIp7sGY6QASWDLg6ZcbBKW0z4bmNMUQC+A6e7YjbzuvCvvnYRypmV
	 sRM5f8LXfjyxXeUm9bM6I8H0HYgk1EaVEHxNtCpYExW9Ebm7vFgbS3TPIfAkrokZGy
	 X721mAfT6t672ZKJuUApPRAUOh474H8czS5EXxU2QJOk3HFn/Yl0biqMlxKW6EnfcN
	 UxEjRvvkJwAFwm5qVwbhpH4ygZnJmiS2bIN5T1PXAhvpZ5k3MTLVGLwQ2FAfFITo5+
	 S1LbRbUMI4cyQ==
From: "thomas_turner@talktalk.net" <thomas_turner@talktalk.net>
To: "semen.protsenko@linaro.org" <semen.protsenko@linaro.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Subject:
Thread-Index: AQHdL9tywkiYFsT4dEim8C++1HK05Q==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Wed, 19 Aug 2026 13:07:20 +0000
Message-ID:
	<GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-VadeSecure-Status: LEGIT
X-VADE-STATUS: LEGIT

From 20f8cda9f788a2d19689f350bff3754ff3c24e3d Mon Sep 17 00:00:00 2001=0A=
From: Thomas Turner <tturner@lineageos.org>=0A=
Date: Wed, 19 Aug 2026 13:48:24 +0100=0A=
Subject: [PATCH] arm64: dts: exynos850: Add GPU/Mali Bifrost node=0A=
=0A=
This can provide basic GPU functionality for the Exynos850 platform.=0A=
=0A=
Signed-off-by: Thomas Turner <tturner@lineageos.org>=0A=
---=0A=
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 12 ++++++++++++=0A=
 1 file changed, 12 insertions(+)=0A=
=0A=
diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dt=
s/exynos/exynos850.dtsi=0A=
index 3881f573ec08..8ed85c125030 100644=0A=
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi=0A=
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi=0A=
@@ -296,6 +296,18 @@ cmu_g3d: clock-controller@11400000 {=0A=
 			clock-names =3D "oscclk", "dout_g3d_switch";=0A=
 		};=0A=
 =0A=
+		gpu: gpu@11500000 {=0A=
+			compatible =3D "samsung,exynos850-mali", "arm,mali-bifrost";=0A=
+			reg =3D <0x11500000 0x5000>;=0A=
+			interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,=0A=
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,=0A=
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;=0A=
+			interrupt-names =3D "job", "mmu", "gpu";=0A=
+			clocks =3D <&cmu_g3d CLK_GOUT_G3D_GPU_CLK>;=0A=
+			clock-names =3D "core";=0A=
+			status =3D "disabled";=0A=
+		};=0A=
+=0A=
 		cmu_apm: clock-controller@11800000 {=0A=
 			compatible =3D "samsung,exynos850-cmu-apm";=0A=
 			reg =3D <0x11800000 0x8000>;=0A=
-- =0A=
2.47.3=0A=
=0A=

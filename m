Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88621B2192
	for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Dec 2024 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734282618; cv=none; b=EenSUiKeYuRoLBRNL5WO5XzWb8UTcUvnk82LITwDST4jnALh6mBeEVS+ZxxT5R1ATAVtBpRlZB44Bd2SF36gktB8GpWxVVjVyDtGccIu58+EFLsVAq2BiFaRzsOCvKnh7PriMZtxFzJFI/cABBNJspS70Iqs/GmALYnZ4QJgVy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734282618; c=relaxed/simple;
	bh=Xqqch/vhNEgGYAn/i2LGTac53RcxdOr6D+YPPMY4tLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Es3kN/enuanI6d6WyBknkM2/ZdqH2GKz92wdoNNeUzr1FrfhKiZQ3aqBwPPnhsLcWnFQBC2E6JS4BlItrtRPHB8X40hQIA4wqddVSOQSuldnF4rx1dq94vs1U74HSen/II0pjVzXw0/49UcT7OJNrcVJ1av1doEUMdjzrgazvV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Dwwnwsi/; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Dwwnwsi/"
DKIM-Signature: a=rsa-sha256; b=Dwwnwsi/P9XgTOdSdIr7ZKC5V2Lkq4H8UPWGssqGubAD5sqyC8UsBxgowIBWCCmSz/IUEIUtz4QvXSwPsKGBD9BRewG5AhDcoUsA0FZFQVeemZ1ULTM8Va+lBRIvFQb0uFa4+DmwjBGwD3CtuE/5G+KtAEdxSpbUUIQPf4FwpqYhkv/kjepTEG+Ux7Metm3ebgAVgheLt/yhRanYRQ1ikB3CLBf+VqmeaX+QfuBOfE2aq7QgCD2w95yujZe6blytD88OB79GkeKJySAg97S3DVpBXOcWyFG4nMyRzMAARiHxPuaMXB7AZAhXHB3qeSt2X9Ep93BUccf/EJtDddX/bw==; s=purelymail3; d=purelymail.com; v=1; bh=Xqqch/vhNEgGYAn/i2LGTac53RcxdOr6D+YPPMY4tLQ=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1363280443;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 15 Dec 2024 17:09:56 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: exynos990: Add clock management unit nodes
Date: Sun, 15 Dec 2024 18:08:03 +0100
Message-ID: <20241215170803.1756850-2-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241215170803.1756850-1-igor.belwon@mentallysanemainliners.org>
References: <20241215170803.1756850-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Add CMU nodes for:
- cmu_top: provides clocks for other blocks
- cmu_hsi0: provides clocks for usb31

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dt=
s/exynos/exynos990.dtsi
index 2619f821bc7c..d6a8c04e6602 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2024, Igor Belwon <igor.belwon@mentallysanemainliners.org=
>
  */
=20
+#include <dt-bindings/clock/samsung,exynos990.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
=20
 / {
@@ -199,6 +200,24 @@ pinctrl_peric1: pinctrl@10730000 {
 =09=09=09interrupts =3D <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 =09=09};
=20
+=09=09cmu_hsi0: clock-controller@10a00000 {
+=09=09=09compatible =3D "samsung,exynos990-cmu-hsi0";
+=09=09=09reg =3D <0x10a00000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI0_BUS>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI0_USB31DRD>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI0_USBDP_DEBUG>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "bus",
+=09=09=09=09      "usb31drd",
+=09=09=09=09      "usbdp_debug",
+=09=09=09=09      "dpgtc";
+
+=09=09};
+
 =09=09pinctrl_hsi1: pinctrl@13040000 {
 =09=09=09compatible =3D "samsung,exynos990-pinctrl";
 =09=09=09reg =3D <0x13040000 0x1000>;
@@ -245,6 +264,15 @@ pinctrl_cmgp: pinctrl@15c30000 {
 =09=09=09compatible =3D "samsung,exynos990-pinctrl";
 =09=09=09reg =3D <0x15c30000 0x1000>;
 =09=09};
+
+=09=09cmu_top: clock-controller@1a330000 {
+=09=09=09compatible =3D "samsung,exynos990-cmu-top";
+=09=09=09reg =3D <0x1a330000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>;
+=09=09=09clock-names =3D "oscclk";
+=09=09};
 =09};
=20
 =09timer {
--=20
2.45.2


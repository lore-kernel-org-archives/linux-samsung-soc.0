Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01060140E5F;
	Tue, 24 Feb 2026 05:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771909468; cv=none; b=UFyVIJgH/Ho7bjZilqJbNUcnZtibbmHGrOGhoijiJ00Cn9eUBo6C+SXKNrGN2Nmoz0BU0uQpW5Vny9jgVRHQA8Ki0Zq3jaCbZ7xYKyd/rXnRcZ6s384a/JY4sqNYsfIGTwUlKc7YdiSfb1mR155S5kBJHDBxi0/Zo0xk8U5p1Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771909468; c=relaxed/simple;
	bh=Px7YCJTLYs5dcI6uV0LeqCWSBT3HnluSpU++9H1U5Kc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fTVC9mPjh3yH4pPm1LHDzF6FwpkWBVSHBEHv+zupcgkDCNjxlSZTeBqOTWKCl4iiIpFwRyuVa3j/YKfXFTcf67jUod3RPHn2nnadTFzv4Lq4wwIHTONkRGZ4dhjFgxWxBExiAP4jIZ0CUWOrhVml+I76l2t9R9yL6OLOiuY748M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aR8C5yu4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aR8C5yu4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86453C116D0;
	Tue, 24 Feb 2026 05:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771909467;
	bh=Px7YCJTLYs5dcI6uV0LeqCWSBT3HnluSpU++9H1U5Kc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=aR8C5yu4fQlNa6mCDKDrzfbVSB6C/hW3Aq2SI2ihLNqaXRnq7HSEVBlPxTLG91ip1
	 6dlYSey7wVC7CT3l0GutzT/NNWvrFa2JcNZ44mRCxlamuiLfA8JnHIWioPHCkIFCee
	 vqL6AM4Dk0XZKu+dhoIM3Ta5Ly0W/I7jfBEbDicla2CP3bDONhKQsUmVj+cAHbJdf7
	 RgRXMRloIs2O7h2XX5FM9jlsPoGQ+GSLuAoJjlvPmJKYy6X+P9HGEp4/D112S8O4Or
	 2yStczOqr5Be1pDupQdmuwsYMZ0HfipxNQcjoT36o0N1fbedlpmn7FPyY9wy0uT2jo
	 wX8kWGfy+gcvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAEDEFB7FA;
	Tue, 24 Feb 2026 05:04:27 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Tue, 24 Feb 2026 05:03:47 +0000
Subject: [PATCH] arm64: dts: exynos: gs101-pixel-common: add supply and
 regulator properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-max77759-charger-dts-v1-1-b443545c04aa@google.com>
X-B4-Tracking: v=1; b=H4sIADIxnWkC/x2Myw5AQAwAf0V61oQuav2KOAhFDx7pikjEv9s4T
 iYzDwQxlQBN8oDJpUH3LUKeJjAs/TYL6hgZKKMqIypw7W9mLj1GbbMYjmdAcoV3ztfCPEBMD5N
 J73/bdu/7Aa9c1r1mAAAA
X-Change-ID: 20260224-max77759-charger-dts-23493398e77c
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771909466; l=1720;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=3jPKBl5MYkX7r6yLANmNLU9+YkyAc1+ak/0AsjI+qS4=;
 b=xTODcHq7YQIqPLOpbsQ57wvld95whooxac8lki1NNt9ZVz3sztOBRGNt96j+7mATnfkIxwmBB
 zEKUbhMJFStA6yMbG41n30f/UvvXDg+G1wf+8YOhqtJBep5TAgogwgd
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

From: Amit Sunil Dhamne <amitsd@google.com>

Add power supply and regulator properties to the MAX77759 pmic. The
usb-typec device will reference the regulator provided by the pmic as
it supplies vbus to the typec device when operating in power source mode.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
This patch depends on the patchset [1].
[1] https://lore.kernel.org/all/20260224-max77759-charger-v8-0-eb86bd570e9c@google.com/
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679..2cc00d34dda8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -142,12 +142,13 @@ &hsi2c_12 {
 	status = "okay";
 	/* TODO: add the devices once drivers exist */
 
-	usb-typec@25 {
+	maxtcpci: usb-typec@25 {
 		compatible = "maxim,max77759-tcpci", "maxim,max33359";
 		reg = <0x25>;
 		interrupts-extended = <&gpa8 2 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&typec_int>;
 		pinctrl-names = "default";
+		vbus-supply = <&chgin_otg_reg>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -236,6 +237,11 @@ pmic@66 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		power-supplies = <&maxtcpci>;
+		chgin_otg_reg: chgin-otg-regulator {
+			regulator-name = "chgin-otg";
+		};
+
 		gpio {
 			compatible = "maxim,max77759-gpio";
 

---
base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
change-id: 20260224-max77759-charger-dts-23493398e77c

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



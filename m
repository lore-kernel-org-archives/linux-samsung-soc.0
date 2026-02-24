Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B183624CA;
	Tue, 24 Feb 2026 23:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771975833; cv=none; b=cD4JU4kSNz0zrNdySUnyTqHOo4HVMo4DW80swpDlBWh6fsGkoUANRyrVRZB5+oQ1aQK9sCfQWtBdq5qgryn3lmAJXmNhSxgbdghhlZOlt5Xi/1/RpCsl9P2dbOUP9lCpT4gvYzuhDu4NWzit6lY++mvXkuK2ee6yTkg+kgT+xlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771975833; c=relaxed/simple;
	bh=ADR9CvrvUzc0kTvJQ47ZqNuoTDTeK64MKM9SscoqhvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oWTaD3o1PjTMw/iSRaC6oN6CZEGtHsUm6yboO3SkpjCje3ySuI6RaORnEvvA4qhc4LFYkKxarj9EojibTbmqjFwv3o3qCRW+SjuYqdR8PYl/LVwWxcGu69TJQTxHXim88GapmBXnz4PyZmwFOaguBZvGo/GmHqH+04J5cihdSAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDFfRfnF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDFfRfnF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42786C116D0;
	Tue, 24 Feb 2026 23:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771975833;
	bh=ADR9CvrvUzc0kTvJQ47ZqNuoTDTeK64MKM9SscoqhvY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QDFfRfnFqEQ18E8DB2gcLKi7UVqZJraqiwjo4axwGgTLIerU0ht6DhKZ/B99VTqBk
	 MiV8xEbyiaLI9R1nX756iZsGKu5ovYqRMJ/FnSu7igmNX0qwySJDGu5HCQs3eMYYJF
	 EaKk2ccH/hT1oGdXcYgEoPsbO87WHdJrwvvdcSzYG83YxlU+pHfBiV2hscnjARUawJ
	 YOLnHSFVAWgg7S6X90qU1sC2ZDRvKnERxARbg0P51slifQDVkxsycoAbeAKm2dPBGC
	 H/LnQXGeiO8XUQMRbuTjmHqHc8Q+xwsMq2syOZ4OxUVtZO03X/F2WjsGeVpt01mJf8
	 6gITkWyv3tc7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE4AF55433;
	Tue, 24 Feb 2026 23:30:33 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Tue, 24 Feb 2026 23:30:09 +0000
Subject: [PATCH v2] arm64: dts: exynos: gs101-pixel-common: add supply and
 regulator properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-max77759-charger-dts-v2-1-983265ac8e63@google.com>
X-B4-Tracking: v=1; b=H4sIAIA0nmkC/4WNTQ6CMBSEr0Le2mf6a60r72FY1PIsTYSSlhAM4
 e5WLuDym8l8s0GhHKnArdkg0xJLTGMFcWrA924MhLGrDIKJCxNC4eBWY4y2WOscKGM3FxRSWSn
 tlYzxUKdTpldcD+2jrdzHMqf8OV4W/kv/CBeOHJ9KSa20Z8q5e0gpvOns0wDtvu9f3olMZLkAA
 AA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771975832; l=2045;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=88wsB5MWvHCzIwGqyj8+p1i8avmUTsCvuP3h53Fmyv8=;
 b=dh7Wzn/BI6+sbCg7HzZuAnFKztyTTZjpc3QWBJVkfFGIWyd3aWswVHKJHeGu12064DZor3HAs
 Wq9qT3xRmsMCcFk2m99357uGLp58VjOtJ3IF0y9YaqYq9U8GL3xE4W9
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
Changes in v2:
- Added a line between property and child node as per DTS coding std.
  (Krzysztof Kozlowski)
- Added the "power-supplies" property immediately after the prev
  property without leaving a line space.
- Link to v1: https://lore.kernel.org/r/20260224-max77759-charger-dts-v1-1-b443545c04aa@google.com
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679..14c1518bef81 100644
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
@@ -235,6 +236,11 @@ pmic@66 {
 
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		power-supplies = <&maxtcpci>;
+
+		chgin_otg_reg: chgin-otg-regulator {
+			regulator-name = "chgin-otg";
+		};
 
 		gpio {
 			compatible = "maxim,max77759-gpio";

---
base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
change-id: 20260224-max77759-charger-dts-23493398e77c

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



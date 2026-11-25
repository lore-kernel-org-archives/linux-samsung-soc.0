Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795623181;
	b=riKuCHRd9mkWyGd8BQmJYx6d6aoIkCznHMb5daJgtAdQ3pYQsnbMRbUMooCD74EUaZj3
	 4A9MRJD1BXU9KzAxtQcV6wRNGKKMxc2SMa56cPo00LDwsAAlBAGMQ65lYAlA30gcywJUW
	 OxdFXfIwDwZbv3H390TMzPYiPAOPlcLjWPucTCJ+hXaEyL3WjYAH5H3BGUxCAztrKoYe1
	 iikwgOEr+kRRMkLZ7hKdlndsHqwqCK2QzG63JO8xqFwPlhx2ggA2OS2IMyXc8IslV7kfg
	 M299PBgPnYw2d2bF5c6pLvuHCLo/qV+eSwn22EelhPx4R61ZU077pczEx066syqlpUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623181;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3A3E6sXLIyQnIHDEX6Cx1wJAY2QjzvuJ/e8FaTKLYEg=;
	b=GPO580VJIGeHNCYqWZ1WjMfYpb6Tn1XV8fe91XDcjmYp9pXsLG9cdG27hKoSu4TiCwBU
	 qP5unhiM6XzJ3Qg6pacit7ggaub1Z/YUdwWeaA4cPQe4FoDnmLaPvK9rkbQ/vo+XSSXtb
	 VGu267pCv2u7XHaGHobrfWv5oCTZyPh92u/ZOf4m6QwjP10b041lUGMCmoo394ji/QYHX
	 njIJz6lapG1ErU05MTQZhR+P9H4L+8QCLx03qPhSc3ez0bkKqxXWzFuQTRIrms30a/09G
	 xp8MtGweg1YGYvGFDZ3LCJqmwiebR3qx8QIiL7tPQi/ejjyO9Dozfszry1CG7NFOuPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cod0zp7p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74D7606A31E;
	Wed, 25 Nov 2026 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cod0zp7p
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795623181;
	b=AwXAzTJe4jDnV7dByyOdWkZUc5A7qrXmofz2f49r6c/bs1eQu/9OfUUIcCqufHyWvFTb
	 cbNA4pbxLkQJ5IXEMfjzilELVqHH61ixWfKlhhjLC1bhV8Uhp/0I8HuYG5c8sRNUadWdD
	 hQJ0rX9jS0rIAKtmDsYn+yueWsQeXPAxQ3eQ9vBQLTc81TGMhutZe/Mh0dQqU1S3smN2q
	 CKgL8dwbfzwirfPfoK7Fe1h4sQ0CoaQo+63/K8AXpu8IL7ZR/zoTBXebzMY7jNlYYydpg
	 AfMe4dsQrWxXfeu+QIzUztpgaDyX7m+IegVzGeHy33fUNUz0UGimqgEFP9G5sqVJc0A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623181;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3A3E6sXLIyQnIHDEX6Cx1wJAY2QjzvuJ/e8FaTKLYEg=;
	b=tvoTPy4hf1tmWOPBCHxe/8TAikMXFdRKrvJTGI6/2Ac01uw4yCECTwCdNHuV4egPB/pj
	 lLoo6Fp10xoC55/ZGSarXGsqNrK6sd9F80DQT/H1Jvqxs1vWtB5exEmYHx6Lk4oxd9fX7
	 jIwaBid7yp5mrpb52R9+lgF0sgsNZA3xn4rWLjiukl1qzELeYBem37S9YSIu6H4z8PYFE
	 9zMHbS1Op8qPkQsV1xJKWmN9UlRiuHyMu0CurExkUduKZCGDqARII2fUnM/haS+82cu95
	 viWWfcGYwyLMY3NuD7Css5DSezpLvW58cKQ6D1vgIi6mAZNnDhWym52l13WDW9n0/mw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B64E1F01563;
	Wed, 25 Nov 2026 16:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795623181;
	bh=3A3E6sXLIyQnIHDEX6Cx1wJAY2QjzvuJ/e8FaTKLYEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cod0zp7pg6TARplVW2UT+a/RzoUhXIpDrRRScxu21m4cRA1EOkDY70RYeZk3uVdwV
	 ty3XwEDLZV+oz9t3Bp11qeS6XAMmPsn6/gAaRAO1mdlIidkPls6QD46JoO953tQgXo
	 UPHHldhWL2y9ToDuE2Vcq2m8cRqr6QGPA0epIh7CYnCwlfhXm5ZBEQOeDOBrOjP0YV
	 ooPsHLxeycuf9WS74csH/OQhIwiS/wTH+7b0vZEJdM52SSYyfVMEMCk9ID79HbGtoK
	 Gur9tqtkrubKP8o8cQxkauNCRvYrkpQjkQ0uRUOyQI3MZ4ggFs6wcn+TmAUshNywKd
	 +kx7FY6te26Tg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A5E734CF54;
	Wed, 25 Nov 2026 16:12:47 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Wed, 25 Nov 2026 16:12:41 +0000
Subject: [PATCH v3 1/2] arm64: dts: exynos: exynos7885-gta3xllte: Enable
 USB support
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-gta3xllte-usb-battery-v3-1-2ef962bf5423@mentallysanemainliners.org>
References: <20261125-gta3xllte-usb-battery-v3-0-2ef962bf5423@mentallysanemainliners.org>
In-Reply-To: <20261125-gta3xllte-usb-battery-v3-0-2ef962bf5423@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henri Ommer <henri@ommer.net>, David Virag <virag.david003@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795623167; l=1634;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=lq3RkQ/cpzRDW2dTSf0wXDxDTq/ch8FNKpY2bDIwhtU=;
 b=xOchDRY8climikJIu/c0kZk8l7G16xlR0c+suCGIHRnwaSkguijrc8Bw7Nod5cCWD+7VwIrDY
 Xxl7rgE3ZIPDXoqr8+oNH+nxhLITY3gptUb6a6MKeQf2yLUpwZSYKbV
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Reply-To: umer.uddin@mentallysanemainliners.org
Content-Transfer-Encoding: 7bit

From: Umer Uddin <umer.uddin@mentallysanemainliners.org>

The Samsung Galaxy Tab A 10.1 (2019) has a USB-C port capable of USB 2.0
speeds, used both as host and device, and is used for charging the
tablet.

The port is controlled by an S2MU005 IC. Until support for it is
added, only USB device functionality is available, so enable the USB
controller and PHY in peripheral mode.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
index 03476f8b1200..c71101ed0ba9 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
@@ -68,6 +68,12 @@ memory@80000000 {
 		      <0x0 0xc0000000 0x40000000>;
 	};
 
+	/* TODO: Remove this once PMIC is implemented */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
+
 	reserved-memory {
 		ranges;
 		#address-cells = <2>;
@@ -127,3 +133,25 @@ key_volup: key-volup-pins {
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 };
+
+&usbdrd {
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
+};
+
+&usbdrd_dwc3 {
+	/*
+	 * SoC in theory supports SS but no known device (including this one)
+	 * has it wired up.
+	 */
+	maximum-speed = "high-speed";
+
+	/* Force to peripheral until we have Type-C working */
+	dr_mode = "peripheral";
+};
+
+&usbdrd_phy {
+	status = "okay";
+};

-- 
2.56.1



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117763;
	b=oqCwe37Q45Zo1HvgIBnix6Uu4+a4+QlLbdYUlI98hrpHtRhS7vHHLr7Gxig3rLTtiFc3
	 rsvaTwrxgBi5Tz02hjH5dhQ7FQZmlcIeY+bKE3oIRmW0kB9LeH15SPRHKa6bZMQsR94jK
	 kbH3GDICnSpaQ8lDgF1ji7jWFdIsp5+69VkhwILNZdyQ49MN3CyW/xdXuL1oT2+7QQcwJ
	 3lcxtj7zG9SmwFzqMU0bNnla/u6UD88gnFGkSG2CEojeSwbtF8nyg7LMmLYVammgZm0KS
	 e6gt31bW8GLwMPpekDwbKvnhPhyiGiOqVqygSTnMbnRoxxZOkc96aHBwkI0pfo9Cjxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117763;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tGaSlh8WowCpjefQ9EPxD+050Ca7Fij70+0D6vHAq9o=;
	b=Qb5kb0O/TRZL0TNxyXbw4/SWT8Mb5a97u5HCvx5WLwL1lSrzmvnln9VfOqHWLxL+1U4h
	 JX1WdYQp0LP5iU96eQ6sT5ulkgDijtGV43WeodDCxiRBIYP0Eaduv17SWLBNfV9pQk0nC
	 9dymQsr6JtUUGGpjqZv418owiDnLDHNPZ5pVorSV6gx0tjD+YRhaYS+B09GTYNww2c2VO
	 yPBDEEP6IXPLXC8UphRpJIgLjDP1VC1yfhU/deu3mQMh2zDjqF0FmPCJZ7E3yuwpmOmtl
	 kTcNv7JZppoL9zY/oNoZFm8425el/ekGbftwFC+6+df10y3SlgDsZu2WY39uBbCL90g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q32nPSYJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858B160A2624;
	Thu, 19 Nov 2026 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q32nPSYJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795117763;
	b=wHWmGdLcalaF7YNPcMQFNstoAJanGwZsXix/tlv9Tf+kSV3Nnq+HALT5RKsTfZWlqpZh
	 mMc7hxN+CrBtMmyqUQwzWCJcAfhRKSDAIN5ZnmRuO7j+4CdYiTrjkAYKNyeci0NZANLVL
	 QaK2z6P9wzgLJdvhwKNq6ObW3MN8cgSRQ9SF3HD8yo+adNBwrrtfeRe/jmlQo++srYgjJ
	 58RRjO6h775LLTaP4mxDiNB7h1799eHN296f+DrlCi6o4j5fKJysFNVk4D8T1n9lWsFOX
	 FcFT5VSpouQG3n+wWZY5mf+aGG24JQZp2Ptm7T1WMorOPY0wznEMJ5muei7s9MUYmHA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117763;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tGaSlh8WowCpjefQ9EPxD+050Ca7Fij70+0D6vHAq9o=;
	b=W43kpO3cRw8zO87hyFjDFog4rrppNUwC8/djoO2pjkgN0j2npUsvE+KlLcRuye7JySk+
	 7KUyKvjPKuFyGA13o3feIEo+6WhEBOO00pRJe6EiFUA9PdqptbjbHEcLGoKVAVNIrEpMZ
	 wdidySCDdR9y6s8RLSxyiraRYzXssNpabT3Nz8YZ3p7IxbF429ErayPVUan92XGt76832
	 uoODwN+C4MrumV23oF+8IqVaWwO5UvjeBu1rk08JZgG16yeMPlE1O49kj51H/wZ8uKHVX
	 17Vr+2aHhN+wokwVV7jfImko4G8yuBizRehcLt7N1oqlmvbnMd2Oq7/4+Mf7D2vzUHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6DEB81F000C5;
	Thu, 19 Nov 2026 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117763;
	bh=tGaSlh8WowCpjefQ9EPxD+050Ca7Fij70+0D6vHAq9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Q32nPSYJ0/MqHSX9Lmm8kNXv9S18ULwIeaUTHM7ga7hzxqZQ4fTRmybclYNILTmSR
	 wQUu1PqibOPGE5FuUEYjL4ZKVjBTU22CXRBnU3LR23+3ybsTZjbWc0JJabS3KZnYqD
	 PHb9s2fKYpaUU3C7pKfE12g0J1QySmBaH0zFkKFmVJnUPiPSGDLp+DGZ523ZXiJTDb
	 GmAvkiqmwlIRXxbJ9o3qjWxrDzOl0N7sRBtwWqcDzerhAqiv+2SN74ncONJ/Y//W3M
	 5JXERCtyCnhj6SjawswZ6pAMVZEj7xRE/Fvqy70z8RgXeXww76M+XxNlsWHJqCTTdP
	 ruA+d7MIjcj7A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8225E4B410;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Thu, 19 Nov 2026 19:49:21 +0000
Subject: [PATCH 5/6] arm64: dts: exynos: exynos7885-gta3xllte: Enable USB
 support
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
Message-Id: <20261119-gta3xllte-usb-battery-v1-5-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795117759; l=1489;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=2sc//xhMdQLxeTbKn3e0zeBob0QS6bolzRWDj8BhCrE=;
 b=hoa8lF31kpywbV6h7hS1pTyfL1CIInM9Am92ae7H88ueiW47bUVtJ7ONmjYxJi3JTlClFyWPv
 yplbPml6tGqB/pddUWhxTIrYZFIIS7uwQ+sZBxr4oToOwDW+qNOmRH5
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
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
index 03476f8b1200..57df878cb563 100644
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
@@ -127,3 +133,19 @@ key_volup: key-volup-pins {
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
+	/* Force to peripheral until we have Type-C working */
+	dr_mode = "peripheral";
+};
+
+&usbdrd_phy {
+	status = "okay";
+};

-- 
2.56.1



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795623180;
	b=BC2KWbF2x3E6e7jf/8HovG6qjbA227TV4AI6C9aQCOkzggpoIOU0eWOlzSLWF7V82KQl
	 kcDK78LbzJ7KNncAbMI6aZljAOM3+5ldd37d0RlKJ2XpPPa/lh4NQ25Wo2ygbRWzezhme
	 /aEsIS9eCthhBFaSIML6vvzChimQgn3BEt3mvNBh/1jVdRwhh2fAoOZ6YoXDzlvKxy2PW
	 VS656T2XRbOACCid/UuCpivcPYIYKaw2yy0yMDyFgAqsTEQqEp/0M7RNuq0WBRbk6X7W2
	 HZOCjOvobAfSWLGZgOrZ6RZoKjWYESToRe6XHVOvCz2i1klbXCwR0qJG0dOnkzxZTPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623180;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ydAVlbiT7HtdBwFmKZLj3/SdTDt++MO23OROKjnc3CI=;
	b=FZOeAw7GKVs/Km6Lef18REOtqVrTFSW4diqrBFYNESa41CIQkstHfLzrgxpiz5UvLK3+
	 7vGpv2a9EchWdT+mtP3VMSeQbbQFGZxNfxuZm3YlpjhNSp0O3xB0hLa5JwFQcNDYOP7mz
	 5E440iexTSQRqeX851ZTT+rH3nRIUZ7RCzmt9J/RONlPszEaYb+lYysQo2Uxx3XZfZsVH
	 68CfJXh2gKc2Sca0jRhmlwNG2VpkPhFEhzLB399FGqBj7TUZjDly3CUbX5E5cOXkq7Xz/
	 jBgEW+aHNPFuk8YKCx55EC1PFL2Ho+y6ZSvy9f8u2xV+zKwNYWb04YsnrCJ3SmecYJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dXdVOuYL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F879606A32C;
	Wed, 25 Nov 2026 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dXdVOuYL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795623179;
	b=KOtD60Z9sRWgNc7Jz1Hi8n8WR1vg6ECzc9LtmRi3PiQihSusMhVlRN2jpww7EuZDOoDe
	 7jAFZe6oHx4Jv1zTzkdzcQLTJyAadLWtDt8UN3RPtbo60htnPAY6I+e8o9B+8ZpjFZx8d
	 Ij8aHM/KtUQP9+8EtYdWqQ9ZWVGZuIu+dZddsgkZAfyCkLrnPxYd4bL2CJQemOGne6HIU
	 7SYZEqEJJMMQMLMCe/yOs5kaD7KOyaHcLeoFwC2aKLNVKW0UH4rnZ95kCqGsBL2iuekcn
	 IaVFGGAQFKEL73rsW16G4dN7oGOl3hXVYyGnFyV5mDU4X/V5jRa3lnSQDuvd+ojBEJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623179;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ydAVlbiT7HtdBwFmKZLj3/SdTDt++MO23OROKjnc3CI=;
	b=cYS0DCHweuDIIeBvBSn9lYK/EPa9jkArTnRoOENB219XGAgy80mywD2yiAfW6nmtN1PX
	 vUWivvd1gXPH7PhY1EAeIMM1g7IjyzauDl0Pi7YP6FtHj14SM1Xx+/Tbl/Kgv6F+2kNJm
	 DLhmr6PuVYYDltKUqWaRxDz2pP0r/roSc4cXPVcxQ/2UMQQyTJvS1i5ICkl7XoJ+6UhSs
	 QF1sh8I81/seUxxH4Tct5NMlr9HWK1EsXCYiKnUPsP0VfyAKuUpxiy+0Mtw7HRxpGFyrv
	 RUkkvPrAoCW0egP63sZFTfRaokF/LwmKAi4F0NQv8Q5I5G+nWGPqHcT7GZU5yKPqEqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49D111F00A36;
	Wed, 25 Nov 2026 16:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795623179;
	bh=ydAVlbiT7HtdBwFmKZLj3/SdTDt++MO23OROKjnc3CI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dXdVOuYLYBUylootiJLTxBCIsViAmfYWrcVmPQs0yxeeTOyRaRk7dyCT3Sas0b55B
	 uz+Ikm6O5VC9vNd5MUDBEQDDSmKtyru9Ep0r2iMDSCIY2Uv3u26SHaSDMHDCLGQLIU
	 Q+bUy57cV6vBjcgHAaHCxZPD389dS56JNVFbpnL7AucrT+5o8axncd3MfAUuM1YHXt
	 1Ry82ZwvWl8QQQXYN+UzURdrpuXtZ0YE59dSVSYwo/ZW6GEb4rMCN0SGGYnzpYeGXv
	 Azw52+sXHjFzJ6ppsNf4LGYhOoCGhKIPnbY9l5g2BahSeeN76spsUSWIotv47Zb9IK
	 7PfPhzhNy/UhQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C43E54CF5F;
	Wed, 25 Nov 2026 16:12:47 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Wed, 25 Nov 2026 16:12:42 +0000
Subject: [PATCH v3 2/2] arm64: dts: exynos: exynos7885-gta3xllte: Enable
 FuelGauge support
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
Message-Id: <20261125-gta3xllte-usb-battery-v3-2-2ef962bf5423@mentallysanemainliners.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795623167; l=1850;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=1xi6TN0cxIIMdEWPE8CrGdgk4y/rnvekhNW2VzWmKzE=;
 b=Ng7NpeXzQis6U9eUxFGZh4M8hXp50VKddJ3WiOfFHPTupT8MCJ3QsyBkAe3EdtWqSdkJHGCvu
 xJ4XCytoJNYDWRiaQKnl4LFccNYDIGrAK+VgQqbs0pTn2kmIFCoSL/Y
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Reply-To: umer.uddin@mentallysanemainliners.org
Content-Transfer-Encoding: 7bit

From: Umer Uddin <umer.uddin@mentallysanemainliners.org>

The Samsung Galaxy Tab A 10.1 (2019) has a S2MU005 Multi Function Device
(MFD). It contains PMIC, FG and EXTCON. This commit enables the FG, to be
used with a simple battery device to allow for battery percentages to be
reported.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
index c71101ed0ba9..466ae0874880 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
@@ -22,6 +22,13 @@ aliases {
 		serial2 = &serial_2;
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <6000000>;
+		voltage-min-design-microvolt = <3300000>;
+		voltage-max-design-microvolt = <4350000>;
+	};
+
 	chosen {
 		ranges;
 		#address-cells = <2>;
@@ -86,6 +93,20 @@ cont_splash_mem: framebuffer@ec000000 {
 	};
 };
 
+&i2c_0 {
+	status = "okay";
+
+	fuel-gauge@3b {
+		compatible = "samsung,s2mu005-fuel-gauge";
+		reg = <0x3b>;
+		interrupt-parent = <&gpa2>;
+		interrupts = <4 IRQ_TYPE_EDGE_BOTH>;
+		pinctrl-0 = <&fuel_irq>;
+		pinctrl-names = "default";
+		monitored-battery = <&battery>;
+	};
+};
+
 &mmc_0 {
 	bus-width = <8>;
 	cap-mmc-highspeed;
@@ -112,6 +133,13 @@ &oscclk {
 };
 
 &pinctrl_alive {
+	fuel_irq: fuel-irq-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
 	key_power: key-power-pins {
 		samsung,pins = "gpa1-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;

-- 
2.56.1



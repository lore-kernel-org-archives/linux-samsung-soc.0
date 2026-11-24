Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540493;
	b=axpoo8XHbSq/3kRv68U0NoJT76hRkGqC/mrFPWqv+lbb+N9dUQUUDl6CjEBgpplMPGFv
	 BfMnN2MQUVQ8CgVIxTRO3REPRpPunTyqLqbeVBM26ZGr/rUVZrBym5uQa5LfA3ZeYVBQu
	 Zuk1HIo7uKZA6oLHscFoyz62bIXXZ0e/phqhIBfUPrPmnkPF82xPg5HwbcdmIrX09HCTB
	 gDLH7rkderfRUNVbd0qoZ7Fy+Yv/28Enw4Ew6yDED2Ufb3HFotW4rib+u/RYpQ5LjanTV
	 L5a222ZxmHtmdXo1D3osd2nCQYAi/49lz1vR3M//79SpZS/z914rv9XXy7/RqU+2qLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540493;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NLcacHh2AlI+z6F4X0aPUFEo3odgTr28TBoLjE+0958=;
	b=SW0igwskoM6UsEx7bcuIYGlFHXqC7GNruK3s2jwo+t5ih+RJn8BIygffIJ7q2lRW5WdY
	 ozAeP/g5IHQ2rvZe4eVDsRSjBzC00ReXRWpzwMg9QjzDbDTJsFDLi7/1uPIxUMmHtqCih
	 WTOon4is+O6X8S0ZOWYq6VmN0mYK3VPwwu7J+j5TxGaACS4kJam4MAoPWtXo0QN+Mwv7V
	 xMvR3casQomykQ+6F+EB/bhPMvQm2Tf4+FZI6htYIdcSaYCIA2wEg8cBDdFgzYWMpEUz4
	 ipyadlVnTlkVuqWPuTI61QFInaHBwTo8DuUmAVk09k8ENhhaBzBLvL/sDCE3Kj0psYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoyQEfYm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB15D606A323;
	Tue, 24 Nov 2026 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoyQEfYm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795540492;
	b=xW4lAlqwEZpkVT3HTSl7zcBNm3i9eRHLsKK0y2kPID1oSspSf/saeGCHka8C92YI+UyN
	 IMOk/fl/Ic4RbE4ucRE4aPuzFYDkNy7IO6vKCMtl6t3mfRlu4OXC87Pb02yCUTzGibh2r
	 xLMKZ99DCedj2hliq2n0874tam+fedspNoHx3WMIlj2rHptz9+wYKdNyxWzS8ax9kX1AP
	 g14m9fHn9dJ1axBIN9ygnfYOY8Esy8GNOCnDYSCLaLafOvJp0Y3B5CyzjcLgHyPC2X0E/
	 ro3K9DS42cDNA8zzKCNlgZb0xGqOKcsQ8syp29owBbTl8WmGweVSpR923zJAosJxfgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795540492;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NLcacHh2AlI+z6F4X0aPUFEo3odgTr28TBoLjE+0958=;
	b=tvbX5NscNI4qokrSjptVRqbjTeT9gtUJzuYYYAh9hKg/Cgr5E2njc3jllSHIlfv5ahv5
	 pBDKfR/zW3EIWe65OM6Ey660fz4frsdi3c+PWnFHdFGmzugu1XbaTymUQgj5PLMbFfEQG
	 6sblXL4MjLaaR4iLzg2LFpRWUGBViSHnhnvjOyWPuxxY3sLy8yTIKevglgiaFO0mxjI3G
	 J4gqKth9poj2rYbLny7wCs0rxovL8sUwNG8+E/fGcbxeX7B0WFs9CntmqbxASK1QzhgBG
	 Vs+hJ9T8JhtCqF+VFHHWQIbSbh7Sc+VedWX1XK+t+lnXk0kLAjM0UakBwn8gYOWgsMg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20AA81F01565;
	Tue, 24 Nov 2026 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540492;
	bh=NLcacHh2AlI+z6F4X0aPUFEo3odgTr28TBoLjE+0958=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WoyQEfYmKrPjFXaYNQaBhQMqoF6keGSuY3wQiVd+3yFdPU/dh6Cg57hVSUirdlL7X
	 jQkXIjwV54sXFpUPUfzj/8LuAB+d3rnKvBvXRHtJpP7Rjm3wIo8RcIvwiWO9btVkse
	 +lZoti9BFbTmGy57L0qMXUrOtyn707/s8v/8s0KrafGPyTqeZb+a7y9dQVcY09LCkB
	 6XXBs9DuaPRZhRzeT/Kfz1fuG1WwNFJksM2PCD5vlfk33liencolapkX9Kc1CAaebt
	 Z/R1t8qxkGVdtX8X9XLlC1snw3/5OXfBpP4uSmm00HvFR/nsAZg+kBCe8QT7IBIcRy
	 B53I40GXwh+Nw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A1D734CB02;
	Tue, 24 Nov 2026 17:14:35 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Tue, 24 Nov 2026 17:14:33 +0000
Subject: [PATCH v2 2/2] arm64: dts: exynos: exynos7885-gta3xllte: Enable
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
Message-Id: <20261124-gta3xllte-usb-battery-v2-2-80bdcb1753bb@mentallysanemainliners.org>
References: <20261124-gta3xllte-usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org>
In-Reply-To: <20261124-gta3xllte-usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org>
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
 linux-samsung-soc@vger.kernel.org, Henri Ommer <henri@ommer.net>, 
 David Virag <virag.david003@gmail.com>, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540475; l=1850;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=8/qztykzuOZxhphrQU0aaqpVGh+Y9V0/eepwjkmIL64=;
 b=xxN/SEUrsf6G7DRd8I0L5w+daJviKds2Eahv+vUd/iz34IS2lEXrKVYDWEwVRAzpwya3rwvqS
 Cbv1s6dlKyhC8AzPDFguGL+FpCdY6gsbVNFnBdPLpThnm5NJygo6SSe
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
index 57df878cb563..1c0af6f89396 100644
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



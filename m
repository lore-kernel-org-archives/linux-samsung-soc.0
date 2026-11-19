Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117763;
	b=zIJ8XO2ySdNflsdUuz7Uv5lfxbhdOpzxVQksTdLm8AFDZfQoGeOprdL7yt7P2V+5tg0a
	 90aClLniyq67lBdYIkB7zyrJ2XDrXASvOdMI3j0C3E+U6wuHHHzYv4ZfL3yDlTO2Grayy
	 GAl4G72li6wtcF99o7zUJenJt1BRuriymsL5B0MVAL/THxX36xPgAe1OTIuV9XGr43u6H
	 +R7w4+A5HleGplKoLctUs/3tWneGZpfzH4IUan9mfHe6X2AwMnBjmc4Z/4H96FQrQAfI1
	 4CDFcoIZB3jmhTpjc5lcpTZQUhecBvDahShCsiHE5uwscD9AkasJmaUPvCvn6p5c9fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117763;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NLcacHh2AlI+z6F4X0aPUFEo3odgTr28TBoLjE+0958=;
	b=Ya0poT7jrkDwdpcMHT2MnzILatN6OY1oWosbt2Ve2kmBC6n5wY52eUrfkf9zGVV9QDcA
	 LPk3KYXBmoBdjVv4GOUB7YtoxeZUTHSnUIqf+dgWSzuxRwWcdHzEiQuoqHZD/P2TtZy5v
	 DpNWq9PW+Z74b/uiRmKnWcJkCKQT9qAWyx9EoakA4uDwdoOfDEweRHuJy3JoJO0TbKCZ8
	 f+yGjuywvotZ1GnLO7QqRRpGVKhbSL/I/sXkoDhxQTq1BaPdHENVmtAYGKLvc5oTi+veC
	 8a8bYjc0vclJNvxnZOYInLU3I2ilJ4CIC0mQPmiIeXsaNblftPfR554PMGODHpVOU5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhNainQ7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C70660A262D;
	Thu, 19 Nov 2026 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhNainQ7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795117763;
	b=xbN0wfuetxI9o7tITwX3XTqmCbUFV34EizETsMKuktfTzqHJful5xVPmiLzF1E74QdiQ
	 0k/0+VcExVg56t1QBXGSp+C3hu20gRxtruVEHHRtcD5Vz+6Eb7E83JWs/RtaIn0IMZTDk
	 8WlVd8/Oe0FiB4QgblbARBr8dM7MJnwqxxPKlaF0vu/rX9qTWct7f8gsEJVpgePdwV8AZ
	 p51W175H/I35C5G32dJdx7ihyc32JhxlZ5uOZWswgpeHyTn7HWRRJaOJhBGZWf/iL451E
	 6FC9Z2s6/Bpxw/YZvi0flc64DxGAI65rUDmANLEEE67kGJhaLx1rm1VQSgTjSPOfoRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117763;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NLcacHh2AlI+z6F4X0aPUFEo3odgTr28TBoLjE+0958=;
	b=jwgaTFbehMP690PVdGc+AAVXWILpVwqp1gN2HrDF+/qmu/qdeymUxwiYHqXxeuDNatRU
	 G+OWwPoxT40NjUwL2aDQbP8ahhkNrXhCKfEyMesDyRnMVugaDapaYIqCSZCO6Unt8bja9
	 yXXMksqlj7DYP+IZCOSWqtp5npv1GoGRM7gkc3YPA+MydwYUt9FFHrMpGtgsIWwsDIJwT
	 L5deioeYDFHcsacyGznQndcOMCp6Kl9eGey45fchZY/Y4D/zzgFoDHn68b+YHkkOx0ibB
	 g+QKHkKAXWNfN3z0eR99X11UMXg6/TXYp08Tp7G7m4HR2q43jmstXUPX4S4/W5tOmnQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70D061F000CB;
	Thu, 19 Nov 2026 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117763;
	bh=NLcacHh2AlI+z6F4X0aPUFEo3odgTr28TBoLjE+0958=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BhNainQ7RuGC5Xcmp9oIjCoZDtP9KgW8b/oFSBA2U2e5G76XdI5LZPtM2Ne15Wz44
	 pvGj0LWhGFGrba2WmnKmRpRdZfLNln3dYAqj16CCtKa84alQzMjB9UtnWEc4+jNQaA
	 QDTgGYftTWPLnln8xstBhwyLucBDn2jSBRZBJ0wWT4AORBiUvbprJFqAGufWY74Z5+
	 Ni5EQkC0Ih+qXmIk6P6KrgU3iDPaAsAX/tE11ADwEWl5ZQRbcWQIsGuNaXTAVl+anr
	 TJR4plFZX+v26JmwVr9h85yJjGu8ITTxU1w+jbf0bAnyeMGpD5Erm4G5bDQie1igQ/
	 tRWP6MDLJ+eLg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A38C54B414;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Thu, 19 Nov 2026 19:49:22 +0000
Subject: [PATCH 6/6] arm64: dts: exynos: exynos7885-gta3xllte: Enable
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
Message-Id: <20261119-gta3xllte-usb-battery-v1-6-0cf5f763522e@mentallysanemainliners.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795117759; l=1850;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=8/qztykzuOZxhphrQU0aaqpVGh+Y9V0/eepwjkmIL64=;
 b=21d/ypEdBDsGYrW/vcomA2ptJ+BSgDPuTOUObjThbEmYwTq/Bf9mVhfYVzfITsCVthjbT19Q6
 lE79g+pF+x/A02WDaQ+kJJFTZNSLX4Ht+dfeEFqjN9i3PwmH85FBKKk
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



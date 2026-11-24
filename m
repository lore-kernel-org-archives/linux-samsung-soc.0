Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540493;
	b=RZWUpzhd4D9FUXbg9P4yDA1/AzJliXf1IaTbk8XJ6W28qqQt8+7LCyH8sCzPyTHuntLo
	 qxxeABsEovq8hVJbD+nmSDOaPqFML8S4qfc3bAniQarvG2kzcgvb5tKyawVHQbm3ns0l5
	 lFa7PmKOqJefjjZzE7lufTxBkWQt+8b1/qgE/PRaHsT4pDFGLOkOF9PvrJVgZYC2V1CeQ
	 9YBMkQHvpjQrjkCLueO1U7+QN5j73v0aplrzAxdaGdeW0P7vnHXJs/4gkDLrHtZrnYxZI
	 yqfzRW4Qgvl1WskIgSS58sI+WFlJGKvL1BxK1VZKGHrICx997cVVDr7H1A/leQCSpLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540493;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tGaSlh8WowCpjefQ9EPxD+050Ca7Fij70+0D6vHAq9o=;
	b=4wW1xDcd0F6YVeiu1MIYvHPlNk9f6QPmr4au2EyXDkuVb7d0WaIv6BjfL/6ONulPRxuD
	 3NCqQCwH3z5ZDhXPH4KQ3281dRSwM1otxoLEaC+FffdBlcaukRpBsjgfT+oWIF+W+IWtM
	 ViSRpI7wzwe8bK0+zN3/oLMdEqBKT7JFUdwq7RicMtrBvkakEsbMHai3qre0jP9r8ySMh
	 13FIsymWkUqvjSJnfmVSMOiOUXbscGZAx1WqWx5sFSWibm06X3L7Acxzq6FJWxDl6pnpr
	 cT30PGK27Qiz0wVN5+y8+Umweyo19CT1WrrSxU3uim4NvVaaGv7ABL0Ho+s93+fjEwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A9WCnkGf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D5D606A332;
	Tue, 24 Nov 2026 17:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A9WCnkGf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795540493;
	b=qXMQcBTM6N/wJAZAsDGPo2yvnkaIqBroFSURQKmgO39gIht+AkAbr0Tjg85WHR95FKDB
	 O2215f8oOtce+X874EbAvBzpfPg1sr0OljePfZQ8vqOcNz/ja8R5IHBkuh9peSPYz+utI
	 Gjm+YqwbGhsiA1bJtleU0/4zWpmnw9C3EWInINV+mbPt7ntENIvgpVp1/aR/aD1Now+QK
	 AURq5nHVj+rXxcbSMpVmDyPdmbr+ICT0y1h/17nsuHSZh10XgFrU8VIkNB1iP9OxT3YRk
	 VY5jM992FQngzw7Xm9Fco6dgZVZSL1HCFclKb2XjmDIKPimV60ec6SNMvOh0IMOcEpw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795540493;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tGaSlh8WowCpjefQ9EPxD+050Ca7Fij70+0D6vHAq9o=;
	b=TnLUIfRfKXekXXvBBLVOe6ID6Odx/93/fJ4DpbV4v4Xz4Mkyo5FHCwgIJaHTUO2syIq7
	 1rkDY7DE7UNhH2xoGHvqNu76tD30wIXU7xw99ldefPIjNVFkOVfnjJlpCb89X62wJBi5E
	 5St897Wfei+o+HvkCPduLVsIcrQqs+exkKfiGJSe2AFHmir2Hhf0QWXgyh4iMOjIkZFSI
	 1dtGITCoMG6+Ad7fm1JhhYmjnh8AS5noE8GYs41rlF8Bn4vIHfBxGDuZNj6GSBCYIg2Xq
	 +IXO10uPzzDi9/zgI2od+PLYOb2uENpPSh3kPTLbW+nrEC821b2Hhg925Gt92hF0IKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CA381F0156B;
	Tue, 24 Nov 2026 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540493;
	bh=tGaSlh8WowCpjefQ9EPxD+050Ca7Fij70+0D6vHAq9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=A9WCnkGfWsStu7pdPjuelGK7wBZTRen74um+zh+aP2TuBg0C/XQp37Z3l8tb1EMRA
	 0E4sNLQFFPJy5VBtbFqJCDYoXshoyvQqd1KjMh5J0vhUfRHu8Uflv481ktErMJs+G+
	 Dm67wZGQLKFPTjaGnN0BO7Esvp3MfQdHfDNpH3QPYHBikMb5m1N4nKWVITWtirlS6S
	 qY7GHY6+mr1gIIs8FWKyNMRZc1nCBnvxdRPVaT6wxb/d6+jLmXZYEYKH3iAS8Hxlyc
	 qM+A85rtJ8+sRhOsA9j22LiisCNgmPi3W8PLxLjRwv0SVfkpWxacJdG6I6LeH2UK1R
	 AKHLVmVlZL1PA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 862804CAF7;
	Tue, 24 Nov 2026 17:14:35 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Tue, 24 Nov 2026 17:14:32 +0000
Subject: [PATCH v2 1/2] arm64: dts: exynos: exynos7885-gta3xllte: Enable
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
Message-Id: <20261124-gta3xllte-usb-battery-v2-1-80bdcb1753bb@mentallysanemainliners.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540475; l=1489;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=2sc//xhMdQLxeTbKn3e0zeBob0QS6bolzRWDj8BhCrE=;
 b=o9CZzwH0fykt7/8/HjQfcWLgxRlRcPq8iqZ2/s6lVdr97PQOOvSlOul6xoVAVIbfyWATm2Ars
 +sC8rjeEMvZCe5EoZMWLE90xrlQ9bLL38+0KOydi/u2YfilSj5hbyr2
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



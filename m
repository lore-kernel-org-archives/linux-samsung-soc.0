Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4B1B21A7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 21:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739827970; cv=none; b=ljnWy6a1/6btNSAiFvqb+nHgwjnbuLjEVCDsXJC/cg/PtuGY68ucyS7fJdXp7/lBErgTTajiupTyAFAsqZsReES8g1oCvDD+mAmCsNI0EVxdsIwcwCf7i6mZEVkqKzQawEIdHa8tmUoGague/nq/udxHofKAAAnO+sCATwF2PKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739827970; c=relaxed/simple;
	bh=hknFIwkcGKVEGhAUgTXGLYiwzwz0RfRZ2lihmtn+v/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nyXlSTZ3hBm2mqID4N3db2SSgeNW+/qs4U1OsNRoYof8W+4LePOhDjRvJIc0Nc2O8bMSehsuhBPq6BCXKIgd3saMuLchLapB1NFXtPAQLRyT9s+QybSE819tqJq3pHA7wRCk5YfeIrLuf3J/MLrabUl1DKBtYE+bSQF27APLtD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=FyyomyIF; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="FyyomyIF"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=FyyomyIFr894CgDIEux8ZVTLlr9iRlrf10hjHZQvghfylYvqXbQxo9Np5Bgh73NSQGNruarZsqAq0p5lujyvWnY+lQhibpzM6vvzSQJEy1LEuXBFJSEhmlaXkMis2WVE4Bj1c0wXJZCkHhwWP/2CxLAzppfnDj3F0qKCjnfNlkS/fIRg8rN6rPgsddlkw1aKAKJV1sq7BKgUcSw24WneoF4W9b3dOJACJtEj0MnDtS82N3ej9/boWN5gF4jondntQvY3/JXoxa4LMZZUIFyMx5zTTx9Qq6VIhkYqbx6w6TsBjgwUw0VQJakdH9aTZlZ5iS5mBVsm0MeObI7oGCge7A==; s=purelymail3; d=purelymail.com; v=1; bh=hknFIwkcGKVEGhAUgTXGLYiwzwz0RfRZ2lihmtn+v/I=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 42194286;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 21:32:40 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 17 Feb 2025 22:32:07 +0100
Subject: [PATCH 5/5] arm64: dts: exynos990-r8s: Enable USB
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-exynos990-dt-changes-febuary-v1-5-99935218cbf4@mentallysanemainliners.org>
References: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
In-Reply-To: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739827951; l=1236;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=hknFIwkcGKVEGhAUgTXGLYiwzwz0RfRZ2lihmtn+v/I=;
 b=xcil7QKlppQhkwxh68VRTzsZH+KuVGaBTaffQMihrQKE3bFYFXcERLOFxo+PnFC41npBGAOhT
 sZBJqNg93CAB572kGmCPeZsiXIn4NmefBAZ3LjTr9MkUVZt8m9zg81e
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Enable both the USB PHY as well as the DWC3 controller nodes.

Since we do not have any PMIC for USB implemented yet, use dummy
regulators until we do.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
index 6bae3c0ecc1caae31d2c6b6e81bbd76a4ccd6f5f..55342db61979bc28e65f68c9ba7d6b452dbf6c07 100644
--- a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
@@ -44,6 +44,12 @@ memory@80000000 {
 		      <0x8 0x80000000 0x0 0xc0000000>;
 	};
 
+	/* TODO: Remove this once PMIC is implemented */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -113,3 +119,13 @@ key_volup: key-volup-pins {
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 };
+
+&usbdrd {
+	status = "okay";
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+};
+
+&usbdrd_phy {
+	status = "okay";
+};

-- 
2.47.2


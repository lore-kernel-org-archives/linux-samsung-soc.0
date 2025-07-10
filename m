Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2032F004A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752166275; cv=none; b=jrAh5JvzuFbStQbdua8DS5EPCDX/oBebS124kgJTt2BhpAYv9CMN9OdfBVpay6P/ezD144+wNQWzIjyhQ/FwB3xrkIPy9sNquBPdcs2nuKqRj4zh4TZMvooCSAbKdnI1ks4uAPwE3rPfhq0++BeQAikzUPyQYMv+XTSjgT3B0No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752166275; c=relaxed/simple;
	bh=hknFIwkcGKVEGhAUgTXGLYiwzwz0RfRZ2lihmtn+v/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OX41E9yeN3hm92/MTRLVjcAy0g7mpMXeEeF+UybQu6+E81fhfz8z/QSqDmMeGBPFg15bICOnhKZRsz/njYIPykaHbBhMOwK4DFO98I/U0O68SJZgM+MoMeF4e6R6kYevnuLi5Peuq5f1XOzYbLm3A2BUHRMrnqo7EDr9rxw/NY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=h35GuMk5; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="h35GuMk5"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=h35GuMk5eju5NI5/LGJ7liDrab2T0HxDd6ftADlmxrt8ur1zxREEhR5xgaYzC8OFf0h1/SyErlgMTRwLLbx6TsGU1815dCZXYkDwau2jJAw8OEhk6oSKpOZHtyiyYuPh0VvLMot6Qh3t9FeGm03gkmlSz6HLzPCn6AJOY5/L+E2yvsAJ+kloB6yK5XexlPor7CyN7LWT2lZ1wOxZr30i0YiklDNgcTkdL8Wd56I/ognUVgZ/ATPDlz7CBW9j2aTQKcUtN0sjOgnq74vmBZa9gxNsim30x0keXp3UHa1JDtsy4Q/QUWYRKZm7Z92qXVpVYePYBbf60I74/mK7he2kBg==; s=purelymail3; d=purelymail.com; v=1; bh=hknFIwkcGKVEGhAUgTXGLYiwzwz0RfRZ2lihmtn+v/I=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1992400030;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 10 Jul 2025 16:50:44 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Thu, 10 Jul 2025 18:50:09 +0200
Subject: [PATCH v2 5/5] arm64: dts: exynos990-r8s: Enable USB
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-resends-july-exynos990-dt-v2-5-55033f73d1b0@mentallysanemainliners.org>
References: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
In-Reply-To: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752166235; l=1236;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=hknFIwkcGKVEGhAUgTXGLYiwzwz0RfRZ2lihmtn+v/I=;
 b=ynBO6kmtohpJo3p5lxLXPL57n/QpF8Lx2UHxcFcKg0YmDmr3vudy6s1QYzYLQalQbz3gK2k2N
 IG9BHBog/VaAplFRDtiKJ3xdAC+skHG0iNoJuyjYufbdAbUzTiRAAIC
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


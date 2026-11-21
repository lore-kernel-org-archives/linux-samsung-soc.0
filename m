Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795251720;
	b=bx6Am9HsSKJKSknPDF8P/CgiodGlHvNf5uO0fBNe1qp0DBR7Y9FRNDhojKnwtiIzrZpd
	 Z+WCyODcUy3dN9p6Yj/YTcUrfP0XCx8ZlBvq4NQSj1lMG1lJ2q742y7dILAfmYu26WyOZ
	 sr+ptyCU7sHK0mKVJm0vkacrwZRg3xHUkxP5khjsk6MMvA/KDzdn1QTJYPo0xa/b6rbbb
	 FEzZnZJBtUDYYwNW1eW6cQMeYGZyE2pO754g5r22Ny/piIOI+YL4CWK8B7kVC2MWXfzsO
	 kuPw8JvEg8J/SiS8a9eEANkm4Wg3kq3e9ladMukvrOTKiI7xrRkWEvNs4wrWWSe9XEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795251720;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=4G5897CAeWCxhJiP+gkLr8DLihG7IAvXy/0cmceGluY=;
	b=v9tbNkI2JWS5aORglkNhNBQqkPSFkcBiL6DgaHc/TSyaDE38tek1ay3foOIlk+X/HFr5
	 P6WB1NJ3zZ8CSe8NfG6dQZINf+Wo3PZKsg68hKGvoJWKgT/8+m4xYDHpIeTIrSZnQxMiL
	 +s0tNQ2TtKOO7c+cU6viwrYDRtNyGBHWaik//mE9Zrgwo6Jq0HOHbSZbR7Io+pu06Le3v
	 hcLktr/Sn1M2cYRPu9f9DYEccQh4YJGPMR+4aCzrg1kxPTxHaEp9Tx24gNsXl31T0zqOx
	 nr+qLSA4oqohsr6KBz8oSyTrqxCN2X5afiQy7g5UIf6Ogfsj8bBtOcTj1bhR9OqXSqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ommer.net;
	spf=fail smtp.mailfrom=ommer.net;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=IuFfuwP+;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ft0dI6M9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A81F606A681;
	Sat, 21 Nov 2026 09:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A81F606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ommer.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ommer.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=IuFfuwP+;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ft0dI6M9
ARC-Seal: i=1; a=rsa-sha256; t=1795251716; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dl12HGKcezvNB51Mf38ofOCRVdnVsFXEkdAr+R9jiCTD2R937kCuEe3ejdrtsuE6c/
    N7yNKMOUSAzMbKQxfpWtYmR8MU91gzS0p0g55NHY7jdCyedxS2LA2j7CH2UaWG8lXeEv
    x8+3BDsfMwBKWlgbuTz37D3ga+DD8ui4F5JmHpyWZSWfM2K6dCj4uja7CL5/O3ZZcjOv
    5AYixUpTay9M3eH2s2oZmIsIZriWssyCBLIc5FDLfBB8lNZ4X980765v/ummkRmhpayQ
    uJpD2oqcWbQFdNAcPNNpx72M81N9so+nTgGDQi5iF7HDLCOU2uwnbu8RIXpsWGCCZUBC
    YmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795251716;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=4G5897CAeWCxhJiP+gkLr8DLihG7IAvXy/0cmceGluY=;
    b=lYgynkrwCFVRyYDE1SL9oXv7ws+GKLpTI7/Z6fb1z8PA30QUd/Qkr45Okm27VUnFY4
    zxW5bTZ248HuNsTPiv6mCyaq0HtfXqe+WJWe7VZto8ddWUn7lkW9/9A59uLMtumta846
    ynXrBNme6NqT+OJYPxWb0FE0WgwBQoTA3z/FRnoZlDDQ+SrCaiqHqrTJrtM8bzNmi/7f
    l2CHRno0+I+jn3KUzZ7TNVNnydCnQ71IzIKZC8bzIViXwjl3D8+7gAsH67wAQJxXdL+H
    A0elNkjQgvw4DRYzKr9/Z+8jkuvWJvvXLsERf7ZxBAELoSeCtt5XYaMg+JHx7kVciOrp
    zBiA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795251716;
    s=strato-dkim-0002; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=4G5897CAeWCxhJiP+gkLr8DLihG7IAvXy/0cmceGluY=;
    b=IuFfuwP+7KjHk8IOCKP2gMZx6q/CttQdwMyGyCXI7AXCSQepX6SObWGdLHtZeOTVTS
    bHhLVf8OOGm1YtbtbKMyzzf60QuT/849B/ophDJMzw/WvVFuT1Z3qUTR2k3OWZPDzzVy
    9lJL6lnId4viBQNtr/DARLTZNMYF4TwGE7MaogRilgfuPBG/t5uwiB5u6Vk0eS0lQJVW
    56Q31Ylt6R3TgPek4gfkSZjao2t3atHtzDFw5bShyf6qjdPOti/9WcLpEsBLy9rpZKdX
    cCvNw7LNxx1KfYeY1dKipPq+Z3xn+fu6ib2SyxQtPakZ5pzXv8SAxZtSutNvbn2KRLW4
    fd1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795251716;
    s=strato-dkim-0003; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=4G5897CAeWCxhJiP+gkLr8DLihG7IAvXy/0cmceGluY=;
    b=ft0dI6M9IPBLCjpw5k7HumzNPaBEU/YR/A0lZ4qVB/XLPkzr1mQyQQEKZcI+fGfxj9
    x5B/sCeM/89dKN0orBAw==
X-RZG-AUTH: ":JGkKZ0mIdPJLfj3rk5MOrv6kH/tvwFubxUqMvsWOyVXJkOABZnPqvKUstHY8FQgi4y8Fiu3j5HL2zuVyTQ9NDYXzNSFFaQ=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id n2f42d2AL91uVCE
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Nov 2026 10:01:56 +0100 (CET)
From: Henri Ommer <henri@ommer.net>
To: krzk+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henri Ommer <henri@ommer.net>
Subject: [PATCH v2 2/2] arm64: exynos: Add support for Samsung Galaxy A20e
Date: Sat, 21 Nov 2026 10:01:46 +0100
Message-ID: <20261121090146.39170-3-henri@ommer.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121090146.39170-1-henri@ommer.net>
References: <20261121090146.39170-1-henri@ommer.net>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

This initial bringup consists of
- memory
- internal MMC
- GPIO keys (volume and power)

The device boots into LightDM on Nura/postmarketOS

Signed-off-by: Henri Ommer <henri@ommer.net>
---
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos7885-a20e.dts | 123 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-a20e.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index f1946a95c..f359b5776 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7870-j6lte.dtb		\
 	exynos7870-j7xelte.dtb		\
 	exynos7870-on7xelte.dtb		\
+	exynos7885-a20e.dtb		\
 	exynos7885-gta3xllte.dtb	\
 	exynos7885-jackpotlte.dtb	\
 	exynos850-a217f.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos7885-a20e.dts b/arch/arm64/boot/dts/exynos/exynos7885-a20e.dts
new file mode 100644
index 000000000..24c4d137b
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7885-a20e.dts
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Galaxy A20e (a20e/SM-A202F) device tree source
+ *
+ * Copyright (c) 2026, Henri Ommer <henri@ommer.net>
+ */
+
+/dts-v1/;
+#include "exynos7885.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Samsung Galaxy A20e";
+	compatible = "samsung,a20e", "samsung,exynos7885";
+	chassis-type = "handset";
+
+	chosen {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		framebuffer0: framebuffer@ec000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xec000000 (720 * 1560 * 4)>;
+			width = <720>;
+			height = <1560>;
+			stride = <(720 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&key_volup &key_voldown &key_power>;
+		pinctrl-names = "default";
+
+		power-key {
+			gpios = <&gpa1 7 GPIO_ACTIVE_LOW>;
+			label = "Power";
+			wakeup-source;
+			linux,code = <KEY_POWER>;
+		};
+
+		voldown-key {
+			gpios = <&gpa1 6 GPIO_ACTIVE_LOW>;
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		volup-key {
+			gpios = <&gpa1 5 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3bc00000>,
+		      <0x0 0xc0000000 0x40000000>,
+		      <0x8 0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		cont_splash_mem: framebuffer@ec000000 {
+			reg = <0x0 0xec000000 (720 * 1560 * 4)>;
+			no-map;
+		};
+	};
+};
+
+&mmc_0 {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	card-detect-delay = <200>;
+	clock-frequency = <800000000>;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	pinctrl-0 = <&sd0_clk_fast_slew_rate_3x &sd0_cmd &sd0_rdqs
+		     &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
+
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-ddr-timing = <2 4>;
+	samsung,dw-mshc-hs400-timing = <0 2>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+
+	status = "okay";
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};
-- 
2.56.0


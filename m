Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991408;
	b=YbUaxhmtQAL+80DlC1TeALTZF302ALZZVYpb+HkvpuoWr8ENJWVK6GcVumEjFLaicunI
	 sed/v/QsiGsSmO6rvvaAw/gF4B305lT4PXY6X4QEqTRzoeryIuNsxk+yDxh+QpQac7de2
	 fmQER84Me0tCDnd9baqu6INl5cuO00H7mbOaDnCS56qbGBab4mnrgyhU7srJFhgmaffTx
	 ugs1wtreIbmaky8DryLPUu87dh97GAdTvmaVVXjE6dpI4W+Bq5LT4ZaAthZxuMsgSiuCA
	 8Je+guyOwq6AoNELOlv5QUz3X0Jig17vOCKD6bIPbxBv2TQgBjhX09skHwBvIZ2WO/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WtXMK7nafDq4nF/muvbhyZHVq1+wfpdpFg6fV8GOli8=;
	b=U3HsQOr9Ahl/hFLOkp42iAZC5YRgiNbeDZRJ39qOz7MYWBUQoIV9OHJEhiL9VbExuLM3
	 jswEjhWKcLGpCZxAY1H9RW4KCPsDCb6H5pcaRjSt1uwnT+4nae4mXR8DhpTR8+f3hmJsb
	 CL+vo5dS4075A6011j23cedatRjo6tcpFAbpdpN2i3vI3F6tcClA/IFtY2IGT7457By1J
	 QYJD0Sjyn7JIt9YsgXMTzuBqQDlSbowdbbqvYoFdyzItHmrLflAtpXTWJV6NWir8zMTkd
	 VBHnCBePizgqYEW08PC5Hb5KVoZkuCrzQhhV+bQoxTfJvGzcYDD07lt+8caV4WMmITg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VROO+ogq;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEF1606A32C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 08:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FEF1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VROO+ogq
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-372bdb942dbso940018eec.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 00:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991408; x=1795596208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtXMK7nafDq4nF/muvbhyZHVq1+wfpdpFg6fV8GOli8=;
        b=VROO+ogqJns+EnDqW36fjRmBhLzkWPI/HFbzhAxc/QY7ljuFYEmKvs8XqVIstQk80I
         fDoDHKYm5Up2k3Drer8iyhxSI6shDDVDBfmeu04gbICfE5mnOVgcIn5GPtMMo7C7A0uL
         ZuvoT+LuFzbjL7cBRKInQd/+X4cX0LOxoRhK+iqVdaqTONd4qF/hT404TL4MVGZznlqc
         jxsZLbCWIxJfbdSC7+1u1QyhhN8r+CcQY5IrrjofoZV0+Awf5O5H8xX23/ZknNFMVscB
         /Mr1yf3Fdu7B5P16Gm9aG+opsZmJheOvizwbnYWFDwMEVmbvnEEZOZRX3F5mzOMw+8bT
         SrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991408; x=1795596208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtXMK7nafDq4nF/muvbhyZHVq1+wfpdpFg6fV8GOli8=;
        b=WMaPbaSFCLamAXZCYzipaWRBG+qKA/xRBRyfkLFyfnYdd2hGPoNTe+1F6P/soscuUB
         5wJhnyynVsb+VWd2Q9asM0nSxq+NPdmH6KDE2lEey0fhfDFJqJZOIHufwLl37SxRuLfH
         a21v8TksS2b3mmXPAfISRsiwE0Fe6XI+eJnUdOqg7Rt2rRHjUvuyRVqtz/OV+crPm3Bx
         wvoLIyCrUgAm/ti6gCzzkKGPF9CJ3dS08X6V7d31r4kIn3Uv5dKYrGn86unrLhVbRYcU
         hXMVWrdhyu4xJyxlNRX9yUhL7b97jbT/PVAw2Bf8+vL+eO5RjjWTeuamdEnxCzVZ92SO
         nbMg==
X-Forwarded-Encrypted: i=1; AL+hErGdl2RY2ES93QYhl+CejhkTxIeoVjb/rAvQi1VMOUYqrH4JetReymJqFCZJXpkD4/9zQyYVDgxAT1G9wwYN2h7/2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z95v40IsIU1Q9KHDv6RPSmZlyYiCZC0KReeM9jteZ5FyHiYEg7f
	bAaq4BOpKoqzGYjLw6RZfwBNr1OXxXCMgqnW1CUrDN5ZpiMmvaa0ifhteXWURO7pLDcC5A==
X-Gm-Gg: AZFdTZez4+ClfEBUBaFIiVd5O/UYJCG3z90g/GRYBe1yXHFFP/rK1sVHfeA21y5zKwl
	c4py7Aeof9ITaBrJsu2SaioJiCW4HOw4UYExCT3BjCa6AI9RstEZT0Qxl85yxEdFreX2LcfyTTx
	mplgp+n3U+7B//jb/qmYlmnMxh61dWFyM0RSBrkj5UmAB//BMfbyvZq1Krzn78HIgBIMvoMrC7R
	/SAs9IDz3D9a4zYCngpSZpAk3eKk6eAMxHKBxXgiF/N5H30uaFaG4b3guz4ABFgF8r6CnJt2XCc
	JPfttWsWmBuK1dmVK/C4Ucs+5bptoIpC2sj0f7eOsFXaGdwMCgaCkreV7WqrQ1juVpYd0VG/BYj
	NGDRwD/zZzZi+dMZpkItLCf6WPFjQ3v0VZBFdim3fOpMf6VHROfueAnZOMJ5Jk5FZecPARgBLbg
	KHlcQLmDVBZBZqRGB+FK6T7Zc7wlpPp76uAbrb//AkHI0I6jw/BzTc4W90Z7gQq3hGcfF4sFPYJ
	9QK2wH7YDuukODJQAd+DW9XNMS3gjAqYcKZ9cyvaGzSlAdkmqTQdNM5wIMIwRBGsjozWLzJUO7M
	3vZQc2v2MPrXB/OMS02mNArUqGsqFrYpEzcgQ2sYtHRd3MfMFvFpxjvpfOagRBxZk0wn7i10iQ0
	M+6rJeQ==
X-Received: by 2002:a05:7300:d214:b0:382:42a:d3ea with SMTP id 5a478bee46e88-382821d53edmr1784295eec.29.1794991407621;
        Wed, 18 Nov 2026 00:43:27 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm5508771eec.21.2026.11.18.00.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:43:27 -0800 (PST)
From: =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Date: Wed, 18 Nov 2026 15:43:00 +0700
Subject: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for Samsung
 Galaxy Note8
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Samsung Galaxy Note8 (SM-N950N), codenamed greatlte, is a mobile phone
from 2017. It features 6GB RAM, 64GB, 128GB or 256GB UFS 2.1, Exynos
8895 SoC and a 1440x2960 Super AMOLED display.

This initial device tree enables SimpleFB, PSTORE and GPIO keys.

Signed-off-by: Trần Trung Nhân <nhan.094.vn@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts | 124 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index f1946a95cb42..1faf01dab180 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos850-e850-96.dtb		\
 	exynos8855-smdk.dtb		\
 	exynos8895-dreamlte.dtb		\
+	exynos8895-greatlte.dtb		\
 	exynos9810-starlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynos990-r8s.dtb               \
diff --git a/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts
new file mode 100644
index 000000000000..a7cfccd59bf7
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy Note8 (greatlte/SM-N950N) device tree source
+ */
+
+/dts-v1/;
+#include "exynos8895.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Samsung Galaxy Note8 (SM-N950N)";
+	compatible = "samsung,greatlte", "samsung,exynos8895";
+	chassis-type = "handset";
+
+	chosen {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		framebuffer@cc000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xcc000000 (1440 * 2960 * 4)>;
+			width = <1440>;
+			height = <2960>;
+			stride = <(1440 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_power &key_voldown &key_volup &key_wink>;
+		pinctrl-names = "default";
+
+		power-key {
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			label = "Power";
+			wakeup-source;
+			linux,code = <KEY_POWER>;
+		};
+
+		voldown-key {
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		volup-key {
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		/* Bixby key, mapped as a camera button for now */
+		wink-key {
+			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
+			label = "Camera";
+			wakeup-source;
+			linux,code = <KEY_CAMERA>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3c800000>,
+		      <0x0 0xc0000000 0x40000000>,
+		      <0x8 0x80000000 0x80000000>,
+		      <0x9 0x00000000 0x80000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		ramoops@92000000 {
+			compatible = "ramoops";
+			reg = <0 0x92000000 0x8000>;
+			record-size = <0x4000>;
+			console-size = <0x4000>;
+		};
+
+		framebuffer@cc000000 {
+			reg = <0 0xcc000000 (1440 * 2960 * 4)>;
+			no-map;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_wink: key-wink-pins {
+		samsung,pins = "gpa0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+};

-- 
2.43.0


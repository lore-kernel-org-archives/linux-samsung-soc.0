Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCD23D4127
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 20:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406868; cv=none; b=bbPC7KeEiIX1osD9qOscxGH6vA9UpenDnt7fj/rOIoCVGINn9tyG54H7b/XltrrUq/zivNW24+1zFqCsp4e8DDMCccUkWODlBFE/DYU08CoIFQdsXdGRqHwhSzezskxrdDg556XH+7Fsx6dGik/MWrW4rfym1a7inMEXYK8aaAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406868; c=relaxed/simple;
	bh=91Jr18vVzfVxquYQHVRz08LrBbzSjFimJpVSdAg42Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVJ+jbq9hUCt7VwRcrMUViwj0Hu68BpwQ4O/yAuIF+lwXKZeJRIYDnPsH3nZZ27RVNzFPr9XaX+LJXTaPRdcKUaXUAGqxgxXaitNnFkKLneyqjhDzJG+dZkO9D5yYo9mRCFgkQI7cCsjI3SVwE8oyH4Ej72tM1BKwPyEqKiHL7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mlzutQ1Y; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mlzutQ1Y"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso3258060c88.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406865; x=1778011665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4z+F35aj0Zw+rehp8tVxMlZOUqU6/YdKeXG9fNxlPfY=;
        b=mlzutQ1Ybi0XOPzWC891b1KD65Argk5xXWrYLq1sQymwC6WbJJg+vjUBlSn95exkSa
         Q1Ng4czKlFVonm85QUbgqVVWxwpi36H4U3O3lnRB3zwT/rLxRVPsEeQi3vNarThSLpNa
         338BW4Hf57O1P/rzC6bfni6qiF98VuEy8AtN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406865; x=1778011665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4z+F35aj0Zw+rehp8tVxMlZOUqU6/YdKeXG9fNxlPfY=;
        b=LjFlTCbg5Qc0q7FE4N9W5ehGvfeYMcmvjan20zyJxHDejquxTg2yp8uRNLKoBCemLN
         tELppFTRuK+lBKxE/n0lLaejb6O8K2aqoRrWVeSae4xsUozpKzzLY1Ey8YidMUDGZPcW
         AmZZz6f10UkKHPeHtIutQHwxLevok2dfVygEQmVOW9VImUGCnhNVW4yKjxJRvS9ta7L4
         xrPKGw+/jC5E3UdITn5uGbSaGDdUsYntp5A0A1cbEJMVGy9xdYW4SF574gcVjs0SAF/N
         LpzmHt9NETcMiOZ8/6Z8SZ5oPQnCKROzVnkzkRzss1fRUbVrjPLX20yduMmg+UV491gA
         Xkng==
X-Forwarded-Encrypted: i=1; AFNElJ+NEeazMhSXLTWtlVrBRLM5ozOixxxcMplt/aMO8MyiDRvZip9boq1D7h9YjUROgodujeVzRJdhBemnC9F7ORV31A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCmvNi2S9k4T0h7umMes0K87E4Hyj76KaLIfvFDt42TUepZrRl
	lMS9QLPPKPGLjZJviEArEyFgv1neYU5UEq3+o9OmFXB3yrDbuhrC0u+Mibb9buO4fg==
X-Gm-Gg: AeBDieudsT5q+nKB/b+zfqjAc/HBJIYDUOci6RfcNRTs4U846ns5zFwh6wCFPmngzsD
	BFNo1iMFXNfp+t+xDidLXnIyX/cr3RGqJAQWU3rZ2y4NZZsLbpmEKLep+gWfeiTxQFGLpeTh2cY
	6IXaAU3sUpSYkTMSJX6NnM9wyqgwpdZdMC25Ej+8rlH0KtkMwt/Zj+VN9VORx7TVN2RtmIvD5RW
	eqcpQ63RVFY2Rxph650P451HzyXt/dQbVaktrSAe3U+KRsr7PM2q6CzshHwLJqjmNnIb7FBzYQg
	TTlkyHs0SFDS7yCpuXur9QnROMSzbrv7ZNXaB19QMrxDRBvZZhlFDiKxh/xtr9Y/4Z0UKt1ksJp
	vMlqzefxDwurfZ0idDKICTUFW7z9p6GlpkfW6SbxDdh0xdGIEk7Xw73wZh9Tnj6lci820Z/ErlN
	0GZcX2ws6I+6sgs0UHEkJvour7mWgRsFx1qxVo3AgGXz6nW5FGurrWYPBNHXvo8SThQQiBex90
X-Received: by 2002:a05:7022:660d:b0:12c:8b9:720c with SMTP id a92af1059eb24-12de2a330a7mr383827c88.18.1777406865408;
        Tue, 28 Apr 2026 13:07:45 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd9a63a7sm3079240c88.11.2026.04.28.13.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:44 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:57 -0700
Message-ID: <20260428200712.2660635-6-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
        firmware {
                ranges;

                coreboot {
                        compatible = "coreboot";
                        reg = <...>;
                        ...;
                };
        };
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
 6 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..777da2129e77 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -16,6 +16,11 @@ aliases {
 		mmc2 = &mmc3;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index a8e257b21a88..a906ec1ce672 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -21,6 +21,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells <2>;
+		#size-cells <2>;
+	};
+
 	backlight_lcd0: backlight_lcd0 {
 		compatible = "pwm-backlight";
 		pwms = <&pwm0 0 500000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index ff20376a44d7..2b327d9ef65e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -26,6 +26,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size should be filled in by the bootloader. */
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 8e423504ec05..ed63c74cf238 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -41,6 +41,11 @@ dmic-codec {
 		wakeup-delay-ms = <100>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size will be filled in by the bootloader */
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index eadf1b2d156f..b3850be25594 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f1ff64a84267..4992631dd504 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -42,6 +42,11 @@ dmic-codec {
 		wakeup-delay-ms = <50>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.54.0.545.g6539524ca2-goog


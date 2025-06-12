Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7E92D3207;
	Thu, 12 Jun 2025 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741863; cv=none; b=pGjA3c43t0Fq8Rjd5xFQKPM2ztCzxY5FMwGjwxoIj5VLl5uvO2yWHhxX/r4r1jHD4KTnDXRzlgJHrmwxGsqfkO4hQQ5FRWZKgRfBHqZJrw54tHZycfyOSH04uH8pfBbQsct+pKp4JGdllac+r5u1nAdYOmd5UYylrGPljtMotL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741863; c=relaxed/simple;
	bh=W/nkKTD79z758WQYParQygtnrS69BZz3GsqxffvPYMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W/YKnDh51lw3bQabrTKN2O9lkLLCY3dMzhNl+buRwfKuFRkr8tSTqEPcTXFW/XJj6dNU7YYu5IaQwYNxBvc7x4FCEMC1elYgp3gUxLDgRcKrr+LpdGfYz+R2gxMIBf3FqKEoNNaIK61gF+m7Zp0T2zIWDjKAD/osoWcx/7HqihY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=AkWx6u+X; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="AkWx6u+X"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 92F7B23069;
	Thu, 12 Jun 2025 17:24:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uAinr5v5Vkf; Thu, 12 Jun 2025 17:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741859; bh=W/nkKTD79z758WQYParQygtnrS69BZz3GsqxffvPYMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AkWx6u+XW097M1uy+DN8YqHuvpeHd+nFZVWmImaV4oLpv6pQ4eEfBa5lwTVX7bYTv
	 XJixKJCgRXikkjnnx9FsohvIGtZ8OYW2bjYZ4yfmfL8W90rntslmB5kcCLrWYLB9wF
	 /zEjV2ZPtDblV1mGBjZi927u7GA+dTCbAJ+fMAkcHGkWQwCwBIZrTodzLou6E1tOmd
	 DJNU5hTcDT6RiIiWwsNVGmbofXR/85A5oD6CGlUTCI9S++mD2XUWb4NPgHEiWlA8RF
	 HiPfNkVPx7uuavYW3dj2Ul44RqcrsIE0yOFlYnmfM6hOKcpIdN6UiB45fNDHBiRZax
	 taHQLvrb8smUQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:53:39 +0530
Subject: [PATCH 3/5] arch: arm64: dts: exynos7870-on7xelte: enable display
 panel support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-drm-dts-v1-3-88c0779af6cb@disroot.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
In-Reply-To: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741830; l=1722;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=W/nkKTD79z758WQYParQygtnrS69BZz3GsqxffvPYMg=;
 b=67U66+f78PB0MYl2wyiD9HsWaqEzJEReAsaeb17NmF43CNe5hmXPI6QUkH1sJHbN2EVPk9c/I
 ERXl1ASIfjuDoihJYxLOEPJPzNzpRJGyEN7pjJflLlI7zkvftd9M2QP
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, disable the
simple-framebuffer node in favor of the panel.

This device has a 1080x1920 Synaptics TD4300 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index eb97dcc415423f405d7df9b9869b2db3432fb483..86a7fc2554a137752862c37d27cf9813b3ac5514 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
@@ -40,6 +40,8 @@ framebuffer@67000000 {
 			height = <1920>;
 			stride = <(1080 * 4)>;
 			format = "a8r8g8b8";
+
+			status = "disabled";
 		};
 	};
 
@@ -122,6 +124,44 @@ vibrator {
 	};
 };
 
+&decon {
+	status = "okay";
+};
+
+&dsi {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,burst-clock-frequency = <1001000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	panel@0 {
+		compatible = "syna,td4300-panel";
+		reg = <0>;
+
+		backlight-gpios = <&gpd3 5 GPIO_ACTIVE_LOW>;
+
+		width-mm = <68>;
+		height-mm = <121>;
+
+		panel-timing {
+			clock-frequency = <144389520>;
+
+			hactive = <1080>;
+			hsync-len = <4>;
+			hfront-porch = <120>;
+			hback-porch = <32>;
+
+			vactive = <1920>;
+			vsync-len = <2>;
+			vfront-porch = <21>;
+			vback-porch = <4>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.49.0


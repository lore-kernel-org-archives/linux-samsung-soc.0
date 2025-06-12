Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82AC2D323F;
	Thu, 12 Jun 2025 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741870; cv=none; b=NR1/K5BTMRmWZcyv8+/nPP124VtMor4aPwTsuNsHK6z59pqUTs1A6NTAljT4KS6uHNouU96DPm/+6JUQJXTmbz0YXMTYuI3yYtfzDpBnNsaynA4VO3oG/JhaXVdsoQ2M6YSFIaGWvoFfNjCQZ8xfi95dq0OvQJcbaramDaZDack=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741870; c=relaxed/simple;
	bh=hP6/7Ulk7xtnGXya7SX9uWClvPQd8ylGJd5uaHnGFVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GElrq6/p670iNWGE6mLBnTp+UWwwD8PhMv4C62KBS9q5siM3+AwHQLhMDxk+qM7aIkmvBgnSzLlnTxTUjvGRYWeNKMmejzhubPMY1mArciQf+Mc00/pbdimrI2vlAAky3EbZBULO0pQnk7TEXlmKmUskgcnJAji1NkDMmEUL2PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MsJ+4zoC; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MsJ+4zoC"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6C94F25F14;
	Thu, 12 Jun 2025 17:24:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBxoWwEKWPQX; Thu, 12 Jun 2025 17:24:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741866; bh=hP6/7Ulk7xtnGXya7SX9uWClvPQd8ylGJd5uaHnGFVk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MsJ+4zoCu3ZpEWzPU+9mX+Brdhdzw4pz+7LXUAhVGBgPVjX7Tg97wI7GObyKHipJF
	 q84GMezIF8dJ1g/lCQ7aDw59WGwcC5Q5fOeBat1c+0kadvKHyJ4bEZey1NM7LK1yUI
	 x9CdlEQ+nqah/hfVvtZRc4UXWv9rd5qu+s2Co0TwuPzKxaUhXezvWpxdRnq91IV1BP
	 POt1eCRiM6lNSSJHDA2m/cL1V+GzmJrwSGe2bbU3d3bnbH2xiLRFtrtPwXi7BfIoaJ
	 r0wBvamDdqqKFbOes7tU934cBcSyBNgIyhhkh9/HRw4453GdbF5lcv9P2ZyNom4/0s
	 CMcxIqyB4lf8A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:53:40 +0530
Subject: [PATCH 4/5] arch: arm64: dts: exynos7870-a2corelte: enable display
 panel support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-drm-dts-v1-4-88c0779af6cb@disroot.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
In-Reply-To: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741830; l=1723;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=hP6/7Ulk7xtnGXya7SX9uWClvPQd8ylGJd5uaHnGFVk=;
 b=kD1QBIhiLnkG+6ETKI346c9XYAaR+cSO+lCQU28qlMFjMsPSG8c0/Y1xJ+9l1OQW79UZ7ldjm
 x9EqOjKxo/JCfA6uSY4oFylibUK/LbZY9LVY48202uYVVvAbmD9rbAR
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, disable the
simple-framebuffer node in favor of the panel.

This device has a 540x960 Synaptics TD4101 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
index eb7b48593187409ce6653b7d857b63f6946aa4f7..d7104d42240d408f07d4d94750307e51d34b477c 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
@@ -40,6 +40,8 @@ framebuffer@67000000 {
 			height = <960>;
 			stride = <(540 * 4)>;
 			format = "a8r8g8b8";
+
+			status = "disabled";
 		};
 	};
 
@@ -124,6 +126,45 @@ vibrator {
 	};
 };
 
+&decon {
+	status = "okay";
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,burst-clock-frequency = <836000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "syna,td4101-panel";
+		reg = <0>;
+
+		backlight-gpios = <&gpd3 7 GPIO_ACTIVE_LOW>;
+
+		width-mm = <62>;
+		height-mm = <110>;
+
+		panel-timing {
+			clock-frequency = <69336720>;
+
+			hactive = <540>;
+			hsync-len = <4>;
+			hfront-porch = <364>;
+			hback-porch = <40>;
+
+			vactive = <960>;
+			vsync-len = <2>;
+			vfront-porch = <244>;
+			vback-porch = <13>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.49.0


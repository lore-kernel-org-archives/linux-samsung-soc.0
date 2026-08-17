Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A703F5BFD;
	Mon, 17 Aug 2026 10:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786962457; cv=none; b=JJlRpHvjKHPPX0vx65404KRMetDiu16g3uu1M1YCj5CIOlINYpfypWnDUHZaYaQt5pkHqtanIyxrG7he04vv86lBsPUnWyaDylOkl2MNS2qhr8D0xahnJZxPcnU7CZdrwf5BQId+oseP3SDFlU9zGrQGSKbO+uQ7WpLBJAWlc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786962457; c=relaxed/simple;
	bh=aXNeoCFaEVwQtDMP5NSAWhQPbrkHKS7cNH2dCz5g/xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZazxMbadUgNEdJwlbcISsGwaB1mSYow8HEZh0IyMB1lX9NnTlFyZNG7Ist80xCVjPf0bYfNrIXmuIWRM2h3uNoXnbiKyF+OoZAJYa6A0OGndEGw0RrBQgY8t6Av+aJe2hVXuaEu0RzErL15cicIBpUMaNua3xfB+03uiFkEwv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRqNt1wC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRqNt1wC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B1B7C2BCFA;
	Mon, 17 Aug 2026 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786962457;
	bh=aXNeoCFaEVwQtDMP5NSAWhQPbrkHKS7cNH2dCz5g/xk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RRqNt1wCUi6fdYz9OtybP2JiPZf9VOzUEeejYnbyRJDcoYftQcomQV0MBqtij/HCK
	 QmQGbXzSq6hORkoAMxfRfb8Pdh5VqI5xeKlYR3CpkGjQeddq78GkPx8AZ67pXNjY8k
	 WqxnKV/X8Qg8X8cpQ3EsemFRT/At8zy37PFqJ8nchFhWLVjKIIIXUhemFVNiTxg0GE
	 +3j9E6RJufEPG2X4lksgCcNB/wIerGLh08RXpzy/oGN3qE+Cn6Ze5SwbuYYgSYe2hs
	 NliSbhIBbWezBQiv9HYNEgUnXaZPz5s/9MexBDk3p7d4FecBTgoOX+jlagilsp1mOM
	 UILTjqnZu2MZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7CCC5DF7A;
	Mon, 17 Aug 2026 10:27:37 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 17 Aug 2026 11:27:31 +0100
Subject: [PATCH 2/2] arm64: dts: exynos: Add initial support for Samsung
 Galaxy Watch FE
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-for-next-lucky7-v1-2-42ffb2b71ba2@member.fsf.org>
References: <20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org>
In-Reply-To: <20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4016;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=JgUcx630PdrXwT+rYg8sAdnC41ZQqTbtWy02gE4KOCk=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqguIWkOz1uAqkN1RMWuX/bwAA7pFKR/QXpcUV1
 FDoxjS8J3eJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoLiFgAKCRBJJwGyxHrX
 61UDEACqb+I9SWraGW9VWgeX4597H/yzaceuVXbn/6MwjY8P5jO9hMIcPR2wem//z10LLXT5aDD
 03mWmgoZlRjEvBdljtoksFDMWC1lAMME8OIXNaXU2N06TgVDbw28E+9Xe+zab0i+QF547kwQBDu
 aa1fCG1XW0NQ163hWuMeDFbkPRekvtPmw5Db2OOCsHli7CdP9a77KwDdhE/88I8Zfa0MsYd2SCs
 XF5Pa02f5yfwyLdz+inRZJ9Pd+RD6UKOT/TawSeH2vUX1iFQAWyoTUGJaOXLu3Hz+RnSkqKc9cG
 B8yGpdhorC6z87NuZjkObSOallsfCFjykLiJJKhCi2a/xFK5OCCdYGS7rbmKjoV13Fn2R+YP73x
 emCZ9HKfiwYMRzktRGZeNdlpV844SSzzETH3sIkBcfE9w5/eI+vBPenWk7DJy+InOOAn9XxAhJU
 9uVUVSHFw1MiRWqwuHcqQZwFHrYSWw1f4/HZTJmq6LeZj42IpTvnRbdvdAHUOqZdwb/1FW+x43p
 xRzvdIOwpObRWL4tCJpU4t0Gw007loBQO9kDRL48psNCcQ3UbW0M9Jo6n2DR7sB2RGFB7iO+NC4
 Q4uwmpCYddnyDi7cc60cZryodftV5RFvGUC34IkeRntELGRSSOsIYMly794sIAln11gtE4DHNhq
 YKbNF9lhD97y/yg==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

From: Aiden Isik <aidenisik@member.fsf.org>

The Samsung Galaxy Watch FE (SM-R861/SM-R866), codenamed lucky7, is a
smartwatch developed by Samsung and released in 2024. It has 1.5GiB RAM,
16GiB of eMMC storage, an Exynos5515 (W920) SoC, and a 396x396 display.

Support for the following is added by this device tree:
- Bootloader framebuffer
- Memory

Only the lowest 490MiB and highest 512MiB of memory are used for now.
The 488MiB between the addresses of 0x9ea00000 and 0xbe680000 is excluded
from the memory node due to a bug where if the kernel even knows about
the existence of this memory, one or both cores will lock up and cause
an RCU stall.

Signed-off-by: Aiden Isik <aidenisik+git@member.fsf.org>
---
 arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts | 106 +++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts b/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts
new file mode 100644
index 000000000000..f91ea7e44cf8
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Samsung Galaxy Watch FE (lucky7/SM-R861/SM-R866) device tree source
+ *
+ * Copyright (c) 2026 Aiden Isik <aidenisik+git@member.fsf.org>
+ */
+
+/dts-v1/;
+#include "exynos5515.dtsi"
+
+/ {
+	compatible = "samsung,lucky7", "samsung,exynos5515";
+	chassis-type = "watch";
+	model = "Samsung Galaxy Watch FE (SM-R861/SM-R866)";
+
+	chosen {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		framebuffer@9e0cf000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x9e0cf000 (396 * 396 * 4)>;
+			format = "a8r8g8b8";
+			height = <396>;
+			stride = <(396 * 4)>;
+			width = <396>;
+		};
+	};
+
+	memory@80000000 {
+		/*
+		 * Use the lowest 490MiB and highest 512MiB of memory.
+		 * The 488MiB between the addresses of 0x9ea00000 and
+		 * 0xbe680000 is currently unused due to any memory accesses
+		 * in several ranges between those addresses causing the core
+		 * performing the accesses to stall.
+		 */
+		reg = <0x0 0x80000000 0x1ea00000>,
+		      /* Crashing memory at 0x9ea00000-0xbe680000 */
+		      /* Memory hole at 0xbe680000-0xc0000000 */
+		      <0x0 0xc0000000 0x20000000>;
+		device_type = "memory";
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		framebuffer@9e0cf000 {
+			reg = <0x0 0x9e0cf000 (396 * 396 * 4)>;
+			no-map;
+		};
+
+		misc-rmem {
+			/*
+			 * Some of these regions belong to memory-mapped
+			 * devices, and will be assigned to drivers as support
+			 * is added.
+			 *
+			 * Other regions belong to the TrustZone firmware
+			 * and should never be touched.
+			 */
+			reg = <0x0 0x87000000 0x200000>,
+			      <0x0 0x87fff000 0x1000>,
+			      <0x0 0x8a000000 0x31000>,
+			      <0x0 0x8d800000 0x180000>,
+			      <0x0 0x8ffff000 0x33000>,
+			      <0x0 0x90100000 0x200000>,
+			      <0x0 0x98a00000 0x600000>,
+			      <0x0 0x9a000000 0xc00000>,
+			      <0x0 0x9b000000 0x400000>,
+			      <0x0 0x9bd00000 0x208000>,
+			      <0x0 0x9c000000 0x20000>,
+			      <0x0 0xa0000000 0x10000>,
+			      <0x0 0xa0010000 0x400000>,
+			      <0x0 0xa0510000 0x1000>,
+			      <0x0 0xa0900000 0x2000>,
+			      <0x0 0xa0902000 0x1000>,
+			      <0x0 0xa0910000 0x3c000>,
+			      <0x0 0xb0000000 0x200000>,
+			      <0x0 0xb1000000 0x200000>,
+			      <0x0 0xbbfff000 0x1000000>,
+			      <0x0 0xbcfff000 0x1000>,
+			      <0x0 0xbd430000 0x1250000>,
+			      <0x0 0xd0000000 0x5d00000>,
+			      <0x0 0xdc444000 0x2bbc000>,
+			      <0x0 0xdf005000 0x1000>,
+			      <0x0 0xdf008000 0x1000>,
+			      <0x0 0xdf009000 0x12000>,
+			      <0x0 0xdf01b000 0x21000>,
+			      <0x0 0xdf03c000 0x1000>,
+			      <0x0 0xdf03d000 0xfc3000>;
+			no-map;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&watchdog {
+	status = "okay";
+};

-- 
2.54.0



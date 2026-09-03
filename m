Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C62837F739;
	Thu,  3 Sep 2026 10:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430270; cv=none; b=ZG5fl7oN5qTSse9+b2JL6zdDFytxkbE7el362kcMY8Xkhzy2xMGXGXgjEab9vcIiU/0VUCEtHg/MGCXXWYwQuvKawnZMxsYJU9+9XyCRUjuw40Gx65s5u7h47esPyS6k2ySS5V/SnqfoidU5qGHa64S4aX6iFC4wG1bQfEuY5Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430270; c=relaxed/simple;
	bh=EDQYuii8VZBmnUY+LUd2mIayPMMjpoNvGDx4qWq4doM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqqUShDkNIra3KEzLfAHgHvUqnL+eS9C9w5m6KVxldqdSPy8kCPjlvW1pEzcE1b3nJhLxzkFr6+fOp5XfhqyultpxHRluWC9zi8erDXGK+dThjB3iC7OO5+7K4YVtm45IB4nHKkgvWix3bokIvppiiG26baTzgRQbl+iVZzNgCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2841F000E9;
	Thu,  3 Sep 2026 10:11:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
Date: Thu,  3 Sep 2026 12:11:04 +0200
Message-ID: <6108b9d8ba5e750fc3f104c7c47c765cda12ab0b.1788430197.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike older GIC variants, the GICv3 DT bindings do not support
specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - All other patches in the series have been applied,

v2:
  - Rebase on top of commit d0298724f901d45c ("arm64: dts: exynos: Add
    EL2 virtual timer interrupt") in soc/for-next.
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index bfceea5486f46686..9e17f36e1fbb7ce2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1928,11 +1928,11 @@ apm_sram: sram@2039000 {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts =
-		   <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
+		   <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 };
 
-- 
2.43.0


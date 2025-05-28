Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C4424469C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 May 2025 10:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429650; cv=none; b=Xak/v+9hLwbgQuJartHMN1puElKdV6hkcl2Up+POCnUIw/V+lhQ4J1Btw4D/NvA2wXmK7uzTLAu8ImsTe5cfSyknIAsphSk04zLyO+4NfGbjU1mpaUvhRm+VOxKa7pD73ypvaMOjlhk2kpineZXdDkf7rjDD/czR5++W/26ShtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429650; c=relaxed/simple;
	bh=JgCYTvLWUK/mh8lOqOaJ8RLcYi0tSYTu+9p0SfSb+sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c8icWG4b5bYA8wOimpagUOyKZqgmKdU5VGv6VKT7cUv9Pqw1XiYRLWFUGAy1qtW7+py61Vzfo3MSV2MTIUO9wsuiizNWjYF1yScRIS6G/ivOi6zpCKHg3ViT5Vpqr6o0qjOSVYm5ILWC63MDd9y8nBrHlwHdZIPYZGW+t3PdLh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=jTiJGQds; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="jTiJGQds"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=jTiJGQdsCmZMEXP3gFgOQDOSjH0QEjZ8GGVwwvgcwHzLqI0p5osRERcq/pfByCUMf1TNS5fRePgSJDzD9AXWhAa3FGqWBOFZpozxG+M2p40ZCxSn8BhCEp50LrrxwMf/9fSBQc7t0kavcKTXhSe25HJR32dPFyPwoTDUKhdGbuxXPIJmDg+RAO9Y+PqX9Bp0S76oRAeNcm4nVebItWQhth7ujro99NQA6pbi2fwVn8XfNXj1iMlF4fy/FVDJqvXfNa8GvsHOi6XH40jmuCHe290ElWsKm6GDOC7tmqPu10f/Xhi4vUAof03dW/w45jI3T5uwFVP4K5NLQHP6Jtc6Lw==; s=purelymail3; d=purelymail.com; v=1; bh=JgCYTvLWUK/mh8lOqOaJ8RLcYi0tSYTu+9p0SfSb+sI=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1157235224;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 28 May 2025 10:53:47 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: clock: exynos990: Add CMU_HSI1 bindings
Date: Wed, 28 May 2025 11:52:51 +0100
Message-ID: <20250528105252.157533-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250528105252.157533-1-umer.uddin@mentallysanemainliners.org>
References: <20250528105252.157533-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Add dt-schema documentation for the Exynos990 CMU_HSI1 block.

This clock management unit provides clocks for the DesignWare MMC
controller, PCIE subsystem and UFS subsystem.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../clock/samsung,exynos990-clock.yaml        | 27 +++++++++++++++++++
 include/dt-bindings/clock/samsung,exynos990.h |  7 +++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos990-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.ya=
ml
index c15cc1752..ce3b845ce 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
@@ -31,6 +31,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos990-cmu-hsi0
+      - samsung,exynos990-cmu-hsi1
       - samsung,exynos990-cmu-peris
       - samsung,exynos990-cmu-top
=20
@@ -80,6 +81,32 @@ allOf:
             - const: usbdp_debug
             - const: dpgtc
=20
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos990-cmu-hsi1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_HSI1 BUS clock (from CMU_TOP)
+            - description: CMU_HSI1 MMC_CARD clock (from CMU_TOP)
+            - description: CMU_HSI1 PCIE clock (from CMU_TOP)
+            - description: CMU_HSI1 UFS_CARD clock (from CMU_TOP)
+            - description: CMU_HSI1 UFS_EMBD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: mmc_card
+            - const: pcie
+            - const: ufs_card
+            - const: ufs_embd
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bin=
dings/clock/samsung,exynos990.h
index 6b9df09d2..3164cca44 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -254,4 +254,11 @@
 #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK=0918
 #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK=0919
=20
+/* CMU_HSI1 */
+#define CLK_MOUT_HSI1_BUS_USER=09=091
+#define CLK_MOUT_HSI1_MMC_CARD_USER=092
+#define CLK_MOUT_HSI1_PCIE_USER=09=093
+#define CLK_MOUT_HSI1_UFS_CARD_USER=094
+#define CLK_MOUT_HSI1_UFS_EMBD_USER=095
+
 #endif
--=20
2.47.2


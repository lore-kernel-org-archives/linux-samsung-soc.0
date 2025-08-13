Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CFC28C5DB
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101791; cv=none; b=QquKQCsSMstbI6b2VUYq/n6NbhfM7IL1DCA7fNYn7BYY90ZsXIYoXuB1EjDbYA+bX0BsklDa8U5qINnpF32HdBwsHFAlBeA3R8f+j1iRfiV352XSBPHDNehN3DPJ7jp4Azz0WeTIU63Y69ds4EtR21esm96JW/yFflUNbxRJAIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101791; c=relaxed/simple;
	bh=XTNGxrGn/AAOhwYTQs/AcuIEnComGv/ogvJyjB1xvNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eaeXB//l07NB6s+fuhR85iVN5Ilb/pLDnG34NqvP95xQ3LWXpsqch9erMhrnTwM6adu8F4hx0KFBcHDxin0SLH23ijl3v9byl2nD6JeVI6ZNrQJSugZF4EnpuRURFF28Uujzf0m3pZBSb8x3z11A4tIHgc6DETFiFI0BcmuS4wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gQgD4HD9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gQgD4HD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=JOIOq894v+zaK4XV37kMzgRxg3LpyHPgMP/RL2Mj3a4=; b=gQgD4H
	D9eZ10uOMPdefygxiftpeI0O9E4P2jdt5Ft+P6+nRtsbPFJo/Rx7oP5R4qfkLOlk
	K8yTgsKitD2MGbLSdu7nsxjvMIzS4QRN6PDl/lbizFjApUYmaqz0FU1/+UYXoJHr
	kfREh1l1caSGge8T+0wGQD9Q8LrToK/Mt10h7u14NxdhGIQr9CG+MqtDfcTBCIOh
	scvODsgiNRQbNO/DX8xchORmLrWw13AXbSHx1ceMwnmtnr5AQ4Yqi8fbgjgH+cEz
	W+QTokqZBfvPTn0uK0cUMiu6aKSevxnWHJuTMBTDNSQ5F8jlJEmKsQnaf8WCp+Y6
	M9lCqwuXQ+wny+cw==
Received: (qmail 695008 invoked from network); 13 Aug 2025 18:16:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:13 +0200
X-UD-Smtp-Session: l3s3148p1@Tie5eUE8HNttKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 09/21] mfd: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:55 +0200
Message-ID: <20250813161517.4746-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/mfd/exynos-lpass.c    | 1 -
 drivers/mfd/fsl-imx25-tsadc.c | 1 -
 drivers/mfd/stm32-lptimer.c   | 1 -
 drivers/mfd/sun4i-gpadc.c     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 44797001a432..9bb2687c2835 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -101,7 +101,6 @@ static const struct regmap_config exynos_lpass_reg_conf = {
 	.reg_stride	= 4,
 	.val_bits	= 32,
 	.max_register	= 0xfc,
-	.fast_io	= true,
 };
 
 static void exynos_lpass_disable_lpass(void *data)
diff --git a/drivers/mfd/fsl-imx25-tsadc.c b/drivers/mfd/fsl-imx25-tsadc.c
index 0aab6428e042..467b1a23faeb 100644
--- a/drivers/mfd/fsl-imx25-tsadc.c
+++ b/drivers/mfd/fsl-imx25-tsadc.c
@@ -17,7 +17,6 @@
 #include <linux/regmap.h>
 
 static const struct regmap_config mx25_tsadc_regmap_config = {
-	.fast_io = true,
 	.max_register = 8,
 	.reg_bits = 32,
 	.val_bits = 32,
diff --git a/drivers/mfd/stm32-lptimer.c b/drivers/mfd/stm32-lptimer.c
index 09073dbc9c80..123659178cc2 100644
--- a/drivers/mfd/stm32-lptimer.c
+++ b/drivers/mfd/stm32-lptimer.c
@@ -19,7 +19,6 @@ static const struct regmap_config stm32_lptimer_regmap_cfg = {
 	.val_bits = 32,
 	.reg_stride = sizeof(u32),
 	.max_register = STM32_LPTIM_MAX_REGISTER,
-	.fast_io = true,
 };
 
 static int stm32_lptimer_detect_encoder(struct stm32_lptimer *ddata)
diff --git a/drivers/mfd/sun4i-gpadc.c b/drivers/mfd/sun4i-gpadc.c
index 3029d48e982c..bf2f6fdaf8bf 100644
--- a/drivers/mfd/sun4i-gpadc.c
+++ b/drivers/mfd/sun4i-gpadc.c
@@ -72,7 +72,6 @@ static const struct regmap_config sun4i_gpadc_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 };
 
 static const struct of_device_id sun4i_gpadc_of_match[] = {
-- 
2.47.2


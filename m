Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA370206979
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2024 19:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730229675; cv=none; b=fqpdwOvrfd3ubEhVjFpEKSpnCkmF8TVCYFTX78kWnis854aQnymhDKxdUVvNi+5ulaQnyUExBCZOb4UCakUa4kk7PaUBiLR2XsQwgp7sMk5L4LvSlQz13DmL8QrBwxqUsEGzW3sJFcVwUCZyJ+XKKYuyxMzaad8paaxHYmcTSvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730229675; c=relaxed/simple;
	bh=P489AMDgM30T1RbDh1KNW2GuxIt8cv6FbKb6+8yV/Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M0HFrzmuxJNuWRNXkCi2T+kNZOPCqILsQJsetXaxpasOpe9uOfV5EnpeMeo2gFSijc2y3Ym1vaySzi6hG6W7t9xkZftJCWRrWvRcFqvlHtK4Jx/dLk28tnqumnVSNXMTHEAx65VxMUU7+5rgOT0E3FTerjoTz+HaBgSeHk+iRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mrl19yhC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mrl19yhC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so4268631f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2024 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730229672; x=1730834472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0XI8AhmhnWxIwBb5nhzbNedpBYemfsEhJh3VU8fjT4=;
        b=Mrl19yhCuxDkFlFmHbQv8Mvk2T3jFck6aRJLYiFC/fXc81v8vmvFUuMyWhKhUhiJEU
         W1lPGvhDrSvyu5Nt9CAODhdPvDSKKxZFvY/h7qksrqzu1G9oLtQKDBmlpFFcCJ39WlfL
         RDxnwe39pvxBZB2rSQHf6ReNjYUvCD1Y6TzF9FS76lkl5orxDHRYVH/lyAlLc2a8Yi3i
         Pw5cwcDgai8Ziht84fXYHEOukN+1yPg/NHPCVOmI0BTFUsXYJFnGFcjV3NXn8CR4YQNc
         YnTveJAsnOn58TLVIYbCYmhxVvHAY+uiGqd2isKLNv+FZCRF6qR3KSv5dv1hYbqJj4UW
         fZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730229672; x=1730834472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0XI8AhmhnWxIwBb5nhzbNedpBYemfsEhJh3VU8fjT4=;
        b=WgSXxaiyMZ/Cw1AwAsiEGroPvniQ1I4rSZvGK9l6L6ItqgW7qNgSom/vvRPV29yK1s
         kl7lWMDSA6+EeXI5r1GjHnB1o4XRxGOglsG+9jMNJCSJQOguU7lGQBAR01hhlewfARaV
         Y4FMVI5AFYgxxzu7fitMuNuNTS8+b68olzVg1m5x488gruas83SPC7gdkd4d6sdH/xL3
         E9oRcD2cXZ8X0ywg1CJ9aBSgCj5k5aJWekojAThyNrqrpb2bLf/o68geYiU/ChwQSDI4
         y30/LfqhaqgzgMqf3NkEIdroQS9E3g2NPLN78QudH+OfQiiqMf4RPAWpzRfzHGPX9h2O
         f9RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW29/JkkJCQ8Osx2c1oXzrA0hb+zuLAeZd94sDtken3VCtxwFw3UNBAwVWb3bgZ77+sJ96ck10lqhAgTqg1LOiAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaS1NfRiqiYLBVY4Smw/zW5/3ftpRFGCI0dBk5GRDPvaBchkHV
	41ak/nwIoQuYNjdtpaC5WlaPAB0oFEBMD5L4gDw7AzUL0w88JPDly0nbi0tSkG4=
X-Google-Smtp-Source: AGHT+IGHMHqNaQuwakaAsQmPTNJ5IJ7w2nk9odL/D7VFnJmp9SBayW4GuwAbU+nObFDT/w1xv3DyDA==
X-Received: by 2002:adf:fcd1:0:b0:37d:4cd5:fff2 with SMTP id ffacd0b85a97d-380610f4961mr9250210f8f.6.1730229671917;
        Tue, 29 Oct 2024 12:21:11 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058981ae4sm13436572f8f.0.2024.10.29.12.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:21:10 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: vkoul@kernel.org,
	kishon@kernel.org,
	krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH] phy: samsung-ufs: switch back to syscon_regmap_lookup_by_phandle()
Date: Tue, 29 Oct 2024 19:21:07 +0000
Message-ID: <20241029192107.2344279-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now exynos-pmu can register its custom regmap for gs101 via
of_syscon_register_regmap() we can switch back to the standard
syscon_regmap_lookup_by_phandle() api for obtaining the regmap.

Additionally add a Kconfig dependency for MFD_SYSCON.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/phy/samsung/Kconfig           | 1 +
 drivers/phy/samsung/phy-samsung-ufs.c | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index f10afa3d7ff5..e2330b0894d6 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -33,6 +33,7 @@ config PHY_SAMSUNG_UFS
 	tristate "Exynos SoC series UFS PHY driver"
 	depends on OF && (ARCH_EXYNOS || COMPILE_TEST)
 	select GENERIC_PHY
+	select MFD_SYSCON
 	help
 	  Enable this to support the Samsung Exynos SoC UFS PHY driver for
 	  Samsung Exynos SoCs. This driver provides the interface for UFS host
diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index 6c5d41552649..8e9ccd39f97e 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -13,11 +13,11 @@
 #include <linux/of.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/soc/samsung/exynos-pmu.h>
 
 #include "phy-samsung-ufs.h"
 
@@ -268,8 +268,8 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	phy->reg_pmu = exynos_get_pmu_regmap_by_phandle(dev->of_node,
-							"samsung,pmu-syscon");
+	phy->reg_pmu = syscon_regmap_lookup_by_phandle(dev->of_node,
+						       "samsung,pmu-syscon");
 	if (IS_ERR(phy->reg_pmu)) {
 		err = PTR_ERR(phy->reg_pmu);
 		dev_err(dev, "failed syscon remap for pmu\n");
-- 
2.47.0.163.g1226f6d8fa-goog


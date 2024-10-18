Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B1D1CD2B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Oct 2024 13:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729256547; cv=none; b=GNw12Gbpx05gK/hwaCnZq/LydGCnHzmzyG6T6U0/03W3hSHTNMdfxRxgnxKdMZv3DzNaY2HP3HUq5hnsptYHHVVFdX31u+FK/LtzlrBKcgo+707VpWoCsykSjzJ72KrY3JnxIU2G90LZd9Yq/mNOlq7pn57+E4DRXwsoJBqjKd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729256547; c=relaxed/simple;
	bh=C49UxWfwudobA0oVeClthd6MHqj4KuKHQV+wJPs4JKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKcmO08A4cHm6AdBMhpPXlwHV06E6zYmKa/327CR9WIN9uc2GIa5IHbthR9U5BtnrX5B4x9ao1+rdd/mWRozdHtYctZ4QEktRYG3XKQgpsTTAAj8g5CcTapbkTtfV3bmmTDeNVNH0IX03SCLk+zA7oq0wxAnoVlS2zdhYInQino=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tNB2UpFd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tNB2UpFd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-430ee5c9570so27166255e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Oct 2024 06:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729256543; x=1729861343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yo1uQJUXg8PU6STfdxAj8qXez3dTCFvPnWXMLXqyc/s=;
        b=tNB2UpFd/zjJhQcAjfZvljB7rjMaJl1fWHJ0QcT65qs0QrYEGAG82MkXgZQxg34d3V
         cw9Zwrmjp1HezoZy7mUaoLEdw3BFapjN45VnWzCw84cyS3ghomeSoiHgIxevu9KfqB9U
         MKMKQ61G6HMsfW1rOenLEAL66WAyHN+hcfWVExemuJrKr0SBHSnDw3AcdGDNWEfxMs30
         5K8xE1gzegvBFoK+dU7iPciqccKOEdEMRWf5XRO/t1Fc36U6ArpxDHcpQcAnxZEAkbP6
         FSCTBzY33uM5n+4acWi9ae6w52R010kT9TljBafkxkLjbjNAJtbHtd4q5L1ePbpHUCMJ
         XfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729256543; x=1729861343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yo1uQJUXg8PU6STfdxAj8qXez3dTCFvPnWXMLXqyc/s=;
        b=xToKAgrR2INpAcbKuREhTI7DVKB9Rn0kRIulF9ZuhS8Z0Ln1QXH+VwzqYMHL4fg0Vr
         LLi8v9dbVDtEsxefKugLEwrt3eQtRf1poDojOKpiOuOp+eRcPMzbGfQbSHH9A/h+1ah9
         a80WPVfJT5gibplsQueQpIf38MBZusiyCZ1K0DsOpCmanmsn8dCwnOYuThkbDCelol3F
         mBc8/CFHN3enupPxJhQrnQPVXjbH/FtxxUi+XXNgWvzQcrYwzKx2+GTZ23wKNjJAFO1E
         WaMGmJ4P/HJaqCxICMTbJ0No636KQMB+A8df72StUyBghYzNwGmUuKXRSNYC3fbjW6Pw
         mr/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr8Pbs9Xqmc9Ym/3w9eMbiiPffODevaPP39hDTm/qoVxk8yyaGNCeAcSs8OAhX9ut5JgizlDbhnxAS2XAtArVmCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPlBYa8aT7WtuyxCmr8IpP5BFMrfk5UqhcjfyIE+oAD9Ni1z/Q
	7OyMx3d/MWM9VY+fnuHAxnJ8DiPACgDeGriWBL/YxkYYANMF+0K1ehJaYFVlJ9U=
X-Google-Smtp-Source: AGHT+IGkFYJMVKXgPlKjlx/nVstLc5egfgTDX9ehcNEDC23QAyFPkTSDwFGn5cVXBVuGdzsNw3ENeQ==
X-Received: by 2002:a05:600c:c89:b0:431:4847:47c0 with SMTP id 5b1f17b1804b1-4316161ede4mr21601655e9.7.1729256542645;
        Fri, 18 Oct 2024 06:02:22 -0700 (PDT)
Received: from gpeter-l.lan ([209.198.129.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e44404sm23616735e9.35.2024.10.18.06.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:02:21 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: peter.griffin@linaro.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com
Subject: [PATCH] clk: samsung: gs101: make all ufs related clocks critical
Date: Fri, 18 Oct 2024 14:02:15 +0100
Message-ID: <20241018130215.487425-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling UFSHCD_CAP_HIBERN8_WITH_CLK_GATING in the UFS driver means
all UFS clocks are gated/ungated, which leads to the UFS IP getting
into a bad state and being completely non functional.

Downstream these clocks are all left in Automatic Clock Gate (ACG)
mode, and are not exposed to the UFS driver in DT. Enabling ACG is
ultimately what we need to do in the upstream Samsung clock driver
as well.

However until ACG is enabled upstream, we mark these clocks as
critical to avoid them being disabled. This then allow us to enable
UFSHCD_CAP_HIBERN8_WITH_CLK_GATING and have UFS hibern8.

Whilst this may seem at first glance a strange thing to do, the clocks
between UFS host and UFS device are still gated after this change, and
enabling UFS hibern8 leads to substantially cooler device when running
the upstream kernel on a Pixel 6 phone. This change only effects the
clocks from the CMU to the UFS IP.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 85098c61c15e..86b39edba122 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2775,11 +2775,11 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_ACLK,
 	     "gout_hsi2_qe_ufs_embd_hsi2_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_QE_UFS_EMBD_HSI2_IPCLKPORT_ACLK,
-	     21, 0, 0),
+	     21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_PCLK,
 	     "gout_hsi2_qe_ufs_embd_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_QE_UFS_EMBD_HSI2_IPCLKPORT_PCLK,
-	     21, 0, 0),
+	     21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_HSI2_CLK_HSI2_BUS_CLK,
 	     "gout_hsi2_clk_hsi2_bus_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_RSTNSYNC_CLK_HSI2_BUS_IPCLKPORT_CLK,
@@ -2806,7 +2806,7 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_SYSREG_HSI2_PCLK,
 	     "gout_hsi2_sysreg_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_SYSREG_HSI2_IPCLKPORT_PCLK,
-	     21, 0, 0),
+	     21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_HSI2_UASC_PCIE_GEN4A_DBI_1_ACLK,
 	     "gout_hsi2_uasc_pcie_gen4a_dbi_1_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UASC_PCIE_GEN4A_DBI_1_IPCLKPORT_ACLK,
@@ -2842,7 +2842,7 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_ACLK,
 	     "gout_hsi2_ufs_embd_i_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_ACLK,
-	     21, 0, 0),
+	     21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_CLK_UNIPRO,
 	     "gout_hsi2_ufs_embd_i_clk_unipro", "mout_hsi2_ufs_embd_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
@@ -2850,7 +2850,7 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_FMP_CLK,
 	     "gout_hsi2_ufs_embd_i_fmp_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_FMP_CLK,
-	     21, 0, 0),
+	     21, CLK_IS_CRITICAL, 0),
 	/* TODO: should have a driver for this */
 	GATE(CLK_GOUT_HSI2_XIU_D_HSI2_ACLK,
 	     "gout_hsi2_xiu_d_hsi2_aclk", "mout_hsi2_bus_user",
-- 
2.47.0.rc1.288.g06298d1525-goog


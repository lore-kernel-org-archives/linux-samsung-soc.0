Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4D12E285C
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 18:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093188; cv=none; b=ADn+ffBrnbMR8jSwJfaLt/hiGO0Q8rZRfTPKtsFkGidPh2L0l1fdY9isH5QaXioSWMaRQEPDnXxK9Nz8aI6seOmhR6tZx1ysCbPTYmhHtG1uIByNkmJ/KWpAN42PchasKeREz9eOmTV7SXNc5h+PeWe39G6fZOMO0pE1wO1w22Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093188; c=relaxed/simple;
	bh=qdjAMl7pVZLzrJY8XhRsX1huAGzjKOhJ/3DLSBciWKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTClfSmbQT+3/WDrH7E2JfqkYAVoAA+xgdMN5SyhudHqSmnHdAbHWA3v48xNGH67jjRVqe6FwTki6Nfdt7sMfD5bX3rT/VtA9TPDg13CGzS5MKSskCz4sB9tAUwcL2nTg/ApHdUPbHS4uQgB7+yCqvenYSZdGADwGVz/6rvBd5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IP6qGDr8; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IP6qGDr8"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a871daa98fso14201515ad.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 10:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093186; x=1771697986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBz/VS0n7QHhwwTW/twbu0ESsUBq5BIV+GsuXlYuLBc=;
        b=IP6qGDr82tSPBUHJVoAiWUBM3kbAl4bL6mB0fBf6WjtnwCYk++XeF1kbZfKoDmpJYm
         isijt1KCNOVs8o/wsoWq5vocrdOTqEGMZ+HbWQyttawLLO/UHUPNaqEfIVPYwhIGU3IM
         yNNgS0IMbzhGxTBm/GDTVret6gEbYcLrpQ31HCT+RgWzMa62w9eTKWn7CAUg1vxw2pzj
         iq1QsxrJ7i4S12uJesjjwy7T2SOBUS3wsHnnZqL8FL1b97crLUmQG0Z0gq2U2WOllcx4
         MQNQQ01ku99ahDK4yabU3yi4qEH890SPAlG7eb7JZzxDvMoSyC8lbT5TvVjs2myAd5Fj
         2p4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093186; x=1771697986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GBz/VS0n7QHhwwTW/twbu0ESsUBq5BIV+GsuXlYuLBc=;
        b=oLYlXNuh/qfbRBXgjTXSdtNRG4dvz94CC5Xc9yXHO1MoN0qqiOcf8/OPzwUd4k8PjO
         5YM7c00Av7Vtv+/aLvQo0E5BWHtFSqMzEx3xuovQH0zAYna5kHrX7BwSgJ2x62zkp2RD
         SmKU/RkP9wr1rc+kwEC3N4iPLgzTu1GoJjLKPg1BWIwqFaBF4hRd0nphF5uhVyhNzZkp
         pKu8RrtLuaXejVH91+QmGpddaeABUQ97Wcu1hk7U+yVoJd76G51tFsgdBnT0aeKmbxxs
         +XTeHX+NC/9ObkNob1BFFETIs+tQZBP13Y7dEKMFWExlAHmHW/fNyXriFEpFodeusdUC
         Fuug==
X-Forwarded-Encrypted: i=1; AJvYcCXDevn91a6mOBHQjLWCe6BOGbtWqhAZHfUBkuLJveKrvVEtnnI8V/HHYYaX+/4jdK3P2/fxql2NHWiNywejSsud/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrT6x4Nq8lW+QJIKiblCHtuX4798aNdzV7OOpx6F9/wHRzAsSz
	nmWC1DYr1segK6dHjJQ6wiEJoFO8UHwu/IobC7bpdUz03FtSH+2Ljghz
X-Gm-Gg: AZuq6aJ1y9RqcomKZkIV6+M/ZpztKRDdwf0q8gP6rak2wTJBqewKMUHHgjiYk+3iiG8
	JBL112yWnyrL+/+y9vZS0c0o5REr2XQKOgqUk25x8lPqfjTUzVA48wJTkDKZnqNv1Hzudq8KTxh
	2Sru3eFjOl+Isd/NJLfzT5saTf/zZho+LwL0TiQZT4vcQ1Oee+wYaMFDDW48rHnkWey5Qi6g6LH
	SQqah2Kr/avNIKQWOHcGsxZLQCkXu/dnceVQnfozvZvRzMeBrkGnj8CRGnc33x+JkHuSoQ0Sr2u
	hvx16+SCEGX/lNohfk9UZxLSqzYGHJ46QX5i8hfFvWT++GLW6YoRiKWYHYQbtM2QvYg0sOJ5XV5
	AdiGiORqigmzX8eKWH8wGl35AUW8GjsHdDK01INrJbxxPogNsw14C+NH+P4uh1t7O/t0YRiBVAe
	LjZWkKLM1oHdNBhC/yumQ=
X-Received: by 2002:a17:902:e5cc:b0:2a9:db7:446a with SMTP id d9443c01a7336-2ad1743398cmr29145525ad.9.1771093186513;
        Sat, 14 Feb 2026 10:19:46 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:19:45 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v8 1/9] thermal/drivers/exynos: Refactor clk_sec initialization inside SOC-specific case
Date: Sat, 14 Feb 2026 23:48:58 +0530
Message-ID: <20260214181930.238981-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the initialization of the clk_sec clock to be inside the
SOC_ARCH_EXYNOS5420_TRIMINFO case. It ensures that the clk_sec clock
is only initialized for the specified SOC and not for other SOCs,
thereby simplifying the code. The clk_sec clock is used by the TMU
for GPU on the Exynos 542x platform.

Removed redundant IS_ERR() checks for the clk_sec clock since error
handling is already managed internally by clk_unprepare() functions.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v8: None
v7: None
v6: Add Rb Lukasz and try to address Daniel review coments.
v5: None
v4: Fix the aligment of code clk for clk_prepare in proper if/else block.
    update the commit for clk_sec used.
    checked to goto clean up all the clks are proper.
    drop IS_ERR() check for clk_sec.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 36 +++++++++++++---------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..04517d52afbd 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1040,26 +1040,26 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (IS_ERR(data->clk))
 		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
 
-	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-	if (IS_ERR(data->clk_sec)) {
-		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					     "Failed to get triminfo clock\n");
-	} else {
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to get clock\n");
-			return ret;
-		}
-	}
-
 	ret = clk_prepare(data->clk);
 	if (ret) {
 		dev_err(dev, "Failed to get clock\n");
-		goto err_clk_sec;
+		return ret;
 	}
 
 	switch (data->soc) {
+	case SOC_ARCH_EXYNOS5420_TRIMINFO:
+		data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
+		if (IS_ERR(data->clk_sec)) {
+			ret = dev_err_probe(dev, PTR_ERR(data->clk_sec),
+					    "Failed to get clk_sec clock\n");
+			goto err_clk;
+		}
+		ret = clk_prepare(data->clk_sec);
+		if (ret) {
+			dev_err(dev, "Failed to prepare clk_sec clock\n");
+			goto err_clk_sec;
+		}
+		break;
 	case SOC_ARCH_EXYNOS5433:
 	case SOC_ARCH_EXYNOS7:
 		data->sclk = devm_clk_get(dev, "tmu_sclk");
@@ -1112,11 +1112,10 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 
 err_sclk:
 	clk_disable_unprepare(data->sclk);
+err_clk_sec:
+	clk_unprepare(data->clk_sec);
 err_clk:
 	clk_unprepare(data->clk);
-err_clk_sec:
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
 	return ret;
 }
 
@@ -1128,8 +1127,7 @@ static void exynos_tmu_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(data->sclk);
 	clk_unprepare(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
+	clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.50.1


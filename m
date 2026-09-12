Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD613A6F09
	for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 19:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240378; cv=none; b=r5g1iSI33AcezLY4CoXdxWksWkIg+foRG1o5BxkLNhvG7AO4tkUCdfFTiEYbnABYojs81cW5XshOv3d/Fz49pvMqle36pzJdU9MP1SxY9pZBltuux9mtCEb646FAUPpx9MuocMQDqH6EP4TqCv39NVjljBNGKygB6EPkM4qOGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240378; c=relaxed/simple;
	bh=Ix38TazmjpNN8K8bcbbXrymOYyLkk4HmlfbglpAUeqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qoGmJJ2BqI9zv2HKTElotDlNi40Qs1bTRYmXeV94Aog9jhC4UzzKmIAUv9lC7nH1ffFBGEnDD9cNCtqdDpKYDC8WR2Rqnk7G5iov+rAxHaQ9ubOC+4HBGce1z/X6o/g18aydYukSfa9FC/B3NHCDHSCtFP9/xOyjSa+tt1nOHg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7zwKyY7; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7zwKyY7"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so437736a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 12:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240376; x=1789845176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=c7zwKyY76WFPqkHtEVMAaBr8oenCadTGrKRE1cObBJFe3DRxS/HRLaRosjWEBe1f3X
         6jMyWaM2jt+Zavo+pUovwg6DVrdw3QAak/HGXaWtE1gP8Z9Uujv4fzer0y+A9tyJfmMj
         yGqHnW5u94QCTOvUHBVU+CyCCppOW1zRODOJpqEbmVvexN0x8/LiLOEfFfuk4BncnEix
         o4lw6enXZSstfgOk722YVcqhRuQIYrtEjDxhZTAJ4b0yMxswUu1qw9FpnwcR3qUG1J1l
         5C4OjbA8Uj0dqMpwYnfyfLnpSzSrLKNYZth7ra8UQfAXSi7/FZjmX8lO1ifEAOpSL7D0
         8bLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240376; x=1789845176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=jMjK7qvzww5LPaWd/sRjT41DUkCwcQzYAT78qfVyFF2IPFOMLGOoFCWrzadGzua8dn
         X/XdpvaMpOP/XTdhI15xBwgJ/pUKaJNeCcXEo29oitSRjJyZaPvlvntf6tgM0LLAxpRH
         In1rRK7x4qwLuoghqifoW9EyhdMn3gvd+XJp7dC+73NkDPWBPsHdFCPmjwgLl/Av9LB3
         wx1h4lPeKdBd2s4A45x73hcHKq//zQBGcQh0d/fW9/JYUBfWrPKeZwWsAdphKAu+eQbR
         deLtUyaJqXGSAiG117LsB0DyMsLZv3x20rPBNd96piC3UNF5spytGzRWk7Wbg2f4nyA7
         xZKw==
X-Forwarded-Encrypted: i=1; AKwUvBzLoKkXc6YNteJUqa+XmZ4oRHv+GM+T9R5o17J0PCIQNmBHXKYtZ9yprQqHbN1O2KxCUwE+SSb896JKFSwL0mM18Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mWRXjymbiR3zg+ODRTcF1Ia1OnIHdpahLAT508MWOn9GKHirZ3
	oiWrzAQyUSveDzosvwEreecvLUXmraRrNKUU9f2fZ4Rw41qpkf29leJX
X-Gm-Gg: AYBFou2PHXh/5DN1tZPx5ysrN1MJDP9Gmbb5CHKdH3I+rFf5/aUMGXQtpt2yaTcxcm3
	b9nPN3f15ZKDuuRL/D8xRQGBGc8t030kSPa+52bo6mVK4XBMvKWPJ99z8Yyp4NpGNtMURTEAYUG
	6monNNrVQwMZSdBBNPHTqyvEw2hkedwzW45Q4pM/sWx/EQXhPHsvAnTN6k2+FUSRqcicCOutjyA
	A3EqZCRVjdcJD0J4gAnoPhdA5EkWa/zW+/l+/xlGn4zvOU3+EYVvUfaxSw/798xTVBxbpfqEtbc
	iN7Kzkwm80WflwyJSctEUfTo6wAO6FUdE4pZiuDfM8v5/wP83PSPGK9hsM9iSX6TPeJh+a67FtE
	AV3/wrT9PvaHRQ/g7Gb+oWRFo+DSzE/MA3YxTJrOvGN4n7n9CnMNvzHv/sFkH3ZM73/bBaoW8lI
	xCnIpHceUJT+Hn923gYmt41t8Z+le8e8LUyqM8Bdlbo9OearmBpCLlSqqaleKiLIi0k3Ty
X-Received: by 2002:a17:90b:5745:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39d9bd685e6mr17887143a91.10.1789240376247;
        Sat, 12 Sep 2026 12:12:56 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:55 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 3/5] cpufreq: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:53 +0530
Message-ID: <20260912191156.185448-4-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
falls back gracefully and prints the raw integer value. This makes messages
more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
 drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
 drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
 drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/cpufreq/bmips-cpufreq.c b/drivers/cpufreq/bmips-cpufreq.c
index a8e35bc75fb2..389fff5e6f65 100644
--- a/drivers/cpufreq/bmips-cpufreq.c
+++ b/drivers/cpufreq/bmips-cpufreq.c
@@ -132,8 +132,8 @@ static int bmips_cpufreq_init(struct cpufreq_policy *policy)
 
 	freq_table = bmips_cpufreq_get_freq_table(policy);
 	if (IS_ERR(freq_table)) {
-		pr_err("%s: couldn't determine frequency table (%ld).\n",
-			BMIPS_CPUFREQ_NAME, PTR_ERR(freq_table));
+		pr_err("%s: couldn't determine frequency table (%pe).\n",
+			BMIPS_CPUFREQ_NAME, freq_table);
 		return PTR_ERR(freq_table);
 	}
 
diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 80893844353c..f767898ebfb5 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -230,8 +230,8 @@ static void cppc_fie_kworker_init(void)
 
 	kworker_fie = kthread_run_worker(0, "cppc_fie");
 	if (IS_ERR(kworker_fie)) {
-		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
-			PTR_ERR(kworker_fie));
+		pr_warn("%s: failed to create kworker_fie: %pe\n", __func__,
+			kworker_fie);
 		fie_disabled = FIE_DISABLED;
 		kworker_fie = NULL;
 		return;
diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
index 42edb41ad459..0652e5df0278 100644
--- a/drivers/cpufreq/qoriq-cpufreq.c
+++ b/drivers/cpufreq/qoriq-cpufreq.c
@@ -57,8 +57,8 @@ static u32 get_bus_freq(void)
 	/* get platform freq by its clock name */
 	pltclk = clk_get(NULL, "cg-pll0-div1");
 	if (IS_ERR(pltclk)) {
-		pr_err("%s: can't get bus frequency %ld\n",
-		       __func__, PTR_ERR(pltclk));
+		pr_err("%s: can't get bus frequency %pe\n",
+		       __func__, pltclk);
 		return PTR_ERR(pltclk);
 	}
 
diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index 9cef71528076..9a01592425ee 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -152,15 +152,14 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
 
 	policy->clk = clk_get(NULL, "armclk");
 	if (IS_ERR(policy->clk)) {
-		pr_err("Unable to obtain ARMCLK: %ld\n",
-		       PTR_ERR(policy->clk));
+		pr_err("Unable to obtain ARMCLK: %pe\n", policy->clk);
 		return PTR_ERR(policy->clk);
 	}
 
 #ifdef CONFIG_REGULATOR
 	vddarm = regulator_get(NULL, "vddarm");
 	if (IS_ERR(vddarm)) {
-		pr_err("Failed to obtain VDDARM: %ld\n", PTR_ERR(vddarm));
+		pr_err("Failed to obtain VDDARM: %pe\n", vddarm);
 		pr_err("Only frequency scaling available\n");
 		vddarm = NULL;
 	} else {
-- 
2.43.0


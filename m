Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F14353A9E
	for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Sep 2026 06:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788675533; cv=none; b=Ww40l3x40VAxzYFXNsXnFFT53tDY1yno4acYwpMK5RhmKZnXk2P2KKX/AzoPAeLi+ETVaeCqvOD4ur30XM8cIWMgM3FonDqOgS7IIwHGVZyYKP3uVlaqRzMI4vA+ofiFpqW9VhuU/PoJkWhfkkDKdJu9vnrlkgbCruhsFGpY2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788675533; c=relaxed/simple;
	bh=Ix38TazmjpNN8K8bcbbXrymOYyLkk4HmlfbglpAUeqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwRnq4ZzRISK+g53BsxBFnrDX33OC64+ydyPRhC4oLC4s4cJfz49vtTfX1pCKoqkn1VFtx3SwQwtJz1TAJrDBWGDsHyji1gI3+CYFre1WuldTNp6+w7Hu9woXz/GlgBekmHU+6GkhS86pRQjXZ5GUWN+ChcKP2hmm9+GuFb2NLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fi+95+Sa; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fi+95+Sa"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso1779142a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 23:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675531; x=1789280331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=Fi+95+Sand3OXap342C/SixOxVwWyQiP7epFTzx01onRuZ6xVgXs3mwShv4aox9Riw
         CpUf1IxM4Og9czIrhwF5/6J72pSxOr++IG4KeLdnUkoERqgNppTpHTwKuIeP28bF+S2k
         TrymEIEXs1+ud629fyYSv08cqYgiX5qlIAOiZEvxUplEOrb/+dosNC1kMC+7+76zUXnO
         MmswtktGClimZf2r6G8Ziwuog9IC48EuMkIcdhU3TPbIGHTSnk0UgJwu9ArnA1ZzWsdh
         ZX0Ft0wLMY2Lj38sHtNP9x4/IYP0+TKLBXSv8TpmoVX070zU6QLCJ/DXHC6Z/QnlC5Ol
         t9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675531; x=1789280331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=XUmabDTm3vIrMIG76BSj4xbtWXBRqSXQ/cltNIuwxfeeRMaODYBwarv2NY9F0n2Xr3
         +/1CbmwnZCGoC13ooMg2ma1cp/fJtszgZyrukDZzRyuWLgl+bgYw9xxBlP+VHVz9UXj/
         QMvjFz0Rgmzsh0LvXnnzGq7fmYu7DcSnb8CLJTv6LIG6yEdUUmzLTKi2pv1neiacG5AU
         mRcYHjpUuzuKmwSS952+PgI1yt3CSGHVs8kOQUIBnS1+vgGKsL6CmumdJL4fCzRwTpWH
         MpksXG34xi5Kx2ldI+ZWTFymeTIktVm8brzIoP+qHTrRKpoZyQuDtUvUSFSOe3mcE0rA
         DYow==
X-Forwarded-Encrypted: i=1; AKwUvBzosjnuG09Z8gu2IEIGprskKCl/IVi7Twyzm/9tI+G7jqojcGidm8rzHTCK4MoaBFK/oCSFL/iOWHYY3vHyHLk21g==@vger.kernel.org
X-Gm-Message-State: AFuF++kKeHd3UHqqoEjSKxbarYxIiSu8ftR4Pk/n6UzpMZCNK/auBBuL
	0HVS6Rr6ZHmiV/dnZMyst5je6OAgW3MFql534caYbvvn54veyIfmtX1N
X-Gm-Gg: AYBFou07P15Rc+DWDXJ5S8PxP5JREzLWlFUDYW3vtv/plNYcjCSXnj8v1el4cM80rsG
	OJPfxWATBLmGOqH4uiUtvniD7AGdbSBeNyrFfVKeiROoHzleH+Y3VEiS9zm2F8DoFPoqgySp+pI
	JP0KBnY+WPpfNc5LLmsVX1Yfeh5APvH/d5uPAhkJ5pwl9CChF5MP1vHHSJz5pkRQ7KYmBoGKTgr
	jrk/aQaMgidPOOClUYcr6upxn9n/4AkdTsNG22aVxFacBcY1z8oT7QWPW9otg7VwjyqcID8aidm
	rutMZHPjnqel1xyls0j+eYpntXJvIzGcFFuG6Mb7fT74nfUVC62UJ39ubwHYzHqozjV95BdUlke
	8Iso0ItawbsHoHG16jkTRy4uJyS0DGB1V6T+USYq22cqp2QzXUpxQleLro+okpJU64Ufc6M0ZpU
	K0D7N5YLFgbPferkxEYEEBVt+MHezcTiUMKdtraYnW0EW5rZYlLLunyUIKOo/ICPtOWifHMg==
X-Received: by 2002:a05:6a21:6003:b0:3d3:adbf:7780 with SMTP id adf61e73a8af0-3da3a16a4e9mr27908167637.21.1788675531001;
        Sat, 05 Sep 2026 23:18:51 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:50 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
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
Subject: [PATCH 3/5] cpufreq: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:52 +0530
Message-ID: <20260906061755.5103-4-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
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


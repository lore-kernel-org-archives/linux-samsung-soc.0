Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603AA13CFA6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jan 2025 04:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737348635; cv=none; b=SGBAR/iRQjACQak7cLUWH907iwHax+e9EW8pZuWnuBO7QH7XG44iQ1ejOAGmAT7FWQTHEr8q1if0/A62JO73r0A5w2wxJ+Zllt+iEXN6c52/6xd7AQDjYh06100NONoOv/XPRBC8C6NRnn9scJGJHObYIJrxyDFDCspohWVUUn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737348635; c=relaxed/simple;
	bh=e/iDzvTCC8bo1dFL2/v4kqgePEuwnjykIjQnI6TREos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IhoCT/En8oQe12NP0O7N5pDzAcyFcyFGuKZp37w9gRJ9C+Os+Ish+qOUbuBhG0BU2dO44dcIvzE4m6U6YsJfxX68O9a5/K+sFHe3m5Rw4EX4Zegb34mW/qmtPpvmnLkAJaEropreoNGwruDCal6s2RJ09GpWIZAax8B4pDtwEYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jbT5N4Ii; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jbT5N4Ii"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21680814d42so66006205ad.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Jan 2025 20:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737348633; x=1737953433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FW6GDAHddcOMPFKJEakNdIWoZuUyT1szsyK8VMgB8Uk=;
        b=jbT5N4IiRc67b3DRzhZw7kyJO8SML5ZJHdIv1I7VxTKrxYXxjswIhTLgaftIM9h+tJ
         +2vxh46mWo0kH5RJB9jzjdqJmC1DGmIJDy2EaR5XfKfYrjYiPa2C0d+MN4520u1fpTFy
         X2WyXM++aqGX/krCYfz71qMdA+c7+hqQSQoBID+73VgRtoQGM0fghbeNvCspdTAyn8ri
         z2ceVaDKRiuNtjnB7pUYCKHlKkoEuq20FihjzgsSOUHyO2b+N+umC0eFPLdsIc9hOlYp
         mtxODA+KGKQgvsPKv4B/DFxqylIOkBqhw2RNV/vJJ+blAgIrPRzkNC+JQLtAvlTD0sgt
         dvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737348633; x=1737953433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FW6GDAHddcOMPFKJEakNdIWoZuUyT1szsyK8VMgB8Uk=;
        b=aH7VoqjgJRYAWIkPkvSx+FOgADJeNW4oqVbo+Lyys8VF5UtDX4fgwqrO7/ibGX9zuV
         7yphACCPT18zxLwybEUW0phE3m0qdLpZbieo4elOdcH532EVQUOi/Hy0F4IWfZVtbOQ4
         +RqVUSWF1xvWeVzBx3Ax/IUZu27w7E4V1+6Y6K0VD+8ibuAioRnJdaiB4Pz1abRAy0gY
         HtxdjQmsPwQ5lTCbf6J6UJb6o2O+0HSUiWy9CMfx8YOHYiUt4EToIBFOfoanAis6yfCt
         +GnrQ9js2xvElQstlPTJMA9R3V/B5jGcpOjpxJOz8DqR0RacT4gn1PpPT8WJQ6Ye1CpZ
         f0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxnaW8nB6aKtcpDQLMGxuj+hwVbyD5+5NlRq1wIQOLOu8GOLFJI2eDD+/+Tv0GCyrTCwKR8ElZnJ4Fj5Am9UDprw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7t9XSE/gzhIRWczL6a+daczOAqo8UNcYDt3Kv/kpYnsUu7+7k
	34KEGVe0E6LON33J31PZDGClXgQG5eDXq97vUsostGjWqoOd72CJbzzEmfz4KeU=
X-Gm-Gg: ASbGncsMRhNtxL2C0EmTcVCTJ2OhgEP8o1B6iVucJN3sqH5SL03ob5Xhp18DnG9YakS
	eDvifzGsj3XS2cLklK/w5i4ZEC3368aY6OmT6r5Jq86dxghP5koRZXYBj2wcnRXVtbIG4hO0aDX
	t6iE9C9BMkHu3p0scEgxqo2w0LL0y9+uk+WJbvw6HYPeGc/lXV3nvEm4zUKGMAUdYqDUKFWRVhZ
	eXObBGSpyAAYh+LKd4yhwuworBcOs/sVDM0JWP+1pqyECZFM4OBcZQriKQt38dX0+ReEfoD
X-Google-Smtp-Source: AGHT+IGFk0vEdymtZTj+lLuHlMGCHpVVSzOjAS6UfJXaYfWRkrCAng+HqZSDbAH8bdLeqj6n7JsTPA==
X-Received: by 2002:a17:902:ce8a:b0:216:32c4:f7f5 with SMTP id d9443c01a7336-21c3540c7a1mr174490975ad.19.1737348632564;
        Sun, 19 Jan 2025 20:50:32 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a91cesm52428625ad.133.2025.01.19.20.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 20:50:32 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: s3c64xx: Fix compilation warning
Date: Mon, 20 Jan 2025 10:20:25 +0530
Message-Id: <76b218721e5fd5ac2fc03e1340595c9a56c1613d.1737348588.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver generates following warning when regulator support isn't
enabled in the kernel. Fix it.

   drivers/cpufreq/s3c64xx-cpufreq.c: In function 's3c64xx_cpufreq_set_target':
>> drivers/cpufreq/s3c64xx-cpufreq.c:55:22: warning: variable 'old_freq' set but not used [-Wunused-but-set-variable]
      55 |         unsigned int old_freq, new_freq;
         |                      ^~~~~~~~
>> drivers/cpufreq/s3c64xx-cpufreq.c:54:30: warning: variable 'dvfs' set but not used [-Wunused-but-set-variable]
      54 |         struct s3c64xx_dvfs *dvfs;
         |                              ^~~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501191803.CtfT7b2o-lkp@intel.com/
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/s3c64xx-cpufreq.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index c6bdfc308e99..8fc43a74cefb 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -51,15 +51,16 @@ static struct cpufreq_frequency_table s3c64xx_freq_table[] = {
 static int s3c64xx_cpufreq_set_target(struct cpufreq_policy *policy,
 				      unsigned int index)
 {
-	struct s3c64xx_dvfs *dvfs;
-	unsigned int old_freq, new_freq;
+	unsigned int new_freq = s3c64xx_freq_table[index].frequency;
 	int ret;
 
+#ifdef CONFIG_REGULATOR
+	struct s3c64xx_dvfs *dvfs;
+	unsigned int old_freq;
+
 	old_freq = clk_get_rate(policy->clk) / 1000;
-	new_freq = s3c64xx_freq_table[index].frequency;
 	dvfs = &s3c64xx_dvfs_table[s3c64xx_freq_table[index].driver_data];
 
-#ifdef CONFIG_REGULATOR
 	if (vddarm && new_freq > old_freq) {
 		ret = regulator_set_voltage(vddarm,
 					    dvfs->vddarm_min,
-- 
2.31.1.272.g89b43f80a514


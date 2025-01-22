Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E4915B0F2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jan 2025 06:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737525985; cv=none; b=THhQZ12At29TLDn5uTML5V5uAk2eKKrqAE860zuTHD160CpU1ys6AJYpvWuU126VFLHhZFlLKes5lmpkMyW8xqE4W8cr5wPiuGtf15RFwINux8KhAF1zJzVL4/185HOuTZ7zACHD6DQhNTfbP3GPdUVOZHYswA8MfQJmR6P0zWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737525985; c=relaxed/simple;
	bh=Ex439rGdFdfUdYHc9niaz10rACr4snOI2Q6IBNyOfDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jrwm22qQQEoMNXESQt3KCG2A16kQZvVFD+44UE7gidWBQiSVf3IOwuQB/W2VqZ1oJ6h7lMJrJAtUKEWsJYq3d6Lx2EDVOoZjf02J79v3blaqJR86JUR99EQjn+4xWG6eUYDBjoVP3Y2uFG1rEzK+gGfvp1mqwv7KvYAl2E1C1Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rdkC43p3; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rdkC43p3"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so8405523a91.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 22:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737525983; x=1738130783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0W20+yxBOW7S58mPqEOjxHOWXZCgIN0XLLUDfARBjDU=;
        b=rdkC43p3zZqu42eS4hh8xuJAWdf2ZKYPQ0PRxy58msDFeJF4hgHYqM8cEXwix4D1HY
         uZ7k2d/5YiDKoD8FB4w5gTVyclwnYHQv/NNpQWLt+JG8ikqbPTlfwdBUI8f1hoFNzk7y
         a8Fh+nKrp1yB0n53xVuV12uy/k8nNjDx3goH1sMG2B0QoriTb4e/ept+SGhxbnDvhPyn
         kG/TEE0Lp6Me5L5Q/qWuOuSupb93GSHySBBDSbCrdncoFNt0xFRz6466ZPFpkBIC67Sz
         7mTqFfnsjkrOnCCxkvEomyqfMVrLxfEBKaKvFIIjrfmiAJvUjZ12YYjJEsbhGJvm2csr
         8KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737525983; x=1738130783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0W20+yxBOW7S58mPqEOjxHOWXZCgIN0XLLUDfARBjDU=;
        b=HGg11mgI/Y0pUbmVatL+NHMgF4b1mfW9TRzlqZlh2t5dAQaZCSTpaMIAIXvziFCG35
         rDHFWP15hMlwo7WNtXx/SN38s9m42JFcfR0OuUmTC5qpEoVf2eUTTDFlpVVwquJcNDPs
         c+jNUNT8JzL4XFpTZuTzgOOJSaPcVg6Qa/Z0okNPVz++S0qYbcOLaGC48gZ4DiOn95B7
         +ThQT/rvHbufWwwwBumdeYjyxiB2crdBc9tNtelPzNlGvHff2cLBTJoQrnF/vVQSD4fv
         rVwZeKXEf33fLoKCcl4ondGpNCOVh3/z73luEHKct7IfNNMI7z38nnUzIZhrfq/bWUTT
         UZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCUshPAfhdF46gaoDAry1tccTZo/SDXjnHee8wB9e9w9vjD46U7Utgn1fHiAR4laSLGZDlt7FJApFUP1DB7i60XGUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGcWzQGMeI1g5bBqJT8smg0LuQB4dmFraa2OCgc0IZd/BwknOm
	NOBbVd0ucq8zCOpNjjRYXr7CDargSrw8VIjogoMRFjNRC0kEA7jzIZqDv+fXv5M=
X-Gm-Gg: ASbGncvw78kOJUYJ1ZAZgt7l9i7JfDq9JXi9yRgLaig7ST30nhtOuSOAjE8strunfhX
	b9M/+Gmy4OG030za7EdVWHWlo+12Yo9ff0OSR/ojZ/gnmwHmU3Vyfd/Tau7FQ4yLSOmqj1UkTkj
	EgWLWZXBzsKVEfqzRC/M9A3NwCSdvaLWdq3EEFnHppoDVtXHxImKeniOrMncaFkt/aloMu9fifE
	RHy2t1K7Lmy/sr77bf3k+Jbfkt7fWcgnmTX9UGG261mGq9FGvkyzONDMJGq1U4Sn/uVFD6T
X-Google-Smtp-Source: AGHT+IE4ag6j6hEEpyPWZk0VRFVk6mkVLAwHWJ2F4Qn9kdzng8UiejuaFtPP8B6RnjwiXV6/Vg4wEg==
X-Received: by 2002:a17:90b:2748:b0:2ea:59e3:2d2e with SMTP id 98e67ed59e1d1-2f782c73b7fmr31718132a91.10.1737525982910;
        Tue, 21 Jan 2025 22:06:22 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6a65966sm648044a91.1.2025.01.21.22.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 22:06:22 -0800 (PST)
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
Subject: [PATCH V2] cpufreq: s3c64xx: Fix compilation warning
Date: Wed, 22 Jan 2025 11:36:16 +0530
Message-Id: <236b227e929e5adc04d1e9e7af6845a46c8e9432.1737525916.git.viresh.kumar@linaro.org>
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
V2: Move s3c64xx_dvfs_table too inside ifdef.

 drivers/cpufreq/s3c64xx-cpufreq.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index c6bdfc308e99..9cef71528076 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -24,6 +24,7 @@ struct s3c64xx_dvfs {
 	unsigned int vddarm_max;
 };
 
+#ifdef CONFIG_REGULATOR
 static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
 	[0] = { 1000000, 1150000 },
 	[1] = { 1050000, 1150000 },
@@ -31,6 +32,7 @@ static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
 	[3] = { 1200000, 1350000 },
 	[4] = { 1300000, 1350000 },
 };
+#endif
 
 static struct cpufreq_frequency_table s3c64xx_freq_table[] = {
 	{ 0, 0,  66000 },
@@ -51,15 +53,16 @@ static struct cpufreq_frequency_table s3c64xx_freq_table[] = {
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


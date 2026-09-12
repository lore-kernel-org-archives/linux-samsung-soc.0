Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EB33A6F09
	for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 19:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240341; cv=none; b=cHY3IZXK7VeE8U6A5DNT+FFqIG3TF0CDNl0dMEcZpIFBVX5MhKmL6L7vfmlsBQKN45bNxLZa0fwEjhzOwT+CEBNm3lf3tMhGnochhmFYC3RboivnwvyEvTiNkI+WnOl01chDDAwDgIqL3Gvo2ETHPC/az1YA9KZUvfQZGnoGg30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240341; c=relaxed/simple;
	bh=JlupTLV8Cln4XfTiHb4RxwCt6Slbwqs/r3cqkHuWFwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qJOUeqEutokzOOFCMNeh7XAMpd0E7Hw8XtHw7lSR2fOQXpz6G0NlyP3KG/5xIEQcjUuz97tjd7AN1r0XSnmEVwOQbjCk4YuNE/q/6c82asOMUljM0aJ44EAtc7ydBQ8oPUBSPv///f1qOh2JneRjvDxD6ihHLFFQyTtleN2U298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7liz1hB; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7liz1hB"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8686f46e4adso984609b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240339; x=1789845139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghx8XBCWnxG/J6Ds3c+N5I7YNs+hz5/VoWXUJ3eWQPY=;
        b=E7liz1hBcWKo9hD9cGxwgGiA0VBvzMAku2mG+BjnGkXXdeYy5H0ACIvXObYuRp64ZM
         tG6UlEVFPxWa4VnOaAdBdnD+a3tSefi+71h/Bd53KYZ3wiLM0CbsuPTG08XmlafY7Vfl
         xKMtsp86hGj8pKPdTe4imcKy92ikjNJsZp0DJVBPdiZ5SHATA/fq2HVKrP69mJ65vfjj
         hpGJFk+0Hsq0XTvrLIN8YmQuhZ7aZd/6GXUkvCfTuiEaLIzgRgWnt535qBUWcFRqtNL8
         G3yoCiyh1t3TfNU8O7BOrnQhUiV7Rhm/NA3025Byw364eUoBxhftggbG+QRVmsRJZ8u9
         pUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240339; x=1789845139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghx8XBCWnxG/J6Ds3c+N5I7YNs+hz5/VoWXUJ3eWQPY=;
        b=Slo1mr84DTlcY1L1/LzVjHLXJM6XTDTIV7HoS0be2SNe15SoG+m2aTh+8Y3kNzCWKy
         vHgLEJHhVATW5DR7lbVlhiobHu3otDSEVe1wxUZxwHGkrbSkUUzuIAiPkmgwnj1N9+9B
         RqXGu9ikSSb7uwyHMjpVQyZCp7kd9Fg8IBsq7uhAKWR3ngYN38ebzaN2RA7iuua7GAdL
         Mts2n8aIUbjlW/vIaGSGyRTdV9GaIMgCNY20LmxaU87NXjgGkKkLKx1QozT2txsI1MCU
         ijcK+j4UjastxyziJMPKlcHqQwh+pZi8v0J9eeUbMMTak54dMyj36/SqqZquuSFQLsEI
         dT3A==
X-Forwarded-Encrypted: i=1; AKwUvBxIb8PcffdrXQXcKfwpyG5+vr9dBNEu4dBHeNoQnPPpzCYm/18PfFi9UpMH2hHF8bVvMGyXWbSWu3uegyJctPeZKA==@vger.kernel.org
X-Gm-Message-State: AFuF++kk3ZQLNGvBIxXZ+5fVyptxAdWf0LrZLFLgevwQGqMrbu3xeO1b
	H3ZN5Wh9ljnziFUUJk4rY3LPo4imk2ZQu6yjyZKgyQ3HLTkn1e6HUBH2
X-Gm-Gg: AYBFou0XWTzk40qoB6/kCJD27zw9rhl2tRHPEcS7ioFzURhwYMql0gfENvvmAo04hsI
	UU8eAe6wtkevs1qzhI4jMvuXOsKJEtpWO7zR02CA7MCjkT3jit9mHLW43mH1A+A8fDPYYPQwHap
	JgS+oiOhQGPtcArhWVAd6Tcwq2zmJ/XFxHj46AM2AHQ+B9y0WXRXG7AESOGL1tZeqopAiuccO2y
	UgVyHe/o31RVQ/Z3XuIclYJzP/6ATgqL2tvzkksVsaQRRvsEMHf9jyrvu0HVFb052CLqRplqpNx
	Gqc/3kRxeV/zxBkTGJIKQV9Vv/MVvD7nYW7mNqJxCNE0C2QdAKaWKl8xC9lMT0MUYuAQ9MaeW8o
	pIcdVAg5o5XoC7aRspVuvV7mSZ8u338OFseWjcW/mDex8GxWh7giZhss1drUI7gYLVs8dWZkBxn
	Iaf3kytNQOwsndOhobCQo1vTBhWgcvKKJj885MPD+A1bJHKvDdqnpiD6WOE/pfWweuHCfJ
X-Received: by 2002:a05:6a20:a128:b0:3cd:67e9:8565 with SMTP id adf61e73a8af0-3daed19f362mr18812158637.9.1789240339105;
        Sat, 12 Sep 2026 12:12:19 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:18 -0700 (PDT)
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
Subject: [PATCH v2 0/5] PM: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:50 +0530
Message-ID: <20260912191156.185448-1-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is a cleanup for subsystems under power management
(linux-pm) that converts several instances of error pointer printing
to use the `%pe` format specifier instead of explicitly casting with
`PTR_ERR()`.

Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
print error codes returned as pointers. By switching to `%pe` and passing
the error pointer directly, the logging subsystem will automatically
print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
`CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
numeric value otherwise.

This change significantly improves the readability of kernel logs and
dmesg traces during debugging, without introducing any functional changes
or side effects.

The cleanup has been applied across the following PM subsystems/drivers:
* powercap (intel_rapl_msr)
* thermal (cpufreq_cooling, devfreq_cooling, qcom)
* cpufreq (bmips, cppc, qoriq, s3c64xx)
* devfreq (imx-bus, imx8m-ddrc)
* power/supply (various battery and charger drivers)

---
changes in v2:
 - Krzysztof kozlowski suggested to use dev_err_probe instead of dev_err
   for *_probe() functions during review of v1 series. This will be done
   in different patch series.
 - Here in v2, reverted the changes for dev_err under *_probe() functions. 

 - Link to v1: https://lore.kernel.org/all/20260906061755.5103-1-sumeet4linux@gmail.com/

---

Sumeet Pawnikar (5):
  power: Use %pe to print error pointers symbolically
  devfreq: Use %pe to print error pointers symbolically
  cpufreq: Use %pe to print error pointers symbolically
  thermal: Use %pe to print error pointers symbolically
  powercap: intel_rapl: Use %pe to print error pointers symbolically

 drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
 drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
 drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
 drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
 drivers/devfreq/imx-bus.c                  | 4 ++--
 drivers/devfreq/imx8m-ddrc.c               | 3 +--
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 drivers/powercap/intel_rapl_msr.c          | 4 ++--
 drivers/thermal/cpufreq_cooling.c          | 4 ++--
 drivers/thermal/devfreq_cooling.c          | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
 14 files changed, 25 insertions(+), 27 deletions(-)

-- 
2.43.0


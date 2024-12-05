Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9525E225772
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733421730; cv=none; b=tViUW+Cu4Yol85eN6Go7uA8OOIrxUCbMq+NbaocEwt4jXIQ9Fsnf5UogkBFQvrP/XmHbbgYQzSIu/lbcNHIkrgM4Snf8Vrp3FeHAlW1KitO3szqspE0HVqvUkcBaQybVgdKvf8WB0aKYKYna7AXI3f9U3BNTVhSjUSi7fkPJZVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733421730; c=relaxed/simple;
	bh=IUPkXPm8C/w63Brb8YlUvk50wh9QYwPKoutZ4V9uyMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPqCUbxI1DCZg2Hw3thU1Vx9OWRhpDYs3687Y+60uHk6Yt+xe2SKjn187UBN2SzPWIKnu+hXSubQC160bT76ngzB68DeoNiXjNxpUIEh2A/6/DTqWHJ+7RwI2ysl92YQfCdSaHteCS0e5Mvh30M5SZ7W+WxAjfR7B+qPhhqn/Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bK6pr/7o; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bK6pr/7o"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a766b475so12401745e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 10:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421727; x=1734026527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fwQWQ8p4fSiVsjGQYWImVyS0fCQtF0Xd9Qrli2C/FI=;
        b=bK6pr/7o77tSMIAuzPNEQNk6I6ZlKh6qlR/HrC8JJqd5ByaPrRuuCrF4Jm6x72SWI5
         YFuXgzHIoCtWYcz2itXPjFODig7WtCv1a1DYtiT89MGs/CGUPEXjjtISgIv22wkbvA/Z
         k45MKjqh184LlNQdTwi1dSO3SXH4xyOrJVQWJQDzAkdisruHo74k16wqnkoh54kfsI3R
         9cb57LUWhGeRPU5bYl8utRLhmb3ulRKKpkRNREMlqdKXdTYxc32w3CGZ0Mao228up2v/
         Bjvlkfq6ge1WZSM7t+1W+pAUQ4KZlrnT/jRIuvH6eYrxEMyktNGIBLc3ycvm7Yybld+K
         7eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421727; x=1734026527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fwQWQ8p4fSiVsjGQYWImVyS0fCQtF0Xd9Qrli2C/FI=;
        b=RYBOLfIReK5f+deLGFpQg1+P3dXhJqRg9Vg/sFHmtC97bFWOT0HGl5BFAJFPNAIp9t
         Y1bawv4IuaYwjZ/49uJr4ERjsAJ9yTNWxYX57X2fF/iTOpvcw8AxHMnfgG+TBq/F5J68
         7HzNs+VHxa169vLgHGAlDSx7sXaNXrIOQ1kMTfqYSBzDLtIby4I3cR6UUVRGKsRcJl8H
         U/jkHoBXrZc5tT3WxKf/dRxOKSO2AA6f2/VZbaHYq7kvohkA/zUVDGLp7V+vCFP8Qjnm
         wgAUmQlfIQM/2Bpf8dkO80BAp1DmtUDfhXZWq3K5B6ZLE3fhS3A4/+O3xxxNuQW9do9l
         v3tw==
X-Forwarded-Encrypted: i=1; AJvYcCUTkUXOLhLGxZKXdgglQLBC9fKb+LNnXwpC+aGuuDwJ2GQNpX6x+suxE72OtTJjW/2krU81pOdO/fZ92KTJE0o/Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzd4YBu4INkA9jDIUlZ6cKdkzcJUpwarMrBwcNJ9HyKZD1g6g0
	0mU+xCeSzElsM9hvtPW74W254CHuCm0mvMkMKoP7NlSlavhV5Yytoh9meFfcEvs=
X-Gm-Gg: ASbGncsm3EBnr/NWqbQwfsohX21e+PqQisgfMXImATQuexnOFo5FNVmIdMBFlKSM/X4
	46IeK1t/9VSY4YUnKqP/kzvVQ4VzEArpPZU7WQDZ5aCjo8WR57W4bp2HjkZbV3PPjxJQ/NmcZId
	ibq21KEb3KcAMbTaan62nP/fE4U9s6kgXtDW1MnXvqQDqE9nX9a8OUYlk0t8N7DbI2YGA/fU02h
	RxgnP9v8VC2UQKyFdi8NJn1fH7D23C/AAlPiwC9NYx9QC3SlrrvkoQ3jzdnXkXNbdm/B4YE1pYM
	xYE+RBfWHNV8D6YQrrc0l13nEPWvNSkq
X-Google-Smtp-Source: AGHT+IEF0Sy2Q+DDxTeCkIQlhde+ymelj1BdzVhOSZd3iGZysiBbmVwX72aWK/Yxm+/ZlbdpgcXp2g==
X-Received: by 2002:a05:600c:5125:b0:42c:b5f1:44ff with SMTP id 5b1f17b1804b1-434dded663dmr2047465e9.24.1733421726692;
        Thu, 05 Dec 2024 10:02:06 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219098d3sm2618228f8f.70.2024.12.05.10.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:02:06 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 4/4] arm64: defconfig: enable ACPM protocol and exynos mailbox
Date: Thu,  5 Dec 2024 18:02:00 +0000
Message-ID: <20241205180200.203146-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205180200.203146-1-tudor.ambarus@linaro.org>
References: <20241205180200.203146-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Samsung Exynos ACPM protocol and its transport layer, the
exynos mailbox driver. Samsung exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..91139b1cf813 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -262,6 +262,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1378,6 +1379,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y
-- 
2.47.0.338.g60cca15819-goog


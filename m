Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E49130E0D4
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 18:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093234; cv=none; b=VPydowW38zLpH7dthwqlmQDXRqBH2dXk7NBiEva0BmSwQouQG4yPqGfHnVNT9rAK7Nz4Fq84kN3jvT5qFtyRpOoSo8yxh3HLSGvwJJyhlKqhiPEFrvWZL+xUT37yzSKC0tgHZt3+hideY/vozGix/uGLwzPYGV2ZcpM5HMgHs7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093234; c=relaxed/simple;
	bh=r/8ZmvZDpyYTuUajvJSg4YeDXohAr8BNWTYEx/6FpJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+1pqXIqmkryYrzgzJL22FXUyybcCdi0toimkw4uo1Ky9KhvNiwKecW+aF2s29bByFUk39yQj8ip7P7yvr9/O+RDWTk5yrXaP+fINRUlMrQx/0xVdpMYhGlJ//fZdNLugDjAPdFy8fTmwEpX0NR/GbGXEFQDDz5ylmzTAy6Hu7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djPGrhcS; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djPGrhcS"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so696056a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 10:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093233; x=1771698033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQs0hMS3ix8i+/wRWb9Dj6VqM++U0M+jFLpORX82XoQ=;
        b=djPGrhcSocMb/tinOez9HXYLiC2YQ2FxydO9nQKEU6AaZIGFRwxEYN9THpVwO7k+7r
         9c/cMICs5tunEQ/rm/Ycqkee/PvBPzp+RkX4OHhvdEI4SAJ7HviJDD0NVsSByqeExu4N
         ++JlP0ZNPckvWJl90cTHxVXhGF80e4orPwcdcnQ1f9bpX92cVSbLVfEvKrNTsLCZxX+Z
         5/T5FCD3H06oOkrbfpDkIRkLxXukIlbPUFL8flaB0FBktJwsYtKua9+pAoVHtAKxxqod
         M6hWq9fBHKP3hml49oanJGDMFwtAMaVJeyDDHs0yfd9sRTQidStCLHq/mT/9a+rUFx7X
         BbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093233; x=1771698033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vQs0hMS3ix8i+/wRWb9Dj6VqM++U0M+jFLpORX82XoQ=;
        b=YvZcvZU3fWga2XWc8d1Q3Lj2yJSnKI17+xSa9lmNrOQlXMxgTMfS3hQ5wBfTKnFsVb
         ymsMkD3uWyTX3oDYOaSMYj8vtR/n5TqNOYYytcar0SAsi2OkDPJb7MQ0GSQhxB9rrpnL
         ZaWZF39GlpTdwl8NoxeGgkTSD+/j5/8U/qKHwsq7lpL91oEGmtqxk0qqs0gL56hQAgWZ
         HYF6A61i1jY/Yihsi19/iA73cHirqG16KK+snPLi25KdaVaDhGGidwfrEfUWENwx167K
         RRWi5BAQ23DrJWFCHMoE37dxaMM9WvOEc8KYPI9lZ7iEKvwI4oX0aDu/LQgiPx43hn1x
         nZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+6jNMu7e2NnsAREByhMUxwVqXA9bJzhsXQ1E5a7D4KBJevoUgMnvy+pZDQiOECmHCPc0RArb3yL103HxvfnW3Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1BFcPT9085QXs1DOeA34PlbOdqTL2XktydrnW+8g3I5zREPBH
	AFqiPo75qlZSl/PEHdsYvat206uwg0d02RzTCFrPt89f2jhIKn+6Dljqy8WB8I5F
X-Gm-Gg: AZuq6aIUPX2XAdYiECe57DjwiDrJ66qlqZnYu6asFTKzq1p9Vdb8L/K7mbfrg95pMzS
	wXyCBxRoUZmBgyAHLLro7f8434Ba7vlLdlT2xd2DJfgSIJ+PJynLENm9pN5vtVaaBAamURk7YYk
	po2g/UrdMVp1s+M0jcbPauGHRJmATMgo7fclFznDGE0p0ODeyvanhXkWdk41Yc5brutiDy5Crn1
	bvUNZTtQEE94061bnKDQqsp9Cg956NQ3pkgcQPQORV9BnzqzEm5SAAJp19EIw5O5p23ismBPBLO
	iT0KZJfYWWS/Oiivwf1XE+sX0nPrVTUw6YNr1pmFkEMefSeAIqX2/n2zx3QmHi2dTkVpy50e01u
	1/+1FEZ90+GxA9Ris2+JeI1GsAMHFUTydqS0cSTGFu7YY0mqOlegJ/dQ0D3iI1YvuR0jsur+U0F
	Cgr5bo5skC8TMfdbx/Zs0=
X-Received: by 2002:a17:902:ce12:b0:2a9:3211:29f0 with SMTP id d9443c01a7336-2ab5063261cmr51537235ad.58.1771093232858;
        Sat, 14 Feb 2026 10:20:32 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:20:32 -0800 (PST)
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
Subject: [PATCH v8 8/9] thermal/drivers/exynos: Add missing drvdata assignment in Exynos TMU probe
Date: Sat, 14 Feb 2026 23:49:05 +0530
Message-ID: <20260214181930.238981-9-linux.amoon@gmail.com>
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

Add dev_set_drvdata(&pdev->dev, data) early in the probe function,
ensuring that the driver data is properly registered and accessible
throughout the lifecycle of the device.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v8: new patch.
---
 drivers/thermal/samsung/exynos_tmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 1d657802a310..47b92c84ae98 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1070,6 +1070,8 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dev_set_drvdata(&pdev->dev, data);
+
 	data->clk = devm_clk_get_enabled(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
 		return dev_err_probe(dev, PTR_ERR(data->clk),
-- 
2.50.1


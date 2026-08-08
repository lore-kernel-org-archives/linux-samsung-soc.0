Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56385126C02
	for <linux-samsung-soc@vger.kernel.org>; Sat,  8 Aug 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786191485; cv=none; b=QJUwWVUeIu0VfcaIi88xtyRWD0zdfB4h5sTGKGauycUrOauQOJnugOIaFq9T3UiNGsVmWaTiwhKmDJ8nDQTLOHXnvVhXa2y7AWvmP0xLPhOKP3PBearbYsbpWRmZ2dPnqx/qMXH0Qy+Z6RL497DoQG8VL3MhFfLQ7IigbxAzuJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786191485; c=relaxed/simple;
	bh=a+TJaX4ER1FWwzfB7ZX9Vno1hut2/r6rvF0x/WRAjvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1YV5R8VNgBJoFK4Kxl0K6W4g4M+Zi4IcuS5GasAOFd86NAB1Xj2QXvF8V+nV1pwvFj5KcgnuhWmEasrIEetqUf6oy7FOewoP58hcqkeAAyhYv0MMvSz1Tb508CgG5azN7kajYkzb7tWuLQvR0yjhBwNK7JBP8shJGVq8XWlW1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n10ojE88; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n10ojE88"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbe3fed2f58so254840a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Aug 2026 05:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786191484; x=1786796284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCtw9XLhyYld5CLOFuXhhaanDpjQ78I0gCn1Zksv45A=;
        b=n10ojE88kEoSadyNvpJ4d0IoHzQYgwQDaV6Ob9wXVxo3sOOFEIE3xgGCKRTiugkhfG
         SMKPHLcg1IZhiVbuy36c8zuBsTbXfyUO2nltCYiPsp4MfiMtZgrCasAviNAXl9l/HvrK
         7a41YhIX9I3SZ9SA1pmmPzcixDk/8mJxtxF05ofhVxUjeVPMDZ1T9RhFpWSpfgDsR//v
         skYmP6fAZ4q3sZe1M53xaqR2iHBE8+0xonsym3j658jrr2C9+cfwgQLPSyATBNi0PrMe
         gHx19vBC8PjFpEt3RMctYMpb5Fz2dUVix+IChrHwbZ1iqb+ynyfgrh/C6JKAdddwxc12
         eFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786191484; x=1786796284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCtw9XLhyYld5CLOFuXhhaanDpjQ78I0gCn1Zksv45A=;
        b=FW76TmCJk+lVnbRaz696Y6Trvb4lcKlr0SERjAsjWFgb/BzE+OmdGHy0c+E+gF3/L6
         VZgajvJdxidL5UBolDjAXoo8LkjF79iof+n1btFkysJ/2uc+49GDc/qgccBc94+ntK/Q
         GpPYdXVZzP19dTv3VXg5iqvE85YmACOcblZ0cG9qg6N7JPi1d0l/3zJ/crrBWmYPh3iG
         4e42Z0ZD2civM+NUtiRcPUuZcro1TRvJK2XQ8op+Kh9SHb4vhbpVwonCLGs/8lnRrPG3
         hK3el1AbcOn3gz04CsaoQWyXzSwdI7HW4ACPQXibrFubHiUPWudCzso5eO44KHA6MjLu
         sRrA==
X-Forwarded-Encrypted: i=1; AHgh+RqHnzbCqZzuYxAgGxJLTN2XN0GrbqtkIiwR9PeXfYMcied713wZ/h7ZzHCeC4MtNUg4foky5RLUE7ZmRfMMeBnOtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/mqfWxwBaWtkAHpNwBAtnKpTl5+MWLB862PQikRls+s98jVKm
	4l3pWFxaRFMY0i6vp7u/ZW7cS38KLRGMA/Fn+QGeraPzUeH7No25xqT4
X-Gm-Gg: AR+sD10Zkto1xFqSFPiZgrSFoGn14DWDkrQy0f5ptv8vyWOCFKb2PZzS9FcwOp6D62w
	jpEnEE+e7837FStX0i9Kyf8F0rnyxnCAfTLbNgxrsMhKQsp7qwNUShu8ga4W9pB70kEQfPTUTBB
	xIIUyNCNgwjZOCLWMSskp/xA8+Tfp/1wLsgJdXgKRcXQwVV9B86X776cHtBBFeg0vHzLcXb1Ap/
	ppcGFKQSXXAyuScVwQgawAgTfI7xcwRmC9/HdXfGWR62Yk9odSShBkSEjEfTtF1/tmvhYR4H02z
	noXAHh8T9Yu0jV3lqn5SLfeu6vpMgi7KawS60o9KKwh5TN76kZW3jeo+s37+xxlcKLSO8hnK/ck
	mDyqEIEQlT60Z7whWR1twHFUB6d1KqeoYUFDbgsnerxuZG6HKcCb5fDAlyjBuVjCi057vYbekk4
	qWVFKV8movf9AuVoeqfO0Jo97Tdbn2vpoQoxY6MX8CbfiXZR88Rd3pHXM2vKSSQa5piUcU
X-Received: by 2002:a05:6a20:914b:b0:3c3:bbe6:95b1 with SMTP id adf61e73a8af0-3cb85eef9d6mr29740341637.24.1786191483645;
        Sat, 08 Aug 2026 05:18:03 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1b04e9sm1781742a12.12.2026.08.08.05.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 05:18:03 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Joonyoung Shim <jy0922.shim@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/exynos: g2d: fix autosuspend cleanup on probe failure
Date: Sat,  8 Aug 2026 20:17:52 +0800
Message-ID: <20260808121752.2819486-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

g2d_probe() calls pm_runtime_use_autosuspend(), but its failure path
does not call the matching pm_runtime_dont_use_autosuspend() before
disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

The documentation for pm_runtime_use_autosuspend() also notes that it
is important to undo it with pm_runtime_dont_use_autosuspend() at
driver exit time, unless runtime PM was initially enabled with
devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: d7f1642c90ab ("drm/exynos: add G2D driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index e92a4d872c41..98a5679258e2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1523,6 +1523,7 @@ static int g2d_probe(struct platform_device *pdev)
 	return 0;
 
 err_put_clk:
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 err_destroy_workqueue:
 	destroy_workqueue(g2d->g2d_workq);
-- 
2.43.0


Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3E731065B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 18:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093201; cv=none; b=WT4YBDbVamwigJAHOUojvTRoPtNywa5q4nhHgpJD424Lc/YfMOkYkqTmoNoXk9pXBYGhhCsmBbwfo5ueerQmZFZOGjdxH5rnTGgOiT5AwlRdxIUuQ89mNLg98IMVuuOfLqy25jF+0v+sZU/cDX0bU9n3blRtMA84WFUawfT+6rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093201; c=relaxed/simple;
	bh=PfOygATA+OcMrjg0RKh13yWvltWb+BH/5KX/xERXXEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gp+c1EBNqZCCjEf+6ZE04c8o6qFsZpzmAcnVvj9u5cLyU7g5tqwQHFvQSRctWaIoiFogiJoVwvRPMpD8i93op3vEFzD+69GNNcvsM73M/4FN6LnG8XiSDqMyG80hT/MqpD1D1E8SE2VmS9CHrcohAsUmxG+/S/gPJ8MN2wyb0Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0f2/QQV; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0f2/QQV"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c648bc907ebso1131906a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 10:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093200; x=1771698000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aN6kFZ271/Vjt9LuqJxvnwus9JIfHbc3XvmUWyOckqs=;
        b=R0f2/QQVFZTGJj4H1FmLzqu1IkLe9gxNYzR5+WFZWeOOEJ5XRcGlc99gC9+abkefeU
         byoSOpwjRTO0zKUfmBUQrxUaahEEM3DRJ0YeYdT+jIbynFY5jrPeUaVXGzxSn5froMtP
         AiXMwAmJNsIjpDX77ZF8KOi0kBsqjBzey0uWweJun3HEheZatndnFwQ2cSK4ISy0izQW
         dmMxJznMCgUP6v1orknIxx+khZCRrENRki9ynwtE/quIB/RnBu7XK/IsyD2urTI0QDkj
         8WZdNuOPZEQkhdsV1J8wEYGErTVQwiQ2y1pxN1rHhpNbakeFxNMmo/HXtP8o1weWnf57
         rmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093200; x=1771698000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aN6kFZ271/Vjt9LuqJxvnwus9JIfHbc3XvmUWyOckqs=;
        b=eUnWb1P/vjxHE9VIymL9rBGbEIMFxA5rHyTt6X8rOTyueic/rXNvUwVjR06LfZJPxt
         8HK8ALwNQa4KEcac3ZCfbkujVH/+QkGVOs2NU4fZBeJMcogbTSGvG2188QMeB4CXCfWV
         6QNYLIXP2Gwfy14XtEecWLidgLKjXT5EpKbQK7Tbbwp0mUdjOhdB4d7OvWp5jWBli6GE
         49kC1maqzC0Ocquf70kcYdWx9XxCGAGoGSu916LP/TSI8Rfx5mDFFKFNNKCZX3VrZ7KT
         Gy0/fzKGq4jMjYYxEaAnCE31AS7uVAP5++QOBjd/IUhf+9hUkN1ZBgSTzlzClHvxsO1E
         x7fg==
X-Forwarded-Encrypted: i=1; AJvYcCUkBUhr0GahL4hQRlVMRkuig0Rm18HNvsa1CtWKnK4f/oVEjcAoyY2LCn3ijHGwfAaZEiPnrxLHR+6XdMuHiW8t8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLl9PBU3zqjNb4lDbnoms6Ctk+9gm5mod32YRrHGis6217zOes
	X+iONki7i88SIB3RV/fsbKN9MKNDwj1jAqgNPrx9FHSx5Fj4E5RUFzaf
X-Gm-Gg: AZuq6aIQr534GGCYpJyn4DNCfi1nFWN2p/6xv+FUozeBZfJaEpBEdK/mjT3ms20SL8z
	MlHBQlsSFoFDScjxpewkF3IJOm9Ely2AzuBlj9iKkkXriLOABMR/9brQ5FTwjETgWorik50y20h
	p807CTPJZbszvgUicIUWqAX2YVTATNVIXlIcv9EAT04k9+8xg2ceqXLrydXIzwKzuyDikhVjDK0
	MFSVUcwTiPnZmrMMCC/hySA65PxWn10ZVabXhkuMvpoENiHN8tr6fCfzjJBVQdGvyJtdUu3B4UD
	54A4HFldZuE+IhlGhuMbyHns7T5u4ytGk8qiCobxR5CSjWbs8pRgRifY0VrcQnVM8mASAIsoGEi
	oc4GLV1kSVmUo0/bOShYRC01jkC02kHXx/f3J1W6g7CPKueHgfu2aVIkyIqhrXfRvIXq2+e3OLh
	H1tWRTxP0+iH9Ul/hqXBQ=
X-Received: by 2002:a17:902:dacd:b0:2aa:f2f3:bca1 with SMTP id d9443c01a7336-2ab4cf4f72amr54134195ad.9.1771093199695;
        Sat, 14 Feb 2026 10:19:59 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:19:58 -0800 (PST)
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
Subject: [PATCH v8 3/9] thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec clock
Date: Sat, 14 Feb 2026 23:49:00 +0530
Message-ID: <20260214181930.238981-4-linux.amoon@gmail.com>
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

Remove unnecessary IS_ERR() checks for the clk_sec clock,
the clk_enable() and clk_disable() functions can handle NULL clock
pointers, so the additional checks are redundant and have been removed
to simplify the code.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v8: None
v7: None
v6: Add Rb - Lukasz and Fix the typo in the subject
v5: None
v4: drop IE_ERR() for clk_unprepare() as its handle in earlier code.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index aa0726b33c84..5f017a78f437 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -258,8 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_enable(data->clk_sec);
+	clk_enable(data->clk_sec);
 
 	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
 	if (!status) {
@@ -269,8 +268,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		data->tmu_clear_irqs(data);
 	}
 
-	if (!IS_ERR(data->clk_sec))
-		clk_disable(data->clk_sec);
+	clk_disable(data->clk_sec);
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
 
-- 
2.50.1


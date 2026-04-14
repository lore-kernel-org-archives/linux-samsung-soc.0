Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B2C317152
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Apr 2026 17:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189324; cv=none; b=U7T0KgYX+LjOHWmehKMP4L2BaB9rodFei1f46vGYTNLQBKthqes9BLfr7X6QnfZgphcA8zUHUo1RgIObo2umAFK4/3H3O1XAFnOaOicPNKt0Ptd96Etuv3R6BT8/hXj05PsA/oP5qdOj5wzMQ1S+M/tsr5VxU0YCDdjO6H6F9Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189324; c=relaxed/simple;
	bh=XNxC/j7wptgQgcyC7rkymCzPC7ye04Nqy6IooUn6YxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InEs3GbTLlELMG7b9mZlyWGotlmdahO6uaOVIVAWPFeRgKpXmCFpfb0JI4VeWF1OzVwwZCq7c7agViAdQC5XKoaShIEi0lZewHBfw+H8LiuuttrJzemesTWzlj/FUp2j7VctkAK1B7coTp/UZ09/peuYeYGOtLAC+LlMGUbwSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOJIrm1I; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOJIrm1I"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so41705265e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Apr 2026 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776189321; x=1776794121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4R0CQZ/qrW+yRPLga1sILnx+THT1hscnrJSpkR4Elps=;
        b=fOJIrm1I20fAzcpiaFbutuMLu7QK32Y4dbMrxxVK1Y1kJXMFQce14pXR9jE5LPjdnT
         iik2oOACVZl15ctt/4eV/3/jOPa5Ky1RUcOz+UkE/yAIYcKQmk6jV1l9wcjRz7nZpzNE
         Bfxgm2ZoWJYMZZQ0iXbmj/qeFRzP1BmsGMAO587yys3LyT28HiRg61YSNq7zFhr9TkG2
         T/zour/lt2eECNiGjK0rTaLWwXYsPd1vIz0omGCPxohvp1pTlMYjZZtcCroiHchsMnD4
         lDDF9Gk+mh/Tv66ikUgblPwofvveJzfQpHNGMCyOQqw0hiKDb9iDLkVnxfKYY+JDHVYl
         7oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189321; x=1776794121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4R0CQZ/qrW+yRPLga1sILnx+THT1hscnrJSpkR4Elps=;
        b=kh9w46ZwN/qTz0FkIlhrxdUqZtkRAKeAffHuEQ792Bp6g3Emt66QctyvLYZk+oOyC9
         PL7PF4/4Jq5NW8KKcbcXwmfEmHtDWvADXiKJfdl52/CPdEOobfyQAVU+dlHR5VG4B2I2
         qTxJPvsnER/vNLHVQpFnGys0b3Oo6CDcsJluUQjZqQcsMD0wtsVPiAt0m5sufQXhG/os
         Q2L0XHFAlqQPV5e3tUhRwBN+msQMyNMwbSM/cJgiwBgfkgIZYcp2IH4Cd/zU0Km7hUFT
         anjEC5VqOf+qwRAVEVH+WsUYYQKNxvGUHuEbtnREhMT3Ls/fAvxPcDOgfPDy5jChObXM
         Wb3w==
X-Forwarded-Encrypted: i=1; AFNElJ9bRgnHhmsFWfrZ6ayypwStBMRucTSO42Tj0snNJz+nEHfav8l5T6/+EuswUSYBv3WXnwP34d95vuKaaUswcn7WIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFghC5ExSE/y26ldMFzK47JkBRmmlR89CFAaoj7Gu0ADuKoGpo
	xYXAFvkhDo35S0vH2nLdq91XxcmfoE9YBwN7iYAVQPbO++3oaHPQsD1Z
X-Gm-Gg: AeBDievAF4txcOZKz31p39IyKGETJMZfTVRj0WjN8iN+3hXAGxtSAeWMiJAJn2as7wK
	4UT4dmeNMGgPVWolzJjC8C8z2biHsdXfhCndA9MAirGxEWqHJ1wA2rme9hXggU2CqxJ1g7UHhtd
	VNLMxVo1ZYU8by73zsZbTzOPIUnIztAoExl6rMEtrAo5eAsipqPat07jI6lHHv6SA+tdWX1RzVo
	jvUWT9phbLMi9EtUw/YmleoklHpihVgbAkXpB1HnLaMTcid6+Y1FcoV8gKSzW9t/li2qsmM3qR6
	BhaQn64CqGC6q5nZID6gdpPzc5VIGhjnWgttnf28eVNBVfdCZqPCYiUcV3NdwK+IO7am1suxJFY
	3iggTtYsE0Bxtf0EURNgGbwyfjPPof3yz1OgRk1hMe719+X15RiKIpTakm6g5i+2m2P2NjiK4Qw
	QedF7p5jJJdMRh8bZatGeJmIFG+BsIpLQsZBcPtX8PllaIzTcUEv+BclYMLl99
X-Received: by 2002:a05:600c:c088:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-488d67e6776mr181720905e9.13.1776189321058;
        Tue, 14 Apr 2026 10:55:21 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:cb49:f403:bb20:cc84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1df12sm150436425e9.4.2026.04.14.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:55:20 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: luca.ceresoli@bootlin.com,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v2 2/3] drm/exynos: remove bridge when component_add fails
Date: Tue, 14 Apr 2026 19:54:15 +0200
Message-ID: <20260414175417.144625-3-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414175417.144625-1-osama.abdelkader@gmail.com>
References: <20260414175417.144625-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_drm_bridge_add() so the bridge is released if probe fails after
registration, and drop the manual drm_bridge_remove() in remove().

Check the return value of devm_drm_bridge_add().

v2: devm_drm_bridge_add instead of drm_bridge_add + goto remove_bridge

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 29a8366513fa..e68c954ec3e6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -423,7 +423,9 @@ static int exynos_mic_probe(struct platform_device *pdev)
 
 	mic->bridge.of_node = dev->of_node;
 
-	drm_bridge_add(&mic->bridge);
+	ret = devm_drm_bridge_add(dev, &mic->bridge);
+	if (ret)
+		goto err;
 
 	pm_runtime_enable(dev);
 
@@ -443,12 +445,8 @@ static int exynos_mic_probe(struct platform_device *pdev)
 
 static void exynos_mic_remove(struct platform_device *pdev)
 {
-	struct exynos_mic *mic = platform_get_drvdata(pdev);
-
 	component_del(&pdev->dev, &exynos_mic_component_ops);
 	pm_runtime_disable(&pdev->dev);
-
-	drm_bridge_remove(&mic->bridge);
 }
 
 static const struct of_device_id exynos_mic_of_match[] = {
-- 
2.43.0


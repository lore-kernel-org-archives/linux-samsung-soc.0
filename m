Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7194D3112BC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776974799; cv=none; b=tfGs7f+LqLtHTY7obispAdEJxH8EvjDwluiR3Tvs7T4nQJw09ClrsFcVVoxic22VZRkuK4C9hdLJR1pPMovAITtNcfuouE7Pi33+lMNAbGOWIpXIQGflEBd48ad2t3YsS/lZXeKuCDgXR8/RoF//7ipZTPc1jLea5x2du0nhy7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776974799; c=relaxed/simple;
	bh=irMnp7k8TSFUT5cNFPN0LKBkCkN9KcJEK3rHVag8CKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0n7k6Ux6aqs8HWB7QujkTNI6ypgENwMcVI9Y4KlB22qGAUO8Y0m/RjoHnYd++DlExu6wyDbX1M5OLs1LZgUHQqI+DdnWDeu/27NndEx0SGeNaNn/Z8CJqZKUFkbWD52+Wv/N+smQcOha5uP8qtHft8QJH++YvLtncbyaVjX5yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNh4oWwv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNh4oWwv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so90392725e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 13:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776974795; x=1777579595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miy/V1Ssd8oZVcXvrSSNRZJTWkLzXKYl4wR7b24pcBU=;
        b=VNh4oWwvmDrGRloogEy2/DO4CSRXDAoDDxQ8eEr5LW6K36gWHkscP32Kie3cshoc53
         YwurxfVgiL4QErswRuZTGjYgEdKKysvLzOtyZ73Qx1ET3DcbzXoiN3DuvJj6c54kKckl
         HJdpW+rfp992RTUnTfbTkPrBUG+mFmibR7tlo1Qlp3KaRyL7DGrdufJDSr+488O5ynSM
         tK+USAbXfC0uM0Tugo5302d2WJy7PXpoYhkbdTPNvLKiVul8BHvRlVaiV/n/KWFTqHUa
         561jFnZMF7OmpQwgkJcOF481EAiStjlEOBmSNfaJOu0QmYZqe+alQUCC+I1fPIBd2F3c
         lCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776974795; x=1777579595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miy/V1Ssd8oZVcXvrSSNRZJTWkLzXKYl4wR7b24pcBU=;
        b=lIL52PK5BXCDS1alXw92ZHpbWUwnuYoT8NeYVz9Tfi0ZqSO0Tgrhn1X6xriCYswKzT
         EZYP8iUF4xKUG9po4L+ZC4hFnrKGd8SiiPBeHcB0WNlWmNZdXLV948XzhkSMYMDwHpUN
         /eA0qtz2NSQSX2FJi/639EUPJcIpMTpWvx1d0IfLDiA2odyO6cWvhcnZhkiGGjPa6MhP
         2SIdt+jUyeIJ4dAaDunEXQYnXTIVJouZHxAByOhUSAZkvhiD6wdtLUj5mHRG/YUidogB
         bwsaI1Iq+GrZx+y8X61nwYpzUFtTU76iPv8Y250myWI/rzED4ltAxIgULBuPVdSC4Yl2
         SZvg==
X-Forwarded-Encrypted: i=1; AFNElJ/HeDCjYdCbDqXuNPp3fjGc9Fd8uJoWhabvsF7HLcApHJ1drZS9zVG8LiP1yFrDCFfo372RCdy0DKdkq8O4paS1Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEpJxwtbP4SNGgTDG6sHy3LtQDiqhJ28zt11A5sWlBOUVLmMqt
	vCHn6VxKBZn0b1yvA9INbDXvobXFyeD9K/UXiaUFTmaN4qaQ9Gwon0Ah
X-Gm-Gg: AeBDietwt0bHmcGwUfba10XCa7lF+s08cuwgCxKyykWfLjL15GsVqhLz3aEorCVNtog
	PBRs/1qBwLjUkZnWpEQVg1Q47w+v/laa/vL/aqAQoWUE/NsztC5nlhdVNeWv4X1GBbL58cnReJf
	7stQO9KacJRmKFo1P/xFJnUQv7MQAfvmjS1JciMJKPQQ08dw7NZlKCXW3aOXVVDRbgZAj5Zi5B2
	2/vVR3s33MxD6JOqvlowmOpFFKnlGu/J81OEWmNqERGW3qCwmDJUfp29J6uPN3COww7sgO0mA1P
	qCP+gpOY9NDczsUpsavwyQgCZ25141fDFjYJKPcDylEubesQ3OVZM/afJFWBIs4nl+IdylXoCYl
	IAlcMe5M+e5VFJgKiPlrxM1fPlM9l0iEV4cISiVb1/72VLuvG0r68cUBAaRwUDySl/MmU106toZ
	9FVhYRRGXF/4A7TmYXKwOTdNubbvz/XfNhTb1FRmOlGFut8PCTYlj6yW8IXKsVxZXhjM8cs9I=
X-Received: by 2002:a05:600c:468c:b0:48a:56d5:16f2 with SMTP id 5b1f17b1804b1-48a56d5179amr182114795e9.7.1776974794828;
        Thu, 23 Apr 2026 13:06:34 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:5f44:38d2:bccf:b54f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75ab25sm167658815e9.11.2026.04.23.13.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 13:06:34 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: luca.ceresoli@bootlin.com,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Hoegeun Kwon <hoegeun.kwon@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] drm/exynos: remove bridge when component_add fails
Date: Thu, 23 Apr 2026 22:06:20 +0200
Message-ID: <20260423200622.325076-2-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423200622.325076-1-osama.abdelkader@gmail.com>
References: <20260423200622.325076-1-osama.abdelkader@gmail.com>
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

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
Fixes: 576d72fbfb45 ("drm/exynos: mic: add a bridge at probe")
Cc: stable@vger.kernel.org
---
v3: add Fixes and Cc tags
v2: devm_drm_bridge_add instead of drm_bridge_add + goto remove_bridge
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


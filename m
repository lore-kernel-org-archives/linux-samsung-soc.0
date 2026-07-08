Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01D637206E
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Jul 2026 03:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481343; cv=none; b=Pkl7/0yDHscJBawHurDtbyKmmyyuawHqVjraA5ZYyz0sMfYni08pGpUiw7N+fydzpCOlRSrUr3BQg93Cicns0QUftQtsLLPnOQcLve6FUosyT7YQklSHGX2X0EqVTDGzlNXlznQjt3OzTdxLk9Ob065/H3i7Ucw+GLtbTq9Rn0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481343; c=relaxed/simple;
	bh=cGQRLKPzkRBbEQoSHGKQKFpcGeZMtIrh8S47aKbpQqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CYDGGzqsm3Qd3Maco8FNs9fcRW1uLlnhw2HgBL/Y+I8X6E+LmfTsR3uDyy7Gu4mOKcBTOhJbR+VA0n/bJK4q5V80bvuJ8VA/ClxnVURePxtOry6Yh+m7r19CKNUrchA/lzRm3CR7ukaze3+dnipa+L3Mf7byeiSJklxhrWqciAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHEuOZ6q; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHEuOZ6q"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caced6038eso2599495ad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jul 2026 20:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481340; x=1784086140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dWbuXPSLohRB/M8EIN/JzhKRKCDqHb+iOVssm+yt0m0=;
        b=mHEuOZ6qmLWS/Rgs4KxZxaIbt0pLxVBNJ8MZyXrz7JWQSOmWBDJdXFWhg0Zrxak0LS
         e37Nsa8Df2wpyiSuIxnbtAC0AIoAgcys2q/bD4iGGSWfSPaVqm4Kqf4uSf9NwYSguSid
         p8IRY+wQYcfor/DqLYnzwoi3uaorgN7Jzu+iCKKoCSel/DNJXTObP+SO8galattyjozR
         iD2zmA9ZtQOl0v/SKds3PWP3Y/a/JfIHKVeoDNVKATE1BB2M3IqEqhoL8rUkEKplIwcx
         O/oSnzh7q8MP+stWKHp0nzIt6vVXEkotr+RagcmqrboEg66F8RZ4i/ghmn06u3OJDHbG
         6A2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481340; x=1784086140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWbuXPSLohRB/M8EIN/JzhKRKCDqHb+iOVssm+yt0m0=;
        b=slQugrRwqraWOztv4kMhGrabmc7ZnCNJasD0fRXeqSWg6qZMbHbQJqygboPzXZ1Sil
         iwZPLDe3RpXtPtBgPboSPqqVhwGmrWJNby6A6lkiuV4Cwu1K30givezB7hCogWystWJo
         YqkUYWC3nHZvW5EIPAYFUK+eXeGpaQCQYVdoNB2JGVIByFPCojJfHgXc+sbi8X8OOTqo
         xQXywOe2QQfvnwVP+E+LynNCM3Z9HKiIOle8qISwdJa6Sq3sfMAxqTVZN0gWqTjnhVZe
         cmjKlPTuSK6o/T+UdMiTFVcFD6S0G7ujCwtdfsymjQneTcdDOAH2vIe8QJSdrSu2phhY
         o0tQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqf4gvZliG1XvpXV794VcVDdqNY+/wxI1cYVss3XddgWEQRvQbJWGwJSYZgKqjeAZC3UJwDw5UrrwhssCEtXC8GJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGAb+GYKhQ5AvLiWMc8NZgnH2q68cBqhvdtvUK44WvPCOZOCWc
	z7p0SxPYrQ0a7OjpSbnpOU5JyyudFV/Xze0tF1L5cA89EN4mMzktBy6X
X-Gm-Gg: AfdE7clPWvFVi0BksYIje7yG494XWMXPI4U3YMdi8c7WSFI4bWK4+TGYtmq42vcmGCJ
	aHFJjCtK1tf1MPWlHukSt0jwN2LvFYnran/Y/SXeIs6ap08I2gEq+zuy4TzxKePU0HBVpr9+cAu
	SMBYkm3v9JPLWWzC2LqBgJ34Uz8YWJDnB4jOHuIKpZ/rkYUFH2AQpN6DSbjUIEfAsJUV9XvdBKg
	Sz7k/sr3fVNhzfgr+L8OfbLIrD79+QF8+VjfySt1O/iIZfB02/siqWa+jL7xNj1lnTA5BuTQwMn
	goACuiaCEqHFBiB4iLBFEXzYg2w6N7L7zLxceLRjsniTSbd3q3/zb/b10huc10DjMX8xdT8MbS4
	1LOOnwPSKkqblU9n4IoNPyXko9oUJYrGii2V9UDeK29zgfKNuLv1tfAtuDjAHXmUTh/jWxscY30
	JmuCFgDrgHGw==
X-Received: by 2002:a17:902:e84f:b0:2c9:d277:2cdb with SMTP id d9443c01a7336-2cce9fafe09mr7101655ad.9.1783481340217;
        Tue, 07 Jul 2026 20:29:00 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c20616sm20602815ad.34.2026.07.07.20.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:28:59 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jeongjun Park <aha310510@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] drm/exynos: vidi: fix EDID leak on concurrent connection ioctl
Date: Wed,  8 Jul 2026 11:28:47 +0800
Message-ID: <20260708032847.712897-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change referenced by the Fixes tag added ctx->lock protection around
struct vidi_context members related to EDID allocation and freeing, but
vidi_connection_ioctl() still checks ctx->connected separately from the
state update.

Two authenticated clients can therefore issue concurrent connect
requests. Both can observe ctx->connected as disconnected before either
one updates it, then both allocate a drm_edid and assign ctx->raw_edid.
The second assignment overwrites the first drm_edid pointer, leaking the
first allocation.

Keep the connection-state check and the ctx->raw_edid/ctx->connected
updates in the same critical section. If a concurrent request has already
changed the connection state by the time a newly allocated EDID is ready,
drop the new EDID before returning.

Fixes: 52b330799e2d ("drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 33 ++++++++++++++----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 67bbf9b8bc0e..bc0af9e6bc81 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -252,15 +252,6 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 		return -EINVAL;
 	}
 
-	mutex_lock(&ctx->lock);
-	if (ctx->connected == vidi->connection) {
-		mutex_unlock(&ctx->lock);
-		DRM_DEV_DEBUG_KMS(ctx->dev,
-				  "same connection request.\n");
-		return -EINVAL;
-	}
-	mutex_unlock(&ctx->lock);
-
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
 		const void __user *edid_userptr = u64_to_user_ptr(vidi->edid);
@@ -293,21 +284,37 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
+
 		mutex_lock(&ctx->lock);
+		if (ctx->connected == vidi->connection) {
+			mutex_unlock(&ctx->lock);
+			drm_edid_free(drm_edid);
+			DRM_DEV_DEBUG_KMS(ctx->dev,
+					  "same connection request.\n");
+			return -EINVAL;
+		}
+
+		drm_edid_free(ctx->raw_edid);
+
 		ctx->raw_edid = drm_edid;
+		ctx->connected = vidi->connection;
 		mutex_unlock(&ctx->lock);
 	} else {
 		/* with connection = 0, free raw_edid */
 		mutex_lock(&ctx->lock);
+		if (ctx->connected == vidi->connection) {
+			mutex_unlock(&ctx->lock);
+			DRM_DEV_DEBUG_KMS(ctx->dev,
+					  "same connection request.\n");
+			return -EINVAL;
+		}
+
 		drm_edid_free(ctx->raw_edid);
 		ctx->raw_edid = NULL;
+		ctx->connected = vidi->connection;
 		mutex_unlock(&ctx->lock);
 	}
 
-	mutex_lock(&ctx->lock);
-	ctx->connected = vidi->connection;
-	mutex_unlock(&ctx->lock);
-
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return 0;
-- 
2.43.0


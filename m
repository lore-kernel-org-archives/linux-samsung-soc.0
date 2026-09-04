Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A86A470E82
	for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Sep 2026 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520317; cv=none; b=SRzVdI9KdUxb0iDV85SZXHb0ax6UEgQA2tSnRQZr7yg8cwHL/OgPOp9ooU/8PnGwpkTvXSbA1N6T6F/7SRwWHcsz5eY2MVANbcM/5x8XE9StlxNe4l/uHz1WX+TSKd41uBnxdolo2wygl/BjYyABCTpJFKBXVovDJJLl1KZr5YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520317; c=relaxed/simple;
	bh=lqh0A3Jb0dkPXewGZE2Ccph0KyGwB/eJ+ObjVtkWNGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q6SSYvgJ7FIcy39ULqATUO4EyGan5EaWXzyqQjVtOATkMNYTKTV6zOPKbVkkpsfOQOjb8MQ76JhxK8SL+iZXuilhNTBwInXjjFXmThdxuwRcA11uEctbsXnypJ6T9zNl503coxxmIywBjdUvoqM53hiGSxFOsxULCBddvG72d7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdxPefCU; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdxPefCU"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f6617c7536so465081a34.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520315; x=1789125115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZtWfz8k9yebmPOl53AMpbrmlWc8q0MMFm5Ljx0y4d0=;
        b=RdxPefCUyjeeTOCIYmcLD52O0lOLteAckJOy8e3G1W1Wxx8s4/CjAMFJHYuU99vkrF
         ulcdHhQOOspiXk9jGMqJc47X6pRPX7flAzDjV2O77ppxdPqAJrlcENBVJHk6r0G5ZNGC
         yLAyEkZoTe8/JWHmrBid/qJpeonWLeP123oCFzfbUlpMetS2nxxJJ0wDEkCNvvAKoCTZ
         524ZIkNrqLdMEJdB1jtGmejPRsCl3zwWYgingJyF4il75OWhIgCy6D4gJydCKndKL8WI
         JVK+V6P1yUBVZ+GLEXNy+hNlXMRyGwTf7KpUhrn8MRu90zZ8o+zXaHmnOGhpIBpkeZUM
         IEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520315; x=1789125115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZtWfz8k9yebmPOl53AMpbrmlWc8q0MMFm5Ljx0y4d0=;
        b=Pu6Byya6hvzhe6gFYLwktyG+UBbj7VnaHuXCxYdRfEuyRwHvmD7DVN9ZnWp44jnD1y
         iJfRcdInPCqK72WSuH6lShq30Ti2I4IHB6r/oZPIBKOVwZm0VDjjq+61Z4cqypN80Pgf
         njnwRSbAp+jvf/Y4xsT6bOz1tOHEhAJEIiFlC/v/veSkzhk7EMO7cGAWafbPEY+Q0hkD
         +Pd2s2+QP2JEryUc/VSMKihSmlgzgacR1i2FbH+dwGS3FKEYpWW861JkrzefCd2ICJsh
         EBId78B108U93GhBCW8HQIJ7MFr4dQWIMubp8Lp9Ze3aYsKAMB14ZRp2YaXHXmZ1FqFt
         ppEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsbrwI3VLAi6tZf6xV1fzg4nVTppLMz4nITtjSpkX8H6WAqWaGR/7uCit+t5avwoKqQOPrDB/IChgzAJKFWsSflA==@vger.kernel.org
X-Gm-Message-State: AFuF++kD0gvpwFeLrFSOOFwO3s3VLYjLqkLuqz708qs3TbgBy3wT+VvB
	UtY7pi5p0HLhTizp+ueSb4TL6y5/jJ5C3dAhq4x+ovVHP4ryE9GtztGZ
X-Gm-Gg: AYBFou1ZhFvOR+2QfnNLgx82kiQ3W7QcFXQHJNkfSSsjG1MCa6y+al1pgnK6zXx44lW
	xDkuCZLQGCHDRXN+QjGdXUSzdIU58B996q/rxq+xGeEn6/aXNOHN7XSZvSvrgiHios5V8b780mC
	stF9DifrbMM9W3piImpG0IpzVW2QYNHsz+oU9ePFuYlbb/s6Ydk65Zo7HXSsLjx139VP7Azh+z1
	oP4tEeAxd670c5sPjm298arA4Dmykq4eheyaowXGRcTStHOur/skiepo9XwOf1A4t3uSIzxhv3f
	ATy/T3s/+0orlfUFvAhdUNukaL1lF/LKILCVaT/QzmE+vlUejEnA+N0bSJGCa1jRptBMVODRkAA
	2RFAOYx/VskiQTmaOxhFZW85d11N1Nkxowl1a/UNfH6ZYEVnr/nQzUMrZylwYj9A5KKuIZlxQex
	FEQxHlrE35QMvgea3CGxTVY2P6EhsD1hUlo5wAfuLUZqvc4OYSqvX3TjliXexBI1beevcQdFwcv
	1c6I8t34QkwrdE=
X-Received: by 2002:a05:6820:188b:b0:6b7:46e9:96f9 with SMTP id 006d021491bc7-6b746e9a2e5mr1706058eaf.41.1788520315117;
        Fri, 04 Sep 2026 04:11:55 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm9779797c88.4.2026.09.04.04.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:11:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: fix typo "vaild" in comment
Date: Fri,  4 Sep 2026 16:41:46 +0530
Message-ID: <20260904111147.23677-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "vaild" to "valid", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index e92a4d872c41..c420e61b7610 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -32,7 +32,7 @@
 #define G2D_HW_MAJOR_VER		4
 #define G2D_HW_MINOR_VER		1
 
-/* vaild register range set from user: 0x0104 ~ 0x0880 */
+/* valid register range set from user: 0x0104 ~ 0x0880 */
 #define G2D_VALID_START			0x0104
 #define G2D_VALID_END			0x0880
 
-- 
2.48.1


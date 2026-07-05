Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED5F27F728
	for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jul 2026 11:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783249369; cv=none; b=HODSf83PwB3OSvsbn6GbeYJcwsEmMkz1Jyu7eyGLH3JdZ35rAzQtGkM21XfA1iPYgGclmkP4G/Bx0hEOEGH5ardzqPk2fAV8Yq5MCeRlbxqmNTiS/YcE1rSr7g3oHYmkVe+ZyuRSypoPUJZHnk8zx9BqU10eE51Jz0miFe6hoUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783249369; c=relaxed/simple;
	bh=OlIUgNGE1HKSv+L2iMKE9cFxqo/qDY6MkWimAjFFYn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z9LWN2aAe2YkyVJSHTU2aUPCuWljyvBCG8a0vXG98haKkrKveV8d8CMT1ZNNQJlr8ANDDPiFyIdDRNV0Bilhrm6zL89/SUaaC9cndOIWIcAYDFSKNy1OAqKVGyP9JFfuvQjRlIp0GkmQWZvv9GsiOtZisfIT1eZeMfuZ26ChTqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KebufEGG; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KebufEGG"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37df72c9984so1824953a91.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jul 2026 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783249368; x=1783854168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Oquh24DvrkOPCF2fJclrR7ZjjQ1IhHgVpf5JxW1uNE=;
        b=KebufEGGEGgPh4QhUOSsn1Xc+LXrpt8ItGVmyI7E66zxbiV6tQaOy6/AQPBZnbf4WQ
         3SUUwawbhHTvPBjo4nBAjR7Ic2MTfOurcRe7JFh5Es5N6XidUc9xRk7Bvijib/nQr4nt
         GymwXsj1yd6sKCUSCFmtQdny3iOTdUGBHUAgsneN7QUSsIvbqOHwLzkpluAr+QZr4PuO
         bMeC2P6OQVx4OCN2b2R2/ZoFV/fciSOvpfjLP3y8gzo32vFjgSZJmIlGIpQSeNZijN54
         qa+FiD1vTF+ZiydLEcNYpPG6vSeW7fqThikPeaUsTx/70beUvOWNV3Uoms1S7Xm8piJ1
         VLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783249368; x=1783854168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Oquh24DvrkOPCF2fJclrR7ZjjQ1IhHgVpf5JxW1uNE=;
        b=ZiaS007X1vF3nbpzm/etuPUHjOIKxGfW8bx1I4shPyY5HRDiEGsy5D0c2qaKTPL9du
         1IMhqApiRIzPXjmxupvnTkal11uMtx0kFsX5XdqMAndrgQc3vPYVVAQL1fKp11CYwstg
         J+5z3+RRyFD674Q/+G3Rpdm7hqgpnaGb1mdeU8L2dN3INZrHSFRdU/KxFoYTLuEyNND6
         olPJc4+6UNv6fJejjKhrZcELNsIPmhfHOoJyqFC+PQZ8543lXm31q3OTDjHqrkM62o03
         6WpgCeI6I3xkuQJR9GhdkE/9Sv8QEXp/MY8Ieu/s3ka7OUACd9NIMZ1x2pcjKn2S6COJ
         H9cA==
X-Forwarded-Encrypted: i=1; AHgh+RpL+kBhbvPQiJ6c2lIk0v9M8ZPgKeW98uelsLS848KRsL9DUGJtUAKlbqlvvspOklSWNrFnMTkkDeH2b3hroC5KrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWg1iEEmQX165xaCVOuJxVQSg5iOQf1+drZlVsz0987xRUV2dD
	r+ZkT924Qn7veyTY3ggfPb9peyRKDcYlF+xibpgtToGof6nkdWpU6Sw5
X-Gm-Gg: AfdE7ck/9yMUJm/SVOWxgAvHlbYvGa41paw1DII/pQR6dbYfwfUYghElzCLPF5AIt6f
	uiDZ9cxRPEqAESYIkbTR2dDEqCpOFq0XHiCYvcZxZPQ4slo7ix//4D4FdNxdvPNlN5f75RcEu2u
	hnwbPrLvB2thOrunHOFkalYgFMUGS3ioyqcqeWEabh2xO9RGgZQdAhTFAhPFYjLzKUXF2OKi/67
	z6mjzh1HMjXg46AHXv4LwywUnx1rodiuFuHUhu1GCv6IgJsy0aRYlFy2Dqh2wN5vbvlfRrxxk7F
	Stv/CjSL+OCeUCJU1uMdb15AkMmskzIPtLIszYux9czO+6u1307aXAs+lw8aghcQYYDhnPnYkxd
	l0Gk7Yb59brPOpaciBcoZiNYZa9Q/DiooHu0V3Gk4C9pqZpeN5LC6UNU6M1Ni2hN/ZHCVf4FrQ7
	u8wcTijOyv7UE=
X-Received: by 2002:a17:90b:2886:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-3829f0074b6mr6040067a91.18.1783249367936;
        Sun, 05 Jul 2026 04:02:47 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:8312:822e:57c6:3816])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f38ee1333sm25067156eec.24.2026.07.05.04.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 04:02:47 -0700 (PDT)
From: mdshahid03@gmail.com
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] drm/exynos: vidi: use memdup_user() instead of kmalloc() and copy_from_user()
Date: Sun,  5 Jul 2026 16:32:21 +0530
Message-ID: <20260705110221.153481-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

Use memdup_user() to replace the open-coded kmalloc() and
copy_from_user() sequence.

This simplifies the code while preserving the existing behavior.

This issue was reported by memdup_user.cocci.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 67bbf9b8bc0e..183671de711e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -273,14 +273,9 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 		size = (hdr.extensions + 1) * EDID_LENGTH;
 
-		edid_buf = kmalloc(size, GFP_KERNEL);
-		if (!edid_buf)
-			return -ENOMEM;
-
-		if (copy_from_user(edid_buf, edid_userptr, size)) {
-			kfree(edid_buf);
-			return -EFAULT;
-		}
+		edid_buf = memdup_user(edid_userptr, size);
+		if (IS_ERR(edid_buf))
+			return PTR_ERR(edid_buf);
 
 		drm_edid = drm_edid_alloc(edid_buf, size);
 		kfree(edid_buf);
-- 
2.43.0


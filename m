Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9393E1CD3D
	for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Mar 2024 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710698548; cv=none; b=WfJrvOciFFZLsCHR5hfPbYcVCe+RNciAMUP/T250wCET0ai7sCiLAik5vdGzZs+mJD/uyaxNZRojRymwD9AlBDIUIl+4SU9XowZytn4Mg+KEY0vVjkMPJxWvA9zg1vJx6Wy4Llhy0gort2Kth1HhTHdd9qAJa6zKBqY9lyLv3Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710698548; c=relaxed/simple;
	bh=dTOSfgCj1oToVmJkmnXA0USyDSPyyxiQTsMFvpH1aXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Krf24doWDIFUyS03YLjcJAI2LGDDxeQJJzQj61bI6obHBh4hxHNSMwjqKieNdPBXwq+tGxcRmDtvUSjth54KwGteAUfOPpnzZLnRzWV+aQucO1lUccAVj1XyBCAJ5DTFb1V/ikUNI+DXBw10DJGFLh4+0DNF6MP/R1Z+EFvuYS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IL9AhKih; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IL9AhKih"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d48d75ab70so31469231fa.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Mar 2024 11:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710698544; x=1711303344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77+d/aGXZdxhiUIc4X6IkmC/hLm4q/v2prNmd9Qfe+M=;
        b=IL9AhKih15LhDK+Iz+5tYLUfHlTYmFerUKybYh/zf4ZHlcZCkgS05GA8C1Gbh8td6s
         HRadGeXhFN2nqvQK7m8w09GnWzexs+lys1k1/uHBugyPamEDAgZSEN2DFrmrhE3tt0Za
         AfryCMWB//JqlF49eemNQoEsVAzoaHzdArDF6LpJI+i8Zvv7kUtdvt1rE1S7PoOPlPfE
         JV8UKJL3+nmCeM44gq1R63G2Tr1Hpj476/L3KJDuV1Y/1iDbW5ay9XVXCk35i+PCAKA3
         Hgk/g7Z/6+/Gsms+P+to64CBusA5w6Qkp7Tq5bwrV4HjKUM9luy2PRN8UmSQjrifphNg
         yQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710698544; x=1711303344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77+d/aGXZdxhiUIc4X6IkmC/hLm4q/v2prNmd9Qfe+M=;
        b=R/+fJK/HvAYnGsZhIyNMd51en3b4aoTK2MwrCB5o8CcbEGI1Uy6K9J2CfhHEU58L8X
         ys7VK83+37WchqregoY+PA4B9XcJa6eCpi3QwTqOdq8N0hGXBiQqyutjHrdNAlLnWzWc
         XlepbP2TdWgoWBRwPttmYhCKXVI2B8q3sZmA6QayuHNbjFF5cUWtO6+/Q13V6vhAm11w
         RPsEmp+JdMq3uh3LRqF+knspk/SZ1U1k9z0nLb1bonQCV/fTbsA+JQLqS0vSWrIGqdjy
         Vv+/bNGj8DPMLdJE6mroE0pVjqvzODEK5zm6gfeZwSe344g6biiCCK6cn+4MB/z24AVH
         8mlw==
X-Forwarded-Encrypted: i=1; AJvYcCVENZ/fQA7lLBdLyODzUxNgnJvB1pe7tab/4dmRrC5GHkVayp0RJk48aU7OFN6mlTUH7G3wVjMABd3bOtwYwutRz4HTGfSC2mX1tGdEcmuMtO0=
X-Gm-Message-State: AOJu0YzcRU56lV+CB9VXNsi3LV9Slx/MYjK0GTJIXJGWmvIRar366TBs
	kQVMntDwy7yJT9mWsPdblnmGyZ7Zv9Tnepb3Hk4bmxl/AaJIumMQ
X-Google-Smtp-Source: AGHT+IFSRqBm97H2wrhw9FQv+wqTWFQSx3C8N0+1LjbPizm2KnCzgclN9zqpZvKmU9dWdDqHUxwzbw==
X-Received: by 2002:a2e:351a:0:b0:2d4:37ca:92d1 with SMTP id z26-20020a2e351a000000b002d437ca92d1mr6010901ljz.42.1710698543878;
        Sun, 17 Mar 2024 11:02:23 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com. [213.67.237.183])
        by smtp.gmail.com with ESMTPSA id m4-20020a2ea584000000b002d2e419d9besm1171685ljp.65.2024.03.17.11.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 11:02:23 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
	by betty.fdsoft.se with esmtp (Exim 4.97.1)
	(envelope-from <frej.drejhammar@gmail.com>)
	id 1rlupy-000000005e0-4Bry;
	Sun, 17 Mar 2024 19:02:23 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 04/11] drm/exynos: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:29 +0100
Message-ID: <aa2e96d47d4465827fea0604089b698fe37d1550.1710698387.git.frej.drejhammar@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710698386.git.frej.drejhammar@gmail.com>
References: <cover.1710698386.git.frej.drejhammar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using drm_driver_legacy_fb_format() instead of
drm_mode_legacy_fb_format() to use the same logic as for the
DRM_IOCTL_MODE_ADDFB ioctl when selecting a framebuffer format.

Signed-off-by: Frej Drejhammar <frej.drejhammar@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

---

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index a379c8ca435a..d47bb5e89ff2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -104,8 +104,10 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
 	mode_cmd.width = sizes->surface_width;
 	mode_cmd.height = sizes->surface_height;
 	mode_cmd.pitches[0] = sizes->surface_width * (sizes->surface_bpp >> 3);
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-							  sizes->surface_depth);
+	mode_cmd.pixel_format =
+		drm_driver_legacy_fb_format(dev,
+					    sizes->surface_bpp,
+					    sizes->surface_depth);
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 
-- 
2.44.0


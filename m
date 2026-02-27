Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28624325498
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772162788; cv=none; b=MOJNGuJygR+8Xwpf2n4543DbvDXCYLZu9gCjXzM4F8H46jNNBwLiz+MDLvUBxi0cgH3/d50gG6Zx+y8PBF4g7oRn8GcGQkj0FK2CfWqPG2I4/eExfr7OMjBLD4U2/JVJdIIY7U0KXsMHZsvrCAYmfH4spHdoknJPIaDq81+YQHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772162788; c=relaxed/simple;
	bh=14tp/ZbiHhc9fo6I3d3q5B/zYDGp7+QSAvy5xrmzM58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BZzGDnCvkXduzvVLHXYqm1DxkvVSGx1iLUsaYRJaclimQTkaaerm5ay7NrbTIgO8oMtWFieQ6SATFTy5vO+RmXsl1XVjdxtRN8u/b/4ncET2pUynEEoJ5ruXv9UpCKFV+sxCtIXLMXdGrDhqz+Fq9aKiycdZe61IvB5YGUjX0T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeIveTIS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeIveTIS"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3590408a093so814631a91.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 19:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772162785; x=1772767585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
        b=DeIveTIS7rZ75TqpGKczy5WPewUBeKiWGUGcO4gSFVW+e6ftPxQLTFrqvClSbtSzu0
         3S0CuPNLLsKoXjsb/1nQ6V6o6ySEsCLWwZVPp2kjeuxXzz0HBdDNCdxtBpl6Wh2d1aMk
         AQFmSE/vtFqihP7Cg7sPrIFyB2sB4vM1rlG9zYUsi9q+FnUmrEbzBREq58sX372UrShE
         rAnjuyvQmOqEu7FyQ1B4ewq6Il9qYtemug5tBeFR3MObJrgNfqlLQ82yXdOSXHfUKY7X
         QbfiPRb37GiytDZ/jVyu91RzZYfpavuDPUdFDcFydh5YtLABlkH2APxilOoP7xiLRxyk
         LLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772162785; x=1772767585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
        b=Z0Q8h2Y7t8btH6J55HIddjfZhkuNCW9qpOuk0I90iwmghrz+th+8GYMvxyPEt1muN7
         j3MyMmOhe6/VxGOAVu8FA7b535uBQw2RzEDcqnNgr7DB+78ka6v+wC7j8NmA/Q/OuEaW
         XM3KJYf09mBcK8mjmc58YpzpUEHLA5Q679iJOI3ZhA5SXSzUvgkmGSntx2velU8VH9JL
         /7Nxlsl8z8wRZLhowNKIu+PJH7ppUoeLEdBU/Gp21xoVzzJYCGzF/skJX3z7r9UrJd1E
         er5Xh2+8KQ4GdPe6rhr74Eue8UxXJOUBnz6KC88EZSdya1UM1XRhfhom/vvbveSTtmSh
         L1oA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9gn6gYfW4NahuKDun4i/VmnhthiWSA3xBBaPwFgCJMrUfMVlRdBIALDdNsEPNmKlEZE7p1yf/bYjSvaEgc5s5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcGfJjSq3DvKad+Jb1BuqDaOhZTKeWU4hQJV3HhQtpcueW2gzb
	5wXE4PB0opaC9JcZAyH85y3QUH4FmGJpmcnksMtk3GD6l0Mbx8T+I3Wa
X-Gm-Gg: ATEYQzyLwKioGPfh0zz3dSVdNXzlBeoGFGHqAQucfFYmMPfS9nCE5lMj/qqJqTJ0uNE
	nTTLuUTTqtoqzEXeSvLr8qkdUM4PMKAntmtWeeJ5T91cLjBiZ456sPUis8LhzMrABl/xrWoWlfx
	MGCMLZbNjYkJS/3Wn7RbsSSlfRWk/DPi+sa2T+I0TnfC5hZk9r3F1gQf7Y8omfBIB86NtrZIKcC
	IkdGo/eNM01E2skR1rtybLtUwAqyAZKA8wt7NmSQxWtqeMMASI809ajbAJFQgcYjxpfoDxi+u3f
	TnerF+NDUz8TU/caMPPpAYnovsRrYI9jIXgVwshSuQERcBQbfaeJIcrlkHrA3YU/xNYEr1gAHSP
	BX3clELkmklz62k4xOa/ZJ2fgo2fTVhLBM2L4xVOyPQ4F3O4/2Kn4tbNkfbf+Vn422fQsy2I20O
	SB4Y//yqR9rExWgIcthIh5XcfNIlU3cMBGCRylHhPKxNDQlsViKw==
X-Received: by 2002:a17:90b:3dc7:b0:359:28b9:5f64 with SMTP id 98e67ed59e1d1-35965c17095mr1275630a91.6.1772162785515;
        Thu, 26 Feb 2026 19:26:25 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fbc363sm4501887a91.2.2026.02.26.19.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:26:25 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.12.y 2/3] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Fri, 27 Feb 2026 12:26:14 +0900
Message-Id: <20260227032615.108139-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227032615.108139-1-aha310510@gmail.com>
References: <20260227032615.108139-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit d4c98c077c7fb2dfdece7d605e694b5ea2665085 ]

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 1fe297d512e7..601406b640c7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -251,13 +251,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
-		const struct edid *raw_edid;
+		const void __user *edid_userptr = u64_to_user_ptr(vidi->edid);
+		void *edid_buf;
+		struct edid hdr;
 		size_t size;
 
-		raw_edid = (const struct edid *)(unsigned long)vidi->edid;
-		size = (raw_edid->extensions + 1) * EDID_LENGTH;
+		if (copy_from_user(&hdr, edid_userptr, sizeof(hdr)))
+			return -EFAULT;
 
-		drm_edid = drm_edid_alloc(raw_edid, size);
+		size = (hdr.extensions + 1) * EDID_LENGTH;
+
+		edid_buf = kmalloc(size, GFP_KERNEL);
+		if (!edid_buf)
+			return -ENOMEM;
+
+		if (copy_from_user(edid_buf, edid_userptr, size)) {
+			kfree(edid_buf);
+			return -EFAULT;
+		}
+
+		drm_edid = drm_edid_alloc(edid_buf, size);
+		kfree(edid_buf);
 		if (!drm_edid)
 			return -ENOMEM;
 
--

Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA9536212A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 05:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772168405; cv=none; b=nCkXwazSLCXKJ3ePZ+iKRlBj5XtTM+wcCnNlnrWEMJ4dZXSZTP34i8onh2aUYXiQ+gnFHTEekd2oEJNEFuqZ7PmHDyI99+bMVPfgYg/pWj8t2EIl2yYGal+5ed0uCF8KxmN/a2s5V2WE1Ao7j793PUuGse5egoLWqa7PgPdjJfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772168405; c=relaxed/simple;
	bh=0V9TfcF0jCfymmrv79UOCNsFP+ZBkFqnn+Tpw8wkDGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NNNSypdLL6RNNtFiLHbgqLIivQjDHAOBxLreE3XFpBwulVJuDU2MNZ8DCUbSlXEzMxTfT2zb/lyzJKxxBZ+CJ7dDsbdqzk7R5P4kpqNk8x2qRNi4pi98WEvkV4FJ84NG8tnaz/e0ntYViUEqW72cfd9Ptm8+d7jaKWSVroazREc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzLtuleo; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzLtuleo"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-824b5f015bcso1966558b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 21:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772168404; x=1772773204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=;
        b=lzLtuleopx7xWpjGSSkGs48wbvj/CLTwwV1DhHSnp2+qOi5lSlaMZ2/GdU1rEod/BC
         TXx3LGDEQp5hYKmYoq2Naz4H2EVM/6lUWA/DJ8Ibe8LfHi87QcGXvJzm+547VYizz2+5
         5JbtGc8YoxLvDpf0Efl3UA/18Jas2j3iXLfiC6XlvZbx8mGbmTRhFjObNmPLLjb8Mr1p
         mxIwW1gP6EEEN1gIoGnDj+zjbIS4qN72TYd8IyQ4py5Iu5pqxqZcux16Jtdy8WODcTdT
         e6Hjdxs+24GsQ5jIuPfNpG953biPxaansl7pJXVwCgK5iiFvVBxxlj+mxzStKlt3+p3C
         LOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772168404; x=1772773204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=;
        b=UnyC8drYZoqZ7poZMEH0obaqPvmfx3VEjMK6m7iQd/J7OlukY5WrB87twA7Xbf07fb
         Pp9SpQ6IUdHD+Mb3ookoRVoJUNLeIYCszPipibKFYNrRy8MNUHjOcT+tBFRV5NPyNhAO
         yemRLPKgu27h4XitXM8KuYpWVo7Lz89NQ/c+FBiFdShkx5lUPJMIZfZ0VcwAJosnLJb8
         Y6jJzInVmhBN3yHtD31CEmkyl4d26kvypN631ZXGUj1SuF5oQuy8PtEUufh5ih8RmyCd
         gwE9DbBMzNHG46gh8xgcitnGQMfnnDKjX6Za/GrEmNY2X+wxJXhuQDKf9cXum3TO0Txw
         cq4g==
X-Forwarded-Encrypted: i=1; AJvYcCV36hx1Snhz/OFLDnShRT44In/MHnzosHoLyaPwa4jgcw3nwi8H8f5CuK7X4aDUHb2z7+xNzGUie0tanc08EL8OxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6bsQHDVI+damjtjZcgIP6y/eywJvfyL8SAOVbGIO5SPE3Qz/L
	X+OV3BpdJ6a+kgjdAAnKBn6o+duVKJfSFHTqGkuXx+e71xZ6SpqDmmIx
X-Gm-Gg: ATEYQzw2gFckGICZDeR1JKlduIQ9wP81bjC6lb5j4tAEhbz7ZmTuMwrTnuMqq51/BWa
	i+Q7evMnaJXYtQtxeNGGKXdhVZqpRxOjviv/KDBm27r69VyWkswQ+/hZYfdp28Rqx2mAyM3QU6S
	RALafKtvX/LGKz04aHNuVR4RMgJisQaPOdWzcJ/WenKTxYKmQXuSk4eCi8bp4oq0agSx3RBPFtg
	AjGzxDZLf53EFeU5+sfTgS5cVt0EweQ0QWSkoNKQZv9UdX78JuLblZjbSigG9zdSpB2SGnTFLTW
	B4uSD7kQWAbcgwR4RemiFhF3imCreRnCVeQOmZw9V+f2L441Lr1rA82G8zNxiAx7a7wV2dScC+w
	TTaM4zCC2h70ZJeWbAm9pYG/M96KIiyUuvcOZ1Fle6eMWCxAgygXvsxir1uJCeoQZOX3WsZbwMv
	RPH5PnNIre9zq10pD0AI2K0i8CnhmQTUQXiCRtBzlQfNPBehEf+Q==
X-Received: by 2002:a05:6a00:1a0b:b0:827:2c11:f137 with SMTP id d2e1a72fcca58-8274da7a4f0mr1480551b3a.62.1772168403587;
        Thu, 26 Feb 2026 21:00:03 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d94de6sm3966543b3a.24.2026.02.26.21.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:00:03 -0800 (PST)
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
Subject: [PATCH 6.6.y 2/3] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Fri, 27 Feb 2026 13:59:52 +0900
Message-Id: <20260227045953.165751-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227045953.165751-1-aha310510@gmail.com>
References: <20260227045953.165751-1-aha310510@gmail.com>
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
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index d0e394397eca..576d79ebe9a8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -252,19 +252,26 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		struct edid *raw_edid;
+		struct edid edid_buf;
+		void *edid_userptr = u64_to_user_ptr(vidi->edid);
 
-		raw_edid = (struct edid *)(unsigned long)vidi->edid;
-		if (!drm_edid_is_valid(raw_edid)) {
+		if (copy_from_user(&edid_buf, edid_userptr, sizeof(struct edid)))
+			return -EFAULT;
+
+		if (!drm_edid_is_valid(&edid_buf)) {
 			DRM_DEV_DEBUG_KMS(ctx->dev,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
-		ctx->raw_edid = drm_edid_duplicate(raw_edid);
-		if (!ctx->raw_edid) {
+
+		raw_edid = drm_edid_duplicate(&edid_buf);
+
+		if (!raw_edid) {
 			DRM_DEV_DEBUG_KMS(ctx->dev,
 					  "failed to allocate raw_edid.\n");
 			return -ENOMEM;
 		}
+		ctx->raw_edid = raw_edid;
 	} else {
 		/*
 		 * with connection = 0, free raw_edid
--

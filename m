Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCE533D4FC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 08:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811171; cv=none; b=WVmWvrG9ejhMJzurxTGBT85NUVq4nL7P4KC3z8PJGgJdlEf8tkjxpVZr9cVRxxXA0DQ9gTO5SFV8zxGG9iO/vC5UjKGR5z0hX/Aj+EMwozn7FmtYg61zwRHoUobzPDBbh4fjOAiOZ06QKbGZggTdY479BFFUv+aDnrzmHhrMUsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811171; c=relaxed/simple;
	bh=r90VB4kVBN2xFkL5AxvLxiyYXhfIfvCQV5FTD6ekEMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AODGMAylvGbIR+I1knFpxd3AOu4AAxqXG20lmpS3Tbe3jT9NRS2IvyNcNEZaFYME1lpjaZVi1vvtbWoG3pMBPQxzvTTfZRa+hoCi/p4QDwpSeYUu5e/K8SDtJhVnPfIxgJwEpQnzWNdT5uP8z37WY30iQGpXCkIoZvIyUyJK+H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtrVACOT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtrVACOT"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a12ebe4b74so39108485ad.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 00:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811169; x=1769415969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=;
        b=TtrVACOTquiPmnd3bq+zMDfbACTlbD/5sqrlQMHm12O6jGKkMhbK4W2hVu5G0f38aY
         pVTouLUGEIQ0yTh/MJWIHYXy/3s0gc7+Rvn4RljzqQTAY5sSvKnJYH1T8vkxEQVvMuDs
         fgeEeH//JpOuatZzSfSy6BEk6ieYJGFVBioO5jLb4PaKUf2j3UEwbageGvixQSX0NKA5
         79/BQZ47AnFCOcpN965SY07ZzdpM2lVa7sbbiK8qVS7BFNimp+z6w7aqTVxiYnyWuTno
         OS7PfATwo1hD9oecIAc8ZW3mx8appZjQcDECsjBosDLZ9hugxpFbcl0CEd/J/5zac+bu
         gFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811169; x=1769415969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=;
        b=SgSymhWW7p056WargrBinxbu22QAnee0TNaurVE8gM5TmG4nPbcavskFYtNNU/7k0y
         S52ZdjDAJbFtsQrrlOWiwjoZl4Sqc3T6zrwHPIHX8cNMQ9a7nYkBqm1IsC/4+iswmOG5
         cA8qtlRy3Q98M+Kn47CtKEVHJtsz4Viu+/qnikTOCo1XwltKGVFTQ0hL47AcZz8vjk1U
         9Ry7WRudBZBLtbE9+dzxIMdROr+1ilsKVtBRX2pfxgTmhUkCAcAD1h0oPZES3OyVnUb1
         p89RCP1OPM0PSIltqYi9S429daXS7FFY+MnOV69/CuQEttvUx/1Y+Pv84FFKL0N+AFrA
         YqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj7TcCo5LC0cO13Gd81izquVgCN+GPVJ+xvTnoQ66XvMYUNc0JrQEZKZMofhFn+bnssKg3bzbKECGyHKYVM43q9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YytRcsbJr0M+etEtpxfeg7bHahjd9z32WNESuqezI6EbjfuQLUL
	DnhWhx20O+4T4y2IByjkUbbsTmX5/qpgjev1rZVkpP4BaWyWlzYaif/X
X-Gm-Gg: AZuq6aIz20Jewu1hEYTZvGkzMbmRl0pdjJknKPwOtMqc+nK/dVwL/KVylFTFfuJLkb/
	eF/MkLVIT+PGLziLdx5Wg+R7ABOybkOlfOdf1VwP75psjlKqXKzZFIjSZSeWszoagM8y4NfGfCB
	Zywo0amVMc4566gJad+n3DEHAqvtkdkdFOg4iiFVooe1HG3U9gmi7k5SikTjVWOqHWGkLZntwbi
	coVtQwY3HNXChJHwEs0R08EoUeAXyqps7X67S0LwBpjemWIyy9FzJa50T7J8xiCw+FqEvDcveWL
	LoSvdOvwsWgXne4YzrSTbg/ih5pdvTp47XM4H/oFfxe96qxelbWxA5sT5g4aPtry2DPileoe1Un
	/gonGzNe028w1J61D3TOmzMkS0ZG+EXsUnkXJfZxn55wfkvvJVIqVlrx9Gv9yDoIwgLWfpF6JJy
	028pX9obB1ok43wKWjsn71dr6Go0+/JL7RDAvgmA==
X-Received: by 2002:a17:903:124f:b0:2a0:c84f:4124 with SMTP id d9443c01a7336-2a7177e2b6fmr92683575ad.52.1768811169196;
        Mon, 19 Jan 2026 00:26:09 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce534sm85699645ad.27.2026.01.19.00.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:26:08 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 2/3 RESEND] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Mon, 19 Jan 2026 17:25:52 +0900
Message-Id: <20260119082553.195181-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119082553.195181-1-aha310510@gmail.com>
References: <20260119082553.195181-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
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

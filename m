Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02F835FF62
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Feb 2026 11:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770031968; cv=none; b=b5UAHrWsE5+ROQohE/qiSxUwgmt68/d9DV5ZlyTT8QepzPRVCzNccP/JNrQ4jkGaK3SVVdtGPXhZGbTthA+WbgdEVoocVphQxxOhfmuqkN4l8jJOF20DCZK+3J4ZWm/N+OF3nGT9xD39jiLdOfsYTH8X/Ge+VfbzMrXFWPcnYcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770031968; c=relaxed/simple;
	bh=NR6eDPn5SFX41KdRMAwfZgHQYuJFBYzjsakfWJLLEsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZOt815rwO4XzuVWxbwmELi+Ri9CVqPligXZ+I9gxPI2CzD4wMCFnpzsI7EDrMShh9rYjUo6FqxBjqHOdScuWa8yGt+alZ45BXe6xq895vY5kIhwws6Jjcp2ReFF+J9tSSZsxl2jDBFBzn/Yc1sTITuKnwb2q+B+th+4fHadT2TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlTxjbn4; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlTxjbn4"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c698873a1deso459981a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Feb 2026 03:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770031967; x=1770636767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIhY4QZTPPdLq2TRpxo21LNBMq6aPIcLWQcnhCbf1Bo=;
        b=VlTxjbn413Wcg/5t9WaxzuKc807qJT2yfGDZ7aJZeaiwbxHX4kLgjhRW9tRBLLdsPp
         7GK6ssVzPuXE/TecoIjj/i/ZGrHAEk2yS1WUqFHnsSsKgpSLcI3O1CWdR+HyOW9edlDb
         SEDMZqj5E/X0JWNs/kPgLwPLiH3MocrwJCCsOiMxpofwPVzO0pS0AXPiqvWGaFfVGska
         4HPKjBBxzjdZg/P+9HCYoE0nsL9PSUPfeHs1pBGmGQ2F/4P2E8bfD4KhJrv73KEAJ0tz
         5QYZRbcudcR698ATxaVg+aJt/70hQZ9xWgfH13ppJEdZ7WBj7B4p8jzEq/Yf3UJuekmF
         Zj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770031967; x=1770636767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iIhY4QZTPPdLq2TRpxo21LNBMq6aPIcLWQcnhCbf1Bo=;
        b=G9/PkDqjIuj2eXOi87Zg1bJwWb5K/7V9T7BLp0a+jnpE0hxe4iwdo/nHpXWEH102N0
         ESObf/mL3a+J/Oy8N8JiK+m+8lD15gckJ83TqCMKF1ZRzyB9w6LkL6u7xEZxaSH6KZXe
         cdnQbbJdXHUh8C9m+4SIqO03qIhvAuIQTrZV7X5baGAGYeWbRDz8GrzNX/h5vFCpoDNR
         z5nDcDKborRp2+sGIFPwlTep8fUx7xcrz6HrveGPXWwQFZUQjSdIPN4fechxv8r+KXLy
         X/JbfC1unYEIFN4TIkPiXfZsKJ/KCdDCL7QOAihNZQfBApLIy22O2RPoZ5RRlRy8IAcx
         GUJA==
X-Forwarded-Encrypted: i=1; AJvYcCXEqVISSOIRpBJ04O0gklTAAj/hAMXZCuirDwhK6wp+HbDF3tY4sQzFN6ywQDSdjeWc/rr3FFWXWoG3NoOVFpL6qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUsnOR65CMi7nv+W6dr7uoaHMMTQNDvyZysyLNvmykMZuTuxyi
	anwf/Lz/u+kzugLgL+VRZ6A5FTjVoBb9iCDFfqko5dyTiJEL3p7f1fNP
X-Gm-Gg: AZuq6aKKZ1Wzeg/xVnGBLhTK0IpKVB2iSTUi+O3fXZb5tohME5sftB3SmfXnIGPme5h
	BiNBTNuGNnX5Es6/p0p9Au/tynaTYUNTgO/C0d2FW7fJk5C4DVFCJiRmKWSI46bgh9MLUHAhc3x
	wtP8K+avtwDmP/HokItTLz2tPopUje/9dpBThrC0eTNP8raRgZej3nI0OdmbA7nKXkx7Z1h7yVu
	7YZanfFgkND/XJ6p2dDMxmXCUMhQdc7Z2fbHf8c4y8qg7Wm37g5JJoDr4xveBiPgPFbEWyg6ImZ
	q1voxi732dqoJAcaxMiR63P8hu/+wajKYrPHoAt+ZL0rI+pAajOk4AcZ71FlJEFN8HUApzH8jfJ
	uXLW6hyVfm4FleZGDPKSW4VQgcp7KUMh33hFVb+Nituiw/bCBMdiOgmFAnH0TWf1ZGwmje8tTRP
	3OwC8MoVsPj4c8NBVjQ+BT6BSMTlI5267zexNMXWtnBGD126Lz
X-Received: by 2002:a17:90b:2e10:b0:32d:a0f7:fa19 with SMTP id 98e67ed59e1d1-3543b39c961mr12734825a91.17.1770031967103;
        Mon, 02 Feb 2026 03:32:47 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f539dsm13743190a12.26.2026.02.02.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 03:32:46 -0800 (PST)
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
Subject: [PATCH 2/3 v2] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Mon,  2 Feb 2026 20:32:33 +0900
Message-Id: <20260202113234.183393-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113234.183393-1-aha310510@gmail.com>
References: <20260202113234.183393-1-aha310510@gmail.com>
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
Fixes: 221009347844 ("drm/exynos/vidi: convert to struct drm_edid")
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

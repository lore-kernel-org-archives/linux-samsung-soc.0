Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7572DCF58
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Feb 2026 03:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771558563; cv=none; b=inLttiXos/f5bR8VoD7EL0EaS4ldw+8hSUFClHfx4TlB/ljzVH+iSAtblEgNnJatXjCezwN4J3CaGZZ3f84JyCP4kqme/iwQnUm1q8roHhMwCdhRvm1+LS3ZlUjyT8TTBqfQo7lV0n+m6Py/g3eISJE6vyb5+fCff3wFblsK5AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771558563; c=relaxed/simple;
	bh=14tp/ZbiHhc9fo6I3d3q5B/zYDGp7+QSAvy5xrmzM58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HMHEjC18z73Q7sG75Wmc/6xxjm8aRfin8P2fLTJA0Rn+3jQBSfQN0fIZ8LtHW0CThPdRJa1UWVA9mRxuaWbndA6EATtIWDy+Iy6lmgdO2E/F1BZfvyrHsr2yrpi1tMi8W1OvX78MrXeRVqxImyN9s8A4SPue7DWlJEBmaEMmDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kg0gSW/M; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kg0gSW/M"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c6f306faaffso647873a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 19:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771558561; x=1772163361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
        b=kg0gSW/MXrjrrzq9iQGnNOuOjnn29PekJPPoWL1aoMTMyzkREyf8YthxbKs6phcxHx
         DBNiXnmIaNuAhr1z+9Ui4sKwHQWeePTgPfU6RdEVp+nPL0K0AZ8+ll9lLOcjDDLFMGnf
         n9dcA0XqdICkJ/gH0XVKE9G779SwyJBcai8UiWa51z041IfXKhlAgFvTtK5lG6Bzoq8L
         y7lHU1kMWBg/joEkYn+vLOu8xPEyNvppe+p+WSDVvqmjkODxKTM69ybb8gO541vKYzqL
         PgB2JrS+UnVFCzs8K3oMT0+IUbKsLECJIZVN9AA3+sZfSaBl+DEA5rONAX9FfbULqoU0
         eg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771558561; x=1772163361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
        b=dKQl4IzZKBy2bTelQISR/+8PZhopOtJRhEVVKBIZIpPUQvyAxgerbMj12nKAQUyc0g
         JKLU+snpLDLZd8eyPmcClfQ/Ceq8NCXEXP6xmtiVrVLt2xJsZXKaOTNkL9FfKGwZMKkS
         rR/KX7YWDYCCYY8e1j3bTTvZAtlXzFqlNxy5xtO2si0wh0XsmJR5VqGEOickTwSOv/bo
         yVtMRjGgjTAnFSDHIHB4RdzV4qxEqpY/A8o3KMTJvMc9BRRb73gSxJeP/QmphF9chNot
         Jz5YWtrqGkiA+vH2m0HDsFIFZG9WmMJYU5QPVVflFCP9iWwQwEenUg1KNEByhOQ48CpU
         IcWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6tpfatvEvsIjCMMmWxR/glvaFOzDqb7B0IzuTlhmj50TiQlbtavCxuM3ctD/Z6wcda8EP7+AprKqs5o8OU5qpqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl8az34H/i/9ygtrCi4p4NwZnRP7xsRxRW0ZweW+6yKTElm/O/
	S7g8cEsxOYbvZtOna7Tf4q4r5dzssWIketFMjEliAtChMc7ofDM/o/PC
X-Gm-Gg: AZuq6aJADwIYHR3FTFbgo+WS0JSafi3dsCK1hHZxiH5rvs+lWYXmqHUKqfa3U8nFEUo
	yS9KuezD+sWVxE8kiky0GuP6N+xaUOYFDsYMX2cEDmt7R9WrNkN55IyMSB3ol2qQbCEyg6ZQlBh
	WI21KYJEtbjfR/65Vg81l8cN0lc6suU2/GEQmKNqWgdMC+NtNpHoTvGgvUe/Q7/KOzhfHdoQJwV
	o9lIEmY2MrROWzNlK4XdVhmmUwn5Re3Ld5xoHq8AHrJb37GrFNdBCUVbf79Cta3ZUhDL6AfwEmc
	CaYwUN9/Cx/OuUIz3bj34bXDQU3DQSfOIqQa8mwhmNCrw/hdqLsqCBFnKt9FlPtifp45c1Ua3Y3
	vIi0oChRNFUiwvuLj3EWibzr64rC0Gj1fwMFpHwDj8KobdAdIZQL9KzEAR0eaVMRfroRY1OXVri
	6cWZgAIydqMNtNgnsv3MiTChbGRoduo3AzuB/S5VkJC/JPejNZrvGfwYbidGTF
X-Received: by 2002:a17:902:da8d:b0:2a7:80ac:85b0 with SMTP id d9443c01a7336-2ad17431c2bmr182977825ad.2.1771558561498;
        Thu, 19 Feb 2026 19:36:01 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5cf8sm177143675ad.52.2026.02.19.19.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 19:36:01 -0800 (PST)
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
Subject: [PATCH 6.19.y 6.18.y 2/2] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Fri, 20 Feb 2026 12:35:50 +0900
Message-Id: <20260220033550.124346-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220033550.124346-1-aha310510@gmail.com>
References: <20260220033550.124346-1-aha310510@gmail.com>
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

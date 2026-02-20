Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A5B2DAFA4
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Feb 2026 03:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771558556; cv=none; b=j/BQkXf9c3GYqWPfVBr8iIUwGPLX0eVsDYLEqpRaam58vdKkVxEEAO47S/pPCP0EVJah7PtOULl1wOeBJh6DxqeACEphrPYs5Sckz/4TDWh+EMP12m9la5XbaJqWFa1O/fHwtMpfdixvr7JDyKKYXHe1a4TCmw8ca54NcGntwfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771558556; c=relaxed/simple;
	bh=u7qtzELmU0xOUlRYfq6pmRVDkEceHJiG781cdFj6Mmc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QBxULmhkNuqbqqoahL/XlagMw3UBEUzHlGEKkbIY40DDJBNkujvn0eVHM9TH0jqyPTuniDvX9wbKstBE4E8leF0iM3PV/aZ39yQ+HTRfxK3+sODv3LwIBc/KJtbxLfBanu9akkYRZjbJ0OHOtRZLtlV0EnfvMn1JFLdV7hFRbpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZvGhKYG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZvGhKYG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a91215c158so11415415ad.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 19:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771558555; x=1772163355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U9RtH3VDdHvCGowWw21cotg2dMzVihzJvU6s07yH8n4=;
        b=fZvGhKYGSnES7v0nmEJblKj17+c7Z5b44xuBiUQ8cB/SHTl+jw0bOHH7FytkKv/ACY
         NZ7XIHEchhpzMlGFMWViLpV5ddi8ZvTdtOrvnZ8gWBjRuBksiXmBrc+gvVBmtKZXMSjG
         tLJaRTJ2xmUHkY+wJELoG7h/bMcK4dzYCSLNebBagORXTmtDGX1x9kgRoOvtUaSM18AI
         zK7wu71/mOWi0wGQY8AYS9fkpXIohvOr9ugqCC46FARpJJR2JL4P5JqDO5rKtzgpaQee
         HLaj6L7yL8yT67eTCdZr20gYh1IkVCN7lpDvoj8jCIlN55jj6ohqrI7GPdffLhEr4AXR
         WH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771558555; x=1772163355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9RtH3VDdHvCGowWw21cotg2dMzVihzJvU6s07yH8n4=;
        b=FK7edjn/wNSRUGp4MLsOtn5wklmLLgBSMwSCdFa3v2YvK0EGlr633iIaUIMgk0UKEe
         bI/yglADYbp//7hp8o+ZrmgZmzPq6AV+YHDYVRVid2s39uXNZWyNBf0NGBSrN4BWVUj2
         TvaHJMDXHQQU9ckwhN7zOslIX86203FyO7ZalrZM0+EovyGfIX2QDAa1B7zF6pomAdle
         1IxW5IErOriG1KPf6WrhIGOlepUCOHdn6GF1j/rcUjIrXUK8YNXeu8kfWPXHo9m5QLhN
         Q/6OsNQgp/NBGEF4iNSiit8RX0WjfFGnSezHKEWnivoZ1/45k9+tAEl+uNqFexyFzpE1
         OVAA==
X-Forwarded-Encrypted: i=1; AJvYcCVD6oCu1zebMFAVDVzpdNDtAvRrsxsCx3GDZJ17zZQaS8J4NTGfAxqJkj7W4oxo3VwRkKZcPKExiK3zPn9ImeGZjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/y31tSc/3yWDZn9k4262wSGem08l+3SZXCxULymeltUaL3HER
	3VZkwuEliwx+lnXHCjWI905UwLYSlVy7QCo7mNtDEATW9gRW1III39uj
X-Gm-Gg: AZuq6aJunXI27Y6KhL6dKJ+rSvKbYo332pldGXVr6t/wBIUNbnZhb9juDOvEpbvpjLi
	s+DF4BT0lvnmJSVFpV4Ao389G59iI2e3soe35swmgYBgz56KGa5ZnZoqD660PUzJkbOU961ypMf
	83Xt31bssf93IV0w7ncJMWNmW7gaY5PCfSqUGvq9fCZ2i1YruaB0wp5ZfOVqPzL5emTOXtTNyNC
	l4Z/Hv7m+U4GNpxqhuJhLJOVBeoEMYonX+DsBLAjPZ+y7YCxahmnxTnLojrla2aRsYX20+YhJyJ
	vK/F5OOz7r0H0bVVd/QH6EnO5vMsr+78pBigK3TwuyzzW+gWC1zFekO0NVb8AWlNlA4L4nwmjaX
	erbQVzXGzFLjCaJbOhDMayjp7x7fhUA6/5CPuGZWrmVQqxofwHwsDULkQ7VkTF/wCM1WkdReUXA
	2U69w3ue1Z2Vbx9APVe0Pklj8owTZV5QcNscJDCjY7EuQfEQ0dpiioFCFRDrTS
X-Received: by 2002:a17:903:2a8f:b0:2aa:e285:f249 with SMTP id d9443c01a7336-2ad50e757a5mr67786975ad.1.1771558554897;
        Thu, 19 Feb 2026 19:35:54 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5cf8sm177143675ad.52.2026.02.19.19.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 19:35:54 -0800 (PST)
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
Subject: [PATCH 6.19.y 6.18.y 0/2] drm/exynos: vidi: fix various memory corruption bugs
Date: Fri, 20 Feb 2026 12:35:48 +0900
Message-Id: <20260220033550.124346-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This backport patch should have been backported along with commit 52b330799e2d
("drm/exynos: vidi: use ctx->lock to protect struct vidi_context member
variables related to memory alloc/free"), but was written separately because
some commits were missing.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

After this patch is backported, we plan to write additional patches to
backport to the remaining longterm kernels.

Jeongjun Park (2):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 36 +++++++++++++++++++++++++++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)

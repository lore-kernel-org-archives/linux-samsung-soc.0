Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1AB33D50E
	for <linux-samsung-soc@vger.kernel.org>; Sun,  1 Feb 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769956785; cv=none; b=LMF5ZGPaNab9nwTYxN4pm8D5TAiHH4KN/s7eoNrzWW3rkad/7CmoxEgueC0ckqmYN9EjAyl+N1xiOfdn4fMAr/QAQ+qPSvB+Y0rFmo6ZJEmWcRlzYiptOKQc03Ek0cCPLbEy2SlINW82YPiHAeyQGcVGJQCsHg9QGS73dwcgVBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769956785; c=relaxed/simple;
	bh=CKRC+GKeLVAOIq5awbubMTzlmwnYALKXmUYf2PZggr8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bu0GKCNIcmCTeBtjgHpZy2upnil3aHb7r7gAxupl0AxnF+wm6VNCrzWNiFaLKoK2oHvB/W5EQGKoCIbabe1e6HS5TRb8OtG3Tc/NIflVVlWyehfhCtSRpveDQtKhI1DAJ8TeI06Tw9poh8o9QW4b8Uj0Laf+GVcPzFqTqxGTWxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBs/l0C4; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBs/l0C4"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82318702afbso3049185b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Feb 2026 06:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769956783; x=1770561583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sIr4S9fq29SpUMjufiJ6VUXkttUEEBTIS27qyRZQcbI=;
        b=cBs/l0C4HuBQ8fqXt9NMFd3xKkubrfnd8XoHEAqkSClzvjZu6okJWMl6JxA6X+hNZM
         8dZjIxzQRojx0TCwOIBZm3zHeeIuJH7S512I9ECdZlhe4x+BHYkVG/FoEhMFn1TIRc33
         XXhD74OO4V5+CXsxTAuQ6yiw+4bxIunRoF2kKn4v6uXcxJHIuAeRVwo4N5jHKsCFlvrU
         NAEdclgByBIgxO7Fgy3j7CjCZMzGBlkOgQKfJbhOTisHpkJtUQocmWtoVb51nQQ6uvWd
         A3KlAivGL5eH4LhCbAJlOLL4joPKuxuuSyZrxvPVil8r2ieK7yvXUoQ3YsqoRG432vwT
         LyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769956783; x=1770561583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIr4S9fq29SpUMjufiJ6VUXkttUEEBTIS27qyRZQcbI=;
        b=Kb7YpNceU4ck9KJNXCF3f6Ie5f20F7U9HcCGDhXtwOG7B5NLffprBYlwScaq+InkVT
         kvAykBMCJTrA4Y/PhAor6Lf2JFBLffC3LckvWAisGjNdXFMgrhQLY9Nq04jh6khjqFF5
         tJFRK0pgkGCc8Gg0PXJ4nRa5TXJUq0BjPpoaXrzVQ0SWxblTEJxzxx2o95bW8fZuED0W
         NHpvtzJvBfg5mULcbBV3KjKHDr94WbEMkRETMbZAOtBxpr+ROrPoMTNIlcuM7Nirn2IG
         f/kzyDtPT7WFlUfIZRXx+uTEo9xj+R/lI7IBtYSDJUwdFWu9RV1H/9vWZq5jYuDZRDP3
         oT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLdAgsMOU6THM+OwS884dZa8AwC3itXXLEZTT6HGW5WFwy4YXXyfQIxKF7VA66Uj6+t/bUpmtX0C0ZjSyC5llvEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxJpKNcqYNN/MRElrVrBg+wGnVVFBKoR0OyLKS9bxpXX1fZGYv
	70dBwBvuDIzO1arKmn9YSCoKQ3hzq7PcoMQIQgLmkpRJT/+eKvEAiTDngDt56ORp
X-Gm-Gg: AZuq6aKktzSremoMx+5/jje2uOAMZVLY6iR22mLSvlzGJMf1r+GIi4xjx8bEYFp3mQt
	Ma6Xfa4j75CLy0k5qbsQDDYGg91oiPTxYdl+yZqmJamJv1PHFqjW117aVtPkPlmMzlvI1K1Gp4b
	MB9KNWqmdNeb/dSgA5KnNZwzuKv9oTCFh9pjnierEJxj0yk1WFeKwAkNZBj27u8muVOHBhaVV2G
	o5arrOOep/p6jfuZ4r6LP5MULPDSnRMUgCTM6YMK7FOGzCOdzCD6V7gbGRq0r3qkRGk6lwoxw60
	2ngb/KUVdDn9R+BB2b9YVyJrmwBD3xe4+IJ7CIRVZftfwCM8ZUs91WFwYjal70q34Mmdej2uDkl
	izuzizwdXlbEPy26LokOt3LjYZUt8VsDu2rkzQ2QIV5VTeoJUG1MLanegY8aQf61OgcBpLrkmq6
	0kVdtCsHMa1+/Wxsi7Wb2xRUg2QWYfn8lR0JQSbwld7WQSSbtL6YvmvNA=
X-Received: by 2002:a05:6a00:9297:b0:81e:e0dc:6d00 with SMTP id d2e1a72fcca58-823ab74cf77mr8638043b3a.58.1769956782617;
        Sun, 01 Feb 2026 06:39:42 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b4a771sm13063027b3a.19.2026.02.01.06.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 06:39:42 -0800 (PST)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Sun,  1 Feb 2026 23:39:39 +0900
Message-Id: <20260201143939.27074-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

    Fix three regressions in the Exynos VIDI driver related to context lookup,
    user pointer handling, and concurrency.
    The fixes ensure the correct vidi context is used, safely copy EDID data
    from user space, and protect EDID memory operations with proper locking
    to prevent invalid access, security issues, and race conditions.

    Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 502d2d8e01c8930afd42363d543ed11298cbe34a:

  Merge tag 'drm-xe-next-fixes-2026-01-29' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2026-01-30 13:02:41 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.20

for you to fetch changes up to 52b330799e2d6f825ae2bb74662ec1b10eb954bb:

  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free (2026-02-01 23:28:01 +0900)

----------------------------------------------------------------
Fix three regressions
. Fix a regression where vidi_connection_ioctl() used the wrong device
  to look up the vidi context. It stores the vidi device in exynos_drm_private
  and uses it in ioctl(), preventing invalid pointer access and related bugs.
. Fix a security regression where vidi_connection_ioctl() directly dereferenced
  a user pointer for EDID data. It copies EDID from user space
  with copy_from_user() into kernel memory before use, preventing arbitrary
  kernel memory access.
. Fix a concurrency regression where vidi_context members related
  to EDID memory were accessed without locking. It protects alloc/free and
  state updates with ctx->lock, preventing race conditions and use-after-free bugs.

----------------------------------------------------------------
Jeongjun Park (3):
      drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
      drm/exynos: vidi: fix to avoid directly dereferencing user pointer
      drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++++-----
 2 files changed, 64 insertions(+), 11 deletions(-)

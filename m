Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409873DB318
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374189; cv=none; b=PFt3nCVKJzKYoIMlupqq9ZAwSHsctC06LEPgwqhXT83ieAuER2Uwc06HFQRRs/9gPWE1KaO33FWqLompi8oZp/nYr4biyGITKFPIPgX+uSAePYiXSZawx+seYh5cqlOBuelYyt9iYn87jkwbmgyXEdGfV/bkNbnf7UzdFR2mD64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374189; c=relaxed/simple;
	bh=/ixmRpmg8xZAeEKEAmXcd5PzO0R0B/Z2N+0BuJ1k904=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dX7vwCEXjwt4zAMycCzE3c0WD8rZA5Kc7IgivOxuAGORhtExMkVZb8u+uGJrS8A81NQbAWfwmvcUJtaiy5Mnse9wGTedcpMPtAHxgzzvma/o8Q3SZnZTGG7bGDA5Hk2FeX/8jxfMo2m86YXRnGAQ0U2DJ/i0vkZvoYtpNfetU2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePiSbu0a; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePiSbu0a"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba4efedbeaso45346325ad.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374187; x=1779978987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PTAM2OCnR/CpQqKrM7cC8oSYE2+MEWlXnrT+DWAEKJA=;
        b=ePiSbu0a4AxKyHLLBEfAXCjsVhxksbJc4h9MZ7Q+wylGqkTlzkZIa4E4EurEP1oE1d
         ucrDDUJf5/Ys4KQDFSDyuh1Uwf8ONla/oC50oBiAzObrzkYGrwnSTdo+JOgVOuOAHHQH
         /s/WHRbAa7a34P2pzWBtLTJDfov0oXcw2ktQSbzTex9mtwh6Ntaw1ONa3xl6qvzWMut5
         35zMU7/QsjxESkOUs8t+y+vZ6iJd7CMY0jJZ1WOhVO5SGVVeUqB2iyuJmtIV1P4/Nu2H
         /pP9vMmGOVh2g0sivE2sWIS/a1Ssp6bAisJ/0cOy9FIY0kFJqkYf9ukLa0CX8fh93WvN
         mKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374187; x=1779978987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTAM2OCnR/CpQqKrM7cC8oSYE2+MEWlXnrT+DWAEKJA=;
        b=Gjo8fae7nsEVNwdw3SO6jHyW/o8gj7FMa+qL4Pyy4TFcmB0QSv3inO6kIToSz2DEOO
         OowBwmsO2N1rujUDBBcoLc1dPFkun/a9O4XVLYJ8OUJuAA/Ll/IU2pFvtBO/L0l94CW9
         0IN3xnmAQvg1zEh1c4wSRXvUyzVtWEJgTmOioPR9je0moa9VgSmsbE82CXZZfgIMu5vZ
         01ezh7qP9/pgjnjEQ4USsHN/1XgoKBwYT7HQiN+yhmTgfbiZR2DRmj8P+SzLGWNoGWjT
         tZSi6tCEOzTNEnqWuoGRwfyFmlO/Oo5Uz4+sgUxYmq71Gf+wBzUk5JMO1OmxmZbUuPQg
         YuuA==
X-Forwarded-Encrypted: i=1; AFNElJ8A208UySRPkNy9KP2tusf9h8UPw64iZ/ekjvxKIsn0kgdoOIp4LlcUpQVyRCpJVQjaN333yAmnzWe/DoaEAZh9Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWdnHGFixdZdPFXwTpTePyr/0sZdF6C2yYahjHj7Uxbb9+Ixhg
	cbfNKPsO90EeL/8azGjx5Aj7f09PqQOw8lksHXv7+wHFN6uFAc2IRmGor/q+O9AqE4Q=
X-Gm-Gg: Acq92OFCSMQ3EOU4Y9w3Som8Qf76jTADz4t3Z8ieraZKjQpcYLMoTcZUagPa62xJeX9
	f1rCBlxPhyBzwPV4V3O48UPYg4SEO1U1w2UN6x0HebWG9CxfONf++DEbiTDSzekeRBx9265KWeW
	4ztto7yU6I91Eg97+Z0n6q6Jz4EIWGmXPGI/PK2vu/DkzJLMENp5ixQacxT/BcrPwpquV1dnS9H
	7Iz81yIGYLpNcJHjfVMAiRseQ7pk2WvlRf9Aj+rMrah3nqO5D9vpY6x3MwZO7tJWHs9EDKCHFEx
	i7oNX8J3/mxM+6EYn6gDlkYG52VphilBG4al7PIg5kdNOyXzLQGGZWiLPpSJEb4fiprSH9JqicP
	IYV9kt2+G7SNiS0ceh2UoP4URZoukBH0hB3cCgW65sbYFOpw32sRaT5CzjCMWZHYt77uP5Pk2Mf
	SV0/A9azaiA2Y0UkOQC/b7AKcTn27wixmaZ5PUgsazTS6F+gzVB1QGeZIjzpDltjtkxV9jT5C7V
	HlatzLmjLZ9NbCk/+hnLhmcWxk=
X-Received: by 2002:a17:902:ce92:b0:2b0:bebb:1081 with SMTP id d9443c01a7336-2bea339d36fmr32322615ad.28.1779374187405;
        Thu, 21 May 2026 07:36:27 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea929d774sm13807245ad.32.2026.05.21.07.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:36:26 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Thu, 21 May 2026 23:36:24 +0900
Message-Id: <20260521143624.56906-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

    This PR brings a cleanup and modernization series for Exynos DRM,
    focused on fbdev emulation and DMA/GEM internals.

Major changes are:
    - migrate fbdev allocation to DRM client buffers,
    - switch fbdev geometry calculations to DRM format helpers with tighter checks,
    - fix screen_buffer handling to match fb_info semantics,
    - adopt DRM core DMA tracking and remove redundant Exynos-side code.
	
Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 512f9f150f367176fa9e5f4613b4863409a6f686:

  Merge tag 'drm-msm-next-2026-04-02' of https://gitlab.freedesktop.org/drm/msm into drm-next (2026-04-03 18:57:00 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v7.2

for you to fetch changes up to b9bb45aeaf028450c753782280922d31120b342a:

  drm/exynos: Make exynos_drm_framebuffer_init() an internal interface (2026-05-21 23:11:46 +0900)

----------------------------------------------------------------
New feature and cleanup for Exynos fbdev
- Move fbdev emulation to DRM client buffers
  . Reuses standard ADDFB2/GEM paths and simplifies cleanup.
- Use DRM format helpers for geometry and size
  . Applies 4CC-based format/pitch/size calculation with stronger checks and PAGE_SIZE alignment.
  . Sets screen_size and fix.smem_len from actual allocated size.

Exynos DRM internal cleanup
- Adopt DRM core DMA tracking and drop redundant code
  . Removes private DMA tracking, exynos_drm_gem_prime_import(), and obsolete iommu_dma_init_domain() stub.
- Reduce duplication and tighten local scope
  . Replaces MAX_FB_BUFFER with DRM_FORMAT_MAX_PLANES.
  . Drops redundant exynos_drm_gem.size and internalizes local-only helpers.

Bug fix for Exynos fbdev behavior
- Fix screen_buffer offset handling
  . Keeps screen_buffer at framebuffer base and avoids applying scanout offset.
  . Includes Fixes and stable Cc for backporting.

----------------------------------------------------------------
Chen-Yu Tsai (5):
      drm/exynos: Internalize exynos_drm_gem_free_object()
      drm/exynos: Use DRM core dedicated DMA device tracking facility
      drm/exynos: Drop exynos_drm_gem.size field
      drm/exynos: Drop MAX_FB_BUFFER in favor of DRM_FORMAT_MAX_PLANES
      drm/exynos/dma: Drop iommu_dma_init_domain() stub

Thomas Zimmermann (5):
      drm/exynos: fbdev: Remove offset into screen_buffer
      drm/exynos: fbdev: Inline exynos_drm_fbdev_update()
      drm/exynos: fbdev: Calculate buffer geometry with format helpers
      drm/exynos: fbdev: Use a DRM client buffer
      drm/exynos: Make exynos_drm_framebuffer_init() an internal interface

 drivers/gpu/drm/exynos/exynos_drm_dma.c   |  15 ++--
 drivers/gpu/drm/exynos/exynos_drm_drv.c   |   1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |   9 ---
 drivers/gpu/drm/exynos/exynos_drm_fb.c    |   9 +--
 drivers/gpu/drm/exynos/exynos_drm_fb.h    |  10 +--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 111 +++++++++++++++---------------
 drivers/gpu/drm/exynos/exynos_drm_g2d.c   |  13 ++--
 drivers/gpu/drm/exynos/exynos_drm_gem.c   |  50 ++++++--------
 drivers/gpu/drm/exynos/exynos_drm_gem.h   |   8 ---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c   |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.h   |   4 +-
 11 files changed, 103 insertions(+), 129 deletions(-)

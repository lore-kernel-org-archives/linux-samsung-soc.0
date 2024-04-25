Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0BD23767
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 03:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714016613; cv=none; b=CJI6j7eB/PCZpjUIwbc2ZEUGbRN4hWjO3JFsLJtOozGFHlZHabu89B+c33iLmxISLJ24IvYu7EI/9boUPlAstmXuCy6KeeCeFLaeTCI0dy7eEVzM2L+yzqQ9ANnXCHNpC7Du+4eya0zSfnO2xHlq9NqgQXooLAA9YeGzCwgdzT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714016613; c=relaxed/simple;
	bh=VtntOmKbYYcoG5mLwePvjlQf1clcdudLhsWcgdZdSKA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=B3CIhWK0DatNR2eYc1d/px+zsl/qIg/f0Pf0H70y5Swe3Y2kV7vmzsCHbHhmJSzXSvrcquM6rX+a3shrxJmEMjUhOcYPJDd/wVcz5JbToWNU+iAcI6qbl8UZ1keWnR/ILdr5kqgSPuo3LSs1IZtQnj6cg6gXt+KPWU1KDYXpC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM/EDlb9; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM/EDlb9"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bbbc6e51d0so333545b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Apr 2024 20:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714016610; x=1714621410; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnCK077vcnic/R+LScKzvv08SpUTXpy5huFzD93QYW0=;
        b=NM/EDlb9ZukE3Su1b+hVfhvCEUs+xT+6rEZcR5iaIU7Dkxsr5J5iZWliZ8ZR6/e0bR
         AKir87+JdmWWdPy/40jybrbodZHDU8ODwcOe4cjUFKDfT9Z2V/dx67Y8tS62ElF6VlWc
         1IsD6U3vsFtKPtu24JrJlm8iKF3fHCPUU+OFUMw5gORTLt7l4IKOyumCAOoJMpYjNVbn
         W+U96LenNCO7YDKwTUvDGKw1gIvH7HMvjwQFY1uSSnLYjLLFpUPCQxe/52Uaq/F0GI/a
         ZnaX76vt/h7jVT8QqkBiSygPyOsFMfSMtoArENtEmFMUO/fKtdar1/YalvPRaBtBzKt6
         EmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714016610; x=1714621410;
        h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vnCK077vcnic/R+LScKzvv08SpUTXpy5huFzD93QYW0=;
        b=QLoN8qV0dZ2LERCP7R97ZpkoS5XjtZw2Ts+0xng2gLwkEUafilimZ0I0W6oNwJpeWP
         jvFWqSWt98Fg53RkWvPXV7+8DGPEA2Wr48szlr+AS/jxAHKZ7oQ/rBXqwgK3idoEqJLc
         NOKDOLGr4eoMiD+z89cKwod3mMbgUa3j86gxGGhqehsGbekVVMmwndPhZNj4XHFt+tun
         4Lz6Rkd385biDVnIW+1PcKgHCq25uZbghTXgoFoHFk6jFsslNGoBem63iFfyfBFQckK/
         9BK61d+JZ7iFeNg5wDybk1czPSoPFUWHh9HCehN28fI6fl9nGAZ6KQrSnL+Yu9xEqdqM
         ih4w==
X-Forwarded-Encrypted: i=1; AJvYcCUvdR1zYy69EKhhe2ciubrRULxVqseibhnJy9oOreC0u8tMascyrITYEcpVH1isBkQ3kcPFHPGPZ4B6dJWBl+m5lT/3fOdPpMAGiRAXEoPucwQ=
X-Gm-Message-State: AOJu0Ywpq+7+FJHeN6Xe3nPL7TqWq0yq7UCNcybcuPov64IjRLdEmu4x
	lZiKAX9mMuKK8R+263Feka5WVZTYWz/UvKADwVjlSY2toJOhX8lTNwC75+Uv9kM=
X-Google-Smtp-Source: AGHT+IHOtD3scAdjmymPzNeVVVH8W7S8v16Wo22wJAyYclqXKFP3sd7XGOtUTQzT9WE51vOGS34ZKg==
X-Received: by 2002:a05:6808:9ac:b0:3c7:426f:7640 with SMTP id e12-20020a05680809ac00b003c7426f7640mr4387734oig.32.1714016609985;
        Wed, 24 Apr 2024 20:43:29 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id c3-20020a634e03000000b005cd835182c5sm11899227pgb.79.2024.04.24.20.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 20:43:29 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Thu, 25 Apr 2024 12:43:25 +0900
Message-Id: <20240425034325.33507-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Hi Dave and Daniel,

   Just two cleanups - one is remove the .owner field from the platform_driver
   declarations in Exynos DRM modules and other is to drop the device_node
   cleanup code in exynos_hdmi.c using the scope-based resource management.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 83221064c28a0f9fdc4f63ab4fce2e51bfe23315:

  Merge tag 'drm-xe-next-2024-04-23' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-04-24 10:51:29 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-6.10

for you to fetch changes up to d65bfb9546eb627e3c578336355c5b81797f2255:

  gpu: drm: exynos: hdmi: eliminate uses of of_node_put() (2024-04-25 09:37:12 +0900)

----------------------------------------------------------------
Two cleanups
- Drop .owner from platform_driver declaration of each exynos drm module.
- Drop the cleanup code to device_node object in exynos_hdmi.c using
  the scope-based resource management feature[1].

[1] https://lwn.net/Articles/934679/?ref=upstract.com

----------------------------------------------------------------
Krzysztof Kozlowski (11):
      drm/exynos: fimc: drop driver owner initialization
      drm/exynos: fimd: drop driver owner initialization
      drm/exynos: dsi: drop driver owner initialization
      drm/exynos: g2d: drop driver owner initialization
      drm/exynos: gsc: drop driver owner initialization
      drm/exynos: mic: drop driver owner initialization
      drm/exynos: rotator: drop driver owner initialization
      drm/exynos: scaler: drop driver owner initialization
      drm/exynos: vidi: drop driver owner initialization
      drm/exynos: hdmi: drop driver owner initialization
      drm/exynos: mixer: drop driver owner initialization

Shivani Gupta (1):
      gpu: drm: exynos: hdmi: eliminate uses of of_node_put()

 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  1 -
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  1 -
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    |  1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     |  1 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     |  1 -
 drivers/gpu/drm/exynos/exynos_drm_mic.c     |  1 -
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |  1 -
 drivers/gpu/drm/exynos/exynos_drm_scaler.c  |  1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  1 -
 drivers/gpu/drm/exynos/exynos_hdmi.c        | 16 +++++-----------
 drivers/gpu/drm/exynos/exynos_mixer.c       |  1 -
 11 files changed, 5 insertions(+), 21 deletions(-)

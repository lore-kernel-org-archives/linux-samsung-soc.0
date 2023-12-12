Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8sy14FQ"
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8798FCE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 21:11:39 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5d33574f64eso52982237b3.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 21:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702357899; x=1702962699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=efhztduuZIlbY8gtoUVvteotjPJzAA0l+EK879qIAA0=;
        b=i8sy14FQ5VWVan1sB6rY7A3f6xQ1sHDXkvJoovOt35dtUebYW0+TL04iBmm8oY2qf5
         gmql6tIW/3zhcQfHfzvcAo7HZk+1AaMkJDy5XY59kmqXNnkHjuF5AYCWbZ7/67dkpxzD
         10hsumXD/XHadtiEv3a+b4/WgVAze0RGPaZ+9cFCdqXo37YQecMfUHKO+ohfXZnz7A5V
         FVudVYLiXZ0rOixh7sQ7abEJQR5Cpne2RCruHlb9WzcLsXb+2eAFgNtBl+L9noxVj4C6
         133kNkV6ORX+IFnok7znCgAJ65ggelsCgWqEp/92Yab3qSzVVK6cRuuvZEjTf7xpvSy0
         f/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702357899; x=1702962699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efhztduuZIlbY8gtoUVvteotjPJzAA0l+EK879qIAA0=;
        b=Ibtn/bBStGCfPtCmkzIfvSvYkpJVF6WyfywPDyF7sZvAVtNhXkw1avdNawxHFVy5Zq
         fjUhCxhkexRTIQtkO2dGE2RJPcmvq8ADfIv2QMqzIsP8ZWSv5KFX2EUUXaIpjHlD1leY
         xhvGBpSF4l7BvGQCuuJ71PmtEhPgA+zbOrcmDosmy7SL4sAPt035GymS/8wqPJ5ZebkG
         qacrqi9NBgGgU9tIiCox9svcC86WX4R9NK8TIME88wpfJUvsXtemJi+hCPgGhGy+q46g
         qbC8jUg1S3JLMnVYOqWq4hcBERJyf45bdu7dsReIMlUD3NK5S9EqhiTNhn9fW+8qkd/v
         Js4Q==
X-Gm-Message-State: AOJu0YxZt8850xghzIvOt0Y5NnY9tU8+hoRzwv+a8sgXJ+eF4xhT5IyQ
	FZojQnS/Kz9hBdgDkpjp7Zumt8uW9VcU6g==
X-Google-Smtp-Source: AGHT+IH7XAeJow/VB+6EaHQqX8MAujQsj+TAU/S53+aGMo4e7wTNOPaUX+dhBGViFk9bdLu8g6ZHEg==
X-Received: by 2002:a05:690c:2c84:b0:5e1:79fc:fe77 with SMTP id ep4-20020a05690c2c8400b005e179fcfe77mr1175848ywb.55.1702357898614;
        Mon, 11 Dec 2023 21:11:38 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902aa4a00b001b86dd825e7sm7532011plr.108.2023.12.11.21.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:11:37 -0800 (PST)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Tue, 12 Dec 2023 14:11:34 +0900
Message-Id: <20231212051134.48524-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

   Just one fixup to shutdown relevant issue and two cleanups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit a2f8994c1001cfa48483a3afa3550016a3ab0a3e:

  Merge tag 'exynos-drm-next-for-v6.7-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into exynos-drm-next (2023-12-12 13:06:29 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.8

for you to fetch changes up to ead5a41c8f8a13ad7b1c9fd2d7edb1ea909b777f:

  drm/exynos: dpi: Change connector type to DPI (2023-12-12 13:06:38 +0900)

----------------------------------------------------------------
One bug fix
- Add a missing call to drm_atomic_helper_shutdown() in Exynos DRM
driver.

  This function is necessary during system shutdown and when the driver
  is unbound. Without this function, components like panels may not shut
  down properly, potentially leading to power issue as mentioned in the
  kernel documentation, specially in the "driver instance overview"
  secstion of 'drm_drv.c'.

Two cleanups
- Convert '.remove()' callback function in the Exynos DRM platform
  driver to a version that returns void instead of an integer.
- Change connector type of exynos_drm_dpi.c module to DPI.

----------------------------------------------------------------
Douglas Anderson (1):
      drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time

Paul Cercueil (1):
      drm/exynos: dpi: Change connector type to DPI

Uwe Kleine-König (1):
      drm/exynos: Convert to platform remove callback returning void

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  6 ++----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  6 ++----
 drivers/gpu/drm/exynos/exynos_dp.c            |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_dpi.c       |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c       | 16 +++++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_mic.c       |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  6 ++----
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  6 ++----
 drivers/gpu/drm/exynos/exynos_mixer.c         |  6 ++----
 15 files changed, 40 insertions(+), 56 deletions(-)

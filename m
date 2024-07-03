Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF813957B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Jul 2024 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719993559; cv=none; b=fRuIstNVNqO/NEMcZKXfxR33bdanaZCBy3Sy1YKbfp+w7KU+fx/rxqVA7O2RECE3QcqIRFqbKNnNco6o/QdabYkXezYzjpnEnWTYEZVB5ov0xF/PtUqbFsRBtWAL6Qt8r96vyK8DVw29haL2fIhDA4FrL52o/vSGqiJ+0ncn1gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719993559; c=relaxed/simple;
	bh=TLz36ZO/6koabHqZG8cpDOteD6VZ9qut1UFJUgiCSrc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=QD6e1uSnJN4GOahHdC6UalIg8kBAtudKX5GCTXUNLvYjalyG+nHhKXS2NkG7hSaJOJbOGXaRtNa6OOfrHITmtA8p6irXdar9R6z6q4ZXRAcfXz2EKcSpcww5aO/shSxMVe9vxosY4hUgF8Tix/ZCcGbQJcyvSU7zibgU+ACTTZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAN30fX2; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAN30fX2"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7201cb6cae1so2827890a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jul 2024 00:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719993557; x=1720598357; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUXP1n3neYZQXYyEiIWXxaQep8rZCiu9VynGOnY6c9o=;
        b=KAN30fX2O080+iFAj5M+/tcDlMGEuBLMoI/vBKwtBoqSqvSRbANUBOJOliw46ZIIH7
         xVePiGkc2QwnastkzNPZmkiDGNWFnlqK8vaNoS2p6hdIG0ybBP2VwTaRT85lHKAOgact
         8L+82MjcTsOeqevwvJP6xdDNUZZVKuxvHFzpIgdJH8PPo/Ved2Dn1Ayz+6UODXeMRHjW
         C/rR7AlVfbp0l/e58BF3h6gtgl/yvwWL8EJ7SccrZHHWpDWptNSxZZz6EWGDcrMfqE+T
         bGKvdypbrjMBmnw+pmKmobEPvDq+miis4UrFHFCm1VVwMWiyXDDpkbFyyBdrRuppmPT2
         TZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719993557; x=1720598357;
        h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WUXP1n3neYZQXYyEiIWXxaQep8rZCiu9VynGOnY6c9o=;
        b=GihF9WmXgPKj1YhGTiPmD/28hwm7Y8AupNdZp+EbX57yyf5K9PE7LBQZ2vXCra3F/v
         yHWJ+CefoX2Vp6Fuoa8OULXH/EBaoRBoNB8ZufjVxi9FDfw/aL1PLNPaddFWp26yIaFw
         7dI17q8WNNgwhony42j2a2gR9pBx91AEkdCrDdhAAeuzkz1yuJ46+5GFo8WI+az3jbOm
         o3qfj1CbS3AQgKQ2oaLNjQMy/4jBSSLf1zkWJRRSnd3lonlAINNWoZi+giIX4d9Nib9/
         Y1X1ZtFTl2yv0moDd17Rzu3BnrcUzzHUTytsBm7Wel7+l9Xg7HrYNiHdaxnTvC+yvBuj
         bBaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtJpRQG5s+0JNnPxCcsYZUQYElJ1Rfnb/9cuR0m9Rw1yqCb/8YamXFWEZPHz9dpTMgLHahmaxtWj337bLa1yDd+bkYfBKbGMHiXcrThvGRyDg=
X-Gm-Message-State: AOJu0YwCNbOmC9VHGbIN48w17+vmhp8e8oyHLYXH7B7bDHOJJwQmr50f
	X0MQeRFqyXfyHpNHi7qTmFRqCj5NuiWyhmLe7+2eQtVnBdUcQMqf
X-Google-Smtp-Source: AGHT+IEmp3rXcu2b0cdpoNk5erAfpzbe0GUB6DHEdKkuar1CPSsd+S+Xv2XmyThBNVhasHPcpzKcRg==
X-Received: by 2002:a05:6a20:28a9:b0:1be:c054:1ce1 with SMTP id adf61e73a8af0-1bef626eea6mr7742948637.55.1719993556427;
        Wed, 03 Jul 2024 00:59:16 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac15698d6sm96241075ad.192.2024.07.03.00.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 00:59:16 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Wed,  3 Jul 2024 16:59:12 +0900
Message-Id: <20240703075912.37106-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Hi Dave and Daniel,
   
   Just three cleanup patches to Exynos Virtual Display driver
   for improved management.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit fb625bf6187d97c3cd28d680b14bf80f84207e5a:

  Merge tag 'drm-habanalabs-next-2024-06-23' of https://github.com/HabanaAI/drivers.accel.habanalabs.kernel into drm-next (2024-06-28 09:41:04 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.11

for you to fetch changes up to 2210093478443cd57cff5950379fec31ee8a5f79:

  drm/exynos/vidi: convert to struct drm_edid (2024-07-03 13:00:16 +0900)

----------------------------------------------------------------
Some cleanups to Exynos Virtual Display driver
- Use drm_edid_duplicate() instead of kmemdup().
- Replace existing EDID handling with struct drm_edid functions
  for improved management.
- Keep an allocated raw_edid or NULL and handle fake_edid_info in get_modes().

----------------------------------------------------------------
Inki Dae (1):
      Merge tag 'exynos-drm-fixes-for-v6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into exynos-drm-next

Jani Nikula (4):
      drm/exynos/vidi: fix memory leak in .get_modes()
      drm/exynos/vidi: use drm_edid_duplicate()
      drm/exynos/vidi: simplify fake edid handling
      drm/exynos/vidi: convert to struct drm_edid

Krzysztof Kozlowski (1):
      drm/exynos: dp: drop driver owner initialization

Marek Szyprowski (1):
      drm/exynos: hdmi: report safe 640x480 mode as a fallback when no EDID found

 drivers/gpu/drm/exynos/exynos_dp.c       |  1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 83 ++++++++++++++------------------
 drivers/gpu/drm/exynos/exynos_hdmi.c     |  7 ++-
 3 files changed, 42 insertions(+), 49 deletions(-)

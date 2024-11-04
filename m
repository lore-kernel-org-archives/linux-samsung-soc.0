Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1C81553AA
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Nov 2024 03:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730690028; cv=none; b=bc0VHrOqg0M57jSx95dfQQqblKMeVnnw54jJzObst9tyEEWJ/hqZjQtlX6yc3xNi9f7Ug/1WKpGTz0ss+PgzZty06C3ER4VXmmFFOBkrMxLszITfDQ4UaueZAlF2kiZdTb06R4UPFd+Q2/5NHOc28VlMMTHAFNY3LKFtJIoe+ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730690028; c=relaxed/simple;
	bh=LqM12t5/KPiMXOoCQC1G5ffIum/U3xyTDYSYWUL3Jys=;
	h=From:To:Cc:Subject:Date:Message-Id; b=n2jYTGbGemRrRd+vEuVbkYJnq9uLzhN0bKye76nJcuegAGgEsibl3STK7RCNMfN/Z4goOK2AEbtA4oX8ooUngW5fmxMQVGeXXg/pkryookgbX8iDXqF9l3ggQH0qVn7fOrXxllGWV3z9kjzBI0vtoe4eITu3hE4T7o0Y5ISr3uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brpXI+hw; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brpXI+hw"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7ed67cfc1fcso2466031a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Nov 2024 19:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730690026; x=1731294826; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=curM5JHWqTItwQpvFipVaydSvgK/Mn5omBdYFQcRouI=;
        b=brpXI+hwUT82LYYDifyk8s93lkkBvVuRFNiVlbw3p9FZ5LzEqkyI+i2f6413+wz6xC
         42YT/0lsvD9LLAxhBBC/aEn/RQPpPv2NtQyHOKYAiAA4I8E0VoCN80XUjW6wcsdGhQo5
         v6ybX4dM9apoqbnwObN9dOPSEVTrpEh3Xy+AxqGAr++qrl9X+KELSL1ZeFY3X1wUPDp+
         kPdjhiwKOSwdTifdJJqIFQlQBmU3aWKqcTmDwiCDN1x5C5PYYoojtiVbvoVPfNazJNE2
         XshU/nOJC+y/HJbxz00CqOaRQ4MjqSLTgmcarBlFehrdFwIZjIvXT8J5IHSvsEKq96lw
         CH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730690026; x=1731294826;
        h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=curM5JHWqTItwQpvFipVaydSvgK/Mn5omBdYFQcRouI=;
        b=Ec7EGl+KFDVclg2Eb+T5AYyrAvUjbtwAt6s3RiMwzPPG0UlTnnt2UC+mf1s+Dema6B
         zzdwUDIFA1oIHYoNOjHwteXoIn23kENNaKg2vAA14C4zl0Zm7JC5+wTXFYbMGPJNH+vy
         8SaCJHTVO5Dk5lwxZIQ7p2DBGehGHQ+ZlMWu8j8TB5DTwW1b7U1nG3ipR8jwD2oTl974
         Jy7ifRrEp0aUzouIzQK3NASTKV3g+I0rJnm1DbyZ/3GVaM3urKFNIumZwj73W0+3nQxD
         xHhHFnjR5TvWYNYQzp1OeauXW/8osX1natMtnTn0CHffsL0qU7mrozjjAFdc0sJisFfx
         P5xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXcI6oBtY6hy5DM6zSAZ0km6GIXC7vVpxeoMZzu85JByCR+QdfIAfQSJgSa4jokyxr4Vis6UzLiCUGoSubMTYVKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIyPgxdzcfjFWFybonf1/YEgcwMtzsjERE0UsL0eKjdyty2SxY
	bDI88gnPzEa/mfuEl6Rta2d1hcfQ60ph65T2m+CfH/BaRn053jxNfEpA8A==
X-Google-Smtp-Source: AGHT+IFn83lnoK/EDpxaIBt/m8+SjryQFVCLNbxO0iVVPjdnvAIpUl7UK+AHchKjQELZWRaTXP9FsQ==
X-Received: by 2002:a17:90a:4811:b0:2e2:8349:239d with SMTP id 98e67ed59e1d1-2e92cf2ce03mr20646493a91.28.1730690026083;
        Sun, 03 Nov 2024 19:13:46 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fc0084asm8783053a91.51.2024.11.03.19.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 19:13:45 -0800 (PST)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Mon,  4 Nov 2024 12:13:41 +0900
Message-Id: <20241104031341.36549-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Hi Dave and Daniel,

   Add Decon support for Exynos7870 SoC, several fixups and cleanup.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit bcfe43f0ea77c42c2154fb79b99b7d1d82ac3231:

  drm/imx/dcss: include drm/drm_bridge.h header (2024-11-01 13:46:25 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.13

for you to fetch changes up to 53f4b30b05b2a9db6988cb71a785837ee64d2524:

  drm/exynos: exynos7_drm_decon: add driver data and support for Exynos7870 (2024-11-04 10:50:46 +0900)

----------------------------------------------------------------
New feature
- Add Decon driver support for Exynos7870 SoC
  . This patch adds driver data and support for Exynos7870 SoC
    in the Exynos7 Decon driver

Bug fixups for exynos7_drm_decon.c module
- Properly clear channels during bind
  . This patch implements shadow protection/unprotection to clear
    DECON channels properly, preventing kernel panic
- Fix ideal_clk by converting it to HZ
  . This patch corrects the clkdiv values by converting ideal_clk to Hz
    for consistency
- Fix uninitialized crtc reference in functions
  . This patch modifies functions to accept a pointer to
    the decon_context struct to avoid uninitialized references

Cleanups
- Remove unused prototype for crtc
  . This patch removes unused prototypes
      exynos_drm_crtc_wait_pending_update
      exynos_drm_crtc_finish_update
- And just typo fixup

----------------------------------------------------------------
Kaustabh Chakraborty (4):
      drm/exynos: exynos7_drm_decon: fix uninitialized crtc reference in functions
      drm/exynos: exynos7_drm_decon: fix ideal_clk by converting it to Hz
      drm/exynos: exynos7_drm_decon: properly clear channels during bind
      drm/exynos: exynos7_drm_decon: add driver data and support for Exynos7870

Kwanghoon Son (1):
      drm/exynos: remove unused prototype for crtc

Shen Lichuan (1):
      drm/exynos: gsc: Fix typo in comment

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 122 +++++++++++++++++++----------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h   |   3 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    |   2 +-
 drivers/gpu/drm/exynos/regs-decon7.h       |  15 ++--
 4 files changed, 87 insertions(+), 55 deletions(-)

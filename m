Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1562126BF1
	for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jun 2025 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751186161; cv=none; b=O6HYrO/rhjt1medE3UDh/8xOLpSfhUJMnIhxzOzgT9yk/PAqNjEDwXtqtltmQ/O0aL7DYvnGVWuZ5/6WLq2qAUAtCTtLFKyO6U2h29etBUZBwD6cHWGvEj9rS/cuU/e+dS7lmfOXPoaqHJtITXLCHFyRSlAFO6QEZewUHt4K6Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751186161; c=relaxed/simple;
	bh=sjue2DtFJ6sUvKB+UXtDMMCGxF5wCW5f97SwrPChXqI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=GpHE3XzE0zIdRPMwxLHhO9yQHeD9eX95bNko0QknNn9RTUXXH3zaMUMWxNi9l82CIvlEaLybHaYzISASZ0CSXh01R0oeJNpSee6LqaPho+FZdXYd0z3qIUeI9ivbxUCsjypBETSI0fK6foYb9lPwwG9cvLb5E6RCl+JO55ixBVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXziCTS8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXziCTS8"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7490702fc7cso2693249b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jun 2025 01:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751186159; x=1751790959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6i7vyzfe6J1oONSW9AQ3u4jZM9Km0aZbMXu3VqE5Z3M=;
        b=lXziCTS8rS3r1i1EyKehuRgcUtg5/kjdg2Gw+bA/vSNnRCAsRQNfzT5d5FSgBnborU
         45ni8EzPTnSVHY/WJpLSJVpduVqSGu0FkEWhC86Ar2WUU3QduF3RiBYrQx20yZl29Z30
         4yauaSLbV8d1TkyUKQNd+NlXQ3yKUZhXQ1EF7l/ZlTscNeieL0EcsBUMT+157svpKyzc
         5QI1RihlgRRzWozQBdCmBRyOAuTf1RLSfGqIqYSfDRLYPXhmuGwyZai/H55UqWRUqGxR
         8XEp489+rAlfTC6UjtEh3P2JTExFuEQtmDEBNIYe7FUg6B/g9IuqOFuRQqds8YyhZ6+0
         vZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751186159; x=1751790959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6i7vyzfe6J1oONSW9AQ3u4jZM9Km0aZbMXu3VqE5Z3M=;
        b=ZlCNoHOLu7+XEvt08UCxiM7jTbRuv01zPZu+DYwCauLkx0seJohP84y7Es9lVRIzPx
         lEYHTZokVsFFb6+bpuTRyEtUhmzTGCnV3uSV+o3Nr16Fsy7UB8iTinj6sjxbx8L6ZqTp
         GVLC8DBYvewU41x4ALgECRcmxXWZHIRZOVabJmNtj+y4oQxC/8FkKlAQNDeIwfD0Eswr
         XJljaY3qMwwZ4EdH1PyLZvkSTKZsgfquX6Tz77f6Z36qoLmiBXELBm5NZJKBaOuQq8DP
         pGu7H7GB2TG+X2DAmcNgKf2VaByQrW2tEAfTxAJLsp82dZ2rHWCu1czZRnLtaL7W1TNN
         fOLA==
X-Forwarded-Encrypted: i=1; AJvYcCV4uK517rRrpOXEIh7sYm5DZqJe1oGKbKjCLS6BHubRDu2t8972FbKhVot8rbSRn+CHIsxtyr/a762rqHmrXlxlyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCbI3wv+CnuG54gZz5w5FqJ+OGsBuoZBfoE1zL6JuBSnr8cIOy
	vLjjLui3XFEMjrEMhz0QyCZ/dCluU4wE2EDexYC+SJ5O+ZtnT1DwG7Dj
X-Gm-Gg: ASbGncshbSFaAK+1l4n9i5tC2gisOzanDVYo9Jlza2Vdqjl8u0DBEh6fobt4yN73xBa
	4YRoFGxTQMJkhp55yYZGv7JVuiRuxicAPy2nO9yUeYKICFtcvovrjyJjQ0pfgjQ0oOQKjeqSIoM
	WoKWdsVOCSS+f/rVWMR5G3QOw0A2lB/qPSMatJ7fsp4vsQEOBZ4SgMyjSqVzf4lAptR6SyE277P
	oBUMOZ6UDN366YrDJjugDPWxTCYlv5IvX2y2Zk2RHm2XVCvRZ13EqYljKkVQH/4l74dk53dfuOh
	+5uUoc1frh3khv2d8+z8ZmisGCJmGGDAjr3aoUNqmqM1yWMTw4pSL7OW8OfvLUGEtOew7KA4O/r
	GliTBZQkFXANvGO+sik2anfzo9Ocf8fE=
X-Google-Smtp-Source: AGHT+IFjyC42XXzduAZv+zmTuwhrtDybQj1WQjSp+G8pnq0bYkMFkoPgRPCQXQgHMMG70KVVqYUCvA==
X-Received: by 2002:a05:6a00:17a8:b0:73d:fefb:325 with SMTP id d2e1a72fcca58-74af6e53e7cmr11215849b3a.5.1751186158792;
        Sun, 29 Jun 2025 01:35:58 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55786efsm6262177b3a.82.2025.06.29.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:35:58 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date: Sun, 29 Jun 2025 17:35:54 +0900
Message-Id: <20250629083554.28628-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

    Prevented pointer leakage in printk(), fixed kernel panic
    by ensuring DRM driver init and resolved Chromebook lockup
    with runtime PM guards.


Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 9fbceb37c95939182e1409211447a1d3f3db9274:

  Merge tag 'drm-misc-fixes-2025-06-26' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2025-06-28 06:53:00 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.16-rc4

for you to fetch changes up to 5d91394f236167ac624b823820faf4aa928b889e:

  drm/exynos: fimd: Guard display clock control with runtime PM calls (2025-06-29 16:58:16 +0900)

----------------------------------------------------------------
Fixups
- Fixed raw pointer leakage and unsafe behavior in printk()
  . Switch from %pK to %p for pointer formatting, as %p is now safer
    and prevents issues like raw pointer leakage and acquiring sleeping
    locks in atomic contexts.

- Fixed kernel panic during boot
  . A NULL pointer dereference issue occasionally occurred
    when the vblank interrupt handler was called before
    the DRM driver was fully initialized during boot.
    So this patch fixes the issue by adding a check in the interrupt handler
    to ensure the DRM driver is properly initialized.

- Fixed a lockup issue on Samsung Peach-Pit/Pi Chromebooks
  . The issue occurred after commit c9b1150a68d9 changed
    the call order of CRTC enable/disable and bridge pre_enable/post_disable
    methods, causing fimd_dp_clock_enable() to be called
    before the FIMD device was activated. To fix this,
    runtime PM guards were added to fimd_dp_clock_enable()
    to ensure proper operation even when CRTC is not enabled.

----------------------------------------------------------------
Kaustabh Chakraborty (1):
      drm/exynos: exynos7_drm_decon: add vblank check in IRQ handling

Marek Szyprowski (1):
      drm/exynos: fimd: Guard display clock control with runtime PM calls

Thomas Weißschuh (1):
      drm/exynos: Don't use %pK through printk

 drivers/gpu/drm/exynos/exynos7_drm_decon.c |  4 ++++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 12 +++++++++++
 drivers/gpu/drm/exynos/exynos_drm_gem.c    |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c    | 32 +++++++++++++++---------------
 4 files changed, 33 insertions(+), 17 deletions(-)

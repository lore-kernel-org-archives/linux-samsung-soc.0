Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2AD1D7E5B
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 03:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822117; cv=none; b=kSxxyeHu5lWJ8ZCUxnBSQ4YKGPJKRbGfopeYA/Vadu849QJPvtmUx5xgndv06A3YZaUXlDB+gMaKX7bVzkjMZeFlKd5x5/DMk1htWeJPVCja4dyl9nnv7/PYW34dyEjwrDrugZVsiGujVo8kYoZ3uddcRv5V1xxX0u8Txyx9R4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822117; c=relaxed/simple;
	bh=x427pBqx0gFYGTncFxJvdz5uzugsDQ22hEkrWxmHrFM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MybTZJGDK/o0poWHntPYiDLwDpcKwtXRrMYilJZiOgK7G/erGSoZW9KB14w90dQbs0q+BXZGbco8NbGyh5+PHgC7nqzCtCxezqnlL7N9olRlI9GrDOp4ZoOc0Jd4u90+nO1zrUTMY5/Ovf/J3B//p8xtuoHbZ+1XdV+1w0jbrvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbXfQYfp; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbXfQYfp"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso2915373b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Sep 2025 20:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822114; x=1758426914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eVZlx8kiBc10T/c0EsaVi7149K3UyKg/YmSpJ4DwS0o=;
        b=RbXfQYfp0ZX9hzUdFfgU8A2FYtQGKZaByOVimDUVYC4K1iijOFZCUFs7lqw9OZs/qP
         Q4jFsX1c3VSCg4InVa/DMuieJeQz3tYgWmNKDFPr960syC+hozC88gbEIS9O1eoubTGU
         jCj0VeUQ5e8fQoqXkKc/R16XIUvTN4MiZ0v+an2j+rWgxnNI9C7FfJ6mJuNknvvnU35s
         KBWwmGj831V3bSuG7PbZDC1cuVoQMM6sA2zgWbBIjb2ehJuoUwTxzcbCvVvMX/710arY
         LOnUaJTjFEZ4X1RQZA+W9CD2fM1YZSOy/csdy8mkwsKxP9anSPc9ufnipIb7bAuJQryL
         +7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822114; x=1758426914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVZlx8kiBc10T/c0EsaVi7149K3UyKg/YmSpJ4DwS0o=;
        b=GfOW+Jo/ibgFpZr4eNit8CvtUkDFpciOT40mowABCRUo5NY39V5g+ZdCtEHNL9dnBQ
         YkHJnwS7hB66ungc9aknwbC77tcUdj5dOVlJtFRh/ntLWIIXv8+/qBZiQtUkqtNfAr2f
         DOP3czzhGPaol34LZYhAoGw5kTcmdUkx6fBHDNfuCYIkk832WLyxvXp9NI8iCScZrYaw
         IDyw5Jr4lq0nwz9EHNSCH5FfkLE220lr5waSCK1WlE3EfPQhOwD0TdbOZ7raNE/IyffK
         UXFigrXx02CM/8eppXECnU88MUvoMYlkd9JKo2XEefWewdTIHWMP68i10sD6TIzT+0CO
         OZqw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Xs4MZX62OwQXe5SATHYSf9kiJUUt6hruaLWwit+KD/l9J1OQPNgJsKB8okfNcoXKkjsjED9TKTVVvhP17qcoFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6TVctJk5Bk84ba/tVbdRJhkomGLMTetu06DLpAGbfrccMcS34
	hyYOx3DffIhkTWLvVIvTJQFh8GCUe3MWkU8ibXAb8L4hnlsmg5RawXumOX1MZw==
X-Gm-Gg: ASbGncs25S0qwzfR0saOM0F+JGRQQZdT6ZMT8fR59mKnbJEMyRWswSzKl5glj+6O5Bd
	MRSWqjunRh2ZTW3HKnCgRuZigWAa98fbs126fbZDezlBbn0oCutgP+ZJbJh/bohcAkpf3SmFbfV
	l+Hxoqj+AD/H0HwnsdRK2O7/j4pSvWW3wDjM3plYBtA8/9FBXxSDPs+w3u8agQY9DNR0hTNmGVq
	KyrHSmylI+HmP/OKNVErq/PaBmWdeVIxEnDUHl+QwpMOVltH0QUGv20aS9vQXhGcp7T1RBlV6aT
	uPkL85gf/SUo8EhaZ9ThoLex8uaojVcSmpY6DyFQhXvQ+A7g8Zsp+Q3uIDdJoeUjuIlBX+MAJuS
	U3w9apmyg+VsibwWIaMak3AHLKmgtDF9h72KtSGIlOw+70qdSo7Z+4NSnNdRVWH+ZG8uYtccVTa
	kxgw==
X-Google-Smtp-Source: AGHT+IHKPmLqyKmaJOziOgkGnuRkSWBVPjF9DQcOeFHiHgnYMiPe6kA2dVUDq8LL+GQhOQ/52sYZ1A==
X-Received: by 2002:a05:6a21:9985:b0:24a:b9e:4a62 with SMTP id adf61e73a8af0-2602c04eb02mr10505362637.40.1757822114472;
        Sat, 13 Sep 2025 20:55:14 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32e0c2863e6sm3704274a91.28.2025.09.13.20.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 20:55:14 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Sun, 14 Sep 2025 12:55:06 +0900
Message-Id: <20250914035506.63339-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

   Add Exynos7870 SoC support to Exynos DSI driver and a bug fixup.

Please kindly let me know if there is any problem.

Ps. This PR depends on the following PR being merged first:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.18


Thanks,
Inki Dae

The following changes since commit 7ebef12d0c9411c1362cb22c4449747893b7ed2c:

  Merge tag 'exynos-drm-misc-next-for-v6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into exynos-drm-next (2025-09-14 12:30:31 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.18

for you to fetch changes up to 6a3ac4a08be247d6ebd5da13237aec4898a2c4a4:

  drm/exynos: dsi: add support for exynos7870 (2025-09-14 12:31:47 +0900)

----------------------------------------------------------------
New feature
- Add glue layer support for Exynos7870 DSIM in Exynos DSI driver
  . Introduces Exynos7870 DSIM bridge integration at Exynos DRM DSI layer.

Bug fixups for exynos7_drm_decon.c module
- Remove redundant ctx->suspended state handling
  . Cleans up unused state check logic as call flow is now correctly managed.
  . Fixes an issue where decon_commit() was blocked from decon_atomic_enable() due to incorrect state setting.

----------------------------------------------------------------
Kaustabh Chakraborty (3):
      dt-bindings: display: samsung,exynos7-decon: document iommus, memory-region, and ports
      drm/exynos: exynos7_drm_decon: remove ctx->suspended
      drm/exynos: dsi: add support for exynos7870

 .../display/samsung/samsung,exynos7-decon.yaml     | 21 +++++++++++++
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         | 36 ----------------------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  9 ++++++
 3 files changed, 30 insertions(+), 36 deletions(-)

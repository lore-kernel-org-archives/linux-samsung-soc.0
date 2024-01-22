Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A423D7B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705908256; cv=none; b=Ormqt06faxLvYqBiMDEUQhfqHZ3yIg1/gOJAAqQ5SywbPBSc5F0F1CzjPKrM+Mh4uuBXtyzjqHVmx9sGzu8XJain2x9nu3UEWnNf/NyuWB/Oo+WA/dVt5LiYXaFmdLuiTU/INQNoBdqxAPRU+mLWzW/UjmUjzpK1l2hufND5Ie0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705908256; c=relaxed/simple;
	bh=9eyt1MLqaYecB/OI/+wuwrJoDd4zYuudkBp/NLkWIHg=;
	h=From:To:Cc:Subject:Date:Message-Id; b=qXQyWh0CgQISVoiHm6tMHgk9FyhfG/rb01XVYQHEeqy/d+Iu6DARH2X/esY1RLjgOpYdzsblgEgdurJWQbWId0N83y3Qt/bESvfqSN6PVfEpaiDxwR2X5n3eOQvZssj6s3Dqqxl5WUSIV9+sqS6z49RGR2I6iWs2XRTa2HFC5wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WI49p085; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WI49p085"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6ddf26eba3cso1890888a34.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Jan 2024 23:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705908253; x=1706513053; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5fFm2KcnyXnguNHsY0zXxWKy+lJ/vtZz2kmhMHeAyY=;
        b=WI49p085IhpxKn7qbsyxzXp/R4zVpq3V7g8TK0bN/yB7bok9tKqJTNnav3EiGXtZE2
         kGYxnCdAYx/QAneXPEgvL88ebYaK3AGUp+PgN0psLBTjwwQIHKgICTkmXh2QxyDymibL
         IaLWtoaqAeHtTkgckjiz02wt5NLraTQLStmtr/jY8l0hRVYiIK6QKLUlM48Vs8TTt8Sv
         svPPtxV30o3kf2fzuZWonPOYqgrvQqq3YNF27lmjIw0USUB/PsHpFlDZ0VQnas10L7b+
         HcfdrQk5kK6oODNzPUE0zndKhreoZ38wGkUTNfHB+WKIkKKKwDyvdcgYurKMHMrioSOm
         RRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705908253; x=1706513053;
        h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a5fFm2KcnyXnguNHsY0zXxWKy+lJ/vtZz2kmhMHeAyY=;
        b=Ol6HuDnWnqJMhdc0JevBzUQj44nkAfbTltL3kNujxj6PaYX29I8lBnTlc8gwtxCmDK
         V62sCx9l5wDqBFw8gl0KpenMdsWO+LC+DyWuvUmbFnoiO6XVtmr9r9uzjMQOjvUSEVU2
         WLUm/oJwYAeCZm93rM4qJKwdeo4P5zCxeLOkQhH/4KjgdyUNQ0OxhsOwxUteli1v7s5v
         FqV81yzY8we2nbk9klqy1Kudsbhs3d9UUr2NZDXJfrI7CFe911HLJBMPkEPTGQ4z574q
         8zZxk/QGM/OeuIRt7zgdWVlJSHcdd0cwH0YmUv6WF46u/c4yhEIUjLAQIwM5xwCfJ64t
         9PKw==
X-Gm-Message-State: AOJu0YxEfAjms0ICMyqaCfFO9cmvcunKjhnxZDTyPZRfedt/2ZwyAksY
	76P0dNYag3k+upSLy9IbtgDxhWZLe6PEBzjTpEHDismx+1pA3c1K
X-Google-Smtp-Source: AGHT+IG3x4BSRyAKjJPAIptEl+AIntHmyPaj/Rt/Cde3JatgIO7y1fR5x6yZLIA3FItOU3QeWYNp4A==
X-Received: by 2002:a9d:5a11:0:b0:6dc:4f4:f4e0 with SMTP id v17-20020a9d5a11000000b006dc04f4f4e0mr3711496oth.45.1705908253323;
        Sun, 21 Jan 2024 23:24:13 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id y37-20020a634965000000b005ceeeea1816sm7913752pgk.77.2024.01.21.23.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 23:24:12 -0800 (PST)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date: Mon, 22 Jan 2024 16:24:07 +0900
Message-Id: <20240122072407.39546-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Hi Dave and Daniel,

   Just several fixups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 0dd3ee31125508cd67f7e7172247f05b7fd1753a:

  Linux 6.7 (2024-01-07 12:18:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.8-rc2

for you to fetch changes up to 4050957c7c2c14aa795dbf423b4180d5ac04e113:

  drm/exynos: gsc: minor fix for loop iteration in gsc_runtime_resume (2024-01-22 12:24:55 +0900)

----------------------------------------------------------------
Several fixups
   - Minor fix in `drm/exynos: gsc: gsc_runtime_resume`
     . The patch ensures `clk_disable_unprepare()` is called on the first
       element of `ctx->clocks` array.
       This issue was identified by the Linux Verification Center.

   - Fix excessive stack usage in `fimd_win_set_pixfmt()` in `drm/exynos`
     . The issue, highlighted by gcc, involved an unnecessary on-stack copy of
       the large `exynos_drm_plane` structure, now replaced with a pointer.

   - Fix an incorrect type issue in `exynos_drm_fimd.c` module
     . Addresses an incorrect type issue in `fimd_commit()` within the
       `exynos_drm_fimd.c` The problem was reported by the kernel test robot[1].

     [1] https://lore.kernel.org/oe-kbuild-all/202312140930.Me9yWf8F-lkp@intel.com/

   - Fix a typo in the dt-bindings for `samsung,exynos-mixer`
     . Changes 'regs' to the correct property name 'reg' in the dt-bindings
       documentation for `samsung,exynos-mixer`

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/exynos: fix accidental on-stack copy of exynos_drm_plane

Fedor Pchelkin (1):
      drm/exynos: gsc: minor fix for loop iteration in gsc_runtime_resume

Inki Dae (1):
      drm/exynos: fix incorrect type issue

Rob Herring (1):
      dt-bindings: display: samsung,exynos-mixer: Fix 'regs' typo

 .../devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml   | 6 +++---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c                       | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c                            | 6 +++---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c                             | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884C33DA7FF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 13:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600721; cv=none; b=R7bW7nO4Owyn1YvHsBgLyTHLr/JOj3mLcz6FyyoOo/oSYTPs9IRi464sUVvj66ABsmMBvvA+eWTxrfd5nZEiN/VAwQ8pT3OZIx/QDmISRUhT8Z3NeCTrfsn+D5bNXRWJyeG+3G26kHOGZ041bsGkvmjI/gh51BIPNGGWQ37PVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600721; c=relaxed/simple;
	bh=+oa7FG84f0fyNCG+SMW70dUa7UGK5WiFfPLz8JWgVkc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a40/ITC8fWN7fREBXXdEA+N8hlwd8EmYviN+mcNUVfh0U/uozPjDRtL9kDIJk+/9PikZfLnUAzxJrj+qTkhIYd8hfUvXIOqDe4V4hN2RrNRiQ2ucRSSIzbQZmW2W+M0YYLhgh9GOeE/Yt7rVUGscd9+mvrayNFsA9a8RLg86N3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U37kuMdH; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U37kuMdH"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso1470299b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 06:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790600718; x=1791205518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2Kcx8g6kY/kQqDl0Mqqux8bu7JzTOoQQ3nn8/Jqdrk=;
        b=U37kuMdHeYPIAALWg4zXPzfDl+T5ARaJRyDwTCRyH2q3vsp8mozMxJHZpBILEHRKHm
         J7HsHm/uuEWaI76eFSHL5FtuH4TuoWUGU2k5cTtZlH6yOrfxZbIiORvMXdFhC81omIV7
         aT9iame+S4rS0oMklyrmCh9io2Y9acMLFrz1hstm/k8LJHs8X8dYJBOdT7kj4V9SIYYS
         gay8wenP7hQp+o8ledhn1AXF9I+C6tVCkl7qGKXp+QgQg3jRAt8us9nwfMUE10NJzd+q
         g6YuBJLh5xAByoYSsph6SvUk5H6Co39afdupiiWb3NdDtPK30/Y/36BpJ2TA5SywkEUb
         XVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600718; x=1791205518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2Kcx8g6kY/kQqDl0Mqqux8bu7JzTOoQQ3nn8/Jqdrk=;
        b=KuCpLX6XnNclU4dnZxFLzyxPThQ64Qt2dXUrIcJWWYeF1wmhAXU3BihgWzMOOqaGIW
         r8NN1v/L5z4TnlWWN3/IOi4+sZdIJRnSpsGPnYQjiYnhXDAq54gOfYfaEdV2svQdiU/Y
         /O7YkCk4NNiaUu9HJmpE4YeMRd+P4/zRF7JhJD2mewkE3vCmo1nj9vgAzEEVSAhLDBj5
         EecLztjrYoOXRs56o56UYmZhLYyOpgwzNckthONqnwnFB5VveHzr36nKWqQ53niRwNNF
         aJYQ4NQtXaX2Q4s0oX+y+Z04wLTq3zo4Qe9G3Qu+8TsCR/EEPIduCq7i1o8ZXZbBuiR3
         ayOw==
X-Forwarded-Encrypted: i=1; AKwUvBzMqlIZbOmS+SA3uv5kcMbhpNuj/fqtREGTDPVT0Ew0m53elo+ZyEAsZHTYSY3cUE72Xl6vkmnR7IfClIO2knB8aw==@vger.kernel.org
X-Gm-Message-State: AFuF++laqYxJlL/JF54d1ZHUA10KZHjJW054+RyAId7EsC4gGcucdMb2
	NxdXviDQmT7zpqxno4Kbtm3gmyTIA2MFcGSYuOy0V4RDzYZpJe/CUv8rbNGQkg==
X-Gm-Gg: AYBFou2G5cBeeyHg2hS7Mag4wZ+sxWoatlhF56E88+owVGwvGlCgNrRw6oZG01AH+wz
	0bE1xN6E4J5K+xOhcvRiqSbCsRb5BZpVjWglpSKNute2yLtYnRJe8cW3340sI9h9jgCgTaKYWSs
	FT9gmCSVQQEip1qmZJr6MgIddSDdDdGEpcvw1i/1gPrIlUJZWboGqTjTJ056eThCr6UMBtOLkNU
	S7T2RDuhdGv+szaJb8bFV1KqfBNo90PJb69cNO3qlmJzvuFSRRiyZHTBDq1puBpNzGdIPgSBHSa
	ow2qo8qsFjZcyvcJ1IzXBFiO2AyHfa5TkJnRpY6hZYv1OCC4Gj6AucBfZmfN8nAerz1FPAAvJhs
	Nklj3Gv9dt/DGKoVWRYvc4RXinbTfrou+74G1VdSsBVbprlqUXGg9OX+xtpgDXQq4vQGj/8DcGy
	YMvsgpvDrcif9H9+IdKwgGlR1EpGd8A0lBkI5Uwn/74bo4ZAch2AePH1cj6fU1F3RDDi1wSfujr
	4Pv+fo1tammqD1LtC0RVZNGlhuOtunArAxZX73lC+Wdz6ukjni7drjidsEColdQw2QsBBYjga26
	l2udNv5P
X-Received: by 2002:a05:6a00:138d:b0:881:7ff5:606f with SMTP id d2e1a72fcca58-8817ff56367mr4741460b3a.43.1790600718146;
        Mon, 28 Sep 2026 06:05:18 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea18f49csm4083555b3a.20.2026.09.28.06.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:05:17 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Mon, 28 Sep 2026 22:05:14 +0900
Message-Id: <20260928130514.47167-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

This PR brings three fixes and cleanups for Exynos DRM, addressing a
clock leak in FIMD, simplifying user memory handling in VIDI, and
fixing a Sparse warning in FIMD.

Major changes are:
- fix a clock leak in the FIMD resume error path by disabling
bus_clk when enabling lcd_clk fails,
- replace the open-coded kmalloc() and copy_from_user() sequence
in VIDI with memdup_user(),
- fix Sparse address space warnings in fimd_trigger() by adding
the missing __iomem annotation to timing_base.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 2abe8e7e33973dda5dd24b89aa3ee52470a78265:

  Merge tag 'amd-drm-next-7.4-2026-09-24' of https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-next (2026-09-26 08:13:22 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v7.4

for you to fetch changes up to d04392ce52d33bce4d532bd8b965151ed4ce8670:

  drm/exynos: fimd: fix clock leak on resume error path (2026-09-28 21:44:02 +0900)

----------------------------------------------------------------
Exynos FIMD fixes
- Fix clock leak on resume error path.
- Fix Sparse warnings by adding missing __iomem annotation.

Exynos VIDI cleanup
- Replace kmalloc() and copy_from_user() with memdup_user().

----------------------------------------------------------------
Chen-Yu Tsai (1):
      drm/exynos/fimd: fix register offset type in fimd_trigger()

Mohammad Shahid (1):
      drm/exynos: vidi: use memdup_user() instead of kmalloc() and copy_from_user()

jiawen (1):
      drm/exynos: fimd: fix clock leak on resume error path

 drivers/gpu/drm/exynos/exynos_drm_fimd.c |  3 ++-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 12 ++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

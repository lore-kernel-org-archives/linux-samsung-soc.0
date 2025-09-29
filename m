Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F62110
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759120168; cv=none; b=bY6Pj3h4tENrWV1i9ZpGx62y/KOXYy3MNQNeHfLENFS0b1aRbbgH7aEnlTU/xKBSCRFR2+dOW18xPWmDf7y6gXVsmT3TjfOh/4f5IU8l9+SGIVqjUp6FmnULHyPf8Px2ljpFMg+bOkuFW28O6JQOuNv9lQqo8xpRQzqOrBjxdoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759120168; c=relaxed/simple;
	bh=AiENp1JXPD7Pfj2XXP9VYjsfVUN9VhGdUAyBie8UujY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=Npo/gSHoMH2yOmmBIwG5T7QSs4iQ/+iKf67zDUn+XOXziv9xSWdYF87TMqXcoN6CbeiNSDfyONf+Pgyt/EY5CHRKBzq8KDn47HItU1tDXYqhZwABN5mcmlas9VIafCVoB/2qKtDzWThkG+CEhayikzG/Hd4g8yYdhGVUQlE5uvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=s+v406U+; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="s+v406U+"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250929042918epoutp01325b80c42aced3d60013b05d6bf51905~ppnbM-Jt90299602996epoutp01h
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250929042918epoutp01325b80c42aced3d60013b05d6bf51905~ppnbM-Jt90299602996epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759120158;
	bh=D5wRPUu5G4Y4BWyRfH1H7IBbVKWaqq7gWN8q6OvyK9M=;
	h=From:To:Cc:Subject:Date:References:From;
	b=s+v406U+PLcaD+EY0XDxC+20eJv3QWSeozFIVY7UsAN4tfULGnTc8F7vQSD3zdzyO
	 rhzpEmMEGY6CAL4L3PLWXI/qKFUKe3zAZMSrtlp/1C6Zd+ZZoMYrbxOFkv98iJV29r
	 f8slEvX3yQwMPcvUiHi6ykaMs8z9bAvV5r6Izqaw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250929042918epcas2p273bdddf86958b34ea115371bc3f2d25b~ppnar_-kI1350313503epcas2p2L;
	Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.202]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cZp9n5Csbz6B9mH; Mon, 29 Sep
	2025 04:29:17 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86~ppnZ0b28b1831418314epcas2p2N;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929042917epsmtip15533e0f7be7361ed94f2258f0311f7a2~ppnZvhldn2403224032epsmtip1h;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
From: Hoyoung Lee <hy_fifty.lee@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: Hoyoung Lee <hy_fifty.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/exynos: KMS cleanups for off-screen planes and
 mode_config
Date: Mon, 29 Sep 2025 13:31:07 +0900
Message-ID: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86
References: <CGME20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86@epcas2p2.samsung.com>

Hi all,

This small series makes Exynos KMS a bit more robust and better aligned
with common DRM layering:

- Patch 1 treats fully off-screen planes as not visible and routes them
through the explicit disable path instead of programming zero-sized
dimensions in ->atomic_update(). This ensures the proper disable
semantics run when a plane contributes nothing to the frame, and avoids
keeping a logically enabled window around.

- Patch 2 converts mode-config initialization to
drmm_mode_config_init(), tying the lifetime to drm_device and dropping
the now-unnecessary manual drm_mode_config_cleanup() in error/unbind
paths.

- Patch 3 moves the device-wide mode_config setup (funcs/helpers and
limits) from exynos_drm_fb.c to exynos_drm_drv.c and calls
drm_mode_config_init() from inside exynos_drm_mode_config_init().
Historically Exynos put this in fb.c when the driver grew around fbdev
helpers; today it obscures ownership and ordering. Placing it in drv.c
matches other vendors, makes the init order explicit (before creating
CRTC/planes/connectors and binding components), and centralizes device-
level policy in the core driver.

No userspace ABI changes. Comments and reviews are very welcome.

Thanks,
Hoyoung Lee.

Hoyoung Lee (3):
  drm/exynos: plane: Disable fully off-screen planes instead of
    zero-sized update
  drm/exynos: Convert to drmm_mode_config_init() and drop manual cleanup
  drm/exynos: Move mode_config setup from fb.c to drv.c

 drivers/gpu/drm/exynos/exynos_drm_drv.c   | 49 +++++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_fb.c    | 34 +---------------
 drivers/gpu/drm/exynos/exynos_drm_fb.h    |  7 +++-
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 12 +++++-
 4 files changed, 60 insertions(+), 42 deletions(-)

--
2.34.1


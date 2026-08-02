Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426132737F8
	for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Aug 2026 06:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785651046; cv=none; b=OYqvLEEuYogUebWALCYluO/w9sm3aOOtd5rwxhFMqUPW5Jc6frGCE4eKYCPPhUIH8VerwL9V2gX1bICnDLEbQpsBfYWDC+hFv1oaIQuDfocFc4gpSKZwp9/2EGH/XmWYHwSI06uC6DTCI4H84QOCruV8UC4AGQRbBc0PwjM97Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785651046; c=relaxed/simple;
	bh=fVWyj9dhtfJ9D+k8piyQKHBIS/R3WAWV0LnScYgJRl0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XmP+QCp+Ei/Y/eTcpQKm3HepvjxfcNS6A0gXzF38AUfW4jZOFTDvFk1pcHfudC0hKSYh+h/WgesT682ClgzNTo9G5opzmUT0W0IPmGCRuNwk/r2aQaGFIVoKXTMhGnbo4WtmNj773MMP7ONd23erb76yE2C/is/RYUGM3OgIqYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnzFodwl; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnzFodwl"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1628082a91.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 23:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785651044; x=1786255844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vji7wKx6xE1l/WWcvsYGR+bhlFDcfVWGe0tEz1c5YfY=;
        b=SnzFodwlUGhPpytwd6L1IX7cTn3yZbCYoCqt6XrKex0NntKhVVXjcoZZDzMAvthcMO
         C2zyVyDYbufxKmMJk0wSbDL3htlYl5rDj56ua1OE/ttQcvvp0mvwiavS/PMoXg+2sWiw
         vO2cSLuVqr6OLdnS1MOGeUDJYYT4kpp8IvdTQAaLkr1g75EMQX8pFofIzp8Ji7LwmwXG
         /+CPdPwgGTVqq8KebHyGc8d8EF4g8GFTX1pVyoppHPAE9NiTrgLihzHwyz60pW8DHpTz
         +g/BE9DlODaiO4EQGMZqxW3DoUktURDn9Ydr8agdOeLoB/fDlkuWD4O5ll4GqsE4kCVD
         c83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785651044; x=1786255844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vji7wKx6xE1l/WWcvsYGR+bhlFDcfVWGe0tEz1c5YfY=;
        b=tJQwlpC998IAr5fZwpDTpTSDnGVt/BSdJ4kEk1Yqb04Qz0pPnTe4M4V9dJeQbUWvu2
         quqDXOksd3aDdDeE371Ft/3YEJ8sQmFRqfrOaT6EeHMnYd13r6mISjWzuCVNeH5W2+QU
         cQEMa0agDpI6cuGasdNnuuVRgCUF8E24J7ChxBqLu1j/bA6krbzGyi2OTkGuDRlXC8Gy
         c628yFO2AJh+NtSsZDIpIUzAyp8d/qTBjHRrQadfruFtmH3K7m0HZ6F0V7uOMZ1yil8Q
         y9/hd4NSo9gjRbli7XwdpW9v8htEnig9ckY/nmSXseovq6x71bVeP3ztK6+uGh37nUne
         K4xw==
X-Forwarded-Encrypted: i=1; AHgh+RopZQGSXST4Bsqf/3N0+lfai3GgzzBqzIlBhSr0EIjtC22jBOe2VvNNznjWBHGB/Nf1waBxlWvDUlUTZJjkncfV/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1YWOM3+kbPNVf/ibl9lH8MUHHm7DHECT6wBIXAc+Upq1P49JO
	khWLsfi3342UrHq97xQHLlm88YM4q4UNRpi8qJUxwP3svqvXWwa2rrvw81ZFB03d
X-Gm-Gg: AR+sD12hG9s35qX6tn04qIZZszLxjvI1WRwaW1dJgVhKBqw25wgPQEYFHq0S3RpyJAa
	d9h3+dzzKLZGjyG6MVNuxbz6/Rve5NMdW/y6BiYWic889wlShcVSBZ+OZTkcAZB+qH7CjXH1Nb7
	u4NXw4fuHMnFQ5HMfFSY75SI3ZU0RvvrwylWIjy5Db9Sd2VgvSi/qDoae6TgwZRyGKknskVpPNh
	HzvmVXZUFjfx4YkoG2M+ps3mRv9XOWdc7ch/9Oa8OIzbcUAvPTRxuVte/wYNhU2RVkcPK3G3dQc
	X5lBlUzdDNxMtsK80QbLtZCrpaCn7qszB5yM1TU2hvV2i99U+EDX3EC6Buh4MdH3ytHayzFNRvk
	V5Kd4TKTCwSreGYiWmRcxkjF/dcKzJBvbUbkja4lp2srhEol4usKsXbVbgCaLBVu9/OXPRNdyQv
	1qUBnZ4GAnqFE4B+d7rdokjI/8UnII7SGAOj/nvUnYIoU69nBJFcuJf/qsBxGI8g5tsXZID8Qp3
	TaQdfvCZ1rLHS/289LwAmcdHY6ixzVQ/FFmQLm9pBX+kQFHIkboYLJKkeAB1hXw
X-Received: by 2002:a17:90a:e7c4:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38fbc4d976dmr5437191a91.25.1785651043549;
        Sat, 01 Aug 2026 23:10:43 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2f65459sm2564706a91.6.2026.08.01.23.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 23:10:43 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Sun,  2 Aug 2026 15:10:39 +0900
Message-Id: <20260802061039.73544-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

  This PR brings an encoder cleanup series for Exynos DRM along with a
  refcounting fix for the HDMI DDC adapter.

  Major changes are:
      - drop the deprecated DRM simple KMS helper dependency and initialize
        the encoders directly,
      - handle the drm_encoder_init() return code so that a failure no longer
        goes unnoticed or leads to cleanup of an uninitialized encoder,
      - take a module reference to the DDC i2c adapter so that unloading the
        adapter driver while in use fails gracefully instead of blocking
        uninterruptibly.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 82cb10c8bc506a4d2093e0e59672fd307f549d38:

  Merge tag 'drm-xe-next-2026-07-30' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2026-08-01 07:06:36 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v7.3

for you to fetch changes up to 99b1947ba2f82b30c0a4ef3e457eacc31d1b0220:

  drm/exynos: hdmi: take i2c adapter module reference (2026-08-02 14:54:06 +0900)

----------------------------------------------------------------
  Cleanup and modernization for Exynos encoders
  - Remove dependency on deprecated DRM simple KMS helpers
    . Replaces drm_simple_encoder_init() with drm_encoder_init() across dp,
      dpi, dsi, vidi and hdmi.
    . Adds per-driver drm_encoder_funcs with .destroy = drm_encoder_cleanup,
      removing the intermediate layer between the drivers and atomic modesetting.
  - Add error handling to drm_encoder_init()
    . Checks the return code at every call site instead of ignoring it.
    . Prevents silent encoder creation failures and drm_encoder_cleanup() on an
      uninitialized encoder.

  Bug fix for Exynos HDMI DDC adapter refcounting
  - Take an i2c adapter module reference
    . Switches to of_get_i2c_adapter_by_node() / i2c_put_adapter() so the
      adapter module reference is held while the DDC bus is in use.
    . Makes an unload attempt fail gracefully with -EBUSY instead of blocking
      uninterruptibly in i2c_del_adapter().

----------------------------------------------------------------
Diogo Silva (2):
      drm/exynos: Remove dependency on DRM simple helpers
      drm/exynos: Add error handling to drm_encoder_init()

Johan Hovold (1):
      drm/exynos: hdmi: take i2c adapter module reference

 drivers/gpu/drm/exynos/exynos_dp.c       | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 11 +++++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 20 +++++++++++++++-----
 5 files changed, 59 insertions(+), 13 deletions(-)

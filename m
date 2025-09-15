Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254474A23
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 11:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757935091; cv=none; b=PpCCIIPSAM/DW8yftNt8ZcW4bUgTJfEgsOIWNVoZU3awTAwLIQWgmDGMGGYHsPCBSwdnJcuipZmoRiICOwHC1ArOs19v6pm7B+j81ChDNCZHPgw/uan38sdSgVHs4n1jgQlQGCaSzSuL3BOyEdxKOfOUw9UwPRFAF4nq7sDzFNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757935091; c=relaxed/simple;
	bh=pucwv+Y8G2VSO5+NuGKvQ1CwHJB9sssf+5p9d4/9+ok=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BjGdsOpRvvtoj/APsbHyEcLW+CJL+7P3wDvQzL0uNeJwBLsWpYKd0r+1jrk28KFz/Wqf4u9cyY32PT2lGpStapvVLF1IVHSSSSe/HlF5+Fex41Ruza9OoVOEkeK7WyDLgrD1dyes9sm1plkma9ykH0b0+XblyNlgNCHkAjglTkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z42cFFBr; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z42cFFBr"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7761b392d50so3049201b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 04:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757935088; x=1758539888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dPBCFvQjoGjl6M/UvssJba2gGE0hvdRSVyr7t5RZfoc=;
        b=Z42cFFBrQQ+PUgGkg8nCI4G4mmCIezj8pxYCjWe9VVKCy32yXXAqHQHS48IygnMpMv
         Mt263PjggwGMet/WKdESK2uCTUNPSETzQBSEkRQmt/yW9pTYESFb4HHB58xxlI/eBeQI
         cXNoPeNwk1z6uyLU9Nvs0N9NC1RiTvEeUtvp9+cxtauwg+DG9ni+qf48ULPsykrArqCs
         ku9B8AzXMixLVlzOF8bb0MPq4cv8VpmLPeRPwFqa7/7ZbENy/9pcLxVfqCUUpjNFfXmQ
         RlYV1LkiOdI3ZzTaNgyAiRiCn2bXf9FUsObCxgOVVL381PaKvHPu3EwUbqFIZWkppljD
         HSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757935088; x=1758539888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPBCFvQjoGjl6M/UvssJba2gGE0hvdRSVyr7t5RZfoc=;
        b=UUqxQh56OtO8AcK6AWlxDh1Ifws2+V5hJ7qk0tOfJrwO+zAqayeaHcIqFmSt1BPKcr
         rdgvIBBTscWi+9hhxKQR9wHZVj7yXMM7AtVcnnZGFyBeLtMlipvRTXNf8A0EmmWmCGzN
         ph5n747rtA4vizIuUl0MMiu/Wn+VlS6zig+f9DH4XVcqt5sITYyfRY3Rh7v0RB+ckyzM
         dHuOTnVyGqNmo0JzMgfk5NGEWja4VkbDciq9PyzXjtcN9FOsKL+xg+5yC0sll4pZ+6nT
         n70e1WxbrYO3Q7TagUxqUxixF43wGwy4gewi+tjA5lEHHJLRTLY8suBDDFtODs6WGASg
         anxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU47rsPFFOm7XwtKFiNBC04DGdzyfjwqMjlkN6pjMt2pcSmZ+Eu+GQDjgMk8+MYaDDqKI/NQbI9pvrMZnpHXOkZMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSTLl3BPohPypEJt95xmy9dwWdGPi92s7JuJsW4V2tF92EInfO
	xAwGJaebXunp09p3cUxmNZk7fwVLDJTDJBjtmyA7NNykNlvthmR4nPyh
X-Gm-Gg: ASbGncsjsm9FH9ZUJMNVDUs+LMhl0HRucStOICBtmB/jVeOWv2mB9qRNekQbNkGVVT6
	8CghbJTPUF0HJuaa+7bZz8ggNKabAqOtBSPwDUflHcZxRHKoEkHUWiPQ/hD1jrCCCJA/QiEuI0M
	SWnNhA0xloHqSsNVDqZKy0NpnQeRym4hEqXUpdeZqhKgh2SyjHiJ8am49BM5jbt1Ma9sSJWaML6
	D43QE0VyYNfoisLf2KA6WEVLUNpV/61oE72qG0QkMRRun+Z6R99hMrO2c61F3EjIIpvfP0hz1VG
	2kKBrl5Lv7t7SsIwNHpdyQYldvbr8FK1SIyRtgxD7+w2UK7oaY+B4keQM2XPXcjOxPhe9klsvHJ
	Efc5j10rLTWji3jVdJR2CQjB50t381sfRD5GAP9xMPQy2N28W6DYHCnnuk+lFSBB3S/w=
X-Google-Smtp-Source: AGHT+IFuA6DOo3xYNnBW2vLLVl6MswxV/SxmI2v41j0DSWY4Op7WYcCOaiCmbbeiiH1rdBQ0BeKksw==
X-Received: by 2002:a05:6a20:7f9e:b0:263:b547:d09c with SMTP id adf61e73a8af0-263b547d18amr4017400637.33.1757935088236;
        Mon, 15 Sep 2025 04:18:08 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dff06dbc5sm7938947a91.17.2025.09.15.04.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:18:07 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL RESEND] drm-misc-next
Date: Mon, 15 Sep 2025 20:18:02 +0900
Message-Id: <20250915111802.28177-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

   Add DSIM bridge drvier support for Exynos7870 SoC.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 0d9f0083f7a5a31d91d501467b499bb8c4b25bdf:

  Merge tag 'v6.17-rc6' into drm-next (2025-09-15 17:51:07 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.18

for you to fetch changes up to 77169a11d4e9916f6c22587df396d6128505dbfb:

  drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge (2025-09-15 19:55:15 +0900)

----------------------------------------------------------------
New feature
- Add DSIM bridge driver support for Exynos7870
  . Introduces Exynos7870 DSIM IP block support in the samsung-dsim bridge driver.
- Document Exynos7870 DSIM compatible in dt-bindings
  . Adds exynos7870 compatible string and required clocks in device tree schema.

----------------------------------------------------------------
Kaustabh Chakraborty (12):
      drm/bridge: samsung-dsim: support separate LINK and DPHY status registers
      drm/bridge: samsung-dsim: add SFRCTRL register
      drm/bridge: samsung-dsim: add flag to control header FIFO wait
      drm/bridge: samsung-dsim: allow configuring bits and offsets of CLKCTRL register
      drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
      drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
      drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
      drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
      drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
      drm/bridge: samsung-dsim: add ability to define clock names for every variant
      dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
      drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge

 .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
 drivers/gpu/drm/bridge/samsung-dsim.c              | 353 ++++++++++++++++-----
 include/drm/bridge/samsung-dsim.h                  |  16 +-
 3 files changed, 308 insertions(+), 88 deletions(-)

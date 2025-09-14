Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7741400C
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 03:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757819733; cv=none; b=rsOpaqH97IIdTA7P75hEr5mCWz6SHAlYOs6eGY0s+/vjKyYbJGnRbN4uKSYfvavv84wf+8JUqGLnhrQn5WQdUXLuDdvMXAgOWPOdnI8GRWD13DLP4rG5bumdBxFYnDvtbIMhTaKHDhyV8nuhzjmnIqAJvhi+oKOWTyl0CQ7FheA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757819733; c=relaxed/simple;
	bh=MGCNxggbrvTHVfmtavBwoZiNqQNphL1+ubBdUeqtuL8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qfN6/pyM79e1opVqttdI6RBS8UbdI8kUA4DssmrU5wtAAv7GoDg9blkpyeTKxAFM9I4WVCgfdc/x1mhYuUKNu0xVf+5dbqGtZKyjWGzoOcIABBck0H4atIcN9cYVYBCGkGjL4ZiA6q3TiZsK6CDF1No75nO9TW0qv+U45X8BzSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SG4B/A97; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SG4B/A97"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32e1c8223d3so421717a91.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Sep 2025 20:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757819731; x=1758424531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sQXmggUMrwrIw1M8m1vWWqZXk8fIFrk0CiERl2VfUlI=;
        b=SG4B/A97frduQ2zYGTdRf7OHbCHBtPPvWAU2y4zS5N3bCrqPI9fSWJ9MlAnWvUgkzR
         s7m1nCSmq83SzU4BJZgj+ZM2JfH4U4OvNkH6/4kyJ7dOuMhH2QY0YBJbxqiXmS3mQsBG
         YdPQj2wJPbjyuEhuG0AQrqFxTe4Ky7JSv6NMieo0US+IdRyLSq/dA02oWniWSbUOLLkx
         nrH5BcXilJ3CQ6oUBABsVfalzFX3rL2rET/lyw9isJSE2fuSQPL0mDjqM1tfX1mZoLlv
         rWlCifmB9h8rppUoh75nBvkPbuVb2s8dYPtE8qQ0OVpH3umfd06zvYY+sRwX/0nmHsBr
         OPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757819731; x=1758424531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQXmggUMrwrIw1M8m1vWWqZXk8fIFrk0CiERl2VfUlI=;
        b=DLAqUsLjPBcEQWNVVSmQ+p0nNTjRHiiGK4GfYA8QRbmlGjmbXVlsOZSk9drxo+dTxo
         EQ9H1NCZNoE2NFF654clEoRiR2xDTtppNjaj4IKkux1SghJFdgRIN4ff7snKvS258I8/
         f1E76+rjcdgY2Ac2I33DhG+dgjDqRFMx+sEf6aYOAkyrLjeg6q9N3iRYaUJXGCend8Uq
         ctD+QquqSEoPlAJ+Idk6LVkvLijV8+gaXySLJJRp9FvmYxeB3+MrWpg4cFNbI73xGyXP
         DFqQG211u02EzZHunROyHB6CA/Zgw3BvdixGGxCfB941LyjuX16B+L0Eu8Kvu9EVGFdG
         gcTw==
X-Forwarded-Encrypted: i=1; AJvYcCV9brKY+rYv8+QDp7AwHwydSfJ1QzudJUsPPGNkoqL8fO6Lh+VxzHZgiFE3GthjCSfgl3uQ7KMPbqU47NoZsPClKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypeuWkdjFtgX+RZYx3bq7HlgJ1p8iJLON9GrkX5LLYh7llKoMl
	12n0RPOT5EH0W/G/eYRMqIkx3PWhVGoDU4VlZzX+aFBuXVIF2KS/A1RK9KPU2w==
X-Gm-Gg: ASbGncvnoo52WDXCDaIuJAFXDqMy9E2q7FyBCC7vwwV8ai58wthKidh+JliODAIlGNZ
	lovDt9MidYyDB0E+dUHED98tH/SaPqTmbsv6Jc7o5ZveA2ceMteSFu5oh6RYI+EtN5C4UgjAB1O
	TtQHdsxgXuvU9uuoQKDP21l/m5QVUvNyGfJMlT3/LVbL/5N/lLVR1pAHGNG7N9dzba/EqY12PAJ
	WLA93SBtt/YbAsyD8OIDf+ykJNgJSRyZ2jScEBa6HRxucqMcKwfy8OhhENlshCKXiZtBOyvPgtc
	PkG6PpJGCSBybLmQZUzpqlTcXqhc9lIJL7jqzNlI2sfS1Otjis35lyinqyNWim5S6Pgrcmesqhr
	kNwn1CFhYizkFnmxDHCIXcL21nGtT6he0xNrKu9xqQbeLcE1wcguqA/ETFYsVgWdXh43ThIvooR
	et5A==
X-Google-Smtp-Source: AGHT+IFWi3pcyz9EQVpfY6v2lw/9p7EFzqoSsTbbivP4Gpcr3MjF+VaPc8eCawrX7FuIYTVBOeLlVA==
X-Received: by 2002:a17:90b:2785:b0:32b:51ab:5d3e with SMTP id 98e67ed59e1d1-32de4e7f4c7mr9393697a91.6.1757819731089;
        Sat, 13 Sep 2025 20:15:31 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd990e44esm10206805a91.28.2025.09.13.20.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 20:15:30 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] drm-misc-next
Date: Sun, 14 Sep 2025 12:15:22 +0900
Message-Id: <20250914031522.33155-1-inki.dae@samsung.com>
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

The following changes since commit c08c931060c7e44452e635e115913dd88214848c:

  drm/gem/shmem: Extract drm_gem_shmem_release() from drm_gem_shmem_free() (2025-09-12 19:04:37 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.18

for you to fetch changes up to 17308ab685acba947fb35e52fada2b97f346b8cd:

  drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge (2025-09-14 11:53:09 +0900)

----------------------------------------------------------------
New feature
Add DSIM bridge driver support for Exynos7870
. Introduces Exynos7870 DSIM IP block support in the samsung-dsim bridge driver.
Document Exynos7870 DSIM compatible in dt-bindings
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

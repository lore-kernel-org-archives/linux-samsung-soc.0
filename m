Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FEB285CBD
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Jul 2025 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874126; cv=none; b=aLamfpoDIxxOWfXblqsdIcqzQsy/5RYFNho7WZQM+S35IWCxL2uvmH9pJ1XWc4Aa46H2yqO1B2ObUEzAQSh8UINAy+oCYv1mI9D+lVOp6aWQu2N64skP9g+wAo+VkFWF990QZDAOnTtWSZSA0hONi8IP9E2pVlkZ+0Xq1pdyncY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874126; c=relaxed/simple;
	bh=2oKgQpwQgsPL+7EXCiATOc+S0pR2sm/0S4sqSSqcejc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GabOaH9qjzHrFTiRWyc74p/acZB96o1nfb/MjPiOs3QAwaLbQklFAqzRmEGD00/DXbAlItM51kQDXEUg2D2nEmhae7OBvwyPKIIZjiSP6Nj7w4Upm0tXg1Z0aG/JdDBdEk0cR+sEVAZSzMIOxbvoVx4fv2Rpestj2//TuRtsG08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aiNFnkaw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aiNFnkaw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d7b50815so21765085e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jul 2025 00:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874124; x=1752478924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bDb2QDDbYI7e1da4zOCjqVkWLKFqFwWgy3CDKFih7gw=;
        b=aiNFnkaw0vNoS/Da3dzKI9kHaHzL9yx2Jwg9BguUOThYgoDU+tXR5H36aPt6TozXPd
         iaLtNjb3ArE0V/+cmOQHxTJOzqaaUdgmErsAT8BKmM5e+HKyf3X/ieWmG7n6HBbcyT3g
         yF7Cqf2Bo7bvS1NUs1JTWGwh1HoC32grNomSS473pgRrVBH5ANKHmoTfvU5T+ys91Kik
         1FwTqftf5bHf/6o0xeNR/J/fTjrUd9y9TQdGseGJhDn+1vE/d7AOZmwVtioA85q5qzRC
         jX6YSeeebndDo+nDMbcmQDFyd3UPvPsZM1jztt3c0/xdv+AqhywEuW9XELBeuKijMzua
         VVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874124; x=1752478924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDb2QDDbYI7e1da4zOCjqVkWLKFqFwWgy3CDKFih7gw=;
        b=Bd815rad2QF8si8Zx+2BK4/X4GMDhQV9bFFhoKtJcL9Ni3hmIRcVcuD4DtZMGHAG11
         fHIEvVxDUKzhcqAUzzoGenQposmpuojzX7MHvA/TDJetBWZT/SLVIjMj2dcSk1hszF7k
         UXJURKR/BDyGdO1PRXLLNFxLROgxror7TCfTEzuQlQOyXV/Tltmn3UTir797UeXeUquY
         DzeuNP4tEXcbxKQlvdJh4cB6EWgFo53CVIpvyhQgLf7o+eNft/kSiGujuNuWcOAIBJnY
         xLeXpOYNLuDVLbQbreG//KK1oNwJ+ZBxA/gxZ14PlbzZKmjzQ9fYm1bVxLveDkhfXfKz
         NWNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsWpfuDrqvorArQN/jMZc78fJVfKYG/QWiPNb5d6YCFBuDkJkQDqK8WQ8u1pyzdkXtQ4hukm67jYaIxHdke6DogA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXJ+JubISpIMmVOJeFT65772922BSJkPMBioBrZPi/wbcN8ntk
	C5bMmKSAKH78QrVpQgg2INm6C8D2Dl1JEOMM9J8gBgxL9G6Z2ZuNoHf4IcEcSi8P6Zc=
X-Gm-Gg: ASbGncvewVLAOut9dm35zo+d0g3850Frkv0xmYnAm/PoKCFNI8FB+52Wa3fNTF6qOfK
	NHKMY41zE1nLICV2WlUKgbEwTbb4oCCHWWYpjHerd1aVzIFHxTeLhypAhmYDlIrNSBLIr1qh3n1
	hclOrsOMehcPgSfh2tMTRJMx6ZLNLRm2DpiCUKU1QG7D0KuLs22Zk/HR9UdoHIsBtTm+B8n4wDe
	gb9apZFyTieoiee6tGP/eTGBnKFe9cTzEQMSX8Pavri4fmVN1xjVeHfvxa77qPI/5PSWFAuh6tH
	GoToItKN/VzBkhcSzd0j+OSwPfs+eE5ScoMCeyVoo0CBn/vPjLVhe6Ml4j6Z7Tk=
X-Google-Smtp-Source: AGHT+IEWekPleecTkqzHnxj/5d4ocJg6iJ2GS+S28dD/Gu1BHihs4HNC2F49+o22Hs0t3Y/zfvGdYQ==
X-Received: by 2002:a05:600c:4755:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-454b3116236mr125103245e9.10.1751874123696;
        Mon, 07 Jul 2025 00:42:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b10b8c89sm107026185e9.38.2025.07.07.00.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:42:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Lee Jones <lee@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable branch between GPIO, MFD and ARM-SoC for v6.17-rc1
Date: Mon,  7 Jul 2025 09:41:49 +0200
Message-ID: <20250707074149.11000-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi!

Please pull the following cross-tree changes for the next merge window.

Thanks,
Bartosz

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-mmio-remove-bgpio-pdata-for-v6.17-rc1

for you to fetch changes up to 9bad4bec5daddbb296481af759f9d56c849ba96f:

  gpio: mmio: remove struct bgpio_pdata (2025-07-07 09:31:08 +0200)

----------------------------------------------------------------
Immutable branch between GPIO, MFD and ARM-SoC for v6.17-rc1

Remove struct bgpio_pdata after converting its users to generic device
properties.

----------------------------------------------------------------
Bartosz Golaszewski (6):
      gpio: mmio: drop the big-endian platform device variant
      gpio: mmio: get chip label and GPIO base from device properties
      mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
      ARM: omap1: ams-delta: use generic device properties for gpio-mmio
      ARM: s3c: crag6410: use generic device properties for gpio-mmio
      gpio: mmio: remove struct bgpio_pdata

 arch/arm/mach-omap1/board-ams-delta.c | 42 ++++++++++++------------
 arch/arm/mach-s3c/mach-crag6410.c     | 17 ++++++----
 drivers/gpio/gpio-mmio.c              | 61 +++++++++++------------------------
 drivers/mfd/vexpress-sysreg.c         | 46 +++++++++++++++-----------
 include/linux/gpio/driver.h           |  6 ----
 5 files changed, 77 insertions(+), 95 deletions(-)

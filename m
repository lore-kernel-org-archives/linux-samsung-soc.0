Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E31535675A;
	Sun, 31 May 2026 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780228644; cv=none; b=srX7Pg0K3CFxsB8RGfooUuTb1JPaF9cOohJiApR0XnCnqXVPS1dy0iB8suz2WmyGDgpNhZJTyWrL3ZSVpHn4pqoqfK9u0w7+iQ5ywVhg4nXv28e6DjRrsh1TTOvSdefsLJTHPbXl7FKGFVZMAlFxmN7krMNAmMSGcSujEmftDW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780228644; c=relaxed/simple;
	bh=gVCNsDRJ0MP+gZFyRuu3pchetKH69XexU03+lkyuxL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nRXKjezrcrmbn5yZPMtzQBsjrASAhTMYy9jDGP2x4u3EDzOiSEwyCl3NxS/x013TSSrnniSkAvslEA5NwqmuLRoSDpjjr9puhC9075f1TOndsqSJlPDKrJrUbIa6R3psrsBNOkwBIPhYhTUGaO+ShN2P2BLPc6hHZ/Wrc8xkj5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddRUXK5j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddRUXK5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B808A1F00893;
	Sun, 31 May 2026 11:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780228643;
	bh=GDk3yFHBk/zRZTj3Jy29GZAPzcAOfnr2evd5A7y/XD0=;
	h=From:To:Cc:Subject:Date;
	b=ddRUXK5jflEFNwBOC34dADjqdaCFjtw2/hajiWzfpIo8FHVULo8+/RcSofSMGjbZx
	 BvQ33hlnwJrMzijKexomSYnJ6/pDZCuApdZEaxGEZm1gzkacsmc4wJZ5ffRfeF2WOK
	 C2bSo4Jz/GAk3i0InAD6ZgpiSUyjmJ7ERdzlLOvAqelvwl1PBjyAidOXaUHUeqJ8gD
	 l/GfEJnOL8cOGS8JTxL1z9OR56d9Wxsq8GLmAKg0emJLvbPxlMOblr6fASbdrIlogK
	 Lys+Hl3brgcjElAWb8U0nTK+/OFPUGhbf4yi67/49eIitp5M6AJRyUBNWlUzx7oWzk
	 sNFhWXfLYdckA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>
Subject: [GIT PULL] samsung: drivers firmware for v7.2 (also for thermal)
Date: Sun, 31 May 2026 13:57:13 +0200
Message-ID: <20260531115713.19388-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2701; i=krzk@kernel.org; h=from:subject; bh=gVCNsDRJ0MP+gZFyRuu3pchetKH69XexU03+lkyuxL0=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqHCIZPJQi4wCh/sSHqLVPio01+JR11rQoTyW6z hE0vL0HHluJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahwiGQAKCRDBN2bmhouD 146AD/sEch8FDXTWsidapkjgCwA9yBLOtWEGOhCT5t+7v8jakJxrE3pEP0ePj6zsy4FCly+S+s7 ic3bVbQXDpMK9ZibCsr+fbxei5K7OSr714E4O76n6zfSFsOX555z7GUXmNuJoa8+7zKwft46ELJ QHvdyz4ZKY2y6QJZW0tOuZ6U1K3+HP0HbeRqeY2CFBtJ6SKkt2efjHIz5LO+zD6oZ9ENqg9Et5d BMmjvbnO27KXpRBGWKLq/9ai+sQhJX6L0tvGjsbvJr3ybUprrd1RQGRcJkFDYO5XTcGxdR8mXCK +Nn/GDxqMvXsd4VNwx6udMNY3L359ZipuDv87gx63mGxpCafq4EWyJxLP08ujvcwW2EJzPKdGhW AuCnLtLLa/vkSUxq9bh+mlyooLxSw3SaKISKl2uEKBXjzZL7Pw8XMohio+VEsXOkeKx29Di9QGS I/zko0DaIc0bMstx2ZD6lN13QIIWD/uN1Q3PvfO8Tz9w3jHTlbHa1dJ0pxk87clsmbbYPppBQm3 rXqbEQ53lcMxhA06Ft4q0ARI1vJN/FBabTOieqQ3C77Oe4vqI17BOVWSvRiUQKIBZsFn41Crmqb tL3IB6QP3zbW/nPSRIKO1wuyUFgOYE2PgaoLuFBJ5ADBGlWVg7JZgJsmrdoffB5xto2uTfloTT7 Pq65vV5jeX9O4Kg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd and SoC folks, and Rafael+Daniel+Zhang+Lukasz,

This is pull with firmware drivers built on top of my previous firmware fixes:
tags/samsung-drivers-fixes-7.1-2.

The code here will be also necessary for thermal tree for implementing actual
TMU driver.

Best regards,
Krzysztof


The following changes since commit 7fe40c32a33905302341797b5d12c541729dd08d:

  firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion (2026-05-29 14:11:23 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-7.2

for you to fetch changes up to 7b661285aa7507eab79efff0a418445157db4141:

  firmware: samsung: acpm: remove compile-testing stubs (2026-05-29 16:05:31 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v7.2

Improve Samsung Exynos (and Google GS101) ACPM (Alive Clock and Power
Manager) firmware driver:
1. Few code improvements.
2. Add support for protocol used to communicate with Thermal Management
   Unit (TMU).  This will allow to implement the thermal driver working
   for newer Samsung Exynos and Google GS101 SoCs.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: samsung: acpm: remove compile-testing stubs

Tudor Ambarus (6):
      firmware: samsung: acpm: Consolidate transfer initialization helper
      firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
      firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
      firmware: samsung: acpm: Make acpm_ops const and access via pointer
      firmware: samsung: acpm: Add TMU protocol support
      firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper

 drivers/clk/samsung/Kconfig                        |   2 +-
 drivers/clk/samsung/clk-acpm.c                     |   8 +-
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
 drivers/firmware/samsung/exynos-acpm.c             | 113 +++++++---
 drivers/firmware/samsung/exynos-acpm.h             |   2 +
 drivers/mfd/sec-acpm.c                             |   6 +-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  36 ++--
 11 files changed, 393 insertions(+), 82 deletions(-)
 create mode 100644 drivers/firmware/samsung/exynos-acpm-tmu.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-tmu.h

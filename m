From: Ben Dooks <ben-linux@fluff.org>
Subject: [PULL] pull request for fixes-s3c-2632-rc6
Date: Mon, 9 Nov 2009 23:56:23 +0000
Message-ID: <20091109235623.GA13968@fluff.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aeryn.fluff.org.uk ([87.194.8.8]:33291 "EHLO
	kira.home.fluff.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750954AbZKIX4W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Nov 2009 18:56:22 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Pull request for fixes for the current kernel release.

The following changes since commit 799dd75b1a8380a967c929a4551895788c374b31:
  Linus Torvalds (1):
        Merge branch 'i2c-for-linus' of git://git.kernel.org/.../jdelvare/staging

are available in the git repository at:

  git://git.fluff.org/bjdooks/linux fixes-s3c-2632-rc6

Ben Dooks (2):
      ARM: S3C64XX: Tidy definition and comments in s3c_dma_has_circular()
      ARM: S3C: Merge fixes-s3c64xx-dma

Jassi Brar (5):
      ARM: S3C64XX: DMA: Protect buffer pointers while manipulation
      ARM: S3C64XX: DMA: Unify callback functions for success/failure
      ARM: S3C64XX: DMA: Make src and dst transfer size same
      ARM: S3C64XX: DMA: Callback with correct buffer pointer
      ARM: S3C64XX: DMA: Free node for non-circular queues

Mark Brown (2):
      ARM: SMDK6410: Configure GPIO pull up for WM835x IRQ line
      ARM: SMDK6410: Allocate more GPIO space for WM1190-EV1

Maurus Cuelenaere (1):
      ARM: S3C64XX: Remove duplicate s3c_dma_has_circular() definition for S3C64xx.

 arch/arm/mach-s3c6400/include/mach/dma.h |   12 +----
 arch/arm/mach-s3c6410/Kconfig            |    1 +
 arch/arm/mach-s3c6410/mach-smdk6410.c    |    3 +
 arch/arm/plat-s3c64xx/dma.c              |   76 ++++++++++++++++++++---------
 4 files changed, 58 insertions(+), 34 deletions(-)


-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'

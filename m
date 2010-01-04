From: Ben Dooks <ben-linux@fluff.org>
Subject: request pull: bjdooks' samsung fixes
Date: Mon, 4 Jan 2010 10:27:13 +0900
Message-ID: <20100104012713.GA29175@ben-laptop.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.252] ([121.136.51.252]:47227 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751359Ab0ADCCg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Jan 2010 21:02:36 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.arm.linux.org.uk, linux-samsung-soc@vger.kernel.org, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org

Fixes for a couple of problems with the current ARM Samsung builds:

- touchscreen driver missing header files
- osiris and bast printing errors on non-existant custom fit nand devices

This is a slimed-down version of the previous pull request that seems to
have been ignored.

The following changes since commit 45d28b097280a78893ce25a5d0db41e6a2717853:
  Linus Torvalds (1):
        Merge branch 'reiserfs/kill-bkl' of git://git.kernel.org/.../frederic/random-tracing

are available in the git repository at:

  git://git.fluff.org/bjdooks/linux.git for-linus/samsung

Arnaud Patard (2):
      ARM: S3C24XX: touchscreen device definition
      ARM: S3C24XX: touchscreen device definition

Ben Dooks (5):
      ARM: mach-osiris: add NAND_SCAN_SILENT_NODEV to optional devices
      ARM: mach-bast: add NAND_SCAN_SILENT_NODEV to optional devices
      ARM: S3C: Fix NAND device registration by s3c_nand_set_platdata().
      ARM: Merge next-simtec
      ARM: Merge s3c24xx-updates2

 arch/arm/mach-s3c2410/include/mach/ts.h |   21 +++++++++++++++++++++
 arch/arm/mach-s3c2410/mach-bast.c       |    3 +++
 arch/arm/mach-s3c2410/mach-h1940.c      |    8 ++++++++
 arch/arm/mach-s3c2440/mach-osiris.c     |    2 ++
 arch/arm/plat-s3c/dev-nand.c            |    4 +++-
 arch/arm/plat-s3c/include/plat/devs.h   |    1 +
 arch/arm/plat-s3c24xx/devs.c            |   18 ++++++++++++++++++
 arch/arm/plat-s3c24xx/s3c244x.c         |    1 +
 8 files changed, 57 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-s3c2410/include/mach/ts.h

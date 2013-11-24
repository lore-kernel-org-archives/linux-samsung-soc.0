From: Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] s3c64xx dmaengine conversion
Date: Sun, 24 Nov 2013 14:50:11 +0000
Message-ID: <20131124145011.GA14725@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkJ987n7uXEPtlXE"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:54791 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752278Ab3KXOuU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Nov 2013 09:50:20 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--vkJ987n7uXEPtlXE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

  Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git tags/s3c64xx-dmaengine

for you to fetch changes up to 3faecea70b0d6d050e0ae911032ec340341dc389:

  spi: s3c64xx: Always select S3C64XX_PL080 when ARCH_S3C64XX is enabled (2013-11-24 14:38:25 +0000)

----------------------------------------------------------------
ARM: s3c64xx: Convert to dmaengine

This series of commits from Tomasz converting s3c64xx to use dmaengine
rather than the old s3c-dma API missed the v3.13 merge window - Kukjin
said that he'd applied it (which should mean it's OK from a review point
of view) but it didn't make it into -next or a pull request.

Since a s3c64xx based system is one of my primary development platforms
it'd be really helpful if I could merge this into both ASoC and SPI,
I've got some patches for ASoC ready to go converting to use dmaengine
directly which help with multiplatform and there's some other dmaengine
work for SPI in progress too.  I've therefore made this signed tag, it'd
be great if it could be merged into both arm-soc and those two trees.

----------------------------------------------------------------

I'm open to other ideas for doing this, I'd just really like to see the
code building on this go in this cycle so anything that accomplishes
that is good for me.

Tomasz Figa (6):
      spi: s3c64xx: Do not require legacy DMA API in case of S3C64XX
      ARM: s3c64xx: Add support for DMA using generic amba-pl08x driver
      clk: samsung: s3c64xx: Add aliases for DMA clocks
      ARM: s3c64xx: Remove legacy DMA driver
      clk: samsung: s3c64xx: Remove clock aliases of old DMA driver
      spi: s3c64xx: Always select S3C64XX_PL080 when ARCH_S3C64XX is enabled

 arch/arm/Kconfig                         |   1 +
 arch/arm/mach-s3c64xx/Kconfig            |   7 +-
 arch/arm/mach-s3c64xx/Makefile           |   2 +-
 arch/arm/mach-s3c64xx/common.h           |   5 +
 arch/arm/mach-s3c64xx/dma.c              | 762 -------------------------------
 arch/arm/mach-s3c64xx/include/mach/dma.h | 144 ++----
 arch/arm/mach-s3c64xx/pl080.c            | 244 ++++++++++
 arch/arm/plat-samsung/devs.c             |  10 +-
 arch/arm/plat-samsung/dma-ops.c          |   8 +-
 drivers/clk/samsung/clk-s3c64xx.c        |   4 +-
 drivers/spi/Kconfig                      |   2 +-
 11 files changed, 315 insertions(+), 874 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/dma.c
 create mode 100644 arch/arm/mach-s3c64xx/pl080.c

--vkJ987n7uXEPtlXE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSkhIgAAoJELSic+t+oim9yC0P/ipZRMbzAeoL8ajAu4+cknm4
xJSL2lwrxiiucOTi4juJNb3sDGFnZ1le0r3Q9f3Dc/emDJrppjjSJflW+vH0Tfi1
JgHFi1mQ2Ct/nRmzk3ryM/ov1Dx70uNpM3wy1PO5x8p84f6A6V4uJLD0fxMQWr6n
XU/PlAE9I//jUmUbpsBUy8nByq3PyWGrdC+AfOmSiK0ennpRVktMFVb9CCzhMwwb
lkMh/yaGKf3gq7qk3vq09euZofUGFWy1NAXYsX6rihfP8Wp84dSSoPaa7Eg0ojOr
n1Um6lvp7YE13qAMZGrH8lJogXXeRu1Ao1M9zdtWH6Tknb0ojzass5orenjwIkbx
NDyApvW9xGTzx8vm/Klkgs1WQJ5VvOc4u9lSvnrpNhj4EEG4GzL5wpsio2EFln5k
QHdCZWjGqKxVPhKhr12bNk0VOW+tsReYaf4WvwLsJ6Loxnxue5bZWbxnEw2V+g6H
hq6jaLIMt3s4Ny4LYqZ/iuCCWf/M7ji+6LA1GSulzG6aMUoIf4YHX5LUNnrP9BHP
vGYegDxvG3zfZRBKl8XC1Pr3WjYQvJfz1jWbzwQC6pizxk1imTadyGhSGf8CQxpw
OU5HJ0qdNdg4xHCmRtK1gEn6HhiKjJ2ZT8GuJ4KjMa4RqF8uZEy0KH047BDf6tz6
SDkbRcWsmPR0MuzY1n/G
=ACLD
-----END PGP SIGNATURE-----

--vkJ987n7uXEPtlXE--

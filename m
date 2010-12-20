From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes for 2.6.37-rc7
Date: Mon, 20 Dec 2010 15:11:46 +0900
Message-ID: <010801cba00c$ca200960$5e601c20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57950 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753182Ab0LTGL4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Dec 2010 01:11:56 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi Linus,

Please pull Samsung fixes from:

git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
s5p-fixes-for-linus

These things are for small fix on 2.6.37-rc7.
If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit b0c3844d8af6b9f3f18f31e1b0502fbefa2166be:

  Linux 2.6.37-rc6 (2010-12-15 17:24:48 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
s5p-fixes-for-linus

Kukjin Kim (1):
      ARM: S3C24XX: Fix CONFIG_S3C_DEV_NAND Kconfig entry

Marek Szyprowski (1):
      ARM: S5PV210: update MAX8998 platform data to get rid of WARN()

Yauhen Kharuzhy (1):
      ARM S3C24XX: Fix compilation of PM code for S3C2416

 arch/arm/mach-s3c2412/Kconfig       |    7 +++++++
 arch/arm/mach-s3c2412/Makefile      |    3 ++-
 arch/arm/mach-s3c2416/Kconfig       |    1 +
 arch/arm/mach-s5pv210/mach-aquila.c |    6 ++++++
 arch/arm/mach-s5pv210/mach-goni.c   |    6 ++++++
 arch/arm/plat-s3c24xx/Kconfig       |    2 +-
 6 files changed, 23 insertions(+), 2 deletions(-)

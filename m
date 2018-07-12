From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: defconfig: Pull for v4.19
Date: Thu, 12 Jul 2018 18:46:39 +0200
Message-ID: <20180712164641.19925-2-krzk@kernel.org>
References: <20180712164641.19925-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712164641.19925-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Rebased on v4.18-rc2.

Best regards,
Krzysztof


The following changes since commit 7daf201d7fe8334e2d2364d4e8ed3394ec9af819:

  Linux 4.18-rc2 (2018-06-24 20:54:29 +0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-4.19

for you to fetch changes up to 24ede29d026a9f00aa3f4e7a5531803af4810734:

  ARM: s5pv210_defconfig: Enable options needed to boot typical Linux distro (2018-07-07 10:49:16 +0200)

----------------------------------------------------------------
Samsung defconfig changes for v4.19

Enable options needed for booting full system on S5Pv210-based Samsung
Galaxy S mobile phones.

----------------------------------------------------------------
Paweł Chmiel (3):
      ARM: s5pv210_defconfig: Run make savedefconfig
      ARM: s5pv210_defconfig: Enable drivers for Samsung Aries based phones
      ARM: s5pv210_defconfig: Enable options needed to boot typical Linux distro

 arch/arm/configs/s5pv210_defconfig | 49 +++++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: defconfig: Samsung for v5.1
Date: Fri,  1 Feb 2019 20:17:19 +0100
Message-ID: <20190201191720.20464-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.1

for you to fetch changes up to 25c390ec22167f896dbf5fb61b869ad05ce273ff:

  ARM: s5pv210_defconfig: Enable cpufreq (2019-01-13 10:31:17 +0100)

----------------------------------------------------------------
Samsung defconfig changes for v5.1

Enable more drivers in s5pv210 defconfig for Aries family of mobile
devices (e.g. Samsung Galaxy S).

----------------------------------------------------------------
Paweł Chmiel (3):
      ARM: s5pv210_defconfig: Run make savedefconfig
      ARM: s5pv210_defconfig: Enable more drivers present on Samsung Aries
      ARM: s5pv210_defconfig: Enable cpufreq

 arch/arm/configs/s5pv210_defconfig | 47 +++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 11 deletions(-)

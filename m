From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 5/5] arm64: defconfig for v4.7
Date: Wed, 13 Apr 2016 12:01:22 +0200
Message-ID: <1460541682-32417-6-git-send-email-k.kozlowski@samsung.com>
References: <1460541682-32417-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1460541682-32417-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

arm64 defconfig change: just add PL330 DMA driver. We are using it
on our boards (as well Juno does).

Best regards,
Krzysztof


The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig64-4.7

for you to fetch changes up to 371feaff9980a7060f9fea5c795381aaea5f941d:

  arm64: defconfig: Enable PL330 DMA controller (2016-04-13 10:31:53 +0200)

----------------------------------------------------------------
Defconfig ARM64 changes for Exynos based boards for v4.7:
1. Enable the PL330 DMA driver.

----------------------------------------------------------------
Alim Akhtar (1):
      arm64: defconfig: Enable PL330 DMA controller

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

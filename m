From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 4/5] ARM: defconfig for v4.7
Date: Wed, 13 Apr 2016 12:01:21 +0200
Message-ID: <1460541682-32417-5-git-send-email-k.kozlowski@samsung.com>
References: <1460541682-32417-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1460541682-32417-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

exynos and multi_v7 defconfig changes. In case of multi_v7 conflicts
just add changes coming from here.

Best regards,
Krzysztof


The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-4.7

for you to fetch changes up to 0fe3ff4454c9ba2c9d6774ecafed799fe009d145:

  ARM: multi_v7_defconfig: Enable CPUFreq governors as modules (2016-04-12 16:19:14 +0200)

----------------------------------------------------------------
Defconfig (exynos and multi_v7) changes for Exynos based boards for v4.7:
1. Enable additional drivers for Trats2 board (Exynos4412).
2. Enable CPUFreq governors as modules.

----------------------------------------------------------------
Javier Martinez Canillas (2):
      ARM: exynos_defconfig: Enable CPUFreq governors as modules
      ARM: multi_v7_defconfig: Enable CPUFreq governors as modules

Krzysztof Kozlowski (1):
      ARM: exynos_defconfig: Enable Trats2 audio codec, touchscreen and sensors

 arch/arm/configs/exynos_defconfig   | 11 +++++++++++
 arch/arm/configs/multi_v7_defconfig |  4 ++++
 2 files changed, 15 insertions(+)

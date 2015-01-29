From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 2/4] Samsung mach updates for v3.20
Date: Thu, 29 Jan 2015 09:33:52 +0900
Message-ID: <54C97FF0.6090808@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This is for updating of mach-exynos and plat-samsung.
Please pull and if any problems, please let me know.

Thanks,
Kukjin



The following changes since commit 97bf6af1f928216fd6c5a66e8a57bfa95a659672:

  Linux 3.19-rc1 (2014-12-20 17:08:50 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-update

for you to fetch changes up to a4f582f5c5fe3e8eaef7ce637c894619bdee650e:

  ARM: EXYNOS: Add exynos3250 suspend-to-ram support (2015-01-15
00:24:26 +0900)

----------------------------------------------------------------
Samsung mach updates for v3.20

- add exynos3250 Supsend to RAM support
- recognize MFC v8 devices for exynos5422/5800
- print CPU id/rev during kernel boot

----------------------------------------------------------------
Chanwoo Choi (1):
      ARM: EXYNOS: Add exynos3250 suspend-to-ram support

Olof Johansson (1):
      ARM: SAMSUNG: print CPU id on probe

Sjoerd Simons (1):
      ARM: EXYNOS: Recognize Samsung MFC v8 devices

 arch/arm/mach-exynos/exynos.c   |  1 +
 arch/arm/mach-exynos/regs-pmu.h |  3 ++
 arch/arm/mach-exynos/suspend.c  | 77
+++++++++++++++++++++++++++++++++++++++++
 arch/arm/plat-samsung/cpu.c     |  4 +++
 4 files changed, 85 insertions(+)

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3/5] Samsung driver update for 3.16
Date: Tue, 20 May 2014 10:11:20 +0900
Message-ID: <014601cf73c8$68e56030$3ab02090$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, olof@lixom.net, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit c9eaa447e77efe77b7fa4c953bd62de8297fd6c5:

  Linux 3.15-rc1 (2014-04-13 14:18:35 -0700)

are available in the git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-drivers

for you to fetch changes up to 93bfb769752babdc4d3665a1fb166bb4e3ff927b:

  clocksource: exynos_mct: register sched_clock callback (2014-05-02
22:27:01 +0900)

----------------------------------------------------------------
exynos_mct update for v3.16

- register sched_clock callback to use clocksource mct-frc

Note that got ack from Daniel

----------------------------------------------------------------
Vincent Guittot (1):
      clocksource: exynos_mct: register sched_clock callback

 drivers/clocksource/exynos_mct.c |    8 ++++++++
 1 file changed, 8 insertions(+)

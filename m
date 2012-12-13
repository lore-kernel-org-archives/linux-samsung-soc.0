From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/3] pinctrl: exynos: add support for Samsung's Exynos5250
Date: Thu, 13 Dec 2012 17:24:01 +0530
Message-ID: <1355399644-29417-1-git-send-email-thomas.abraham@linaro.org>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, linus.walleij@linaro.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch series adds pinctrl driver support for Samsung's Exynos5250 SoC.
The first patch adds the required Exynos5250 SoC specific data which is
used by the Samsung pinctrl driver to setup the pinctrl/pinmux/eint
controllers. The second and third patches skips the wakeup interrupt and
gpiolib registration if the pinctrl support is enabled for Exynos5250.

Thomas Abraham (3):
  pinctrl: exynos: add exynos5250 SoC specific data
  gpio: samsung: skip gpiolib registration if pinctrl support is enabled for exynos5250
  arm: exynos: skip wakeup interrupt registration for exynos5250 if pinctrl is enabled

 arch/arm/mach-exynos/common.c     |    1 +
 drivers/gpio/gpio-samsung.c       |    1 +
 drivers/pinctrl/pinctrl-exynos.c  |  108 +++++++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-samsung.c |    2 +
 drivers/pinctrl/pinctrl-samsung.h |    1 +
 5 files changed, 113 insertions(+), 0 deletions(-)

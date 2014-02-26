From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 0/3] introduce new config option for samsung common clock
Date: Wed, 26 Feb 2014 14:24:04 +0900
Message-ID: <1393392247-6247-1-git-send-email-pankaj.dubey@samsung.com>
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
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset introduces a new config option for Samsung
common clock infrastructure as COMMON_CLK_SAMSUNG. As current
samsung common clock gets compiled based on PLAT_SAMSUNG, but moving 
ahead with ARM64 we can not have any more such config options, so 
better we introduce new COMMON_CLK_SAMSUNG and make it dependent
on existing ARCH_XXXX which needs SAMSUNG common clock infrastructure, also
on ARM64.

Pankaj Dubey (3):
  drivers: clk: add samsung common clock config option
  ARM: select COMMON_CLK_SAMSUNG for ARCH_EXYNOS and ARCH_S3C64XX
  ARM: S3C24XX: select COMMON_CLK_SAMSUNG for S3C24XX

 arch/arm/Kconfig              |    2 ++
 arch/arm/mach-s3c24xx/Kconfig |    3 +++
 drivers/clk/Kconfig           |   10 ++++++++++
 drivers/clk/Makefile          |    2 +-
 4 files changed, 16 insertions(+), 1 deletion(-)

-- 
1.7.9.5

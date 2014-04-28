From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v3 0/4] usb: ehci/ohci-exynos: Move to generic phy framework
Date: Mon, 28 Apr 2014 14:55:28 +0530
Message-ID: <1398677132-30600-1-git-send-email-gautam.vivek@samsung.com>
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
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, k.debski@samsung.com, kgene.kim@samsung.com, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, balbi@ti.com, Vivek Gautam <gautam.vivek@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Based and tested on 'usb-next' branch of Greg's usb tree, with relevant
device tree patches[1]

Changes from v2:
 - Added two patches in the series for some cleanup.
   usb: ohci-exynos: Use struct device instead of platform_device
   usb: ehci-exynos: Use struct device instead of platform_device
 - Addressed review comments.
   -- Moved exynos_ohci_phyg_on()/off routines inside
      exynos_ohci_phy_enable()/disable.
   -- Added functions exynos_ehci_phy_enable() and exynos_ehci_phy_disable()
      and moved exynos_ehci_phyg_on()/off routines respectively in them.
   -- Added necessary checks.

Kamil Debski (1):
  usb: ehci-exynos: Change to use phy provided by the generic phy
    framework

Vivek Gautam (3):
  usb: ohci-exynos: Use struct device instead of platform_device
  usb: ehci-exynos: Use struct device instead of platform_device
  usb: ohci-exynos: Add facility to use phy provided by the generic phy
    framework

 .../devicetree/bindings/usb/exynos-usb.txt         |   37 +++++
 drivers/usb/host/ehci-exynos.c                     |  148 +++++++++++++++++---
 drivers/usb/host/ohci-exynos.c                     |  141 ++++++++++++++++---
 3 files changed, 280 insertions(+), 46 deletions(-)

-- 
1.7.10.4

From: riku.voipio@linaro.org
Subject: [PATCH] ARM: multi_v7_defconfig: enable usb3503
Date: Fri, 13 Mar 2015 15:54:26 +0200
Message-ID: <1426254866-24772-1-git-send-email-riku.voipio@linaro.org>
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
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Riku Voipio <riku.voipio@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Riku Voipio <riku.voipio@linaro.org>

CONFIG_USB_HSIC_USB3503 is needed by exynos5250-arndale for the on-board
asix network controller. Enable it so networking works with
multi_v7_defconfig out of box like it does with exynos_defconfig.

USB3503 is also referenced from exynos4412-odroidu3.dts and
exynos5250-spring.dts so this patch should improve
multi_v7_defconfig on those platforms as well.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index b7e6b6fb..a4b9bc3 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -426,6 +426,7 @@ CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_HSIC_USB3503=y
 CONFIG_AB8500_USB=y
 CONFIG_KEYSTONE_USB_PHY=y
 CONFIG_OMAP_USB3=y
-- 
2.1.4

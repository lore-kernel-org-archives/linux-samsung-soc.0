From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 3/3] ARM: exynos_defconfig: enable USB gadget support
Date: Wed, 24 Sep 2014 09:57:45 +0200
Message-ID: <1411545465-12930-4-git-send-email-sjoerd.simons@collabora.co.uk>
References: <542199F4.3090601@samsung.com>
 <1411545465-12930-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411545465-12930-1-git-send-email-sjoerd.simons@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Enable USB gadget support without support for any specific gadgets to
more easily catch cases where a devices dts doesn't specify the usb
controllers dr_mode while it should.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 Changes in v4: Rebased on linux-samsung for-next

 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index b14d8c3..2cf22bb 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -54,6 +54,7 @@ CONFIG_SMSC911X=y
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
+CONFIG_USB_GADGET=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_CROS_EC=y
-- 
2.1.0

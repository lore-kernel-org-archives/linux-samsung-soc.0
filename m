From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: S3C24XX: Add missing DMA device for Mini2440 board
Date: Thu, 04 Aug 2016 12:08:11 +0200
Message-ID: <1470305291-15054-1-git-send-email-s.nawrocki@samsung.com>
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
To: krzk@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Addition of s3c2440_device_dma was missed during conversion
from the Samsung legacy to the regular DMa API.
Add it so any devices using DMA, e.g I2S controller can
work properly.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/mach-s3c24xx/mach-mini2440.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index a852168..bbf4132 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -516,6 +516,7 @@ static struct platform_device *mini2440_devices[] __initdata = {
 	&mini2440_button_device,
 	&s3c_device_nand,
 	&s3c_device_sdi,
+	&s3c2440_device_dma,
 	&s3c_device_iis,
 	&uda1340_codec,
 	&mini2440_audio,
-- 
1.9.1

From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH] ARM: S3C64XX: Fix typo in s3c-hsotg platform data
Date: Thu, 21 Jan 2010 01:37:28 +0100
Message-ID: <b2e8f9f71001201637ua278aa2v56c313d605aa7d13@mail.gmail.com>
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
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>
List-Id: linux-samsung-soc@vger.kernel.org

ARM: S3C64XX: Fix typo in s3c-hsotg platform data

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/plat-s3c/include/plat/udc-hs.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-s3c/include/plat/udc-hs.h
b/arch/arm/plat-s3c/include/plat/udc-hs.h
index dd04db0..a22a4f2 100644
--- a/arch/arm/plat-s3c/include/plat/udc-hs.h
+++ b/arch/arm/plat-s3c/include/plat/udc-hs.h
@@ -12,7 +12,7 @@
  * published by the Free Software Foundation.
 */

-enum s3c_hostg_dmamode {
+enum s3c_hsotg_dmamode {
 	S3C_HSOTG_DMA_NONE,	/* do not use DMA at-all */
 	S3C_HSOTG_DMA_ONLY,	/* always use DMA */
 	S3C_HSOTG_DMA_DRV,	/* DMA is chosen by driver */
@@ -24,6 +24,6 @@ enum s3c_hostg_dmamode {
  * @is_osc: The clock source is an oscillator, not a crystal
  */
 struct s3c_hsotg_plat {
-	enum s3c_hostg_dmamode	dma;
+	enum s3c_hsotg_dmamode	dma;
 	unsigned int		is_osc : 1;
 };
-- 
1.6.6

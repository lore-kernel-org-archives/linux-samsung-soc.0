From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH v2] ARM: exynos_defconfig: increase CONFIG_CMA_SIZE_MBYTES to
 96
Date: Tue, 28 Feb 2017 12:12:21 -0700
Message-ID: <20170228191221.18135-1-shuahkh@osg.samsung.com>
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
To: linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, arnd@arndb.de, cw00.choi@samsung.com, rafael.j.wysocki@intel.com, robie@justgohome.co.uk, b.zolnierkie@samsung.com, viresh.kumar@linaro.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com, a.hajda@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, shuah@kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Current CMA size of 64 Mbytes is right on the edge of being small when
several drivers need to allocate large CMA buffers.

For example, if the s5p-mfc driver needs to pre-allocate N MiB CMA memory
to decode a H.264 1080p video, then there won't be enough CMA memory left
for other drivers, such as the exynos-drm driver that may need to allocate
GEM buffers for the display manager.

Increasing CMA size to 96 Mbytes in exynos_defconfig addresses use-cases
such as these.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

Changes since v1:
Fix short and long commit log.

Reason for this patch:
With the proposed s5p_mfc patch series that pre-allocate buffers, when
display manager starts, it fails to get GEM buffers.  Increasing the CMA
size to 96 solved the problem.

 arch/arm/configs/exynos_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 742baf0..2541414 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -53,7 +53,7 @@ CONFIG_RFKILL_REGULATOR=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_DMA_CMA=y
-CONFIG_CMA_SIZE_MBYTES=64
+CONFIG_CMA_SIZE_MBYTES=96
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=y
 CONFIG_BLK_DEV_RAM=y
-- 
2.7.4

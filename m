From: Jungseok Lee <jays.lee@samsung.com>
Subject: [PATCH v4 3/7] arm64: Introduce a kernel configuration option for
 VA_BITS
Date: Tue, 29 Apr 2014 13:59:23 +0900
Message-ID: <000301cf6367$ca12e150$5e38a3f0$@samsung.com>
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
To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, Catalin.Marinas@arm.com, Marc Zyngier <Marc.Zyngier@arm.com>, Christoffer Dall <christoffer.dall@linaro.org>
Cc: kgene.kim@samsung.com, steve.capper@linaro.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, ilho215.lee@samsung.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sungjinn.chung@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds a kernel configuration for VA_BITS.

It helps to prevent unnecessary #ifdef statements insertions
for VA_BITS when implementing different page sizes and level of
translation tables.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Steve Capper <steve.capper@linaro.org>
Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
Reviewed-by: Sungjinn Chung <sungjinn.chung@samsung.com>
---
 arch/arm64/Kconfig              |    8 ++++++++
 arch/arm64/include/asm/memory.h |    6 +-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c7f5d65..7b8d429 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -186,6 +186,14 @@ config ARM64_3_LEVELS
 
 endchoice
 
+config ARM64_VA_BITS
+	int "Virtual address space size"
+	range 39 39 if ARM64_4K_PAGES && ARM64_3_LEVELS
+	range 42 42 if ARM64_64K_PAGES && ARM64_2_LEVELS
+	help
+	  This feature is determined by a combination of page size and
+	  level of translation tables.
+
 config CPU_BIG_ENDIAN
        bool "Build big-endian kernel"
        help
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index e94f945..f6e7480 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -41,11 +41,7 @@
  * The module space lives between the addresses given by TASK_SIZE
  * and PAGE_OFFSET - it must be within 128MB of the kernel text.
  */
-#ifdef CONFIG_ARM64_64K_PAGES
-#define VA_BITS			(42)
-#else
-#define VA_BITS			(39)
-#endif
+#define VA_BITS			(CONFIG_ARM64_VA_BITS)
 #define PAGE_OFFSET		(UL(0xffffffffffffffff) << (VA_BITS - 1))
 #define MODULES_END		(PAGE_OFFSET)
 #define MODULES_VADDR		(MODULES_END - SZ_64M)
-- 
1.7.10.4

From: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH] ARM: MCPM: Add provision for platform specific wfi alternative
Date: Sun, 10 Feb 2019 23:12:12 +0000
Message-ID: <20190210231212.20470-1-stuart.menefy@mathembedded.com>
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
To: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Nicolas Pitre <nico@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On some platforms (in particular the Exynos5260) the wfi is not
executed directly by the operating system but by trapping into the
secure monitor. This allows us to replicate the behaviour of the
vendor supplied kernel using the MCPM framework.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---
 arch/arm/common/mcpm_entry.c | 8 ++++++--
 arch/arm/include/asm/mcpm.h  | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/common/mcpm_entry.c b/arch/arm/common/mcpm_entry.c
index ad574d20415c..524be627c87e 100644
--- a/arch/arm/common/mcpm_entry.c
+++ b/arch/arm/common/mcpm_entry.c
@@ -289,8 +289,12 @@ void mcpm_cpu_power_down(void)
 	__mcpm_cpu_down(cpu, cluster);
 
 	/* Now we are prepared for power-down, do it: */
-	if (cpu_going_down)
-		wfi();
+	if (cpu_going_down) {
+		if (platform_ops->wfi_alternative)
+			platform_ops->wfi_alternative(last_man);
+		else
+			wfi();
+	}
 
 	/*
 	 * It is possible for a power_up request to happen concurrently
diff --git a/arch/arm/include/asm/mcpm.h b/arch/arm/include/asm/mcpm.h
index acd4983d9b1f..96fdb41ac626 100644
--- a/arch/arm/include/asm/mcpm.h
+++ b/arch/arm/include/asm/mcpm.h
@@ -223,6 +223,7 @@ struct mcpm_platform_ops {
 	int (*cluster_powerup)(unsigned int cluster);
 	void (*cpu_suspend_prepare)(unsigned int cpu, unsigned int cluster);
 	void (*cpu_powerdown_prepare)(unsigned int cpu, unsigned int cluster);
+	void (*wfi_alternative)(bool last_man);
 	void (*cluster_powerdown_prepare)(unsigned int cluster);
 	void (*cpu_cache_disable)(void);
 	void (*cluster_cache_disable)(void);
-- 
2.13.6

From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH v2 03/15] ARM: exynos: fix a leaked reference by adding
 missing of_node_put
Date: Tue, 5 Mar 2019 19:33:54 +0800
Message-ID: <1551785646-46173-3-git-send-email-wen.yang99@zte.com.cn>
References: <1551785646-46173-1-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551785646-46173-1-git-send-email-wen.yang99@zte.com.cn>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: wang.yi59@zte.com.cn, linux-samsung-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Wen Yang <wen.yang99@zte.com.cn>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The call to of_get_next_child returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./arch/arm/mach-exynos/firmware.c:201:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 193, but without a corresponding object release within this function.
./arch/arm/mach-exynos/firmware.c:204:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 193, but without a corresponding object release within this function.
./arch/arm/mach-exynos/suspend.c:642:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 634, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
v2->v1: add a missing space between "adding" and "missing"

 arch/arm/mach-exynos/firmware.c | 1 +
 arch/arm/mach-exynos/suspend.c  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index d602e3b..2eaf2db 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -196,6 +196,7 @@ bool __init exynos_secure_firmware_available(void)
 		return false;
 
 	addr = of_get_address(nd, 0, NULL, NULL);
+	of_node_put(nd);
 	if (!addr) {
 		pr_err("%s: No address specified.\n", __func__);
 		return false;
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 0850505..9afb0c6 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -639,8 +639,10 @@ void __init exynos_pm_init(void)
 
 	if (WARN_ON(!of_find_property(np, "interrupt-controller", NULL))) {
 		pr_warn("Outdated DT detected, suspend/resume will NOT work\n");
+		of_node_put(np);
 		return;
 	}
+	of_node_put(np);
 
 	pm_data = (const struct exynos_pm_data *) match->data;
 
-- 
2.9.5

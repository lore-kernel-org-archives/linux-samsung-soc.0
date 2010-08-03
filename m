From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v6 2/7] ARM: Samsung SoC: added hclk/pclk info to s3c_freq for
	s5pv210 cpu-freq
Date: Tue, 03 Aug 2010 19:04:21 +0900
Message-ID: <1280829866-26001-3-git-send-email-myungjoo.ham@samsung.com>
References: <1280829866-26001-1-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-2-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1280829866-26001-2-git-send-email-myungjoo.ham@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

S5PV210 requires msys/dsys info as well; thus, we've included those at
struct s3c_freq, which is used by CPUFREQ of S5PV210.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/include/plat/cpu-freq.h |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/cpu-freq.h b/arch/arm/plat-samsung/include/plat/cpu-freq.h
index 80c4a80..9e97df7 100644
--- a/arch/arm/plat-samsung/include/plat/cpu-freq.h
+++ b/arch/arm/plat-samsung/include/plat/cpu-freq.h
@@ -38,6 +38,12 @@ struct s3c_freq {
 	unsigned long	hclk_tns;	/* in 10ths of ns */
 	unsigned long	hclk;
 	unsigned long	pclk;
+#ifdef CONFIG_ARCH_S5PV210
+	unsigned long	hclk_msys;
+	unsigned long	pclk_msys;
+	unsigned long	hclk_dsys;
+	unsigned long	pclk_dsys;
+#endif
 };
 
 /**
-- 
1.6.3.3

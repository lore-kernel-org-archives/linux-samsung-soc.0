From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 4/6] [CPUFREQ] S5PV210: Lock a mutex while changing the cpu frequency
Date: Fri, 24 Jun 2011 16:04:16 +0900
Message-ID: <1308899058-24318-5-git-send-email-kgene.kim@samsung.com>
References: <1308899058-24318-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33321 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752990Ab1FXHMP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jun 2011 03:12:15 -0400
In-Reply-To: <1308899058-24318-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com, =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Jonghwan Choi <jhbird.choi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

=46rom: Arve Hj=C3=B8nnev=C3=A5g <arve@android.com>

Without this lock the call to change the frequency for suspend could
switch to a new frequency while another thread was still changing the
cpu voltage.

Signed-off-by: Arve Hj=C3=B8nnev=C3=A5g <arve@android.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/s5pv210-cpufreq.c |   28 +++++++++++++++++++---------
 1 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv21=
0-cpufreq.c
index 79b1b4e..7fba356 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -26,6 +26,7 @@ static struct clk *cpu_clk;
 static struct clk *dmc0_clk;
 static struct clk *dmc1_clk;
 static struct cpufreq_freqs freqs;
+static DEFINE_MUTEX(set_freq_lock);
=20
 /* APLL M,P,S values for 1G/800Mhz */
 #define APLL_VAL_1000	((1 << 31) | (125 << 16) | (3 << 8) | 1)
@@ -199,6 +200,8 @@ static int s5pv210_target(struct cpufreq_policy *po=
licy,
 	int arm_volt, int_volt;
 	int ret =3D 0;
=20
+	mutex_lock(&set_freq_lock);
+
 	if (relation & ENABLE_FURTHER_CPUFREQ)
 		no_cpufreq_access =3D false;
=20
@@ -207,7 +210,8 @@ static int s5pv210_target(struct cpufreq_policy *po=
licy,
 		pr_err("%s:%d denied access to %s as it is disabled"
 				"temporarily\n", __FILE__, __LINE__, __func__);
 #endif
-		return -EINVAL;
+		ret =3D -EINVAL;
+		goto exit;
 	}
=20
 	if (relation & DISABLE_FURTHER_CPUFREQ)
@@ -218,19 +222,23 @@ static int s5pv210_target(struct cpufreq_policy *=
policy,
 	freqs.old =3D s5pv210_getspeed(0);
=20
 	if (cpufreq_frequency_table_target(policy, s5pv210_freq_table,
-					   target_freq, relation, &index))
-		return -EINVAL;
+					   target_freq, relation, &index)) {
+		ret =3D -EINVAL;
+		goto exit;
+	}
=20
 	freqs.new =3D s5pv210_freq_table[index].frequency;
 	freqs.cpu =3D 0;
=20
 	if (freqs.new =3D=3D freqs.old)
-		return 0;
+		goto exit;
=20
 	/* Finding current running level index */
 	if (cpufreq_frequency_table_target(policy, s5pv210_freq_table,
-					   freqs.old, relation, &priv_index))
-		return -EINVAL;
+					   freqs.old, relation, &priv_index)) {
+		ret =3D -EINVAL;
+		goto exit;
+	}
=20
 	arm_volt =3D dvs_conf[index].arm_volt;
 	int_volt =3D dvs_conf[index].int_volt;
@@ -239,12 +247,12 @@ static int s5pv210_target(struct cpufreq_policy *=
policy,
 		ret =3D regulator_set_voltage(arm_regulator,
 				arm_volt, arm_volt_max);
 		if (ret)
-			return ret;
+			goto exit;
=20
 		ret =3D regulator_set_voltage(int_regulator,
 				int_volt, int_volt_max);
 		if (ret)
-			return ret;
+			goto exit;
 	}
=20
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
@@ -471,7 +479,9 @@ static int s5pv210_target(struct cpufreq_policy *po=
licy,
=20
 	printk(KERN_DEBUG "Perf changed[L%d]\n", index);
=20
-	return 0;
+exit:
+	mutex_unlock(&set_freq_lock);
+	return ret;
 }
=20
 #ifdef CONFIG_PM
--=20
1.7.1

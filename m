Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0A731A7F0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154867; cv=none; b=onMP43IDwgFLQxtBGp7rSyjqFPBBxaZHiQ4AJUJqwiD7r6u3nIuFixDOMP9EGuNdbpouQs2ShCiTI+LXRr6fscu9H95Hu7Cr4Fw07KAZluf/k4ZvJtpf7gug8B8DZ5KRb7Oj/yCk32aoTrzXfCY+YZR6a1ag5Us3zdGTxmmin8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154867; c=relaxed/simple;
	bh=P544E1HDiyVe+ITxGuEXhJtXKsr9ZG4VjyXfQ7wfBlI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=o0IxOLCnz0kFUyS+QffaxURfM0Gwpsy19Xg+UL2f2oo7ph1eQHtH2bFo1XdhWTnqFF/umdUGPAoVYolWx/L3tNyYkXvPfM4SAG2oyfy/qQaOBCQyOFSZA3hFDbN1Fs7wvLVNsPDeA4NnIm8d7P1B1UfqY8C/vYcnY/BQkVBL1V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QpwAltbj; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QpwAltbj"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251126110059euoutp01c96e30952ecdb638458aa689b1f0f5d3~7iX9fuHQ22534825348euoutp01G
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 11:00:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251126110059euoutp01c96e30952ecdb638458aa689b1f0f5d3~7iX9fuHQ22534825348euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764154859;
	bh=/424bKyZP+hmm9tibLqIJdSzfG9831PjMDA+HTeXuy0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=QpwAltbjlHlVvxv/XptCiqgoGyCDOox8B2lVPBZewFvCiYsgceZH41GZCLewMBqa8
	 ZNHPmV8a4kiHA/+E8Iz7c6YxpyXGo9E8PRyslNyqZbaJar4Wjsb/6+LAXIkTkMxkxk
	 M3A6+J18ytwXti5xXY349ya5yP4Ll1zFtjEqkLWY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251126110058eucas1p2054c35c38f2f849e5058b899eb66c377~7iX9QPJzG0919909199eucas1p2T;
	Wed, 26 Nov 2025 11:00:58 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251126110058eusmtip27e79265cf49e05923ecd839692a59f6b~7iX8_3N1k2775827758eusmtip2d;
	Wed, 26 Nov 2025 11:00:58 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin
	<peter.griffin@linaro.org>
Subject: [PATCH] soc: samsung: exynos-pmu: Fix structure initialization
Date: Wed, 26 Nov 2025 12:00:38 +0100
Message-Id: <20251126110038.3326768-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251126110058eucas1p2054c35c38f2f849e5058b899eb66c377
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251126110058eucas1p2054c35c38f2f849e5058b899eb66c377
X-EPHeader: CA
X-CMS-RootMailID: 20251126110058eucas1p2054c35c38f2f849e5058b899eb66c377
References: <CGME20251126110058eucas1p2054c35c38f2f849e5058b899eb66c377@eucas1p2.samsung.com>

Commit 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for
gs101") added system wide suspend/resume callbacks to Exynos PMU driver,
but some items used by these callbacks are initialized only on
GS101-compatible boards. Move that initialization to exynos_pmu_probe()
to avoid potential lockdep warnings.

Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This fixes the following issue observed during system suspend/resume cycle:

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 2134 Comm: rtcwake Not tainted 6.18.0-rc7-next-20251126-00039-g1d656a1af243 #11794 PREEMPT
Hardware name: Samsung Exynos (Flattened Device Tree)
Call trace:
 unwind_backtrace from show_stack+0x10/0x14
 show_stack from dump_stack_lvl+0x68/0x88
 dump_stack_lvl from register_lock_class+0x970/0x988
 register_lock_class from __lock_acquire+0xc8/0x29ec
 __lock_acquire from lock_acquire+0x134/0x39c
 lock_acquire from _raw_spin_lock+0x38/0x48
 _raw_spin_lock from exynos_cpupm_suspend_noirq+0x18/0x34
 exynos_cpupm_suspend_noirq from dpm_run_callback+0x98/0x2b8
 dpm_run_callback from device_suspend_noirq+0x8c/0x310
 device_suspend_noirq from dpm_noirq_suspend_devices+0x1d0/0x50c
 dpm_noirq_suspend_devices from dpm_suspend_noirq+0x18/0x88
 dpm_suspend_noirq from suspend_devices_and_enter+0x314/0xc94
 suspend_devices_and_enter from pm_suspend+0x35c/0x3d8
 pm_suspend from state_store+0x68/0xc8
 state_store from kernfs_fop_write_iter+0x120/0x1e4
 kernfs_fop_write_iter from vfs_write+0x30c/0x46c
 vfs_write from ksys_write+0x60/0xe0
 ksys_write from ret_fast_syscall+0x0/0x1c
Exception stack(0xf19bdfa8 to 0xf19bdff0)
...

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland 
---
 drivers/soc/samsung/exynos-pmu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index b6970459bb3d..cff9437dd15a 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -461,10 +461,6 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 	if (!pmu_context->in_cpuhp)
 		return -ENOMEM;
 
-	raw_spin_lock_init(&pmu_context->cpupm_lock);
-	pmu_context->sys_inreboot = false;
-	pmu_context->sys_insuspend = false;
-
 	/* set PMU to power on */
 	for_each_online_cpu(cpu)
 		gs101_cpuhp_pmu_online(cpu);
@@ -536,6 +532,9 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 
 	pmu_context->pmureg = regmap;
 	pmu_context->dev = dev;
+	raw_spin_lock_init(&pmu_context->cpupm_lock);
+	pmu_context->sys_inreboot = false;
+	pmu_context->sys_insuspend = false;
 
 	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) {
 		ret = setup_cpuhp_and_cpuidle(dev);
-- 
2.34.1


Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6F9C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 20:17:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 013712070E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 20:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HM1G5TIV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442352AbgJ0URn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 16:17:43 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50391 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441275AbgJ0URn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 16:17:43 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201027201731euoutp024c836a1ebc405b070bd359e456967c40~B8sCVXKoW3038230382euoutp02y
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 20:17:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201027201731euoutp024c836a1ebc405b070bd359e456967c40~B8sCVXKoW3038230382euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603829851;
        bh=VxZYFYGrJfs7cYo4n/HvSxM+z8F+MbNYp2NjUWWih/8=;
        h=From:To:Cc:Subject:Date:References:From;
        b=HM1G5TIVmn3OctyRfsD4Q1TROSG/d74vLVTI1r1ZHGAIkGltglRBwe3XH9r1YULv+
         f04wzcOLi8x/e86W2GKaIS712PyAEZNbUk43IJRmD0yYlcjzuF3olKvbPIQhrXW78A
         jiVcws9aR0WUdh4XXw7Ygfl29D7QxQpG9dGZdtz4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201027201725eucas1p2bb3a248449c804522e26d55753abe998~B8r9FiKGf1056010560eucas1p2_;
        Tue, 27 Oct 2020 20:17:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 04.F0.06456.550889F5; Tue, 27
        Oct 2020 20:17:25 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201027201724eucas1p213868f9a53639d3e03ff81785d3b1c8d~B8r8DNVvL0323603236eucas1p2m;
        Tue, 27 Oct 2020 20:17:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201027201724eusmtrp23e405f5e4ec9aba72c81eeb3138e738e~B8r8CnzvU2287122871eusmtrp2f;
        Tue, 27 Oct 2020 20:17:24 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-2f-5f988055317d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 62.53.06314.450889F5; Tue, 27
        Oct 2020 20:17:24 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201027201724eusmtip11b95b427ba41733926abbfe4fa9d567d~B8r7wRjmh2405724057eusmtip1W;
        Tue, 27 Oct 2020 20:17:24 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] ARM: exynos: Simplify code in Exynos3250 CPU core
 restart path
Date:   Tue, 27 Oct 2020 21:17:16 +0100
Message-Id: <20201027201716.15745-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsWy7djPc7qhDTPiDbY9U7DYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5issmJTUnsyy1SN8ugSvjwbpJTAWTxCom
        vp3I2MB4XLiLkZNDQsBE4tyEjSwgtpDACkaJu13VXYxcQPYXRolvLTdZIJzPjBKnpncxw3Qs
        nPmFDSKxnFHi9Y7DjHAtL5Z2MoJUsQkYSnS97WIDsUUEVCU+ty1gByliFuhjlLi+dy7YKGGB
        EIk9LUdYuxg5OFiAipaeALuDV8BW4lTrTUaIbfISqzccgNq8gU1i/SxOCNtF4uOsR0wQtrDE
        q+Nb2CFsGYn/O+czgeySEGhmlHh4bi07hNPDKHG5aQbUVGuJO+d+sYEsZhbQlFi/Sx8i7Cix
        ZN5/FpCwhACfxI23giBhZiBz0rbpzBBhXomONiGIajWJWcfXwa09eOES1JkeEvueXYUGaazE
        rp8T2Ccwys1C2LWAkXEVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYGSf/nf80w7Gr5eS
        DjEKcDAq8fDeUJgRL8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjNIcLEri
        vMaLXsYKCaQnlqRmp6YWpBbBZJk4OKUaGMv035ve/OV5y9nv3cS9z39HrHtZ+3TqgXmrV/ze
        U2Y0ib36vv2rGa8+cj+2cwn484iToaB2WVl72ZLP3ZnNzCtK5Hk+VT53XP5nr5vBE4+0Ekm2
        Pds7s7rDyqZ47dzzWulp/rKF1TMk7NziXrZZ7Dh29trE/JasZyFHV3fMNz577MTmoi1LwluV
        WIozEg21mIuKEwFVIBTC6AIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVy+t/xu7ohDTPiDS58l7bYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/jwbpJTAWTxComvp3I2MB4XLiLkZNDQsBEYuHM
        L2xdjFwcQgJLGSX+vZvOCpGQkTg5rQHKFpb4c62LDcQWEvjEKNH+KQLEZhMwlOh6CxEXEVCV
        +Ny2gB1kELPABEaJ850zwBLCAkESK1fMBRrEwcECVLT0BAtImFfAVuJU601GiPnyEqs3HGCe
        wMizgJFhFaNIamlxbnpusaFecWJucWleul5yfu4mRmBAbTv2c/MOxksbgw8xCnAwKvHw3lCY
        ES/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQLsnMkuJJucDgz2vJN7Q
        1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAMjj6xZVs7vRm3hoh3zH+sc
        8ziwQXCGnlTshtUzW3b5PQgSbciP8n9/4WbFzl13Nl3L9ZRKkN8ar+Z24+VLg3sq8QfSqr+1
        XLF1cTX2Vnt4+1bGK4VpKjezl7MHHLh4oEvp+byFld88p78SnzPt+b1H2x5MszikUhHlOvHU
        ps+6wemy6W+ZfaxSlFiKMxINtZiLihMBOcSUIz4CAAA=
X-CMS-MailID: 20201027201724eucas1p213868f9a53639d3e03ff81785d3b1c8d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201027201724eucas1p213868f9a53639d3e03ff81785d3b1c8d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201027201724eucas1p213868f9a53639d3e03ff81785d3b1c8d
References: <CGME20201027201724eucas1p213868f9a53639d3e03ff81785d3b1c8d@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

exynos_core_restart() is called by secondary CPU boot procedure, used by
CPU hotplug and coupled CPU idle. Replace of_machine_is_compatible() call
with a simple SoC revision check.

of_machine_is_compatible() function performs a dozen of string comparisons
during the full device tree walk, while soc_is_exynos3250() is a simple
integer check on SoC revision variable. This change also fixes the
following warning:

=============================
WARNING: suspicious RCU usage
5.10.0-rc1-00001-g6f65599d1f4f-dirty #1800 Not tainted
-----------------------------
./include/trace/events/lock.h:37 suspicious rcu_dereference_check() usage!

other info that might help us debug this:

rcu_scheduler_active = 2, debug_locks = 1
RCU used illegally from extended quiescent state!
no locks held by swapper/0/0.

stack backtrace:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.0-rc1-00001-g6f65599d1f4f-dirty #1800
Hardware name: Samsung Exynos (Flattened Device Tree)
[<c0111514>] (unwind_backtrace) from [<c010ceb8>] (show_stack+0x10/0x14)
[<c010ceb8>] (show_stack) from [<c0b1d8dc>] (dump_stack+0xb4/0xd4)
[<c0b1d8dc>] (dump_stack) from [<c0194acc>] (lock_acquire+0x418/0x584)
[<c0194acc>] (lock_acquire) from [<c0b29e58>] (_raw_spin_lock_irqsave+0x4c/0x60)
[<c0b29e58>] (_raw_spin_lock_irqsave) from [<c0897af4>] (of_device_is_compatible+0x1c/0x4c)
[<c0897af4>] (of_device_is_compatible) from [<c01216d8>] (exynos_core_restart+0x14/0xb0)
[<c01216d8>] (exynos_core_restart) from [<c0120a78>] (exynos_cpu0_enter_aftr+0x1d0/0x1dc)
[<c0120a78>] (exynos_cpu0_enter_aftr) from [<c08575b0>] (exynos_enter_coupled_lowpower+0x44/0x74)
[<c08575b0>] (exynos_enter_coupled_lowpower) from [<c085477c>] (cpuidle_enter_state+0x178/0x660)
[<c085477c>] (cpuidle_enter_state) from [<c08572dc>] (cpuidle_enter_state_coupled+0x35c/0x378)
[<c08572dc>] (cpuidle_enter_state_coupled) from [<c0854cc8>] (cpuidle_enter+0x50/0x54)
[<c0854cc8>] (cpuidle_enter) from [<c0164854>] (do_idle+0x224/0x2a4)
[<c0164854>] (do_idle) from [<c0164c88>] (cpu_startup_entry+0x18/0x1c)
[<c0164c88>] (cpu_startup_entry) from [<c1100fa0>] (start_kernel+0x640/0x67c)
[<c1100fa0>] (start_kernel) from [<00000000>] (0x0)

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index d7fedbb2eefe..ea0be59f469a 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -215,7 +215,7 @@ void exynos_core_restart(u32 core_id)
 	unsigned int timeout = 16;
 	u32 val;
 
-	if (!of_machine_is_compatible("samsung,exynos3250"))
+	if (!soc_is_exynos3250())
 		return;
 
 	while (timeout && !pmu_raw_readl(S5P_PMU_SPARE2)) {
-- 
2.17.1


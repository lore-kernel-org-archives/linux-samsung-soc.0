Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2D3C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 15:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1443C6120E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 15:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240876AbhJOPQv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 11:16:51 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30871 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240896AbhJOPQv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 11:16:51 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211015151439euoutp02b2d5e760c1c8e7179ea00e9bae9e06bc~uPRX-NACb2622726227euoutp02I
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 15:14:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211015151439euoutp02b2d5e760c1c8e7179ea00e9bae9e06bc~uPRX-NACb2622726227euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634310879;
        bh=b5QUxLBUiBBzlY2mLx4CgdE8KvDbnYjfslJYLSWVFP8=;
        h=From:To:Cc:Subject:Date:References:From;
        b=s3Em61no7rug3gPibUVnIOVMOXxLL3/ilPOlDHAHHYZ5f19ibrmtuqrjkq2j5QQAw
         PhN7lriRc3C2D7gSdlC8NpGANNOsLIDsqCdzJMyNetBfuz4FkISguRJB5jm/VTKOdW
         9Kp1VAHvsx14lsmJzId9I7G7nJsXzm8W31jDDzzc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211015151439eucas1p212104ef07920d6e97597d233f221a230~uPRXkqr8M1152811528eucas1p2Y;
        Fri, 15 Oct 2021 15:14:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id CF.63.42068.EDA99616; Fri, 15
        Oct 2021 16:14:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211015151438eucas1p1a784b8fb6bc20b01d4b1ec3634359df5~uPRXCPUfe2191821918eucas1p1f;
        Fri, 15 Oct 2021 15:14:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211015151438eusmtrp1e70ea15dd5229f5ccf3497697e1e2a20~uPRW_oWNF2678526785eusmtrp1c;
        Fri, 15 Oct 2021 15:14:38 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-87-61699ade8bac
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 25.F8.20981.EDA99616; Fri, 15
        Oct 2021 16:14:38 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211015151437eusmtip2d9324e2e8468a16ee68151dd6f1e2727~uPRWbCuwt0130001300eusmtip2-;
        Fri, 15 Oct 2021 15:14:37 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, cw00.choi@samsung.com,
        krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] clk: samsung: Remove meaningless __init and extern from
 header files
Date:   Fri, 15 Oct 2021 17:14:25 +0200
Message-Id: <20211015151425.29743-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRmVeSWpSXmKPExsWy7djP87r3ZmUmGlzfbmFx/ctzVovz5zew
        W2x6fI3V4mPPPVaLGef3MVmsPXKX3eLiKVeLw2/aWS3+XdvI4sDp8f5GK7vHplWdbB6bl9R7
        9G1ZxejxeZNcAGsUl01Kak5mWWqRvl0CV8b/i0YFzeoVnZevszQwblfsYuTkkBAwkZix7S1T
        FyMXh5DACkaJTVvfskM4Xxgllm7aygjhfGaUOLi0E6iMA6zlzdsiiPhyRontx/aygIwC6+jo
        rgex2QQMJXqP9jGC2CICshK3jv1kA2lgFnjNKLHqxSN2kISwQLjEkxUPWUFsFgFViS2X5jCD
        2LwC1hJtfYeYIe6Tl1i94QAzSLOEQC+HxPX3C9kgEi4S/7ouMULYwhKvjm9hh7BlJE5P7mGB
        aGhmlOjZfZsdwpnAKHH/+AKoDmuJO+d+sYH8wyygKbF+lz5E2FFiVdNVNog3+SRuvBUECTMD
        mZO2TWeGCPNKdLQJQVSrSPxeNZ0JwpaS6H7ynwXC9pDo/dsHNkVIIFbi4VLrCYxysxBWLWBk
        XMUonlpanJueWmyUl1quV5yYW1yal66XnJ+7iRGYGE7/O/5lB+PyVx/1DjEycTAeYpTgYFYS
        4X13ID1RiDclsbIqtSg/vqg0J7X4EKM0B4uSOG/SljXxQgLpiSWp2ampBalFMFkmDk6pBiaz
        qu27mWQXbv//u/7murO3Ns90XXpoRXTHQ4G8l1tPlx1bFzPlle+DRF6FFRcyVTbJKGl98eFL
        Pp8UfdPBcZK9/tK9E3SZoqYzBqpVHvlnGKUVVCoutyAvznQTf4mutYbIpg0sE/29Y38sv3f6
        5rG3+1yl97pHCpzbUGzrbukp//Hz1dUPVs9a7JVs9e1bvLZTRcXZFfvTz+u/CzdVlXzXo7pi
        qfuxdL8GB0Y3f2kJZfuPUzltI3azRD4TLahJW+nj2tF+rVb9iqTXhPXvhBsD5BXennj05vTC
        jue2175dMmxy+r/9Hee+x5Lsi4wehoV13Tl2+l5KyIHPz67kbjuvEfODmSe3fxHLC4l7OR+U
        WIozEg21mIuKEwGarkriewMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHLMWRmVeSWpSXmKPExsVy+t/xe7r3ZmUmGnxtZbW4/uU5q8X58xvY
        LTY9vsZq8bHnHqvFjPP7mCzWHrnLbnHxlKvF4TftrBb/rm1kceD0eH+jld1j06pONo/NS+o9
        +rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSez
        LLVI3y5BL+P/RaOCZvWKzsvXWRoYtyt2MXJwSAiYSLx5W9TFyMUhJLCUUWLNjZ0sEHEpifkt
        Sl2MnECmsMSfa11sEDWfGCVOf3jPCpJgEzCU6D3axwhiiwjIStw69hOsiFngM6PE+oUTmUAS
        wgKhEvObH7KB2CwCqhJbLs1hBrF5Bawl2voOMUNskJdYveEA8wRGngWMDKsYRVJLi3PTc4uN
        9IoTc4tL89L1kvNzNzECA3LbsZ9bdjCufPVR7xAjEwfjIUYJDmYlEd53B9IThXhTEiurUovy
        44tKc1KLDzGaAu2byCwlmpwPjIm8knhDMwNTQxMzSwNTSzNjJXFekyNr4oUE0hNLUrNTUwtS
        i2D6mDg4pRqYtjudqLQTtNhZsazhR3WdypkvW/f9VX/usKPp5JKeH6LZWzquPQ7znvW9OITN
        yLBaLque84/1Gpcp7lvcTI6/d05ofyDPljfLq/mgfLzVenntd9yHFuVlC9yyFpa5YHYydo3G
        QjmJ+/+rza76fz7x7q2D06Gjif9Myl8ZX5s2I/+sp3XNzqy1+r3SS8+e2Fj5wmDZxF2VLj1C
        Vt+4r20wyKlsPXhuc/WSzcw8MiEKhkcW63Bu3qA6Uy2yzvf4mdvzRZ5FpK62Lvvo9XLG0axj
        tS9O9H+L+yX7X5SztO/NguW/ZpwM3LWFxWjW5Vk33l61Mrt36L3x2eu5keFcIhW3YpRlDmus
        2V0Zsb2HfZ5RpxJLcUaioRZzUXEiAM2KB4zRAgAA
X-CMS-MailID: 20211015151438eucas1p1a784b8fb6bc20b01d4b1ec3634359df5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211015151438eucas1p1a784b8fb6bc20b01d4b1ec3634359df5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211015151438eucas1p1a784b8fb6bc20b01d4b1ec3634359df5
References: <CGME20211015151438eucas1p1a784b8fb6bc20b01d4b1ec3634359df5@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove useless __init atrribute and unneeded extern qualifier in function
declarations in header files.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-cpu.h |  2 +-
 drivers/clk/samsung/clk.h     | 34 +++++++++++++++++-----------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.h b/drivers/clk/samsung/clk-cpu.h
index af74686db9ef..fd885d2bf74c 100644
--- a/drivers/clk/samsung/clk-cpu.h
+++ b/drivers/clk/samsung/clk-cpu.h
@@ -62,7 +62,7 @@ struct exynos_cpuclk {
 #define CLK_CPU_HAS_E5433_REGS_LAYOUT	(1 << 2)
 };
 
-int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
+int exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 			unsigned int lookup_id, const char *name,
 			const struct clk_hw *parent, const struct clk_hw *alt_parent,
 			unsigned long offset,
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index b23776d540eb..b46e83a2581f 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -337,52 +337,52 @@ struct samsung_cmu_info {
 	const char *clk_name;
 };
 
-extern struct samsung_clk_provider *__init samsung_clk_init(
+struct samsung_clk_provider * samsung_clk_init(
 			struct device_node *np, void __iomem *base,
 			unsigned long nr_clks);
-extern void __init samsung_clk_of_add_provider(struct device_node *np,
+void samsung_clk_of_add_provider(struct device_node *np,
 			struct samsung_clk_provider *ctx);
-extern void __init samsung_clk_of_register_fixed_ext(
+void samsung_clk_of_register_fixed_ext(
 			struct samsung_clk_provider *ctx,
 			struct samsung_fixed_rate_clock *fixed_rate_clk,
 			unsigned int nr_fixed_rate_clk,
 			const struct of_device_id *clk_matches);
 
-extern void samsung_clk_add_lookup(struct samsung_clk_provider *ctx,
+void samsung_clk_add_lookup(struct samsung_clk_provider *ctx,
 			struct clk_hw *clk_hw, unsigned int id);
 
-extern void __init samsung_clk_register_alias(struct samsung_clk_provider *ctx,
+void samsung_clk_register_alias(struct samsung_clk_provider *ctx,
 			const struct samsung_clock_alias *list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_fixed_rate(
+void samsung_clk_register_fixed_rate(
 			struct samsung_clk_provider *ctx,
 			const struct samsung_fixed_rate_clock *clk_list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_fixed_factor(
+void samsung_clk_register_fixed_factor(
 			struct samsung_clk_provider *ctx,
 			const struct samsung_fixed_factor_clock *list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_mux(struct samsung_clk_provider *ctx,
+void samsung_clk_register_mux(struct samsung_clk_provider *ctx,
 			const struct samsung_mux_clock *clk_list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
+void samsung_clk_register_div(struct samsung_clk_provider *ctx,
 			const struct samsung_div_clock *clk_list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
+void samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 			const struct samsung_gate_clock *clk_list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
+void samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			const struct samsung_pll_clock *pll_list,
 			unsigned int nr_clk, void __iomem *base);
-extern void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
+void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
 		const struct samsung_cpu_clock *list, unsigned int nr_clk);
 
-extern struct samsung_clk_provider __init *samsung_cmu_register_one(
+struct samsung_clk_provider *samsung_cmu_register_one(
 			struct device_node *,
 			const struct samsung_cmu_info *);
 
 #ifdef CONFIG_PM_SLEEP
-extern void samsung_clk_extended_sleep_init(void __iomem *reg_base,
+void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 			const unsigned long *rdump,
 			unsigned long nr_rdump,
 			const struct samsung_clk_reg_dump *rsuspend,
@@ -397,13 +397,13 @@ static inline void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 #define samsung_clk_sleep_init(reg_base, rdump, nr_rdump) \
 	samsung_clk_extended_sleep_init(reg_base, rdump, nr_rdump, NULL, 0)
 
-extern void samsung_clk_save(void __iomem *base,
+void samsung_clk_save(void __iomem *base,
 			struct samsung_clk_reg_dump *rd,
 			unsigned int num_regs);
-extern void samsung_clk_restore(void __iomem *base,
+void samsung_clk_restore(void __iomem *base,
 			const struct samsung_clk_reg_dump *rd,
 			unsigned int num_regs);
-extern struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
+struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
 			const unsigned long *rdump,
 			unsigned long nr_rdump);
 
-- 
2.25.1


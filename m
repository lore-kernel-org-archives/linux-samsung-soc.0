Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E163CC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 22:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCF51610FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 22:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbhJMWMe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Oct 2021 18:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhJMWMd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 18:12:33 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF790C061749
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 15:10:29 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id nl15-20020a17090b384f00b001a0d49be015so2152317pjb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 15:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=7Tl0nUSj0QXvUEN85dGhpBoTdxs/UpAcTzzK1mTgJrQ=;
        b=qDWzWvYnq5+gFWhd3zD6AGKoBSeOKQjToGdNuU6vqKDSCdXa8XVPhP6bu4tXFWdrXJ
         AdgMCwEfyZWvKbhpXUJASdANUTsKusRPffXyLjSXBf03p8a/yr3M6Tk5C1U/DjTCQvnU
         CtffSBZJBvzO4Y3ULgFohOprqJjWN/V5xHnRqRoCNcq842YbiQDSGmDIr0guwr9Jbp3k
         pl6rTvWxnJwTcOtUrjjuQyz0ISv4ZjKlklMweAYRFcTfmLWjpWAInb5HgxhyROiNDay2
         PiA9m/7PQJtEdJXGYr9lnZu875qKvqZL9g62CdKgBXQ8yHIdBU+aG80VnKfVBCOzV/LC
         D3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=7Tl0nUSj0QXvUEN85dGhpBoTdxs/UpAcTzzK1mTgJrQ=;
        b=cENbxKu5wI8JeFCbyffCnyOlrOjmet1xEAFjxcWomJXHhNeJleovZF+NfE3VKczbOM
         TLmRnlLhLjtGllaaR7AMeL7U/AbV2BtbOA9fes/syPx6fghu1AqrQAwEbBFhsXMNzNon
         P1GjX35M+TJbRXPHQidp4ec4IwhiNJ81fKpRx25OY2drnRyIcb2GzpvVFV1qNYB+wVCe
         XyUXF8KsGV9OijP8P7H97CBQMtINMuYHRSNhzvv+6kZ4Z1dq5ko/D0aBzqZngR845Ldv
         npKtFQl8FID+vt3k6/hgmCTBCwKdXIJ0Xv1HcPC4QPt2OV6pfmZUBAHAb8i04IRO62Uc
         4PlQ==
X-Gm-Message-State: AOAM531eMH2KT+CBcaDNABiq9jTcBINF1FLI1/tzvEfxLkl+Q31QR7eC
        HNw4yXLa+OOCNiTajauwrWzzHe4GFDWnTKV6dH0=
X-Google-Smtp-Source: ABdhPJwlaJHT6tw5t+L2hE6CrV/5BHbujYrOpg7P42XA8BWbOAfYV3aMtGbxCKpn0URvGRD2uv5w4jeo8ECQ/2TbYVM=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a63:7447:: with SMTP id
 e7mr1394035pgn.261.1634163029412; Wed, 13 Oct 2021 15:10:29 -0700 (PDT)
Date:   Wed, 13 Oct 2021 22:10:19 +0000
In-Reply-To: <20211013221021.3433704-1-willmcvicker@google.com>
Message-Id: <20211013221021.3433704-2-willmcvicker@google.com>
Mime-Version: 1.0
References: <20211013221021.3433704-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v3 1/2] [RFT] clk: samsung: add support for CPU clocks
From:   Will McVicker <willmcvicker@google.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kernel-team@android.com, Will McVicker <willmcvicker@google.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Adds 'struct samsung_cpu_clock' and corresponding CPU clock registration
function to the samsung common clk driver. This allows samsung clock
drivers to register their CPU clocks with the samsung_cmu_register_one()
API.

Currently the exynos5433 apollo and atlas clks have their own custom
init functions to handle registering their CPU clocks. With this patch
we can drop their custom CLK_OF_DECLARE functions and directly call
samsung_cmu_register_one().

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clk/samsung/clk-cpu.c | 26 ++++++++++++++++++++++++++
 drivers/clk/samsung/clk.c     |  2 ++
 drivers/clk/samsung/clk.h     | 26 ++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 00ef4d1b0888..b5017934fc41 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -469,3 +469,29 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 	kfree(cpuclk);
 	return ret;
 }
+
+void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
+		const struct samsung_cpu_clock *list, unsigned int nr_clk)
+{
+	unsigned int idx;
+	unsigned int num_cfgs;
+	struct clk *parent_clk, *alt_parent_clk;
+	const struct clk_hw *parent_clk_hw = NULL;
+	const struct clk_hw *alt_parent_clk_hw = NULL;
+
+	for (idx = 0; idx < nr_clk; idx++, list++) {
+		/* find count of configuration rates in cfg */
+		for (num_cfgs = 0; list->cfg[num_cfgs].prate != 0; )
+			num_cfgs++;
+
+		parent_clk = __clk_lookup(list->parent_name);
+		if (parent_clk)
+			parent_clk_hw = __clk_get_hw(parent_clk);
+		alt_parent_clk = __clk_lookup(list->alt_parent_name);
+		if (alt_parent_clk)
+			alt_parent_clk_hw = __clk_get_hw(alt_parent_clk);
+
+		exynos_register_cpu_clock(ctx, list->id, list->name, parent_clk_hw,
+				alt_parent_clk_hw, list->offset, list->cfg, num_cfgs, list->flags);
+	}
+}
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 1949ae7851b2..336243c6f120 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -378,6 +378,8 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 		samsung_clk_extended_sleep_init(reg_base,
 			cmu->clk_regs, cmu->nr_clk_regs,
 			cmu->suspend_regs, cmu->nr_suspend_regs);
+	if (cmu->cpu_clks)
+		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
 
 	samsung_clk_of_add_provider(np, ctx);
 
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index c1e1a6b2f499..a52a38cc1740 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -271,6 +271,27 @@ struct samsung_pll_clock {
 	__PLL(_typ, _id, _name, _pname, CLK_GET_RATE_NOCACHE, _lock,	\
 	      _con, _rtable)
 
+struct samsung_cpu_clock {
+	unsigned int		id;
+	const char		*name;
+	const char		*parent_name;
+	const char		*alt_parent_name;
+	unsigned long		flags;
+	int			offset;
+	const struct exynos_cpuclk_cfg_data *cfg;
+};
+
+#define CPU_CLK(_id, _name, _pname, _apname, _flags, _offset, _cfg) \
+	{							    \
+		.id		  = _id,			    \
+		.name		  = _name,			    \
+		.parent_name	  = _pname,			    \
+		.alt_parent_name  = _apname,			    \
+		.flags		  = _flags,			    \
+		.offset		  = _offset,			    \
+		.cfg		  = _cfg,			    \
+	}
+
 struct samsung_clock_reg_cache {
 	struct list_head node;
 	void __iomem *reg_base;
@@ -301,6 +322,9 @@ struct samsung_cmu_info {
 	unsigned int nr_fixed_factor_clks;
 	/* total number of clocks with IDs assigned*/
 	unsigned int nr_clk_ids;
+	/* list of cpu clocks and respective count */
+	const struct samsung_cpu_clock *cpu_clks;
+	unsigned int nr_cpu_clks;
 
 	/* list and number of clocks registers */
 	const unsigned long *clk_regs;
@@ -350,6 +374,8 @@ extern void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 extern void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			const struct samsung_pll_clock *pll_list,
 			unsigned int nr_clk, void __iomem *base);
+extern void __init samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
+		const struct samsung_cpu_clock *list, unsigned int nr_clk);
 
 extern struct samsung_clk_provider __init *samsung_cmu_register_one(
 			struct device_node *,
-- 
2.33.0.882.g93a45727a2-goog


From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH v3 6/8] drivers: soc: add support for exynos SROM driver
Date: Tue, 13 Oct 2015 17:00:02 +0200
Message-ID: <20151013150002.GA27569@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:34015 "EHLO
	mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932335AbbJMPAG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2015 11:00:06 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: pankaj.dubey@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, k.kozlowski@samsung.com, p.fedin@samsung.com, thomas.ab@samsung.com

+static struct exynos_srom_reg_dump *exynos_srom_alloc_reg_dump(
+               const unsigned long *rdump,
+               unsigned long nr_rdump)
+{
+       struct exynos_srom_reg_dump *rd;
+       unsigned int i;
+ 
+       rd = kcalloc(nr_rdump, sizeof(*rd), GFP_KERNEL);
+       if (!rd)
+               return NULL;
+
+       for (i = 0; i < nr_rdump; ++i)
+               rd[i].offset = rdump[i];
+
+       return rd;
+}

You do not free rd anywhere in your code.

+static int exynos_srom_probe(struct platform_device *pdev)
+{
+       struct device_node *np;
+       struct device *dev = &pdev->dev;
+
+       np = dev->of_node;

Are you sure that dev->of_node will be always set ?
I see lots of driver who if (dev->of_node) {}

+       exynos_srom_base = of_iomap(np, 0);
+
+       if (!exynos_srom_base) {
+               pr_err("iomap of exynos srom controller failed\n");
+               return -ENOMEM;
+       }

You can use dev_err(dev, "") insted of pr_err

+
+       exynos_srom_regs = exynos_srom_alloc_reg_dump(exynos_srom_offsets,
+                       sizeof(exynos_srom_offsets));
+
+       if (!exynos_srom_regs) {
+               iounmap(exynos_srom_regs);
+               return -ENOMEM;
+       }
+
+       return 0;
+}

Instead of using a global static exynos_srom_base/exynos_srom_regs, why you do not use platform_set_drvdata() ?

Regards
LABBE Corentin

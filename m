Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29821C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 06:04:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3A0C2389B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 06:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbhAUGDu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Jan 2021 01:03:50 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:61836 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391097AbhAUDBF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 22:01:05 -0500
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210121030013epoutp035635cab5ad228bbcefaf6d436759411f~cIA5uO8Q00738907389epoutp03c
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jan 2021 03:00:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210121030013epoutp035635cab5ad228bbcefaf6d436759411f~cIA5uO8Q00738907389epoutp03c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611198013;
        bh=/K8/fjM/acf5faTBjH/xLQTxUnBXrcSiqnrdMVPPNzI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=MrXEQ46XqIfBpP0zBCHqlfYoHHj1ySkiZmK06wHBoro92vuGkbUWMj9FsxV566j4G
         9l37C71IYRPM6D82KRG5pmaO4pzY3+9aKq6f1FYFR+W1uX7p7PrkSXi37pLvKd72AC
         mSYBY2m6W8MFuOGSWLdg7QrURx3i+STQyef43nwY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20210121030011epcas2p4816065c3856aafbd9edf654c9d3c737e~cIA4Du3721234912349epcas2p4f;
        Thu, 21 Jan 2021 03:00:11 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.184]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4DLnF44f45z4x9Pq; Thu, 21 Jan
        2021 03:00:08 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        23.4C.05262.83EE8006; Thu, 21 Jan 2021 12:00:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20210121030006epcas2p40fd4e30ae5bf514b7891a464462db7be~cIAzm4NK-0610606106epcas2p47;
        Thu, 21 Jan 2021 03:00:06 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210121030006epsmtrp2bdcddf256f460113d566700ce9cb3177~cIAzmJIGj0238102381epsmtrp2f;
        Thu, 21 Jan 2021 03:00:06 +0000 (GMT)
X-AuditID: b6c32a47-b97ff7000000148e-b0-6008ee387b02
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        2A.0D.08745.63EE8006; Thu, 21 Jan 2021 12:00:06 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210121030006epsmtip1e470b2d270c480b21b6fd77be83f3738~cIAzZ1Jgt1896918969epsmtip1h;
        Thu, 21 Jan 2021 03:00:06 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH] pinctrl: samsung: use raw_spinlock for locking
Date:   Thu, 21 Jan 2021 12:00:09 +0900
Message-Id: <20210121030009.25673-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphk+LIzCtJLcpLzFFi42LZdljTXNfiHUeCQecyNovL+7Utzp/fwG4x
        5c9yJotNj6+xWsw4v4/J4vCbdlaLVbv+MDqwe+ycdZfdY9OqTjaPO9f2sHlsXlLv0bdlFaPH
        501yAWxROTYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5
        QJcoKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgoMDQv0ihNzi0vz0vWS83OtDA0M
        jEyBKhNyMp61xhW8t6uYvWIeawPjZdMuRk4OCQETid0Hj7F3MXJxCAnsYJT4t/w8G4TziVFi
        +8R3UM5nRok7W6ezwbQ8+jEDqmUXo0T31+esEM5HRonpp46xgFSxCehKbHn+ihEkISKwklFi
        +fOFTCAJZoEyiR93HjKD2MIC9hJzPm8Ha2ARUJV4PPUFWA2vgJ3E/60zGCHWyUucXHsYKi4o
        cXLmExaIOfISzVtnM4MskBC4xi7xftYaVogGF4lFf7awQNjCEq+Ob2GHsKUkPr/bywbR0M0o
        0froP1RiNaNEZ6MPhG0v8Wv6FqBBHEAbNCXW79IHMSUElCWO3ILayyfRcfgvO0SYV6KjTQii
        UV3iwPbpUFtlJbrnfIa6xkPi8aW9YIuEBGIlNi45wTiBUX4Wkm9mIflmFsLeBYzMqxjFUguK
        c9NTi40KjJFjdRMjODlque9gnPH2g94hRiYOxkOMEhzMSiK8jyw5EoR4UxIrq1KL8uOLSnNS
        iw8xmgLDdyKzlGhyPjA955XEG5oamZkZWJpamJoZWSiJ8xYbPIgXEkhPLEnNTk0tSC2C6WPi
        4JRqYFLa5ywb1WaWbV/fnSFlM+O2CMPzd9YLFiy8u8Ssr/RFdrHSNP/3+nHLNEok+85ySRa6
        PHDcvrgm1lzjtKrfz5wUtdw5Yu4rl/vY2YVW2hY9W3/AT+PB0uK7038bdmlLfXma3LDQpUV7
        foKdvIR4x6nAuJPTeyTVN0yfytWafTs87IERV8PeD2tTLMw07ersN/3dLHfYdKq3xH9tW6X+
        nvkh13OTN3b7rX6z2fHpPuYPjMZKyd8un8l6Fzwpo/rQDKt6C5bKtp33H9+5rqi3Lfq2zO/D
        b9KWS5yp/GP0SOjrgjeld75r93l9f20geG9BeaDp7YupXLFTOr7tsam+53d74f7pyWsWStl8
        VhK7osRSnJFoqMVcVJwIAEjt94cXBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWy7bCSnK7ZO44Eg3dLJSwu79e2OH9+A7vF
        lD/LmSw2Pb7GajHj/D4mi8Nv2lktVu36w+jA7rFz1l12j02rOtk87lzbw+axeUm9R9+WVYwe
        nzfJBbBFcdmkpOZklqUW6dslcGU8a40reG9XMXvFPNYGxsumXYycHBICJhKPfsxg72Lk4hAS
        2MEocXnmA1aIhKzEs3c72CFsYYn7LUfA4kIC7xklrlzJA7HZBHQltjx/xQjSLCKwmlFi24Qp
        jCAJZoEKiXX7/4E1CwvYS8z5vJ0FxGYRUJV4PPUFE4jNK2An8X/rDEaIBfISJ9cehooLSpyc
        +YQFYo68RPPW2cwTGPlmIUnNQpJawMi0ilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMj
        OFS1tHYw7ln1Qe8QIxMH4yFGCQ5mJRHeR5YcCUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3Sd
        jBcSSE8sSc1OTS1ILYLJMnFwSjUw5Zt/Mey8eLDQ/kPd09c6bOE2epcnbP7Z9KA9p6Ii4B6D
        UMbO4jWfvsVlqd0pfGTw/tCHxJd13AuUnubk6HMLbH7/9AZ3Y0Lc/LUBznkqt3s/Gx1f/+/c
        5IiJ2+8FFJs3LvjEl7CPO7dvstkzp1u3pVe9uv7YtuL6ZdfWnpk39xwKf/s0N97rkev03Bm3
        Chs5XJzczyyXsnZxWN7n6ZN6wvv5/M1Zk38u8RVJdZF2XnN0zg3D20a5aiteLVDIn50d0jb5
        r3ch1/TFr14tefp/mc26+ct5VSKPqLsHfm6Tn1Dz98gD+7LA7MdFzaymSxhebtzHwJbIdrbj
        /r9Mm3UcM+7tuPz+lGbyhifi6+5O+KfEUpyRaKjFXFScCACOxUrhxAIAAA==
X-CMS-MailID: 20210121030006epcas2p40fd4e30ae5bf514b7891a464462db7be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210121030006epcas2p40fd4e30ae5bf514b7891a464462db7be
References: <CGME20210121030006epcas2p40fd4e30ae5bf514b7891a464462db7be@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch converts spin_[lock|unlock] functions of pin bank to
raw_spinlock to support preempt-rt. This can avoid BUG() assertion when
irqchip callbacks are triggerred. Spinlocks can be converted rt_mutex
which is preemptible when we apply preempt-rt patches.

According to "Documentation/driver-api/gpio/driver.rst",

"Realtime considerations: a realtime compliant GPIO driver should not
use spinlock_t or any sleepable APIs (like PM runtime) as part of its
irqchip implementation.

- spinlock_t should be replaced with raw_spinlock_t.[1]
"

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 16 ++++++++--------
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c |  4 ++--
 drivers/pinctrl/samsung/pinctrl-samsung.c | 22 +++++++++++-----------
 drivers/pinctrl/samsung/pinctrl-samsung.h |  2 +-
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index b9ea09fabf84..0cd7f33cdf25 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -58,13 +58,13 @@ static void exynos_irq_mask(struct irq_data *irqd)
 	unsigned long mask;
 	unsigned long flags;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	mask = readl(bank->eint_base + reg_mask);
 	mask |= 1 << irqd->hwirq;
 	writel(mask, bank->eint_base + reg_mask);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 static void exynos_irq_ack(struct irq_data *irqd)
@@ -97,13 +97,13 @@ static void exynos_irq_unmask(struct irq_data *irqd)
 	if (irqd_get_trigger_type(irqd) & IRQ_TYPE_LEVEL_MASK)
 		exynos_irq_ack(irqd);
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	mask = readl(bank->eint_base + reg_mask);
 	mask &= ~(1 << irqd->hwirq);
 	writel(mask, bank->eint_base + reg_mask);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 static int exynos_irq_set_type(struct irq_data *irqd, unsigned int type)
@@ -169,14 +169,14 @@ static int exynos_irq_request_resources(struct irq_data *irqd)
 	shift = irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	con = readl(bank->pctl_base + reg_con);
 	con &= ~(mask << shift);
 	con |= EXYNOS_PIN_FUNC_EINT << shift;
 	writel(con, bank->pctl_base + reg_con);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	return 0;
 }
@@ -192,14 +192,14 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
 	shift = irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	con = readl(bank->pctl_base + reg_con);
 	con &= ~(mask << shift);
 	con |= EXYNOS_PIN_FUNC_INPUT << shift;
 	writel(con, bank->pctl_base + reg_con);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	gpiochip_unlock_as_irq(&bank->gpio_chip, irqd->hwirq);
 }
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index 2223ead5bd72..00d77d6946b5 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -145,14 +145,14 @@ static void s3c24xx_eint_set_function(struct samsung_pinctrl_drv_data *d,
 	shift = pin * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	val = readl(reg);
 	val &= ~(mask << shift);
 	val |= bank->eint_func << shift;
 	writel(val, reg);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 static int s3c24xx_eint_type(struct irq_data *data, unsigned int type)
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 608eb5a07248..376876bd6605 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -400,14 +400,14 @@ static void samsung_pinmux_setup(struct pinctrl_dev *pctldev, unsigned selector,
 		reg += 4;
 	}
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	data = readl(reg + type->reg_offset[PINCFG_TYPE_FUNC]);
 	data &= ~(mask << shift);
 	data |= func->val << shift;
 	writel(data, reg + type->reg_offset[PINCFG_TYPE_FUNC]);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 /* enable a specified pinmux by writing to registers */
@@ -451,7 +451,7 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pctldev, unsigned int pin,
 	width = type->fld_width[cfg_type];
 	cfg_reg = type->reg_offset[cfg_type];
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	mask = (1 << width) - 1;
 	shift = pin_offset * width;
@@ -468,7 +468,7 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pctldev, unsigned int pin,
 		*config = PINCFG_PACK(cfg_type, data);
 	}
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	return 0;
 }
@@ -561,9 +561,9 @@ static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
 	unsigned long flags;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 	samsung_gpio_set_value(gc, offset, value);
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 /* gpiolib gpio_get callback function */
@@ -626,9 +626,9 @@ static int samsung_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 	ret = samsung_gpio_set_direction(gc, offset, true);
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 	return ret;
 }
 
@@ -640,10 +640,10 @@ static int samsung_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
 	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 	samsung_gpio_set_value(gc, offset, value);
 	ret = samsung_gpio_set_direction(gc, offset, false);
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	return ret;
 }
@@ -1057,7 +1057,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 		bank->eint_offset = bdata->eint_offset;
 		bank->name = bdata->name;
 
-		spin_lock_init(&bank->slock);
+		raw_spin_lock_init(&bank->slock);
 		bank->drvdata = d;
 		bank->pin_base = d->nr_pins;
 		d->nr_pins += bank->nr_pins;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 379f34a9a482..de44f8ec330b 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -171,7 +171,7 @@ struct samsung_pin_bank {
 	struct gpio_chip gpio_chip;
 	struct pinctrl_gpio_range grange;
 	struct exynos_irq_chip *irq_chip;
-	spinlock_t slock;
+	raw_spinlock_t slock;
 
 	u32 pm_save[PINCFG_TYPE_NUM + 1]; /* +1 to handle double CON registers*/
 };
-- 
2.30.0


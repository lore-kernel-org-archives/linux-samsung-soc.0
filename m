Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAFB18E02D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126281; cv=none; b=XsDROXtPHRFx/OM+9YVm6TGpP1k2GDpS6p2HYF36/hGqHZ4moEEBtMfn86t8U4CNApuXfR4zS7p2j4fndpIXBjrvruFyFSAKtCh3KjZ8Yc+H6pjy7X+zSLmqzaGrDhjgUNTXZ8Ja22GbXYlGl9z1RCNkl48enKID13COeXA2O4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126281; c=relaxed/simple;
	bh=quFHR8pTn+F+xGctBH9cf3497p01fCYxd5i3Wn9fVPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p3z2trneI5OuEw5AhMsUp0OuWVxQxXxAuyQgIv02BxrBTEbJJx4vU5+L0WvCEk8P3aZzfI4ABNyU45JRXLjnr59ZKPeW4TYGQkoCGzKc4VtpoLUzlV6JUWg0TeIfyQwexQaSNpe3VV64o//wiySSQMeQteVO/VcXtjsYpRwevz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIK83puT; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIK83puT"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5b9d48d1456so1618684a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126277; x=1723731077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaLjrFsw9Zi0L/EdvO9DIKyYpEUrx6lEBXaptLR+VmU=;
        b=hIK83puTKdcgW8oz8MhVeFbIDB97g2ochkIYEKNgLkpdkuhZPC2xs+tu7mcj4lJWCg
         SnKXv/JYOlmLeZUOprA/RHTBpLdYL4cVeeYnyvv6AEXRkzYW+6NJxfUzE2g+TPonKgQA
         iRbbfGlEZgI71tBNaM90ArBgdA/h20waFpnYBDsENRVVUCBBftO4DOiuEasCWABX4Xfc
         FDWt3S87BaoxhA4/RkTc3mm6FkV/srYWjFHy1QGj5y89C7/2cQRIWVdk0EKpvH5vc3h+
         Iv9BlIvbzZpPmY/I3B98mCjcdXJoPQoNxEttb6m9VOvsdD4FhcE5cnMyeoIIvIRrE8ma
         jCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126277; x=1723731077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaLjrFsw9Zi0L/EdvO9DIKyYpEUrx6lEBXaptLR+VmU=;
        b=FdSmUYFteF4OO48HHF99bkUbpZJjnDOYawZ29MG+Z3AMGQ6df+DFYAMjZV7OymnN5h
         612e5w/4EJZby+el/TZNdJ0N/Kbf6s3NScUzYCkR2UCqjIy9yGlf40XuBpVr0V2SafH1
         XWxaMdbuegowPgn7oaP2vexD+Q2A4JRdfBSDpkZ6qRZLPO9inJh7tT9WnIRKJJwKBsHt
         dKqa50zbP4auMaSidd5UsjYR9BSkGpKLgHxaNpIzALA6RlvhxEm7Vv+R+nJSRJcg/2X5
         MUzUt2Zsxti9fENC1Qo3XAHKIh1/lFxshZab/Z8DxCrzN9G5kJuHSWTmz0Y4X5SnyOb6
         VNng==
X-Forwarded-Encrypted: i=1; AJvYcCVx6fI+MNjMwv/pJmkJwEXDIGt15OseCJ7ZtMkYi74sPU6ubjwKHNJU/GbSlYCVqXU9bfRe60T+9TBuXNlmu6dloQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH0yKhB0QolYwRiyed26b0G9TmVdbu8Bp433cbGw4w3staokbu
	MF9HipbFMSO4VZpy1wrZOPF7HVVkLRCnor0JwSWjSZulCgh81Ym0E8/isS9gnt0=
X-Google-Smtp-Source: AGHT+IF2Z+gOOpOJVUcuLSGq7/jhh5CJfmmh1hSytACnK5GYE20eb1XtkmCCnKm8aJbOYVVy6x+hag==
X-Received: by 2002:a05:6402:3585:b0:5a2:bfd1:b892 with SMTP id 4fb4d7f45d1cf-5bbb3c41273mr1981407a12.11.1723126277143;
        Thu, 08 Aug 2024 07:11:17 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:16 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:15 +0100
Subject: [PATCH v5 01/20] clk: bump stdout clock usage for earlycon
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-1-11cffef0634e@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

On some platforms, earlycon depends on the bootloader setup stdout
clocks being retained. In some cases stdout UART clocks (or their
parents) can get disabled during loading of other drivers (e.g. i2c)
causing earlycon to stop to work sometime into the boot, halting the
whole system.

Since there are at least two platforms where that is the case, i.MX and
the Exynos-derivative gs101, this patch adds some logic to the clk core
to detect these clocks if earlycon is enabled, to bump their usage
count as part of of_clk_add_hw_provider() and of_clk_add_provider(),
and to release them again at the end of init.

This way code duplication in affected platforms can be avoided.

The general idea is based on similar code in the i.MX clock driver, but
this here is a bit more generic as in general (e.g. on gs101) clocks
can come from various different clock units (driver instances) and
therefore it can be necessary to run this code multiple times until all
required stdout clocks have probed.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk.c               | 129 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk-gs101.c |   1 +
 2 files changed, 130 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7264cf6165ce..03c5d80e833c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4923,6 +4923,131 @@ static void clk_core_reparent_orphans(void)
 	clk_prepare_unlock();
 }
 
+/**
+ * struct of_clk_stdout_clks - holds data that is required for handling extra
+ * references to stdout clocks during early boot.
+ *
+ * On some platforms, earlycon depends on the bootloader setup stdout clocks
+ * being retained. In some cases stdout UART clocks (or their parents) can get
+ * disabled during loading of other drivers (e.g. i2c) causing earlycon to stop
+ * to work sometime into the boot, halting the system.
+ *
+ * Having logic to detect these clocks if earlycon is enabled helps with those
+ * cases by bumping their usage count during init. The extra usage count is
+ * later dropped at the end of init.
+ *
+ * @bump_refs: whether or not to add the extra stdout clock references
+ * @lock: mutex protecting access
+ * @have_all: whether or not we have acquired all clocks, to handle cases of
+ *            clocks coming from different drivers / instances
+ * @clks: clocks associated with stdout
+ * @n_clks: number of clocks associated with stdout
+ */
+static struct of_clk_stdout_clks {
+	bool bump_refs;
+
+	struct mutex lock;
+	bool have_all;
+	struct clk **clks;
+	size_t n_clks;
+} of_clk_stdout_clks = {
+	.lock = __MUTEX_INITIALIZER(of_clk_stdout_clks.lock),
+};
+
+static int __init of_clk_bump_stdout_clocks_param(char *str)
+{
+	of_clk_stdout_clks.bump_refs = true;
+	return 0;
+}
+__setup("earlycon", of_clk_bump_stdout_clocks_param);
+__setup_param("earlyprintk", of_clk_keep_stdout_clocks_earlyprintk,
+	      of_clk_bump_stdout_clocks_param, 0);
+
+static void of_clk_bump_stdout_clocks(void)
+{
+	size_t n_clks;
+
+	/*
+	 * We only need to run this code if required to do so and only ever
+	 * before late initcalls have run. Otherwise it'd be impossible to know
+	 * when to drop the extra clock references again.
+	 *
+	 * This generally means that this only works if on affected platforms
+	 * the clock drivers have been built-in (as opposed to being modules).
+	 */
+	if (!of_clk_stdout_clks.bump_refs)
+		return;
+
+	n_clks = of_clk_get_parent_count(of_stdout);
+	if (!n_clks || !of_stdout)
+		return;
+
+	mutex_lock(&of_clk_stdout_clks.lock);
+
+	/*
+	 * We only need to keep trying if we have not succeeded previously,
+	 * i.e. if not all required clocks were ready during previous attempts.
+	 */
+	if (of_clk_stdout_clks.have_all)
+		goto out_unlock;
+
+	if (!of_clk_stdout_clks.clks) {
+		of_clk_stdout_clks.n_clks = n_clks;
+
+		of_clk_stdout_clks.clks = kcalloc(of_clk_stdout_clks.n_clks,
+					      sizeof(*of_clk_stdout_clks.clks),
+					      GFP_KERNEL);
+		if (!of_clk_stdout_clks.clks)
+			goto out_unlock;
+	}
+
+	/* assume that this time we'll be able to grab all required clocks */
+	of_clk_stdout_clks.have_all = true;
+	for (size_t i = 0; i < n_clks; ++i) {
+		struct clk *clk;
+
+		/* we might have grabbed this clock in a previous attempt */
+		if (of_clk_stdout_clks.clks[i])
+			continue;
+
+		clk = of_clk_get(of_stdout, i);
+		if (IS_ERR(clk)) {
+			/* retry next time if clock has not probed yet */
+			of_clk_stdout_clks.have_all = false;
+			continue;
+		}
+
+		if (clk_prepare_enable(clk)) {
+			clk_put(clk);
+			continue;
+		}
+		of_clk_stdout_clks.clks[i] = clk;
+	}
+
+out_unlock:
+	mutex_unlock(&of_clk_stdout_clks.lock);
+}
+
+static int __init of_clk_drop_stdout_clocks(void)
+{
+	for (size_t i = 0; i < of_clk_stdout_clks.n_clks; ++i) {
+		clk_disable_unprepare(of_clk_stdout_clks.clks[i]);
+		clk_put(of_clk_stdout_clks.clks[i]);
+	}
+
+	kfree(of_clk_stdout_clks.clks);
+
+	/*
+	 * Do not try to acquire stdout clocks after late initcalls, e.g.
+	 * during further module loading, as we then wouldn't have a way to
+	 * drop the references (and associated allocations) ever again.
+	 */
+	of_clk_stdout_clks.bump_refs = false;
+
+	return 0;
+}
+late_initcall_sync(of_clk_drop_stdout_clocks);
+
 /**
  * struct of_clk_provider - Clock provider registration structure
  * @link: Entry in global list of clock providers
@@ -5031,6 +5156,8 @@ int of_clk_add_provider(struct device_node *np,
 
 	fwnode_dev_initialized(&np->fwnode, true);
 
+	of_clk_bump_stdout_clocks();
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_clk_add_provider);
@@ -5073,6 +5200,8 @@ int of_clk_add_hw_provider(struct device_node *np,
 
 	fwnode_dev_initialized(&np->fwnode, true);
 
+	of_clk_bump_stdout_clocks();
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_clk_add_hw_provider);
diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 85098c61c15e..1759eb23263b 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
+#include <linux/of_clk.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/google,gs101.h>

-- 
2.46.0.rc2.264.g509ed76dc8-goog


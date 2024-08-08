Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C9218EFCE
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128172; cv=none; b=lxqu41FjuRRSs7EAcRVQT8fY4/iTAq4gfgTbyb6ySaN+/aAT37+5Y6G9OLZaeewGlU3ZDz7AIxmm70sUFVS0sRyN5fEtHE9Z3fa8lwKWGZ9tEoEd608BvVnKJgHsBFhbpF2qycy+/OgpfmjzOy62YUCyvqyQQy7Lk/6H5ozJ0ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128172; c=relaxed/simple;
	bh=yNHDH9cROFXgCo6+xkemY/PjpYdZ+ompFIQkHrU5f8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aSm8pblBDGdgQLgBrrG8CIT6GkQNfZUBG4EDWtJ3kKHslkO+ovxUp+y6y/Bs60sd6TEZYe3crFlYzRhFtUlSkpDipjOVjbpXRLEtOYc916qcKAVfxAu30WvdHBSC54Y/2fmWBCZyMhYOJ5tikX2tpOt67N45OG/AvAczlWNNWRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q4j4pvlb; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q4j4pvlb"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7de4364ca8so129001566b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128168; x=1723732968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAtcktpsyK1IopCF5kU8mOGUnH018rQKQhDOBPxOSZw=;
        b=Q4j4pvlboitdFD0EN4fazVQfdDypYEbt3qgC4DZstck5L9fhSTMiR/jzlJ+RlVGW1g
         Ge/cOcnQONtnZNDFnlfcHGByByT3lIVZF0nxg+09WhAVS9Pk++ATKgJCRjlvFnP+Iq6W
         EbPAS4flAaWHX/Nuka1l9SByrBeL7ZEXe/080HxQQIrOtxc5XL9zHEyXCRxRORS1FG2T
         lGaCkJ5OdR1iKYsr8pZUGuNnU8NTBuo7Kp5tRhxPdmOxlveiJhpiQA7JNyn2IAhTZmPG
         850SeGBpCEL35ODXHGvTAqDrQQKatXBMSjARmPwwzAZPBLGxJxh9a4ShTSEzeGqvlaZV
         eD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128168; x=1723732968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAtcktpsyK1IopCF5kU8mOGUnH018rQKQhDOBPxOSZw=;
        b=EiTMapLFguSXy1BuZ3o+kdZTCpoZbb3oebBMqZzDnMZ13i43GWpyN/4OqvnKR3r+4N
         Gr4gX+ezv9rsUbllUNHz2Fd1ed/FjmWAAqZq7eTn+G/R/qMZShfRWJVBbZEsjBkXgU8R
         xldsVK8Jcbvsg/XD9aA7J2xgPAYMPgxWJqZsbwaHhbgPMuQJBNBSP7/+rqjkfJf1jEZX
         f4owa6W77uRaHZY9iKjK/A4t7o74lMYVn5aY92qUfTBRTQM7UWOKbNelUm/C/1VmMzcl
         F57W+1QRALMb0CUTvsBM/NzpCyZJs97l51JcNPyGRjh++ixIcOMUZxelRuiMnDyI5q9B
         NIoA==
X-Forwarded-Encrypted: i=1; AJvYcCUlu1IksIpVPXwsB62cUmjxJ4t6CggWSMqPrgF9ake6VuvmISG1WWZqNsxYL31YQkNgzwu0PPOtBzCzgX2tTJdD7MCwdzSvVLoAoo12AvDMbRg=
X-Gm-Message-State: AOJu0Yz2UFuF1X61reyj7Xm/2JP8QqSGRdHJCO/ze79aaEoTktmsdTt2
	A101hv8IOrifowZ2ICkvO9soBoTZgok8ZMM3AnJvUDNI2OtMjrGy16j4ITb449c=
X-Google-Smtp-Source: AGHT+IFKqWTwUTF9It4/KiFcH08kll66MLBeAiBxCYt6pGnnfGGyfN4DPvbUWI5sbCigMk5HvKV9ng==
X-Received: by 2002:a17:907:c7d4:b0:a7d:a00a:a9fe with SMTP id a640c23a62f3a-a8090c83b95mr144065666b.17.1723128168207;
        Thu, 08 Aug 2024 07:42:48 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:47 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:42 +0100
Subject: [PATCH v6 01/20] clk: bump stdout clock usage for earlycon
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-1-e91c537acedc@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
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
v6:
* drop a stray #include from drivers/clk/samsung/clk-gs101.c
---
 drivers/clk/clk.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

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

-- 
2.46.0.rc2.264.g509ed76dc8-goog


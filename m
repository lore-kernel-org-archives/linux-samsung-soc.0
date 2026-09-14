Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8BD429013
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 23:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427158; cv=none; b=aWLRklBXl+eKpNFiEbMX0bA3LbG0QhSacn7eYAzcA0fXcMyOG7aK7g+KZd/0kL4gkabjb/Lw3Uh1jRdOF7xqehzExpuVEHADM0cv6rmz5NP2tlgZAThg9ekkZqk0vT9PvWD89+KafTh3MhKv3RRlduPAMRELAcxVoLQv+WI1OmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427158; c=relaxed/simple;
	bh=LL9/CFfn7brpN4GoNpkA5AZ4Gnfvk9onVtuLOpwNb0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebbsaOEvtRHy0LXmLt/wSLzn4LMaUMx+xRGW/hGLjMmawtAWBzpJGkNOgCnWD7GMoU+/P0nimqwtZgp9LUDWVfXExjiAZ8dSSyWtSzbhVBjk6Diyu5nzXW6BU5ojr387/trE0bjB3ZlWvtR4sAyMCg+/0HX410NvQSxmoX+AqkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdFvL0qE; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdFvL0qE"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so1366389f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789427155; x=1790031955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzV23OsQcR796zildVLZdcKUHcQM8u6Rrj7Y41au9L0=;
        b=pdFvL0qEKuFqOG1EQ6XsIo1HIO1tTf4PvjyRqpEcAgzDTPmDnzwUxSGccnQ0rb10ZJ
         qaKfRd00uMJG6hioUkde2OAm3xKUCZ9LLMLpQXbI+8Kw064OHi5wf2Ey/PQBLtjURLfc
         RUrRpvOkdgZO3J6bgWMrWYPkt21RSdgAElcXTydpFfglf7lR1nVhfJF9WW663PwXHBIj
         8qG3qjs5S936lghS6uCF+It6hR7VsMKa+TAUEoL4uvCODNvkwLSmVIXJXTs/aUfTb8fu
         eZLQo9gVMoYNjLlROanHpIHyFbi6O+YdvVgyW4ec9nRRqu3T3YmYkBO6omhTk6FM0/s0
         fMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789427155; x=1790031955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzV23OsQcR796zildVLZdcKUHcQM8u6Rrj7Y41au9L0=;
        b=u3ZuOt8VYxUI0hcnGMl8PtpF3TABA9J23iIht2ZU+A+OPJhugC075NIFBj5TsL/6dl
         TdAmlPwSfHSr4q1sf94Znwuu4QSPfmLRqmTXVsjHRiCfxdcZ05U1fXmSGLR4cv3JZ6a3
         wWYkI1mMm1TTOWQrl7KmcRNgUFNF9bU4HHn9I2rECra9iLw6hnefbm38FZ8Y29+bRN4w
         lZp8KhGwHmXnfW74DpyIz40mC5wu70afkKQxXieIDVS48foS4KWf90f95/TsEX0vx3zV
         UdPU5nE3kdqdcAARMibaWDcDjy3hRCbk9Mb+Na88b9bcpwFJ+UrXuRGUU2IDrrrPMDL4
         4rIA==
X-Gm-Message-State: AFuF++mUFbp/bksPHX3s1j0uKkaU/COSFHS5FhUPT0V1jiGiwqBU6RIQ
	USB5M0e8HqruSDSpHVFl6lIdlTlOd8M78gKuv/PtP3NIrHDdA18kEgX95Ouym+wJjho=
X-Gm-Gg: AYBFou0JIK+VxOCa1ZN+Jg2A85jQoZOqGOliQyuQSVXXPbL2A9OSiWaRnEhVVlunGPv
	EpiCFU9WN6zZ7WQ/9VtRN5U/8R6SRG2nAH18G1Foq+0P9nAfUgZ7lBJkadQpF3GF+F5icY5wdgn
	nTpuhaMBSaxMEHwL/wKUcR7qLhEEYxK53Je4yEZWFgLohEop2ARy2NLbRn7pap3eXCPPOjXf8Yz
	AL9tYV2xE0zWYAM5gl82N6U/+s63IVgR/zmy+1hJ/M81gtHeSMi0MWLmZt9C4w45fg4IQgkXsgm
	WfdMlkqMMA+NWhFCYVKjc0GPfC2zIk1kS/WZTzkFwOqsFQIh4NXTX5Vj8BYcnO3GXU3XNGfOTBZ
	8El6bSyx4Su85S6Tj6Ny1CPO/igAwIjuH6zDqsElEILJ+1mDAC88R93IFS98NK6EnUZ9leupaFM
	oHNTpYsjFzdT/YEB5bjdeladv/Dcujfw8sq6sBvM7rICXYO+cShVKIMv8nDc6MkufACGWBf6sYf
	EE7xfxv8BEjo0w5TH1mQuw1MZd2gMiXGHH57hTk/k9rvohSysg/hNkJSvanKq8=
X-Received: by 2002:a05:6000:5ca:b0:487:24e:27fb with SMTP id ffacd0b85a97d-48702b139dcmr5406922f8f.38.1789427155095;
        Mon, 14 Sep 2026 16:05:55 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d5f1sm32098817f8f.12.2026.09.14.16.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 16:05:54 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 15 Sep 2026 00:05:44 +0100
Subject: [PATCH v2 2/2] clk: samsung: acpm: add Exynos850 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-exynos850-acpm-clk-v2-2-ffad4a6b3fb1@linaro.org>
References: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
In-Reply-To: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC utilizes the APM co-processor for clock management
via ACPM, similar to the GS101 SoC.

Add the Exynos850-specific clock variant array (including mif, int,
cpucl0, cpucl1, g3d, aud, cam, disp, and cp) and wire it up to the
driver data infrastructure. Add the "exynos850-acpm-clk" device ID
to enable dynamic instantiation of these clocks during probe().

Unlike GS101, the ACPM firmware on Exynos850 does not implement a
dynamic rate read call over ACPM IPC. To return sane clock rate in
->recalc_rate introduce a SoC-specific ->get_rate() driver data
callback. For Exynos850, this falls back to reading the upstream parent
CMU clock rate.
When ->get_rate() is set, populate pdata.fw_name during clock registration
to let clock framework to link the parent clock.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/samsung/clk-acpm.c | 46 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index 4b68b44fe615..9f46fbdd999d 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -22,6 +22,7 @@ struct acpm_clk {
 	struct clk_hw hw;
 	unsigned int mbox_chan_id;
 	struct acpm_handle *handle;
+	const struct acpm_clk_driver_data *drv_data;
 };
 
 struct acpm_clk_variant {
@@ -32,6 +33,8 @@ struct acpm_clk_driver_data {
 	const struct acpm_clk_variant *clks;
 	unsigned int nr_clks;
 	unsigned int mbox_chan_id;
+	/* For SoCs where ACPM firmware doesn't implement get_rate call */
+	unsigned long (*get_rate)(struct clk_hw *clk, unsigned long parent_rate);
 };
 
 #define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
@@ -41,6 +44,18 @@ struct acpm_clk_driver_data {
 		.name		= cname,		\
 	}
 
+static const struct acpm_clk_variant exynos850_acpm_clks[] = {
+	ACPM_CLK("mif"),
+	ACPM_CLK("int"),
+	ACPM_CLK("cpucl0"),
+	ACPM_CLK("cpucl1"),
+	ACPM_CLK("g3d"),
+	ACPM_CLK("aud"),
+	ACPM_CLK("cam"),
+	ACPM_CLK("disp"),
+	ACPM_CLK("cp"),
+};
+
 static const struct acpm_clk_variant gs101_acpm_clks[] = {
 	ACPM_CLK("mif"),
 	ACPM_CLK("int"),
@@ -58,6 +73,19 @@ static const struct acpm_clk_variant gs101_acpm_clks[] = {
 	ACPM_CLK("bo"),
 };
 
+static unsigned long bypass_acpm_exynos850_get_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	return parent_rate;
+}
+
+static const struct acpm_clk_driver_data acpm_clk_exynos850 = {
+	.clks = exynos850_acpm_clks,
+	.nr_clks = ARRAY_SIZE(exynos850_acpm_clks),
+	.mbox_chan_id = 0,
+	.get_rate = bypass_acpm_exynos850_get_rate,
+};
+
 static const struct acpm_clk_driver_data acpm_clk_gs101 = {
 	.clks = gs101_acpm_clks,
 	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
@@ -69,6 +97,9 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
+	if (clk->drv_data->get_rate)
+		return clk->drv_data->get_rate(hw, parent_rate);
+
 	return clk->handle->ops->dvfs.get_rate(clk->handle, clk->mbox_chan_id,
 					       clk->id);
 }
@@ -89,14 +120,23 @@ static const struct clk_ops acpm_clk_ops = {
 };
 
 static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
-			     const char *name)
+			     const char *name, const struct acpm_clk_driver_data *drv_data)
 {
 	struct clk_init_data init = {};
+	struct clk_parent_data pdata = {};
 
 	init.name = name;
 	init.ops = &acpm_clk_ops;
 	aclk->hw.init = &init;
 
+	/* If get_rate is set, the SoC relies on parent topology */
+	if (drv_data->get_rate) {
+		pdata.fw_name = name;
+		init.parent_data = &pdata;
+		init.num_parents = 1;
+		init.flags = CLK_GET_RATE_NOCACHE;
+	}
+
 	return devm_clk_hw_register(dev, &aclk->hw);
 }
 
@@ -145,13 +185,14 @@ static int acpm_clk_probe(struct platform_device *pdev)
 		 * The code assumes the clock IDs start from zero,
 		 * are sequential and do not have gaps.
 		 */
+		aclk->drv_data = drv_data;
 		aclk->id = i;
 		aclk->handle = acpm_handle;
 		aclk->mbox_chan_id = mbox_chan_id;
 
 		hws[i] = &aclk->hw;
 
-		err = acpm_clk_register(dev, aclk, drv_data->clks[i].name);
+		err = acpm_clk_register(dev, aclk, drv_data->clks[i].name, drv_data);
 		if (err)
 			return dev_err_probe(dev, err,
 					     "Failed to register clock\n");
@@ -162,6 +203,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id acpm_clk_id[] = {
+	{ .name = "exynos850-acpm-clk", (kernel_ulong_t)&acpm_clk_exynos850 },
 	{ .name = "gs101-acpm-clk", (kernel_ulong_t)&acpm_clk_gs101 },
 	{ }
 };

-- 
2.51.0


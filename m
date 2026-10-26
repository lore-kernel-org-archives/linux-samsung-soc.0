Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030502;
	b=PY1fYnI0rN1ThUmKRSL+chXiw8f0wO8KWI1j6jq/ESKGR5zJrV2Sr+OVE++MMWBfWJLp
	 F2GXr2LDnZTpo1X6dWc/ivWPuYmwG2mzCafVUrlvirZJU5erJ9uBE/hEtHFFExz3UVrMD
	 KDnZO+gQKIaj9ref+5mzyHBUz6vQWMArk4NFiLwfFv/CoQ+/QnewwED1eeoqyHeHFLvdE
	 BK6T0h8hbA0nFqRjzp1PwSpZGdRZoYTgZiNrqR6YS0aXSWTuTVmCdmyyU7f8uR8jWW5hG
	 EBf05he5UFmtzmqtOn/oXvgdA9q/xzqZIt55qEoTjX6sHCCw76mZszQ83ABZdLyu4Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EZQIogsZeMKc8icauriJLlFLU0mrhDSe8yDu+EjToX4=;
	b=IIF0+T8ndT8+7khZdDiONWVkZDupPCKxEjkxtBqar7TRmbMRodQkkbcK1sTR9vCZk701
	 hjUx418lk7VDvI1rLZ8sdfdUcI4eXhuIIwiemwPtMZ2cmGazZajZlsKDu2+fsRogVVuOi
	 7yGUr26ZFmT905FJCK15XL0YDq35SZMczXtSPNhzBroEDqvS2QocqvgccyvO+cIn058G4
	 l0omakVdKPdb14NLQzt7s0wAdE5RjIdWjcz3OVE2UI/Tj9n+KVUyu3l5WOu6gPBxsIN6f
	 9ytn4hD5ezncETzq7J57p3kMXJMPqfY4gcXPuXBH6dQ8sigh1EMuy+xdtFQErE+Pb2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZRqnti+8;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5E9606A324
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5E9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZRqnti+8
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4322d310e7so467107666b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030487; x=1793635287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZQIogsZeMKc8icauriJLlFLU0mrhDSe8yDu+EjToX4=;
        b=ZRqnti+8byxePhKwYMdYoyvObrLQhX7R7ZIPDQH7df9CjKIz9grfAbYYoxxawRgTVp
         nUiHWKRl6FUYvwYCId2an2IHwGjTIhtUafJ26vNvWpso0bM9R76cY5P8+Z+oODO7XYkB
         voCVadBvS1Ylc9VumQL/lxITuM5gs8sEPJn73W2HkNaC3x8X0Y8osXO4ppdEG7GFRxLf
         YSLfHfs48e9OaRI4Enp7jBgbGad/RO7OYsiuvJB4xZE3lUcUujr7MFPPpqPysjYAqMML
         LJWob/w3vzHiJDIxzw2rdHJPrjX4sILEsgeKgb/BcMiIN3h+FpNHeYdHpoahaUZ4/UPr
         +2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030487; x=1793635287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZQIogsZeMKc8icauriJLlFLU0mrhDSe8yDu+EjToX4=;
        b=q38stSJIHLDDSb+UdXJbZKnxHnfJsje24YBLeIlbA363uXeETNhtRlb23SzLgMRmck
         Jk43jwZgewhlBgR4xuTjBn7iqPw1GsMpXxvNNCUEm54+k6VrSbl/LOxHVqjs9COQRM4i
         a+QzQDCCa1jwIyQ/pid3jnU8Q9U1+fvx2pauSeDpghTzrzGN8f3vzfSGfVtg2tcQfVuU
         JAPI/t1/BCv/rAfJTODKliZOG/TlpqsmjZRIIj0IweD3ZPYLLQ+hlWEneEf6z3VeXnEF
         hwUbbuslzZVS2SlKRu6OgEILDrDriJ4p6iSXEBGf1mDsf52KVBI49FUFJMg4/qlTBMmT
         Ccmg==
X-Forwarded-Encrypted: i=1; AKwUvBy3NqEZKiufIDm8Bvbfk/qVPwv5xtRlmzpWJKoxOA1D2Hk6oWYetqDW1ZIjsTTlG8NUPDCENPgweCoZKooKBD54tQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIckiHHw/FDBENVG3z0YURs3c/5decDA3mqdtRsDyQxhSRW+MEs
	dVUOMsEg1tcSFgAs9RjrmR+qyVG60Y6TnnE7IPIwJXLRDLUgd+4nYlYl544a2lFya/o=
X-Gm-Gg: AYBFou2kkgW1UMKmxWlZg9STrCAIsOwCfxiN15PDP02Bub9HD+ZxgC9yX2mPSvGtHGG
	0Os94YfArWSPh9SQIdfOgAATztXuKfWVnMzkLeWuP9wVzuonrLccDCzYf+4bLtd5uG5yvRMyORm
	cnRui97DrgMFQTyUiaJLkVdcJqh1fKzWJ0HTZZEnsNmv+3ggT7jVRQ/QOm/IGczXNuHMnCP7fmP
	8D4BAyRnuudfrzNRrjj+SSAzVKrGsabBc29ghy08bJowUXObddU9noBBdzDBJCT3fZGaNGAnPzA
	TQAjLgcDwzh8JaMjPYH1q+teXA0DWlMiN1DvOzCR2so49po0YI+ni9OxCZpk+9+SrqQlXcrrQkF
	GL8UKQCwy9N9m23kQpPBgHibwoBgNX7Kw+n0svTE8MKXfELZNgx3aHc3s4E4gZlIx+nQ4/vsh0+
	dlWcng0P9L2LmvXZ9P4oZkXxG2u2WZbXSXhp5uNiGbp6SxNp3LiEKLjo4l1n8N+WsF/kns0pyr+
	IuvBjKeaVFRKyux7MHhY7BFuEIt3hGQIMzaFmAULVAum4uAEGb2zvXAxdwH/3yUYgH3Iq+/JOri
	7dlKADBYy38sXWIpfHZyb8fpil1tP0jW/433wQ==
X-Received: by 2002:a17:907:6ea5:b0:c32:3da2:69bf with SMTP id a640c23a62f3a-c46bde8a540mr860179566b.30.1793030487233;
        Mon, 26 Oct 2026 09:01:27 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:26 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:21 +0000
Subject: [PATCH 04/15] thermal/drivers/samsung: acpm-tmu: Disable IRQ
 across system suspend/resume
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-4-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=2590;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=VungbphQq4N0jonOAgd10JUjrmj+uUeuGFdaY8Jr4Ow=;
 b=OlMBwVWV0K+I8MCQ7zTlId1NV0MOWldwb7ipLvJ1oDsDkvYkIkS52kjOcu7TB34yhnLWRvFsp
 3sUgZ++lT1yDBe1R+EvobwvPfYXh3UH1OsPkt2wDOLMdyswAKf4YaPM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The PM core masks device IRQs in dpm_suspend_noirq() and unmasks them in
dpm_resume_noirq(), leaving the TMU interrupt enabled after
acpm_tmu_suspend() and before acpm_tmu_resume() while runtime PM is
disabled and PCLK is gated:

1. If acpm_tmu_thread_fn() runs in that window,
   pm_runtime_resume_and_get() fails with -EACCES and returns IRQ_NONE
   without clearing the level-high hardware interrupt, triggering an
   unhandled IRQF_ONESHOT interrupt storm when the line is unmasked.
2. If acpm_tmu_thread_fn() is already running when acpm_tmu_suspend()
   executes, pm_runtime_force_suspend() ignores usage_count and gates
   PCLK underneath MMIO INTPEND reads.

Call disable_irq() at the start of acpm_tmu_suspend() to mask and
synchronize the interrupt before tearing down sensors and runtime PM,
and re-enable it with enable_irq() on acpm_tmu_suspend() rollback and
before returning from acpm_tmu_resume().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org?part=2
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index f490551de69a..55ee97218f47 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -541,6 +541,8 @@ static int acpm_tmu_suspend(struct device *dev)
 	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
 	int ret, restore_ret;
 
+	disable_irq(priv->irq);
+
 	ret = acpm_tmu_control(priv, false);
 	if (ret)
 		goto err_restore_sensors;
@@ -568,6 +570,8 @@ static int acpm_tmu_suspend(struct device *dev)
 		dev_err(dev, "Failed to re-enable TMU after suspend failure: %d\n",
 			restore_ret);
 
+	enable_irq(priv->irq);
+
 	return ret;
 }
 
@@ -580,14 +584,19 @@ static int acpm_tmu_resume(struct device *dev)
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		return ret;
+		goto out_enable_irq;
 
 	/* APB clock not required for this specific msg */
 	ret = ops->resume(handle, priv->mbox_chan_id);
 	if (ret)
-		return ret;
+		goto out_enable_irq;
+
+	ret = acpm_tmu_control(priv, true);
 
-	return acpm_tmu_control(priv, true);
+out_enable_irq:
+	enable_irq(priv->irq);
+
+	return ret;
 }
 
 static int acpm_tmu_runtime_suspend(struct device *dev)

-- 
2.56.0.257.gf7497c7d27-goog


Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F562556C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Dec 2023 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Acal+pj5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40d48304efdso3968755e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Dec 2023 08:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703264084; x=1703868884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2C5UTNIPG7mjByyTbN4UUYUJWv2TfPmtilLr3g/kHI=;
        b=Acal+pj5ltoXwBdUReQyg/omMeFy1jj5Lxj6mhz51FAs58aI/exFwygV2ItRqsW301
         6+vfgPxkEiNGz/weGDz4ovq0SwJtKWiCZdpgbfbPxQ2hknWsSXRxE53opZwlvKXqIslY
         4uzUrkALoOC9r0syqwfDwN8MW/7D9MnBArpr84cH/Ym27nrSN0UiQrw7woE7QjpEMSaw
         MPnMGcfaixVYLMM+7WqP+6rKknmcvgoczrvr9NezTvdnYWNjg88PzBw1WLqpps8sL2qU
         AjJycwSglELdYIpdGDjCi66QXDVxe9UGzPFkbbKJYKAaurM7hF3QM0gEDiSONVSyb6CM
         Epyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703264084; x=1703868884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2C5UTNIPG7mjByyTbN4UUYUJWv2TfPmtilLr3g/kHI=;
        b=JbRNZJjhfDLxK7c1I7hHI5q3XRw+V+TOe1ML2SYsKMDudd5z7MYxgA0TsD5VvlIaUf
         zxkZcvIyLyPLSYS9/grJTf2PF16WPWbbLY8p2EKiKP6JUd9p/4M1HfrZcH8k34or7x9y
         VNRyMCvGOz2wwxcHBhgwVUiWNuyUwy6Jpdd9HWuhd27c9e4u4Kr8mEhgfy+cUZVcwkiK
         PAJu5AvYl7r/2jJJL391yRJ96w4C25sZWLVj+EyTJQsfr/baBfeMrLL1KMuPRL9xjWjW
         b/3Pr5CoxgaiTOPTUzPqypJaC9Np1a70rRFXGR/QyQFH/qO2g2cAKY4wRljE8U6ZEcOy
         COYg==
X-Gm-Message-State: AOJu0Yxpbw7S+5/rHROtryjjmUqr+OqttkTOjbC0qZFTDomivDrVxv7g
	GGSiTy3gHImiLcou8UBL40T6ZhJQPMqMkw==
X-Google-Smtp-Source: AGHT+IEDtRq/ZQw8ts0TCzkxHtm3cLI7WebPXBaKkTQlRZdi99kRrHc6ikhQl7aJvQ9Z9sqp/hNTUA==
X-Received: by 2002:a05:600c:a686:b0:40d:39ea:1076 with SMTP id ip6-20020a05600ca68600b0040d39ea1076mr900090wmb.93.1703264083920;
        Fri, 22 Dec 2023 08:54:43 -0800 (PST)
Received: from gpeter-l.lan (host-78-151-55-40.as13285.net. [78.151.55.40])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600c354f00b0040d378510adsm10138520wmq.1.2023.12.22.08.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 08:54:43 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com
Subject: [PATCH 2/3] clk: samsung: gs101: register cmu_misc clocks early
Date: Fri, 22 Dec 2023 16:53:54 +0000
Message-ID: <20231222165355.1462740-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231222165355.1462740-1-peter.griffin@linaro.org>
References: <20231222165355.1462740-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update cmu_misc so it is registered early, as it contains
the gate which clocks the Multi Core Timer (MCT). This clock
is required early in boot, otherwise exynos_mct will fail
obtaining the clock.

Note this wasn't previously an issue as exynos_mct wasn't
enabled.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 0964bb11657f..590119a25c18 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2478,6 +2478,15 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
 	.clk_name		= "dout_cmu_misc_bus",
 };
 
+static void __init gs101_cmu_misc_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &misc_cmu_info);
+}
+
+/* Register CMU_MISC early, as it's needed for MCT timer */
+CLK_OF_DECLARE(gs101_cmu_misc, "google,gs101-cmu-misc",
+	       gs101_cmu_misc_init);
+
 /* ---- platform_driver ----------------------------------------------------- */
 
 static int __init gs101_cmu_probe(struct platform_device *pdev)
@@ -2495,9 +2504,6 @@ static const struct of_device_id gs101_cmu_of_match[] = {
 	{
 		.compatible = "google,gs101-cmu-apm",
 		.data = &apm_cmu_info,
-	}, {
-		.compatible = "google,gs101-cmu-misc",
-		.data = &misc_cmu_info,
 	}, {
 	},
 };
-- 
2.43.0.472.g3155946c3a-goog


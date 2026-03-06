Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1899B37D12A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793005; cv=none; b=l3+2/9dlMll6c7LFG42C5oH5qXPNxxi8yJl6vw2SAD//RXp0mf6634RPw69mCMUyoVMixXu6Ya2HGzSRuTPHSwH81VGR8LRvZE+259v/8/AdSc4LXIpdQ/tXZKLq7KqBrTF0V4jQb+c7HO5+FWFUgY6x94L+VNuRHkrxpYMTKkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793005; c=relaxed/simple;
	bh=dHULg4KAQ86aduIcQuHp4BhJ2Nb07EP6bPz5fIOQLSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hiGRZVlFgxbOIcf9TogfOSFKr3QELBa5U/olSzWm8cUgmzcb392wA/OfAAE6KSu0gKLtAJMfOmEvltXMz4Qpnzu0xw40T/AKgWqigGs7VQl/gbA0cW4AFHHfexTB61exhbq4dh+lKfCOvXuuj3JLm+DFvACF34S2jW2CJp//8v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FL4AHvQE; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FL4AHvQE"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b940a00415cso254991566b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792998; x=1773397798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aes9Ymy2SVK6T0USFDpwiCwEp+iOTQGnFHuH7w4M/To=;
        b=FL4AHvQEVYvbAajWoTI8ePBmqFickSVhiwIdB43AaSjVsXPr3ujGMbZh4S2Fwg/pso
         9D5GzB2iEcd21+1U5GzizJRFvXQ2fN+qFydGy9i9/cp4v+xJud6PFeRVxGYmR7KCL0Mi
         hWCkhdNi+WvVUl+HInB5h+jNtygB49ExlFetI9KTjCOviPX/Y0Inm8nGgWL7mVVakHOK
         I/Psk8OLhW/Vxie16lYKAKyvPTzKiwRfgMrT2hxy7c/n1v27+ERlgovVs9A0w20eka7L
         +Tdiw7PwEsX4zz18/ED0nV4O9GePgn4V5N5/vy78pnZdEZehCLkuseO3yT1ObfgfGufW
         GEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792998; x=1773397798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aes9Ymy2SVK6T0USFDpwiCwEp+iOTQGnFHuH7w4M/To=;
        b=nbvNIBZwRp108G9je45rKShnybOAsFLnqes8xRJXfO3xCuPh3PKfb9BdX07nGL2mdh
         9tZXMcW7bOmmB/UsZaoebYwzxC3SOquj0cteDRuefau0ax5qP+obfxlCS4Nf+P026OHs
         znfKSUiuJ1zdFXCMxKFgitCOQJE7ArpcqRN+5yNZKF05Vl6NBFn+YYQyfYHyFJVXpY8R
         nn1u4Su+/kYlfFm5cjeerxoQeChkwSZwP6V89yrV5irtzwfpwqd4eLIPzS8ymYHi0ArX
         w7eQ6YUPhA6yzNPy3QyVAQC2ycNos0Y8cH37zEG6I56yoBaSv690O2bYK24C5/h3BcEp
         jJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCX1szE0heOPT5Wj1MK/K4R/6oaJSZfiwoL0ubKWFn+087Wm6Iz2Rbfi9gSxlKIoE2743dQuONceJYhHD7OjW2HDow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+HQpw0+LGukSVc3Dd3G1k2pUlYGRqr024WtFA81PQc3GWdY1
	Zeu1AjV0RBXFPaOxzjQtgw2wknw8l4QAWNBnIwYrPAXShCuf8rm658eXeW95sB2uC0jJQHIS5SH
	ogTZpKK9CTg==
X-Gm-Gg: ATEYQzwmEywvxch+xk0mJCd06yOK8n661bE42WreWreqtXofgEiggIVhWRCTuM5ghgB
	MaxtxF+yVVkrZfzeROis6aqbGoNK7Qw8G2A77cat9skdIVy27ecyfzdMYBSdwQIE3pksc5U4C4k
	Q+C69zEC/NORz308m0U8nCHL71oQBg3aPxxUzBbxK/iZz2bpVZawLGYsmOf07ws+wVmoZFe4w1A
	7qDClDPgJHHHZA8rIv7mg+FTkqSmBdSZfWIhYcuRZdTBIZ2H5ZY+thRNXkKBUMZhaW6n66eoaK7
	1Bh9RWJnQ60n3pmdS/S7RODjpYw2F+TnVKfjfcsvxQsieMQ9KYBqXrhR99yDl0vLjx3tG/NfWME
	dscJdTeJOIC8HEIwKizrTKdw9toG1ZOJOXmQPvKzhpECD93LBb7UKVuhgXupF29rTzQeEu3w2V1
	OLwzAlV3WfGH1fxxRLsohhjqgK30fCRZAqstM1Ny49uidd5OBlSkA3CdYqjn22n3g4z2M2gsW/o
	uMhi1DATxKlQKU=
X-Received: by 2002:a17:906:9f8e:b0:b8e:7dcb:7f1b with SMTP id a640c23a62f3a-b942dbdc76fmr87190666b.21.1772792998248;
        Fri, 06 Mar 2026 02:29:58 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:57 +0000
Subject: [PATCH v7 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-6-03f7c7965ba5@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.3

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
regmap created by the PMU driver instead.

When such a regmap is used it will cover the complete PMU memory region
rather than individual power domains. This means the register offsets
for the configuration and status registers will have to take the power
domain offsets into account, rather than unconditionally hard-coding 0
and 4 respectively.

Update the code to allow that.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 3bcba7d38ac1..8df46b41f9bc 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -30,6 +30,8 @@ struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
+	u32 configuration_reg;
+	u32 status_reg;
 };
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
@@ -41,7 +43,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	err = regmap_write(pd->regmap, 0, pwr);
+	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err) {
 		pr_err("Regmap write for power domain %s %sable failed: %d\n",
 		       domain->name, power_on ? "en" : "dis", err);
@@ -53,7 +55,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	while (timeout-- > 0) {
 		unsigned int val;
 
-		err = regmap_read(pd->regmap, 0x4, &val);
+		err = regmap_read(pd->regmap, pd->status_reg, &val);
 		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
 			cpu_relax();
 			usleep_range(80, 100);
@@ -164,6 +166,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->configuration_reg += 0;
+	pd->status_reg += 4;
 
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
@@ -174,7 +178,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	    of_device_is_compatible(np, "samsung,exynos4210-pd"))
 		exynos_pd_power_off(&pd->pd);
 
-	ret = regmap_read(pd->regmap, 0x4, &val);
+	ret = regmap_read(pd->regmap, pd->status_reg, &val);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to read status");
 

-- 
2.53.0.473.g4a7958ca14-goog


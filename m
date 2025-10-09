Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D98215055
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023517; cv=none; b=ohQx7Qa1XvsBDXpMNfawfPeK9w9WEkuLkB8C98idckLUNobkvBr3Hi9teQVZ8atSmDvGmsFV+PDXJiMyIyglhcsa+Ux74M0Xs1eSm+VfFEc510rE3syek2iYvJIALpurd7Z+C88MGL9IeCcVX1ILMctF96E8A/DOnwZnX/HIMPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023517; c=relaxed/simple;
	bh=QW41kS606/q0M1jPNHEOuZDX62lb/ReQ5t7lhOrXCD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJSt2vzvQMPvas5eXx5xi+C3sFfe9PTEBLjnM1jzeicAnNdd6nDklEyVoANhEMRE9lMLE0jOpWNRAA070B77k+pgYdb/GuouLTw5PLCf1o+MCl9d+4zEANGNpAuQdBuvUzbSSx46ezlE3Unr5Ii3J/cwdryA7ncQEsyt7qJfu+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Af1yyeZA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Af1yyeZA"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b40f11a1027so189932966b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023511; x=1760628311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MC3uJwytBymNcNNUBl3ACIVe5vrNsKsuMCXz3oqIuhI=;
        b=Af1yyeZAOAqEbOeGgYTym0mDHmPAwMGaoPz1O7eyYQz+Th0zjj+ivDHa0RsntCB4tL
         wEFlq6qBrVa+eld8SXbwd/ccrNfz9gJt9fPyzShxT9XgMfXKjQkE7lnqvpbX4I8aaNUQ
         uJeeP/2qDVl2yBHK359MBgqYBescyCVvLFXaL/FWBSYFmVs1smoyfBzcX3Z56QLc5gcM
         RPlyf+1ZFuEChLJ1shNdr3K8sL8ZvTNiS3Tk90dN4bDLoyNvO4flR9o64PPBMfUXGbYa
         dVbaFiejbNnYeErTt7svvejGNY983fv0l/z5i1D2YNvJnxZYkcUYUgtRM+Hh/I+0SGtA
         HqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023511; x=1760628311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MC3uJwytBymNcNNUBl3ACIVe5vrNsKsuMCXz3oqIuhI=;
        b=Qd436X42U48CvEC3nsjUWP/Z8ccDIZIE+xnW7dvtlFWB1NjvMp1cO/wL7stXEzgqvm
         7jSLyIdcbCMA2a9AMsy7+xsVrfMTJw/gvYbwWHlp48XePTuYgpkCX1aXrc+G9EiEveE0
         a9pjdSJmvANQ/UvoKWzGURLcNKC5kF/JpIS7Sjhfvs2Yp1i7ym+WqP4ytKFFfu38Dq/X
         KbhEjow3d1kp0YDEwBaLacQuhjQmwdlDlEzLzmTBcskpjU/IK6OGiy5jSrzJpG4EFEGR
         1I+8sRVFBfi1yN12gSIDVr4lTD+iDVCjB1vZzK3CXczYrGrYqEs3DaER5NHLERPL7TQZ
         yX1g==
X-Forwarded-Encrypted: i=1; AJvYcCW1A0VP5Aa74r1vNOwhjgkWpVlkyiaOWmXKWDfO3UtKRfyt2gq2ONj9d1N/TLF1yBe935MqOYyWaTbcBR3fqFmuRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrWHajDNKsYouFXtOzolpk8H6+cnqVtkqzvXVdZWsYDVjFBr+l
	Wza7PA5VkKCiykiJ6V3AYxFQ1Vqe2H+ULFkB6dM0iTX8LAq+APyCfTQ7Iw9378gUee4=
X-Gm-Gg: ASbGncsTV+vV4e6xBV2EBVVBu1/mw2hGDxR1vKVCQR3d4o3i3FD8irOYAXPqvyPQTEx
	3v9MMjw46S7xJZCMV1duSeDwWvfLO89rtAOw3IreAXfvpL2DL+WOr7IcqbE0ceb71ngQdUkgHRV
	RUFSMVZ+zq+fRmm4t3a8w9U/fdAVJyeumXb3vcMgcTIbBIiwnVtGYNf8z2IKimt7k8ydr0cMA81
	tbG/yCVI8igldBxqY4NiWFJDfIdNIjGHW7RwQzEyXGycG9iiYxgV1X2Hj2WbyMBSrMs1U+bCcBQ
	W6VIfev4zWIJp0aKUmA3vjbBQv1gUWCelnVmRhoWbSCe84tN6L7S24ndSayunfT+oBUYZpKsIkT
	2tw8dH4rfBJrEId98yyoH527QEL+l7rcpcTVXZr7as6oQSoAGdpGLp5TWAfaLv4eWmLzO79rGNl
	bvaPhkX+bbpYShYZt1oWbiKlDLuZnvT3anR139CdE3
X-Google-Smtp-Source: AGHT+IGUCw5TbDsbNDU12n89wz1xnvXjoWKEOoQfEfCs7xti4zjASJ6sSLgSUPyBLFyQO2HMcf/P7g==
X-Received: by 2002:a17:907:6e8a:b0:b3d:5088:213d with SMTP id a640c23a62f3a-b50abfd4902mr890576066b.42.1760023511315;
        Thu, 09 Oct 2025 08:25:11 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:12 +0100
Subject: [PATCH v2 10/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-10-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

dev_err() gives us more consistent error messages, which include the
device. Switch to using dev_err().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index a7e55624728a62545eac049c9a51012a229f44c2..387ee1c91caeae4519237af2ec659f56782e7bd7 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -29,6 +29,7 @@ struct exynos_pm_domain_config {
  */
 struct exynos_pm_domain {
 	struct regmap *regmap;
+	struct device *dev;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
 	u32 configuration_reg;
@@ -53,8 +54,9 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 				       (val & pd->local_pwr_cfg) == pwr,
 				       100, 1 * USEC_PER_MSEC);
 	if (err)
-		pr_err("Power domain %s %sable failed: %d (%#.2x)\n",
-		       domain->name, power_on ? "en" : "dis", err, val);
+		dev_err(pd->dev,
+			"Power domain %s %sable failed: %d (%#.2x)\n",
+			domain->name, power_on ? "en" : "dis", err, val);
 
 	return err;
 }
@@ -123,6 +125,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
+	pd->dev = dev;
+
 	pd->pd.name = exynos_get_domain_name(dev, np);
 	if (!pd->pd.name)
 		return -ENOMEM;

-- 
2.51.0.710.ga91ca5db03-goog


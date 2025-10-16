Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769F3570CA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630335; cv=none; b=t/n/NcqaZVKWHNIs81kWAKVT9c0Cs1pgleVSirNaRZ1X7PZciK8GHAptGDA7W+0Y2gY8bSWCjTEithgvv+wzRWbPrHL7XQAijP5XhMJUZtaLiMXGereOn5+kqzHsmRsJmuIruDpEISuPgZfKiBapwEn/ZsLzlgphV6y3m8uB/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630335; c=relaxed/simple;
	bh=1qxgK+yguVHCcnwDi73qQ+fgj7/mfA7XkqtibLKJhdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fR+b9m/0CnlMCKiDX69NiPvQHrItS9T8/n/sbYfx7Iyj0KoTncsOnwcNb1mrP/A6R76nHK9j0otyYpBv7r13vkP8zOvl9mVMwRVtHJJuuzvS/trAmKXYdv5mnpIgFDLvll2BjCCO2qNmikw6V8EQ+paxJ8NTmECD7jKzskt+Jc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MCnEECuQ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MCnEECuQ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b4c89df6145so158495466b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630330; x=1761235130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOMGO9xFi2Mtx7k0vCEAwcztQ4BN53A74nGNrcyF4+o=;
        b=MCnEECuQZ63xg91QP3qRlhQIprh2xr5VltFR8TlKpDgQWqc2VD/LEzIRK2yP8aj5et
         gbUYXbNQ13iBSv/NIPITtcwoyOtO8rRiznH82NhSqa6eccO+KtupDrWAUz/h7Kbw4VZ9
         LlAlK5yiPbqyVxb73cwHmHIOUYT7C0AxQBPdHscUDSML/kkYLNHXdJxwGbtjs28MjL2H
         aYRUHa/wdvRhwCHd6SWdvOylYk+7FwucbMQT07gd7k5xLZfyPgWcQ8hHW48PQ79wn1Sm
         Fel+gFCuBr2wNtiyltsutGysXd4XlxcuFnc9XeBEHJETx+7lKTN6goOfQSKumMB9MQPc
         K4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630330; x=1761235130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOMGO9xFi2Mtx7k0vCEAwcztQ4BN53A74nGNrcyF4+o=;
        b=aJoJPkNWJUeNDjvIMMa1hlhf6dOB1mP+QYgMdqArSQVQcGrJA5vBi1RYfU4+XuChSz
         N/ezJ+T5OQOORVZo2QdEClqEbte/lvcI5dPzqGqcQm77N/EeePJbfKBBdwkPvHBAWfGD
         hQ+aRcDsHwjtvPNverzowgMOqtsmQ3E8BHuaqM/GgYCD710MWZoubyF9p2aYmsZ8DKT6
         dFNDl18jdlnX11+xrq2OoVAyoSYPDNwRbj1SQIxb5E6cReHR5JGl5BJI9U83GSWeIMCv
         SAZYAyY9/F4fSDp3+jYwfbv4RKFjtzGCd6NNSo3XAzoejyLGCJo/MquZseWiWlUm57Vy
         8p5w==
X-Forwarded-Encrypted: i=1; AJvYcCWIpboZSSzFzOrsFzuqZsDq0HdSVBTPyRr/MSgkkTCkOehXyoEHeenImgfgqkGQcI4y+79IUn1tBFRucMAuM6nBHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyfPj8mzIFu344w2VJjbvH2bcIyvutQfxPgaXx/pN1Qdpbf+m5
	cPIsNob1ceyH1wWS+EvUlwPl/rtAqeqTNgFCZheMoVRGPGA1Yu9J3e8xNQO9UfoB8D0=
X-Gm-Gg: ASbGncszGq5PE1dMdgDhiCQtMJ91CuJt2oUqCM68/53UY8BhKi4ksY6SXSB/aGJzyFq
	i3m1HEYLYjT3g0pwJulW2pAL1jOTb5nZ2EURW2KIFh8jEkMZfem1GjSkH6fPsiHI09KmeI6dLoV
	II3DGlI2N6mBTRP+RnwGVaDdLzngkJn570j4VFCKpAtZQrnyRwVIx5M+KnL9sPT3Ma/2DIx3Eyx
	oYH1OpnJJFnefAH/1nuOoTangSD2m1F6D94CjlHabFRdeaX4AazCr6+ciucXQ0ybEHNGi9AHtSC
	USEZKj+Hag7xf7BOSyOoR66IgEXJUrJ08Cw/r6u540l6o74eavrdkFh2SOcA94n9TTa0PnLMt3o
	t3ZlFDcpkE4j3tdSLDXXVPqCnycVVqF1m4RvVomcVUhZSrOJxrmA6OEHicKaaaPmaEqQS0o/5i/
	oaDXHC+M0cRK/hKKCrDBpHrL9jBY8QGYjwdcrdf9b7xjNJmqavsSA17utOxMXtrmopkIsJBtQ7f
	IJZ/YBgHQ==
X-Google-Smtp-Source: AGHT+IFYdstIK88h2DzNqSnXkoNZZTxC+NFmDH+MQK4MClgJpcEBcvp9PSTTwQIBKBRNe89kOYx4bg==
X-Received: by 2002:a17:907:d0d:b0:b41:873d:e226 with SMTP id a640c23a62f3a-b6472d5bbcfmr52909966b.1.1760630326396;
        Thu, 16 Oct 2025 08:58:46 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:39 +0100
Subject: [PATCH v3 06/10] pmdomain: samsung: convert to
 regmap_read_poll_timeout()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-6-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Replace the open-coded PD status polling with
regmap_read_poll_timeout(). This change simplifies the code without
altering functionality.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 29 ++++++++--------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 383126245811cb8e4dbae3b99ced3f06d3093f35..431548ad9a7e40c0a77ac6672081b600c90ddd4e 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
-#include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -35,7 +34,8 @@ struct exynos_pm_domain {
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
-	u32 timeout, pwr;
+	unsigned int val;
+	u32 pwr;
 	int err;
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
@@ -45,25 +45,12 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	if (err)
 		return err;
 
-	/* Wait max 1ms */
-	timeout = 10;
-	while (timeout-- > 0) {
-		unsigned int val;
-
-		err = regmap_read(pd->regmap, 0x4, &val);
-		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
-			cpu_relax();
-			usleep_range(80, 100);
-			continue;
-		}
-
-		return 0;
-	}
-
-	if (!err)
-		err = -ETIMEDOUT;
-	pr_err("Power domain %s %sable failed: %d\n", domain->name,
-	       power_on ? "en" : "dis", err);
+	err = regmap_read_poll_timeout(pd->regmap, 0x4, val,
+				       (val & pd->local_pwr_cfg) == pwr,
+				       100, 1 * USEC_PER_MSEC);
+	if (err)
+		pr_err("Power domain %s %sable failed: %d (%#.2x)\n",
+		       domain->name, power_on ? "en" : "dis", err, val);
 
 	return err;
 }

-- 
2.51.0.788.g6d19910ace-goog


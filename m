Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AFB3E5EC6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847695; cv=none; b=q/M+o5KakPo/68eDbGwpHueiP4W31sVUjx2YfjGprLL81e8RfgLD9bwCvR9eQPMSse26v88eFdBt1xvOwlMiX+4SsnUC+iI0ms3qGhq7bvdxZTMRAWUdnMoKyenFvhFUxmLpmsTs/7N+IvtjthMjbSYPrFEUhkTA+QXoqwSpb4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847695; c=relaxed/simple;
	bh=6sDUse3Gsz/EvIu2exz7kbl0iyrErcAU5VbpCSGeG7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QiloqQlbD25aRPhV7jNxf5UemWN2s+m/Qt+JBndq/5rYuz1I4ZrQkF7CZhGJKxPGpFSRHwpKKsK/kpAf/WDQRR3q/l+INuCpy580R1JZZdl++ORLglS6u8P804khD3N1ScO1MidugLsXl+FITvK1idqceEXQCLa4Nx5b5aZKLFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fXhB7LJz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fXhB7LJz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b97b30fa5e5so623391266b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847685; x=1774452485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02tyCAuDgIFu9biWUbxZXHp6fnkY15VCU6AYSHfqVA0=;
        b=fXhB7LJzNuPGdJHoowXe2Yt63IHYbZy5eSTuJqD1TI5ZjtFT34DfvyfQeSiilxaK/V
         mVnC1INh8BYRPg7evKtorROI2151TQXwEnl6uw0TYQqLAaXluBELS3YL1G22VtorSaeo
         wPQ7jVhvS/Rvv7voUaji+wv7Tt31ukL6G7HMaUWdUVc162B9keSZJT+7+1O4pJUaGgA1
         aRdzJykGrK/xvJOpdk3Ctobwhk47F922mHFUIs2t4kn7dTrBsuI2p0k2sN6tqNuGLjvX
         ADV1ZEV7ZU9cGsYAvWk6nG7EAUh0uHCli7LGGuEj7TTrPnp2kgkIixvsFBvGBaSkitkY
         noqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847685; x=1774452485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=02tyCAuDgIFu9biWUbxZXHp6fnkY15VCU6AYSHfqVA0=;
        b=bPKNmejHc64bPrESy1MDklqWeGQs/56BZ3OjUl2b6Q5etFVCdRuYkxemEBxXm2CJag
         EzMpDPFmskNpKuFVrDaEJXdijpnyzXFPynmPYxF5MhtreUBq+hY9RFZGG3ag8xK3GKDL
         stb02TUSMlWdQxHS3X3FpEQzrylPoICgTm8A7fOBYmGsbOK46cjlyA1h/0Vbx8VM7z6a
         AV3jWWEmtbGHi8X+WA7XzPHGFIWvvO21WfMhCQwX/T2LD2UgkQeyyUBGlt45LQ/m/5HE
         vj7YYJHO9fjiSX+R0P3KzC2Guh1+rcphBZ8Sy4NIhh2YcayrpK1esvYu2OXN/9f6Rirz
         EV8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXznEit3t2xYZ8dZ38Z1Hs04nmffY0kF3X97QUc10ux13B/7AxB0M7qbmG57I+zN9vizTjDESYT4p53huwVHNJlgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7haIBQp1NdBtNDvvuTJWmFn+edV4VTMESpsf24x6E8travt73
	nfAOlCgB52VsAQUbYeL2XCN8dZVjeBEntQbcfgPmCtkU81XjL5oIrma2pV110YaC4Qw=
X-Gm-Gg: ATEYQzzucxv3FbjQnNgHZlBqRuQTfe2zIY3ZCHRE/MuB4SspUIEIVJe3K020M6P//4p
	9mOXwy39W68IiWtKVqbly7Vu/0pT1M+ujVxMMpYPh0jy44z/TouOZCTCVip8ZKs51s0rS41UV8q
	vZ9AgvDC5MaAHfpDlHCbOb8QXW1QM5PpuVMM74e8crPw35VyIBRoNeq3f8xiVxGczsaq3OLDLNp
	wpPPXTKu5ihhj2eglrSHr+oLlK9BdmqAv2xQ1L8FBzP7hqwjTYdq0U6Sxr8uN2OO8nfkrBhBM2i
	rMvqqvrQTa7MRaxM6phsXBLEeCGKMAkJbWcKeV8A26rH750ysNtK9RfotVB+8BcHiFpMVFEyuxa
	0kAclIK2lb7M0dOh2fMQrVFvSBrjpVVyuR8SpHPjrmek0Zt5Dn0e2zf2LGcRt9mMl2Nv5YQcoXa
	2QLfHBblVJPFHx8RNM8xxn7qOTHkNEeQlRVO0Z6NHQffoujiE1iMnsFrUnA2qwkOzEAoJYdFZ2p
	6GJCiS4+gKevTE=
X-Received: by 2002:a17:907:3e89:b0:b8e:a1ad:36d3 with SMTP id a640c23a62f3a-b97f4ac9dcamr257964866b.46.1773847685322;
        Wed, 18 Mar 2026 08:28:05 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:05 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:55 +0000
Subject: [PATCH v8 10/10] pmdomain: samsung: implement domain-supply
 regulator
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-10-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

Some power domains on Exynos are fed by a regulator rail and therefore
regulator control needs be implemented for Exynos power domains.

On Google gs101, HSI0 (USB) is one example of such a power domain.

While at it, add a to_exynos_pd() to avoid direct use of
container_of() in various additional places, and update existing code
to use it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v8:
- add missing \n in some of the new log messages
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 53 +++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index d2e00f8310ce..3b5e84ca2dec 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -20,12 +20,15 @@
 #include <linux/of_address.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #define EXYNOS_SMC_CMD_PREPARE_PD_ONOFF		0x82000410
 #define EXYNOS_GET_IN_PD_DOWN			0
 #define EXYNOS_WAKEUP_PD_DOWN			1
 #define EXYNOS_RUNTIME_PM_TZPC_GROUP		2
 
+#define to_exynos_pd(gpd) container_of_const(gpd, struct exynos_pm_domain, pd)
+
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
@@ -39,6 +42,7 @@ struct exynos_pm_domain_config {
 struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct device *dev;
+	struct regulator *supply;
 	struct generic_pm_domain pd;
 	const struct exynos_pm_domain_config *cfg;
 	u32 configuration_reg;
@@ -64,12 +68,10 @@ static int exynos_pd_access_controller_power(struct exynos_pm_domain *pd,
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
-	struct exynos_pm_domain *pd;
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
 	u32 timeout, pwr;
 	int err;
 
-	pd = container_of(domain, struct exynos_pm_domain, pd);
-
 	if (!power_on) {
 		err = exynos_pd_access_controller_power(pd, power_on);
 		if (err) {
@@ -126,14 +128,45 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	return err;
 }
 
+static int exynos_pd_regulator_enable(struct regulator *supply)
+{
+	return supply ? regulator_enable(supply) : 0;
+}
+
+static int exynos_pd_regulator_disable(struct regulator *supply)
+{
+	return supply ? regulator_disable(supply) : 0;
+}
+
 static int exynos_pd_power_on(struct generic_pm_domain *domain)
 {
-	return exynos_pd_power(domain, true);
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
+	int ret;
+
+	ret = exynos_pd_regulator_enable(pd->supply);
+	if (ret)
+		return ret;
+
+	ret = exynos_pd_power(domain, true);
+	if (ret)
+		exynos_pd_regulator_disable(pd->supply);
+
+	return ret;
 }
 
 static int exynos_pd_power_off(struct generic_pm_domain *domain)
 {
-	return exynos_pd_power(domain, false);
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
+	int ret;
+
+	ret = exynos_pd_power(domain, false);
+	if (ret)
+		return ret;
+
+	/* Ignore regulator errors - the domain was disabled after all. */
+	exynos_pd_regulator_disable(pd->supply);
+
+	return 0;
 }
 
 static const struct exynos_pm_domain_config exynos4210_cfg = {
@@ -291,6 +324,16 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* get the domain power supply if required */
+	pd->supply = devm_regulator_get_optional(dev, "domain");
+	if (IS_ERR(pd->supply)) {
+		if (PTR_ERR(pd->supply) != -ENODEV)
+			return dev_err_probe(dev, PTR_ERR(pd->supply),
+					     "failed to get domain supply\n");
+
+		pd->supply = NULL;
+	}
+
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
 	 * and handing it over to the kernel, requires the power-domains to be

-- 
2.53.0.851.ga537e3e6e9-goog


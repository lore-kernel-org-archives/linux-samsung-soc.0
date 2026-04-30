Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD5A28506F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 01:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514226; cv=none; b=QTYTUSs0Pb4dcIUgOXJn2BN83ORV5swCvoCjepiicBi1FSusokEPKBGLtIepZnMUAJ1GNAZ3gPSKMaI18FFraNpP+Vb2w/zXT84NzWfY52miATHJmcGH/JqNi8AAnmOkdDMdAHKgB6oSjWFR09XA74XzuSMifZ0E9RGYXjl0U5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514226; c=relaxed/simple;
	bh=2Hl09FruWGr6pjACeuq5DjMb5si4CPaD6fjJlZmzP28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1uOfMFFW/rsq7UqWfaArweJVTC9rhkeoT8sh2dhC7O/PqKaPROFb+fv22htU+JOklJwF2N8uMgGluSlHRnJfXow/tZH5EiqZhybgs2Nc5jIArMvE7o1OvNKqFRHBdr/Nr0sp0/unp502rmo3txG7mTIaGtqJApUpj3TVLj7eFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFR7mU45; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFR7mU45"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-444826c16ffso330141f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 18:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514223; x=1778119023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=IFR7mU45nPGnb5plmWjmqVXFi1kQQMKdsfsDjn9Kfm+CYFAqsYL0v/i5wl2GE5mNpK
         O1AccpX2jdIUquoiJzZv1diJkB6kwnrnayk5x2Hb+S3ZBQOvgJ1L4hiyxHyxgTYJD76u
         90g6cWlvJVfH2UsDtJkqlWJmxH2B/j3Z/GKK2r+XdABJjyoUHFLMpj1p71uBPsEFW51U
         HFfQPadbJcWgUikO6qxdsRQQQGC16bBM4jA565WmlyfPytNRDCiOU/3OxWthabOx6VIQ
         EmHHiBFliYpyEPgjM+i2hcTc/Clp3z1eNdffcpywpXIlmof0XvM0/Q8xnX7uqtChBBh1
         iRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514223; x=1778119023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=HkR5I+QE9JbF7EmkFaXuRSBWnp/WaOBDoXirYfJC8N42LhjPh2p48G2OF8QtaK18xk
         6AmFngak5nwyW1aBp57ql1x7nTQ4+kL7hcn0Y55Srkd7jXCsBsvdizdOfckTWVC+Y0Dd
         RHk5FdYRcedcnyhBlupgNlXicV/FTcE4yGtVuIhkiDBopnzrc83mNFWAtOQl2ZzOYs5u
         EsXZMepKVASYV5by9mLuy+Usg3oieVRoK7Y49mbnJINCoIkDwsB/3WGWH9Fo4YQ3pGU3
         GujF6qaBWnlY0ovs3r0erWtKRnKpXzrxsP9h+Zp77Ahz1o3KQwn7N24uss1axADqg2Dv
         72Ag==
X-Forwarded-Encrypted: i=1; AFNElJ/+yGlbTbb679gOyknG+z1t2F0rE2w9ks5O4Bwc/ZarhF4DPZpngpEtox1P0FiI2tgEdGrCGNN/cEGsoK09qWC5YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwXh7k+atM6y1XP8fGRq6fp/FWHRwcEjNta1su1FZvMMPtecuv
	6lIj81j0koe7wrFF4dGDB5hODC1pMwpDvpBRQWKJEEN6G4WyvytIzmpcOM+eYVQk5k0=
X-Gm-Gg: AeBDies1BhAvO+TAwN4muVYasw+k0pZDF5ZxaTg9eq8ZyxzNhAri8PZbowBx+tVbifl
	zUHd6J967qGcmZLQm+PNhKSxYrX1kwIY2beVcxd/Mj5KqkNUrJTUzra5Phy0vSuAO7Q0Kvyr0ir
	fMhlmPBaECNI4HTvVrdWtO6hXPrJSbQ8XG0vsQZ/KJM3/zGdo40p7eC3ifbwT7ZAackL+jln3jU
	59xHzIXb7+6Es4vROY/T9KN9LarX4PakVTu0TVS1CP1b/8HpE/UopvF8TUYNYt5mASTuQbBivJZ
	Sxq4j/EgKlAVC34rE7lGSzLTgfpE8HseMFnDOukkcZV+o96evjTlDLPyBlZUG8teQFlN0cpogY3
	hAOboERc80VMjjKsnNh6EOL7D+Ebiw/BcBjuMdhrlCjDjL7GoNaC7FHixNXRXcKLKyU5ZLNHvpR
	l7V6qk61nE17OcPQpBYsSiCRt+vTiAIzQvZ12BFgtejrw9X4Egb27005Va6hju08I6UiE2j2PON
	b7m4I6MQdIdwKo6xaVT5RScd5s=
X-Received: by 2002:a05:6000:178e:b0:43f:e934:50ac with SMTP id ffacd0b85a97d-4493d7f9979mr1191141f8f.7.1777514222943;
        Wed, 29 Apr 2026 18:57:02 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:57:01 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:55 +0100
Subject: [PATCH v3 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-5-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 498ca30a00c5..60c25fed8ffa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23645,6 +23645,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0


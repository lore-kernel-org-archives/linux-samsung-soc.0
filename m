Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EF62DB791
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616657; cv=none; b=aW4u/0NTxVKkv6atUVpU1TsD1AYC0vcIBpB+NgU74HifdRCkycTkaiV75yclEQfzRyrmCIuoCj6B07voekN5DkKPOEYv6l3Sm15KoOMYe5eyM0EU/jXfzOZZ2m4aDhDxMUccZ60MZ2/0UncalFXAFFPtqXt/Yd3azk563m3AmUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616657; c=relaxed/simple;
	bh=N4JpNWAJ8z+Zh2xDD+z/ESazuy8Zh1rNG2zbFITp4kY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jaZOdCPoBneXxsLWp+164JFuHdp8pmaXFcj4pbkhdo8XM9uQEmzfkGxc6vWZ9lptHIsh3JkxLtaUm26+YbD0zL8OK/NyOttwViXKohGKhADUap+/dZX2L2bGVVZPPIvmjFC3wI3M7VlfLcBidT6+y+/b7Z3XK5VHWx4PLSBl3hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUmtfpGk; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kUmtfpGk"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b885e8c679bso1398666b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616653; x=1770221453; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNtEsD/7Ir/dUUyhxp9vhIGp+bMH6wePQ4vuvyFT4dU=;
        b=kUmtfpGk+y1Po5L9WbRjGjjeOS3zyaluAuOecDHbQL39C/3NQ90m10XsHMeJWgMtic
         WXjXVMbyMmzYXzv6wlCiDIjbxGFC5BtFthpf/fw9Nqv0i+em9/PGKAq1M9kXCWEw2aQ4
         RW/PtGBL5NweHquSZcl+5N8hWTKlBtclwkuH7NyDAOpNASYqpE1dcRCZmZ6BmlRoMcNK
         KAu/GhbUd4pJx43Qu2w6ggvqZHdGMMH7FfeoTxKWBZp9UJX3PtcFBxuOdL/VjgHPQeGX
         /XM7N2fzXkVv1FYXbiQVij51fsBRSc8zrXwBYBcfvdsdWguY+5leziE4CDiB6YM5KCUK
         Opsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616653; x=1770221453;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNtEsD/7Ir/dUUyhxp9vhIGp+bMH6wePQ4vuvyFT4dU=;
        b=ITWWzcUCRIgSA7QdI+/qk4MRRWa0BXRjCMnVc8IGrLAFjQmZd6wgTsnX8Y9S0glbSr
         g1XHNQp65kloqPeISggvA0eEqbi0zoPdVhIyt8QuOYa/ApUk188ESWChHPd1Glm+xWvf
         xw12dqE6t2bZb0vLJx/cH3wRcG1bTqBJ3bi2L5gPZHNZKg0XTou+D17gpHyH2oq4slko
         3MDS6AJv8w0jWerGyXXTpMBnSkf3iYqwaj7R03U4nakyZarazNjn0dguRsLHk15x5/ug
         VUd1Gp3f9VQZg6m4m5RQcMLTVcsopJkEPG9jYVhEKOxKr54AKpFpOcNN2/lwm9A8g8cU
         9l+w==
X-Forwarded-Encrypted: i=1; AJvYcCV7OgHWM0XfNGMFuKVVc6dYgeLfcbBzzGIr0PHsP/AASaJfFPSbYrpaKxdPsOt4u99+t44FGOVLA7Avn0oTddOvTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM+50yhlb47w/U18nYSmQ7/T8MvIU2NFoaQcWh1AjcpzEYDRxE
	v9uGPRO0DGUKtInxVEzTC6OkZwDU31iKxAfidmt2mLFVGkitcA7EoSsqiW1UTX54bHA=
X-Gm-Gg: AZuq6aLr9AevnjXumj18Q+BQUiGjyiAnhOb6fQts5mdP3i0znrgUf0ztIRmHjHc2+s6
	sKmVb90UwpqRjFLZ7dtEchoV2K1M/aUcxtNtA7mrlKBiij9x46rV/Hrhiqxe8YVktQEz3kH+SuE
	urnhw/o5V//j8c3GXHf+y6FCGaQnyzf1HLoVZBhaJk23Pvl3Yrs1dloVYwhW6IxU52sCy52DtZU
	R7wqAcAmIB28iY0svvHAY6jlAGor19TRFIhip4tIEpyjkhw4VtsJS7WK3cG5L1W6tVNngNailya
	LL7Otkgb3gM9mVHfGQRbms1/JDUeou0EZZSN2rSjTbAKuXwb/GyIj0uZnBKdndsOE9V4cEzSMXo
	vsbQbSnjqYWK/WgBC6AVy1C2vlD/WYs+sY6yHUSF9x1owET1PgNbPNVyOO3dPmr0F3VLIVU0cSC
	JkfPIC45H3QqZWbn04DPsSz3r1O532a6IkiIVl/w86Wc/ZKMvbU3oNqeQFhNSmMvp5UgOlBorJx
	2FCPA==
X-Received: by 2002:a17:907:da6:b0:b76:b632:1123 with SMTP id a640c23a62f3a-b8dab33b16dmr439788766b.42.1769616652975;
        Wed, 28 Jan 2026 08:10:52 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v4 00/10] pmdomain: samsung: add support for Google GS101
Date: Wed, 28 Jan 2026 16:10:49 +0000
Message-Id: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAo1emkC/2WNSwrCMBBAryJZG5l8bIwr7yEu8m0D0pREglJ6d
 9OCGHEz8IZ5b2aUXQouo/NuRsmVkEMcK/D9DplBjb3DwVZGFOiRABDcZ1LnZLHl1khhBagTR/V
 8Ss6H55a63ioPIT9iem3lQtbtJ9J9I4VgwB6MBgPEKaEv9zCqFA8x9WitFNqasjFpNZnnqrOaK
 s/kn8kak7Q/WTWFZiCkYLJz4sdcluUNl9IgBxUBAAA=
X-Change-ID: 20251001-gs101-pd-d4dc97d70a84
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
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

Hi,

This series adds support for the power domains on Google GS101.

There are a few differences compared to SoCs already supported by this
driver:
* register access does not work via plain ioremap() / readl() /
  writel().
  Instead, the regmap created by the PMU driver must be used (which
  uses Arm SMCC calls under the hood).
* DTZPC: a call needs to be made before and after power domain off/on,
  to inform the EL3 firmware of the request.
* power domains can and are fed by a regulator rail and therefore
  regulator control needed be implemented.

Bullet points 2 and 3 are new compared to previous versions of this
series, and related changes are in patches 1, 2, 9, and 10. I can merge
patch 9 (SMC call) into the gs101 patch (patch 7) if preferred, but for
now I kept them independent to make it easier to see changes compared
to previous versions of this series, and because patch 8 actually
applies to not only gs101, but to many newer Exynos SoCs, and to make
the two patches themselves easier to review and reason about.

The DT update to add the new required properties on gs101 will be
posted separately.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v4:
- drop unneeded or already merged patches
- drop patch "pmdomain: samsung: convert to regmap_read_poll_timeout()"
  as Marek reported issues on some platforms
- rebase
- DTZPC related changes
- Link to v3: https://lore.kernel.org/r/20251016-gs101-pd-v3-0-7b30797396e7@linaro.org

Changes in v3:
- use additionalProperties, not unevaluatedProperties in patch 2
- fix path in $id in patch 2 (Rob)
- drop comment around 'select' in patch 2 (Rob)
- collect tags
- Link to v2: https://lore.kernel.org/r/20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org

Changes in v2:
- Krzysztof:
  - move google,gs101-pmu binding into separate file
  - mark devm_kstrdup_const() patch as fix
  - use bool for need_early_sync_state
  - merge patches 8 and 10 from v1 series into one patch
- collect tags
- Link to v1: https://lore.kernel.org/r/20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org

---
André Draszik (10):
      dt-bindings: soc: google: add google,gs101-dtzpc
      dt-bindings: power: samsung: add google,gs101-pd
      dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separate binding
      dt-bindings: soc: google: gs101-pmu: allow power domains as children
      pmdomain: samsung: convert to using regmap
      pmdomain: samsung: don't hard-code offset for registers to 0 and 4
      pmdomain: samsung: add support for google,gs101-pd
      pmdomain: samsung: use dev_err() instead of pr_err()
      pmdomain: samsung: implement SMC to save / restore TZ config
      pmdomain: samsung: implement domain-supply regulator

 .../devicetree/bindings/power/pd-samsung.yaml      |  29 ++-
 .../bindings/soc/google/google,gs101-dtzpc.yaml    |  42 ++++
 .../bindings/soc/google/google,gs101-pmu.yaml      |  97 ++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           |  20 --
 MAINTAINERS                                        |   2 +
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 254 ++++++++++++++++++---
 6 files changed, 395 insertions(+), 49 deletions(-)
---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


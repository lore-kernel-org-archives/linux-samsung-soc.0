Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD1E37BE77
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792997; cv=none; b=YgqOWjo5ocEBRDM8LReKVeiKGKwckNGjnuQiM9LVZrZOIxXMmFMTNycQrjjG33ouZ0RH0f7KhC4RijxzFdnQq7rQpj1Zs+mugO057dtb8Nk3HgtnfvaBXh9yjRM+ps7S38iuk+qOUbfPKsMXwRx3g3xvbsG/U9X/om2NPFPK+E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792997; c=relaxed/simple;
	bh=R6jX4fq4k8WouHrMjpV3xcNoRh3zGZocqcq1Z9Kg55w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EsCs3wgtyxBnEig65U6XAo//9tPeRcuZytJmArbODoR1vQMwOcZ/Ar3nfYGLfAhrwC9IzRhfXRSl1AQtHRHDbQKRNyavhysUzoexBYs8R+5XBa+4LkeO63IE3+AvJ0DcyVe3npMMWKMjYGgAN8/GtvUObWmXbR0+R1jU58a/FXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kak40Ar1; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kak40Ar1"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65f94011dfaso2798739a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792995; x=1773397795; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5PvtQLAwyimVW6/tRnss8RiKpGBnGc7biXK7tOFe0QM=;
        b=Kak40Ar1HBc2J68SbPWxBcIzeEJyfsra+7GuAwpDbOtD0qvmPNr+oTdib2K9C05wCJ
         rCrqGE8sdNxkzhJ87Pr8mqmvHiDXBdOr/7PJAtb2Xvo37DsvqD0KWB8dTM7O44vRCXlE
         w4Emuu3JCNzDb8EevhxUCWD+FoKKoWhnmtC7BJlga8YU0/e0GLvAk7cHoHz7LaGdn7CT
         zZ7w2dVJCj8AU38gSi/+qKr2BePbHbiRxMoacKNGNEdi/EE3OBbTGJS6CJQxeZKULeOB
         z1gXb+TfLm967VhXFDQYsjq9pbWTIiEx3WLdqHb9VbBYHXp2hWQ2qjQuT8h2i5tRoU16
         9W9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792995; x=1773397795;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PvtQLAwyimVW6/tRnss8RiKpGBnGc7biXK7tOFe0QM=;
        b=H7CM00rK1+wjRTUl4q8+herrhuc7Hb3zAqr86/oxEXSaUBmVI0YNIHj1PUirPMe93i
         e8v8zyHh1D1hCvhGyrzYM3XZiFA1tYbpSw9F99l74LOqFUSe90v3PYNFO7I3MDbVlkQ7
         M4CebSRNiyyW32JkgXwHvTLWep23KY5Gli6z1EerrPI3jvn9YqB1uJTsSLCSrI0V5qCD
         CMwfwNwCnPD+EdoH/ch46mphLqyOe3g1iU5kVJ7m+Tvduq2BbvkPeyQgJ/gLbUDWhski
         ODimwKLfl9BaaGOmXpEOMm5Y/dLbd+K5OPR0sLJACV9PwOGDjYqs4yqHN18+lfDQDtfn
         h9EA==
X-Forwarded-Encrypted: i=1; AJvYcCU2ra/cqsOBxVHTdcbFCJsx6Rd3NcbhlnR0Xc4cz0KJLhPLULXh7X7qAcvEYc0xS66/0iTqIx4R2iXMajj3OtMRmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmD7B8x/rryjUrHUFhfVAB0FP8652FGNopUxSyiGawdgI+1d5f
	uhreBf3URP0t/u/ljo22HKsiLKC/gvWbhjIRvctH5XfME7WvDQLDXqSArPYPqOVk+CBEbLEzWTa
	bmm8ECJBzxQ==
X-Gm-Gg: ATEYQzxmLyh+2PXKamgxmGFkC52eTPEamyQ/SIBeyoPZbCDX6N+09OhXW/vI/qjjwnh
	zgkZgUfNWHZAd6T0OTXq4SEMI1btu0zHH47sBDHWXmpYCXOjtK394d+dKTOcWfAe6KI5VllGhsx
	yx7W44KRGZFg1UMd2LI459eMw7erOYCzLztzkJEV427gi8kPGmtO+NgwhmDbOH+s6rrFQpKvxjr
	0xBb0XZ/exIQ/FQgH3rTGiQwjTVo3d29GQBAp9aIaKfql/mcsHRuS366HqjS+DgYNSHyH5GGlAZ
	PvqIKc42R0ywNCk+LXzBl5ppvVgRq5LnhXxJX/Mz/qkeOB1bfwAyfsfyBqqpSEJ8gqEVYadwuyk
	Rda1a9x8IFJn0ockvtmbWr+0O3rRndHdl7QLhntAQWQn2dHOjJOFpCiGvDDkEdwWB7S5USo6Pv0
	fl0OjvwbUH8B2j+PJVNLWAg9nNQlqKpfOA5U01UdY1SVx6NRH2MF74++oZhPGmaSLNnDcDu/8Ix
	lRjxuMIewH78eE=
X-Received: by 2002:a17:906:7307:b0:b8f:6696:f81d with SMTP id a640c23a62f3a-b942da7798cmr93636766b.11.1772792994492;
        Fri, 06 Mar 2026 02:29:54 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v7 00/10] pmdomain: samsung: add support for Google GS101
Date: Fri, 06 Mar 2026 10:29:51 +0000
Message-Id: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ+sqmkC/2XNy2rDMBCF4VcJWldldB0rq75H6UI3O4JiB6mYl
 uB37yQQrOCN4Ah9v26s5VpyY+fTjdW8llaWmQa+nVi8+HnKvCTaTII0AkDwqQk6r4knnaLDhOA
 Hzej5teax/D5Sn1+0L6X9LPXvUV7F/fYZsXtkFRz4CDFABJE9ho/vMvu6vC91YvfKKnvpOilJq
 lF7m4L0o3IHqTop+j8VSQwK0KFyNuNB6qe0IOTQSU0yhowhGa/BwkGaXUownTQkc8raxRQMenu
 QdpfqRVqSQwzOqCg8SvUit237B1h9hPfDAQAA
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
X-Mailer: b4 0.14.3

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

Bullet points 2 and 3 are new since version 4 of this series, and
related changes are in patches 1, 2, 9, and 10. I can merge patch 9
(SMC call) into the gs101 patch (patch 7) if preferred, but for now I
kept them independent to make it easier to see changes compared to
previous versions of this series, and because patch 9 actually applies
to not only gs101, but to many newer Exynos SoCs, and to make patches 9
and 10 themselves easier to review and reason about.

The DT update to add the new required properties on gs101 will be
posted separately.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v7:
- really be consistent with quoting (Krzysztof, patch 4)
- drop invalid tested-by tag (Krzysztof, patch 3 & 4)
- Link to v6: https://lore.kernel.org/r/20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org

Changes in v6:
- collect tags
- patch 4: update commit message footer to clarify that while
  old/existing DT are now incomplete, they'll be updated once binding
  is accepted.
- Link to v5: https://lore.kernel.org/r/20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org

Changes in v5:
- add domain-supply to binding (patch 2)
- Link to v4: https://lore.kernel.org/r/20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org

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

 .../devicetree/bindings/power/pd-samsung.yaml      |  33 ++-
 .../bindings/soc/google/google,gs101-dtzpc.yaml    |  42 ++++
 .../bindings/soc/google/google,gs101-pmu.yaml      |  97 ++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           |  20 --
 MAINTAINERS                                        |   2 +
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 254 ++++++++++++++++++---
 6 files changed, 399 insertions(+), 49 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


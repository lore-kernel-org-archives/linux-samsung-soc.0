Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775141E1DF0
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023508; cv=none; b=AyfmY+xg5huMMAWYVPUpRJ1Q6E5OWT/riqsON23ma1ixQzkogkuKZAtYSC2OXmEC774GGI9j0Gh7sWB96GQ9LMR0+u1vQbnCSKmQvxgVIskbbP6m4NvK4NpGh/KXVATtAptnxqtyxZPXuuj56FihEITPQoKKIfn4mxmeVAmBPi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023508; c=relaxed/simple;
	bh=Uf428h7aIWFjdKNPWRZHAl8cNKtTa/GyBa9IPqgNN9Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m1Yc4b3VnT9p1uwACg+kVGRyffMO9snv+acuVX+3oykMXRAthKQ+4+xdEgRlIBJO081bIBJ/q0V6LYRMQA4HU3w1SZjnzUEC8BnxrDFeyPy7zznTB1bnWDKPVuZtpv7ir1Z7aMXIy0q4D2Za/amSuG4SqdOslmiJ5FZUYVi9UN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7sw9xbs; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7sw9xbs"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b4c89df6145so157976966b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023505; x=1760628305; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ub2snCiVZE8jzqH1nIij73jcu2bxSWb7Zl/RGJIk6T0=;
        b=c7sw9xbsFCwgVqncOV6CfaXBAPUGqy8Qlm07jOAh7Z5kcCbZdDug302u2zGYPlZfzp
         +iCnMFJTaWbgjWZsqrFSHcVHAruK00FlxW+CURi7aiXzpXQCCS1mcNfEymfCWO2Q6WLJ
         o5s99cGC7FRKGhZJIFlKY75Rra+NslmqfsqaWF7Pk/02Pzlus4XN4Hr9GVZ329lrtLu+
         NVHaeNxcq5HYslvlcEsUNk8JcrfGwlIrFcwIydYFViwTn9O6Pzqawo2HFyciqvPMHhnP
         J9E3OKhcg2kXG6GL0xPexELOcQFvHkCWVhi+HsRbf+0djfAuDUTJdIkT3DD7TKto/TyX
         N8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023505; x=1760628305;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ub2snCiVZE8jzqH1nIij73jcu2bxSWb7Zl/RGJIk6T0=;
        b=NPgTBoD94gSewiA5DvwLz5aYwt84ZjqlIWdDPiH9mY9ug3ycvf6lY2L6FFHtJi8eOX
         WGHiWKjyL9OM9odxwafqWetkLo1QoXRzbNj71F5wpRj2iQDdzdEqN/yWFvmlEfcqFVZm
         BJfWTAtXeEnr9x30zpVXpahHKo8U1XgtET64SgVPY9KNvMBMzavsfdQstpP5er5qsAZF
         4qCPJdLID+RcK3tbgc81BqKQsAPV4KwuJHWERxIFaPO7cxUxUwiYDu3sHaD20//lAssH
         YQ6pgoMeUHa3ZvqmbEPfMjAe5OgF7C0is1Su3z4cGoNx7OXTYsbxI83hHX6Gvq8xDO7/
         SD4w==
X-Forwarded-Encrypted: i=1; AJvYcCX8+MrTTsP0RXR58KICmKBc8RTqZCLu8DBVyMUM2IxEYWTdHZ3zIQ7sseQCpVAd5Eisl/zzTt0H8/TNVHV5wAb+BA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzl4LJD1FMXzGGxkwO99srVSYJ7ueQ+tm+kNLZ5eUMQtq6c7TZ
	P03MsYUaQ+YYKtWM2QpPquYDK7f1agNUEtGniWFXFpl+aLxdpAs7GPx44scHJCBKsq0=
X-Gm-Gg: ASbGncuIDzyNuznyCI9/7JLQGaqXcDdj6lADBXuoxPCTIat06NVWpFjHIifWDfsSlpm
	3bxnaGC1qHZzyfzhapERVZrJN7xVmaGBU6AE4uiKJG6jOxw2gQZdzVJdb0YYeEy0TBM7mYJIzga
	LDaI9dQSZISjlHj04qhO2/gFrPLPYp9Gv9rV7geQe7643RbxreITq8fXPivIA2KgDiwCeF7/imU
	uh1bYatMVA40yHd8okaz9RVnhxsfr4AX2mJ0JeSvnEB9vanLRRHNJdVGfo2Mt1DeQgg6VT72Z/A
	jKl7FW1IeOszNebSUwLFpPeHG2IoJDKrkamo8xsKcy/SHo7z6IJpkWhwF6ToRcUcX6kN8fAFycj
	B+sMy0pUS2bW5eRdTIUYS73si4VeDxo2DbBncRMl1uptK7QhaQ12KvZ9Ad7p3xFdUG7tk08vA+F
	xqVwYgm+af8uxe6xPGScm6iOPvsg79SVzcau6OHD8H
X-Google-Smtp-Source: AGHT+IGm9Ug7HLTZ2JUW5hLT87xqLZ3YfSMB46riBMEdnpjNPrdz2fQrTHR8E+dbh3onnyTmrWbKxQ==
X-Received: by 2002:a17:907:94c3:b0:b3e:d492:d7b8 with SMTP id a640c23a62f3a-b50acc1aa45mr699612566b.64.1760023504704;
        Thu, 09 Oct 2025 08:25:04 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:04 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 00/10] pmdomain: samsung: add supoort for Google GS101
Date: Thu, 09 Oct 2025 16:25:02 +0100
Message-Id: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM7T52gC/0XMQQrCMBCF4auUWRuZhGrUVe8hXaTJNB2QpCQSl
 JK7GwviZuAfHt8GmRJThlu3QaLCmWNooQ4d2MUET4Jda1CoThJRCp9lu6sTrnf2qp1Gc+mhzdd
 EM7926j62Xjg/Y3rvcpHf7w85/5EiBYoZ7YQWJRk9DQ8OJsVjTB7GWusH1LZva6EAAAA=
X-Change-ID: 20251001-gs101-pd-d4dc97d70a84
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
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Hi,

This series adds support for the power domains on Google GS101. It's
fairly similar to SoCs already supported by this driver, except that
register acces does not work via plain ioremap() / readl() / writel().
Instead, the regmap created by the PMU driver must be used (which uses
Arm SMCC calls under the hood).

The DT update to add the new required properties on gs101 will be
posted separately.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
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
      dt-bindings: power: samsung: add google,gs101-pd
      dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separate binding
      dt-bindings: soc: samsung: gs101-pmu: allow power domains as children
      pmdomain: samsung: plug potential memleak during probe
      pmdomain: samsung: convert to using regmap
      pmdomain: samsung: convert to regmap_read_poll_timeout()
      pmdomain: samsung: don't hardcode offset for registers to 0 and 4
      pmdomain: samsung: selectively handle enforced sync_state
      pmdomain: samsung: add support for google,gs101-pd
      pmdomain: samsung: use dev_err() instead of pr_err()

 .../devicetree/bindings/power/pd-samsung.yaml      |   1 +
 .../bindings/soc/google/google,gs101-pmu.yaml      | 107 +++++++++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           |  20 ----
 MAINTAINERS                                        |   1 +
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 126 +++++++++++++++------
 5 files changed, 201 insertions(+), 54 deletions(-)
---
base-commit: a5f97c90e75f09f24ece2dca34168722b140a798
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


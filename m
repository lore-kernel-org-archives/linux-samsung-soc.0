Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5BC366079
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 01:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783559437; cv=none; b=CJmOhMagNQM6zXr3GQxFyf9VSM3F2gdRC1v/Z9VQpiHgLYggJ0ZrA5/ai7wuP86q+drwvV4OYpa2T8qBczUsdCIETBPr4410QN2hLBWpMJbs702NZ2p40heUA+96plQANucaX8p2USi5CmWraSyHGCmvqrbTyDrdg6RGgVI0RnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783559437; c=relaxed/simple;
	bh=k3K2O09SarAjPeX241uL2J937+yy32T1n43Z11zxY0I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gNFoPWgZNZ/cKPHF8DCsOKrHvCup59UarQFyajm2dTvIhESs1/OIXRa8OCkB29b+t73dlTxXmgdgtpr+0q4gIPpK2cZkKRnLIC/9l8Kfp477D2nmNOF8NXEHxutkEleCj7GwcBnRHP2Y3FzuNaVhyYSW4XntL4+YMW+kprpWw+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xE1AEC1k; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xE1AEC1k"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so9741575e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jul 2026 18:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783559433; x=1784164233; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0Y9hy7trM4rhn2V5CWQ6cEWC05ni+rRFhrd6P/Y+NVc=;
        b=xE1AEC1kDGZvXCmf4IdfGnhKHV3jHpmtku/GvbEMQjCuwaOiB1sIquTHrzBdtDVCra
         s5jAkqNWNj4Jq/5PbVKZmExFkbhO2BdaozWDlMZo8izMPyP40tUgDI0ElTl1CsS5lWOj
         eoN9/379iUtYuHSkVjxbl8vIAfgTPO2QimjqOm9uTUTH6q1HfN4FNqgrEocMrPyroC4W
         UiXefQbFvWljNAo1KhMx3GbTBRaXExcRF2H6XAJ+fB0DwtgHdsvJdZtunvrGDiqBlWrV
         MYuVyLAMnbQfvp4bGv24gSSWkoZrseaIEjBhtHyppJvZqTWGsMxVXFX2sblGwDxaHbd8
         L3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783559433; x=1784164233;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Y9hy7trM4rhn2V5CWQ6cEWC05ni+rRFhrd6P/Y+NVc=;
        b=rsQs0+F048jdqZj+wgR51asZfZ1Qwops888siL/XMyAkAFsNF+XZ1yV4WTOPZ2+cBJ
         DL4YDDfgtb238TbTBV0eSXaeSQhxF8g/YCtuqhhPrBjPHGT9C3iiYh4Cv8uWHGCSIfsl
         /WBDdIazlav17frz0bxvpYQtkFoBB03nebSB6rFSzokgR+Smz54umdVv2gda3NFZo90f
         4JmW1vJASWq+EUxgh4AphdXmMfFMsEUcK8Lp6uB6i0w4T9YMmyU7jrD1usBBiYV6YJZF
         XoKFg5Hlc9aauPFfDldRLLQ2f9Pa00QGIDg0xY3UEF0rmG+eK8SHNV7oKVKclIHSB9IO
         XDfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7G93C0YG+f1uCZNLIDlw7/vI4p3ZD2t/fYBfjc+mhuV+vleV0yNYwV2Eyy7ln22YA+oojtlP60vpJrwLRbTYaaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgPCb4LjdeF681QeuaF5eSaAadJHKyXpqEAdrCUkdU6NvAtcX1
	ywUcT8ZhfJAmWZNJRrA4azQiQL3E2Xm3cJP816LKAS0Yv8V0OLwpFkujgyPmh7AafyY=
X-Gm-Gg: AfdE7ck4Y2SR6YZymUeZKxojB759EFklCdgD/oNJdhQbg/V5faCb5ZMIbMIq9WxguLJ
	VzdN2hI29qkILZlVK9rkqS6y0urJWzNXu+hWRRlMh5JVu7oU7+Fy9VZKaJRefOyqCZGP5xHAhNa
	GaC5e9uvgMUl0NdlgkNb9e+sJbLjEwjgH1QsiuHcE5eNB8ou665hDNtl1tb3DaUO80UtDC5DiN9
	n2c+o6eqC7imzlKBM+V5sPTWbfzcUBsFNH/uqdOS1srTncP9G+WrDphQvZUISMUJU0ko5XAOr3m
	6T221pqWOk3phVdLuyhxaeu4V+44t64x0VjdrZsu3s6QHS9IeBRw0M4qo4SSfdDAI4JV4T/YTC1
	okl3SoE4VeClhEcP1VRRXrYaxEysCdEmCTFPHN+3F5RACJ+LsF1sHMAoLn/22NzqVCO/xujTOu9
	igAOTcwNzAv46OZ+v24OMdR4XuS4LYqP9XjZWg0hACDzWMnHnwHwfNgM8pI201yTfTe+Ya2xxly
	UKu
X-Received: by 2002:a05:600c:83c6:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-493e6853dbfmr51091305e9.0.1783559433204;
        Wed, 08 Jul 2026 18:10:33 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb742d0esm18994725e9.13.2026.07.08.18.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 18:10:32 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/3] thermal: samsung: acpm-tmu: Add Exynos850 support
Date: Thu, 09 Jul 2026 02:10:26 +0100
Message-Id: <20260709-acpm-tmu-e850-support-v1-0-9fdd58b634af@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAL1TmoC/0XMQW7DIBCF4atYrDvRADEmXuUeURYYP6dIxThgR
 5Wi3L3EWXT3/pHme4qCHFBE3zxFxiOUkOYa8qsR/tvNN1AYawvFynDHlpxfIq1xI9iWqWzLkvJ
 KYNWZFoM/QYv6u2RM4Xd3L9dPZ9y3yq+fo4goxe183+y4Yf2PPywx8SStZKdbA3P+CbPL6ZDy7
 e0ProB8ijGsfeOk10p1k5d1jVb7sW4MJ31kM7ojdDeBDQZxfb3+ANTWkuvxAAAA
X-Change-ID: 20260708-acpm-tmu-e850-support-e02765ebc9e3
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Mateusz Majewski <m.majewski2@samsung.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

This series adds support for the Thermal Management Unit found on
the Samsung Exynos850 SoC to the existing acpm-tmu driver.

The acpm-tmu driver was recently introduced to support a hybrid thermal
architecture where hardware management is shared between the kernel and
the ACPM firmware. 

However, the distribution of responsibilities between the Application
Processor and the firmware varies depending on the SoC:

1. GS101 (Existing):
   The ACPM firmware handles sensor initialization, threshold configuration,
   and temperature reading via ACPM IPC. The kernel only uses MMIO to read
   the interrupt pending registers.

2. Exynos850 (This series):
   The firmware implements a much smaller subset of TMU IPC commands
   (temperature readings, TMU suspend/resume, basic TMU init).
   The driver should use direct MMIO register access to support the
   remaining functionality.

In this series the patch 2/3 prepares the acpm-tmu driver by moving the
hardcoded GS101 IPC calls into SoC-specific callbacks: tz_control,
tmu_init, tmu_update_thresholds, and tmu_check_and_clear_irqs.

The patch 3/3 implements actual Exynos850 support.

There are some updates to be made (rework defines a little bit
and get rid of hardcoded values in exynos850_tmu_init() but it will
be useful to get feedback about patch 2/3 which is refactoring
acpm-tmu to support more than one SoC.

Dependencies
============

This series is done on top of the following series from Tudor:
v8 gs101 acpm-tmu support
https://lore.kernel.org/linux-samsung-soc/20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org/

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (3):
      dt-bindings: thermal: gs101-tmu: add Exynos850 compatible
      thermal: samsung: acpm-tmu: refactor SoC-specific operations into driver data
      thermal: samsung: acpm-tmu: add Exynos850 support

 .../bindings/thermal/google,gs101-tmu-top.yaml     |  26 +-
 drivers/thermal/samsung/acpm-tmu.c                 | 460 +++++++++++++++++++--
 2 files changed, 445 insertions(+), 41 deletions(-)
---
base-commit: a1c3227fc1a1cd83cd7fceb93406da4e37fe06eb
change-id: 20260708-acpm-tmu-e850-support-e02765ebc9e3
prerequisite-message-id: 20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org
prerequisite-patch-id: 335add736ef8f6753c3bdd94f19747aa4b9e782b
prerequisite-patch-id: e254a5f13d367da94d4bd299304859baa9409f0b
prerequisite-patch-id: 45efb8d607e3380686135441c62eb6c2747e70e3
prerequisite-patch-id: 718107c8283ea4a449d9838b57966e1c319f32b5
prerequisite-patch-id: 45b02a84dacb09cd95969b638caa64960f73d242

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


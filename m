Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5124503B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227422; cv=none; b=iJhw94sxqVrtmNJMqgjcDFAS4wOTHmeFDBJR+z6rwBGcB308K7S9Y7nPXBQyoU+6B8rWFw0o3JyU2l+/RDpyhdWDjFUVEwUNJhdW4mg4DVB2RXuWRb74eoNZhyHpPFO+th2TYPRvwC9UzbfmHo+PdeytJxLmHjKgby4WhlKVXis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227422; c=relaxed/simple;
	bh=JgfZ7b5grfSFrY2uNGn7XAOdObSUV8Hdp8wFhFtHqAs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hhsuNvQFma6x01QC7APujMar1hjSaf3axbbQ52lXmwslQUFoy5SO/iY5JQTu4vFiaAnU3295e+gIATZ9xGDnZrBNvpEEV+qGaG0JhTNu6OW2GbDkthiIPoJJxO1YeJPUtRy7fLAw+oEE9IgwbcAXayCrXnLE//riGoEMoN5iPdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgubh25k; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgubh25k"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbc3056afso3681593f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 06:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227419; x=1768832219; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wi9ORL6/u5L+ri+CyR1PVolHDXmhzE6rUlvUG8jfWHo=;
        b=kgubh25kPyRol3oQ4+C5HJFAgg3a859QUlV95flFiM42ktVN6DWa0SzfHJU+SJQ6NK
         fN5TeMXN2mWDtXEggIvI8cX2NVmakd9TywV07EAipIhYMsaIKxpOTJiuZHW+W+O48JiI
         MqUpdihBhH84ZYnjsdhFvuEd1EB4rr8mHnJ/9IbJj4U4b2pg7SU1+8x/zvGh3+uklZ2M
         cw+zvxh+Db/TGvpPv++JOjP0KbKXPc2u2caFL45uegMmw4AQA8ix1Gzm/jHMyCJjM8gy
         U6rIunPrlO1LDqXykNw7tDz/Bq5v0sT9j9inwqSJprA0ZnPI5jffx7OCJ3DHMJapwwvG
         DsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227419; x=1768832219;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi9ORL6/u5L+ri+CyR1PVolHDXmhzE6rUlvUG8jfWHo=;
        b=OeaAQWMas9zoX2lDMc0TBSB1YheSFf7A9QteBqf+OvAZt2+9ccn2I3tOeTwGQ1Wtwk
         eFhPeIYjI0jtQ3u505V+etQ9NMDdfKXLQ77y/rSFS3QU5Tl14xcIKYidyCOrYdd+dHM5
         7lT0dWEN97Yxp9MS/qHiCHayQd5tFz5EDxgynqeapoQS6zi2BdUKgdviy1WButDB85RK
         8aZZPTfTki6Uoq6pmlvu2qEkXJO9iA5EwtncTw6izrY7HovBLgVGmZ1yiQhEiVhmQ/HF
         jR0LnE7hil0WAFU0L7qIuF4O7nryBXPARBqmgF6P4AtUms3x7ScvgS7B4M8iiBHF+cKG
         H2rg==
X-Forwarded-Encrypted: i=1; AJvYcCUWlFiq3LCUjvlRrkySfy1LWWvCUYoNxnXg0GMBfyDgaOrhnWDXrVlfIFFPSiKBh3+z8iqLZQVsorGHMgo+2jSWLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxClw4+dU6Yot6Xkh5bJqCEtII63FEBTDFCkU7ro4vAgw+cOTLd
	fjVluKvsAFnpsN03jAG3BCSkxYwFrtCvSco3ZDQuYdDspECcMGmcCfMsse/b8u+b0LI=
X-Gm-Gg: AY/fxX56dIGJvuC3R6i2d2zbzmEGeTz28g9BRbQ/kQCbFvCz2LPuZJW18KOrRD8wQRw
	52p/wV8PxEDJcQmNlN4Bn57jtgrpk3TZzftf3iylqi1wH/BMZT9wwaJR8pw4L885mFpcnFaE3HD
	JEZs9hQhEQjDtaz5xJ74WCXRib7RVuWxs+av9oLlayvMxkb600WqF+QiNenRm8Ca+O3C7h6+kHM
	QhbIlYVh12gZG3hdgncfzZgF5xngNIQjY94Kcj/iYZCd0zvO4ZsoHrP9Cr2AfObMF51Udqd1ND+
	MxcJ+YzUcGZa8WWFsG8RYeylGEhHP4F0oGeguPggWcX8FiCJqtGHKE5L2N7G5MGj0+weWKO8PIg
	psRUk4Zu/huo0gfNAnDOEgq82daTEmEmNigfbrWhSPOSVnrPaf03T+jC3fYARQ2RgNbsKx6kIn7
	OuC4Okh1/Q1UIOa8tX8/fz4wbFXrx01y7z+5iD15P5+i7CPot64fiCo+g=
X-Google-Smtp-Source: AGHT+IHQ2+tO7amZ1Hd3lau7QeebQejhPMBwIfPvu9lcXcu5kw8U72PL8snBAclb+6f2qXS65G5ttA==
X-Received: by 2002:a05:6000:2586:b0:431:752:6737 with SMTP id ffacd0b85a97d-432c375b134mr20238261f8f.30.1768227418552;
        Mon, 12 Jan 2026 06:16:58 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:4c43:39e0:348c:a72e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38705096f8f.25.2026.01.12.06.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:16:58 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/5] gs101: Add support for Display Process Unit (DPU)
 clocks
Date: Mon, 12 Jan 2026 14:16:47 +0000
Message-Id: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8CZWkC/22NQQ6CMBBFr0Jmbc20saFx5T0MiwIjTCQUp9BoC
 He34sKNy/eS//4KkYQpwrlYQShx5DBmMIcCmt6PHSluM4NBY7U2qNppUc0QmntUZe2MbdE6LD3
 kwSR04+ceu1ZfFnosuTn/ZM9xDvLaD5P+2L/tpBUqrS06tCfytbsMPHoJxyAdVNu2vQHcK/OAu
 gAAAA==
X-Change-ID: 20251120-dpu-clocks-7b825d05807a
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=JgfZ7b5grfSFrY2uNGn7XAOdObSUV8Hdp8wFhFtHqAs=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZQJUgcJ1b1TNz39ppcyhnd3oPqJ4xJI7Lt6DD
 I5Z+HiKa4eJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWUCVAAKCRDO6LjWAjRy
 uiRZD/4uni/IFLPMrxZSAE+mLtncreOXd32tYdFVDOlRFulzcXvfJdY1b//zNAbEf5c1WZLk/m5
 TA/sVbReP0+peU9IAlVlSLvkdHhtAWsvkyHlzTENmIv2TUwJY0+/nbefuWNvLUwv98d8ZwJiXRo
 iNrbrqy7mn/zwsRR2WSmji9Tx/dE/tCZB5Q9EbD3w5yACc3DNJT78YFX9QKIgQozwM9JV6yZAiE
 cQyeok8cqr9Zz2S9tKfoxfKIWAxAjCDhiDPX+Nb1sOEDxDxuqV8NXTYCiC+efQC/cMttsnBLh7M
 i+3JqDtOcWPN0WnnBUAD3hB7QO/fWGJRG5zGbH7pPNyLauaAF9D14Thz1yywZ3hUN71oI0XS3kP
 +Zq9jMz7LkQGAwzpFgQwnCau1K9j3KxNPcW5WY6T9/3QQ0iCGfWLg3pB4Dy7+Q56l+IQJegI2bF
 OPpyighroZX36Wh8S1qoFTxfqrElMz3jgdPZu65vnrxzSrjjXDP5gDMRRZ8Zft9gz2Qdkre81FU
 rivsDSPvxBRI//sZ3Py2MXzQRCkADN5ApC7YsBZcFtK4HMPWMgq/c+Xfo3s9vdUOT8Eneg2TkHa
 8ib8hXHMdavuwNAE0hSBWLp2BER4E9FPn7o1mLDoQz7yig9vBTl8CZYuX7hqolfQHXfFWpQ0Gdp
 vj5nzkmRDIFB2Sw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series adds support for the Display Process Unit (DPU) Clock
Management Unit (CMU) aka CMU_DPU found on gs101. These will be used for
the IOMMU and display enablement.

As all the patches will go via Krzysztof tree it has been sent as one
series.

regards,

Peter.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
- Fix alphanumeric ordering (Krzysztof)
- Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
- Fix dout_dpu_busp parent (Peter)
- Rebased onto next-20260109
- Link to v1: https://lore.kernel.org/r/20251120-dpu-clocks-v1-0-11508054eab8@linaro.org

---
Peter Griffin (5):
      dt-bindings: clock: google,gs101-clock: fix alphanumeric ordering
      dt-bindings: clock: google,gs101-clock: Add DPU clock management unit
      dt-bindings: samsung: exynos-sysreg: add gs101 dpu compatible
      clk: samsung: gs101: add support for Display Process Unit (DPU) clocks
      arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes

 .../bindings/clock/google,gs101-clock.yaml         |  25 +-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  17 ++
 drivers/clk/samsung/clk-gs101.c                    | 283 +++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           |  36 +++
 5 files changed, 360 insertions(+), 3 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20251120-dpu-clocks-7b825d05807a

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


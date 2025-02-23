Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD3A2063C2;
	Sun, 23 Feb 2025 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740311767; cv=none; b=X4rOpCRoYShQWoFj9XDGigIUIS0AuXLzagai66AzHcqCRwygBDkAHRVjYBQhVE71fNR9HwiBJEjvnqq9tbrwI9oE4a+uP0yywOFG1s6Fxj0UJOXJlP5CLYrCrnPlxmX7vbJHaOd3f+PGdq9+OQCvC0sZLMfN6ruhLcdQ03KSvME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740311767; c=relaxed/simple;
	bh=kWhnjPamWt3rHqcSEpYHyD9/F3WM/6V8yX+j0SoPcOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hdx4XF8oqk6K5t7WQjhqmPjtPHTsin3ROi/0HyWGpGWIGdgsVHmWnYXEAkRLY8j8ayRqUdtZBLMKcVJNbD1T1n4mrwLPC7Qlpc/xFov9n52+iE7QA/2HMXp/OlFAOg3/zG0vFr1UKAXKteeRelE/OnnkHYsO3G7y2Fff7uzHRJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpipfKYi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpipfKYi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-439a331d981so30748175e9.3;
        Sun, 23 Feb 2025 03:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740311764; x=1740916564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dkUGDPcIAQTUQFuAd1W5AUK3wwrA36JfPvoQmGdRDA=;
        b=QpipfKYihxR7KyVFlNfrJDvAJiUV3UwtyQKBaaLr33S2dOYs21HuOjRnHa5vOnKdrb
         r4j4BOBmtSnaK4GJoJTPS/KhLZvVEvDghVXPp8UtHBKG4JsEJrtDHZji5yiA/t80tYIW
         rDpglsgiZjyGjaj92tzRDvWDmP+79U33d8MsP4+D9lFEim+6zXqLXa60ISSz5uxD+pcU
         v+ghKas74EjluZIp1HA/CBWXWvVbz3iu7x6p/njkE0e1w7hg7ko0hvR4eGc+eQZMmxQl
         G4dm3CckD1uY20980sZt8oQ57I8nvgNkkaD8+OuzIaE0jjeM6CsAMWtLnwQ3FcwZihSr
         83uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740311764; x=1740916564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dkUGDPcIAQTUQFuAd1W5AUK3wwrA36JfPvoQmGdRDA=;
        b=iZ77EBbiWXFrGG5jgdVZZYqHrfU790UM/z9IVwzJvbDkKWqtbNC2oqmiCOsXzPzARn
         kGcjAMhBHS0DJIjdYVK5OAbFfqnkZVRL32p/jQQRIGSmUBKRyHSiViPkv6VM/4n5notw
         mqLyDa1XsHdGhSX0k3cNszG8BX0BOBZwXQ1vA//c+S9yNcZJtkRRPcMkBfYlSTOlT5kJ
         kVHQl3nhFt6M9icbCrBJ+5fqY/FucTFQjaMii9w6s933o08DCKuhGRjSmEsXKPo88LnM
         VyeXWfT38GvLWrre1320CIjPg/Er7cSxdm4Xl4w0z5JbYmVaFOXLMw9oQBtreP/v92t8
         3RHg==
X-Forwarded-Encrypted: i=1; AJvYcCV9V39O8Lkbe7Cf1tUCbalBh7LAxYDWePQmI69FOMgBHAZcZ9vR9McltCkAECr9axpnoJW/RlMZCBNr@vger.kernel.org, AJvYcCWDinx88cOIPQ1jmRVps/08s0uhslz02lMrPJ9K8uiImI8+HiI8I5otfbxj8d68zRn3v4g1UHdx7ovHJubJHZ2RaQk=@vger.kernel.org, AJvYcCWMTwtludNi9YrmLMSRlH1GfClkBuzivAVDNMJD9PgpzQuT3WpbnEqJcqjuPZgRhLyvKdyJswHSZkWQrtWU@vger.kernel.org, AJvYcCXMd09rWJA90ud3GGOVgt3hjw0fkcChhshWxD3J8maRb2FIqbZ4GQwheKv325IvUoRRjX08nqGpZdXG@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgjzJeu7kf4HVAOZtJpXe/84ZgOGshKV/B+614Ih5GwXuZV9q
	uXc5YXMU68WfrqM/E/e+SxUSwkg3BDZ8hN7JG85EXawUiDmcT3bY
X-Gm-Gg: ASbGncs5KOs9Vy6O6sxqUZ2IOomYlAjNI5F3GUZgY7fOY3JxtBjRvNRliFa2fYOPw3T
	3SlCxv08AATz4Wqx97OoA1yA7IzXsKvWnshSDS8++k7udcSizo6pWnKfZZ59KEtPKjXHKw9B+u0
	voiwQdRbV2LCmD8jRgbZPeLx8mQuodKvB/CLhCX3Iniz50BS1KJpNCKAkbWOPerJRWN9zsgIQjm
	JI7+bZu/r49te4WJg0sIO7hdlebdxFeuxgnj6gYO9h572nrmUKlkqLr2KrDkWTUralbBuChzZwG
	yPeNud13SLCrMNKIjOlZ5qB4hb1fmnwJyGLh5UW1GdGpUUxQ0Jo8LpweyzUn4nydCgvJeGmjL8C
	vew==
X-Google-Smtp-Source: AGHT+IEBJelpxytybvAH4wRvYLIonv1gCa21WDU2Fk0ndy08HF7fSvxqOW4VcU4PB5k6if1vcmxENw==
X-Received: by 2002:a05:600c:1396:b0:439:6d7c:48fd with SMTP id 5b1f17b1804b1-439ae1d877dmr81819005e9.4.1740311764104;
        Sun, 23 Feb 2025 03:56:04 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8e62sm28861189f8f.71.2025.02.23.03.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 03:56:03 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] clk: samsung: introduce Exynos2200 clock driver
Date: Sun, 23 Feb 2025 13:55:57 +0200
Message-ID: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset introduces clock driver support for Exynos 2200.

It's modelled to take advantage of hwacg (hardware auto-clock gating).
This means gates are not defined, so that hwacg takes care of the
gating, which leads to a smaller and simpler clock driver design.

Gate register definitions are left so that they're documented and
in case a gate needs to be forcefully left open in the future, we
won't have to define the register.

Bindings have been tested appropriately:
$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml"
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml: ps-cancellation-current-picoamp: missing type definition
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.example.dts
  DTC [C] Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.example.dtb

Best regards,
Ivaylo

Changes in v2:
 - unify binding and header name with compatible

Ivaylo Ivanov (3):
  dt-bindings: clock: add Exynos2200 SoC
  clk: samsung: clk-pll: add support for pll_4311
  clk: samsung: introduce Exynos2200 clock driver

 .../clock/samsung,exynos2200-cmu.yaml         |  247 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos2200.c          | 3928 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    1 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../clock/samsung,exynos2200-cmu.h            |  431 ++
 6 files changed, 4609 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos2200.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos2200-cmu.h

-- 
2.43.0


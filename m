Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F80D238C0D
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853759; cv=none; b=hiU+Ud2Fe3nF/6JcbbVzRq9sq/SUuqxds1sA2fiagFAK7+LINxNL6/DWD8MGWcQFeDRwMD6DnZs1Dd24DHbJGZ1VMi0iVfj+xrd+aodN6dxFGoDXoPK47sojwxHRknQwefA+O8lSgRg6z9FOAXyVvlToDr5+ggiQ9/XoaOpkyr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853759; c=relaxed/simple;
	bh=a0DS+1ZMlf/0j8PrJ136z6bVlAIog4gQ8+ovr9ZcVgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GWh92mUVQ6vxm/qGpNKDLntwlIYYoId6LNJvymTcA0DMRhf2idGBcGLcgo9jg13BgrOnaw7oRXa49gicMtT8kj1vxt+wqM0I6tFG5GO6ocJDP8ezrVdnvwGaR4HCQu95ACvZlNDBdbfR9dPkOQOSjbtq/wNAipJA8kdbxGrDanM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPnGWKqi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPnGWKqi"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45de1084868so17124425e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 05:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853757; x=1758458557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWkNgc7TTxage7dXNRfg4+5gf5ClKzMP0YRT5Au2R2c=;
        b=mPnGWKqiR75OXmA8flkhbvdmXevDvOJ585jiVFoHBqmGuEd/Sk7A24/8sfbZ/ReLKa
         Ui/If56b3x37Q+u4B71ebHek08VRoTyYThBqUNsLqd8frIYO0mSsmkmV8Ezc43IMdSmZ
         3wJgfu70KctsZSNXBfsslmWk5lBMM2OSLAZibJMN+c3h+JZ/vOdZSz/k3c/uHxFV7YVw
         xEa5jasI1z3Ult+eP5B0Ap19l/EcGGv9Q5xuxTKPLj5q6HjCMKndWamWW5B8DEzqJkow
         jnNxqblbjuCh0yWh149LRBS5IqymXlfweAYKRtez4i9ONcRLK2zyF3AzSdH90pB0fp5L
         jMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853757; x=1758458557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWkNgc7TTxage7dXNRfg4+5gf5ClKzMP0YRT5Au2R2c=;
        b=tR4uekUEWAUfjqOk/O5l57vuIrz28XMjVRZDdQzjbZGOG9qyyFnAlA9wzZkakfXKy1
         FBoF6+NJs11FRWYiY8pAQd+AOgE8Wewsn1HfOORzdr02TwRmES9i+B8NMoE9FJZJ6LRE
         J5yrsIAvFFTGbS1MhcAe9TB0XbOpNeTnDNQNcJ4W72HJ8WMqvCD2gZTVoTPI7KdITvA6
         5A1CdxsE421blJR4OGGHK2viYILburTzUvfB5PUkwuWhfvlZJxf9hIqG70w1dd481qUo
         bn4PzZuXbOgqASMulEYIhH8BDxJwIkczOEHxVnanm0LVcdzEIcCQVhzauSO1dt/+A30C
         Lghw==
X-Gm-Message-State: AOJu0YxcR9IAjyqe9lq2dXTregtCw6Twvk4HZwhSddh4z2RUH1ZqDYT1
	WQE/clQ2GNYNp2FX//XH3ywoyqiOr2z0H6sap+5eGKJpBuBRF8fj3zW9
X-Gm-Gg: ASbGncuTmod2KHKBzE9Rwc5bRT7l6ct2ck7eDEarQchKsEMYTHVnHXNejuX8Jlc5NUJ
	IPfYjnNoO1SEyaxM7LXYBuYn+CZzaqRHSNSMCPL/LwOLwUInFmJuKgh1N/I+ScWpfYRU3HJg58I
	d7VPwLHnVtcmBEDGCXm/fLjSao6v+l5xU6sqPFFwjGyPVQEYRHX9JGkEUwLY9LokWAErKzOmbCJ
	zrdFsDJtKJRJGJkpVnsR8tu4v8xLOGenDI9TMYzwuOIp1KtnHGWkC/ANAyEN9xAOgQWXSTQ/agb
	wUTNGHz1j3sXjE3DHI4CgpuBKBtiTFyof+YlZn7A4NjVtSo9k4a6ufYM7yNXAy+LJogm5QYeWXY
	RSNxe6VlnEVyLxJn98w6F08Vg2NHbDtVzaoga9Rmy38/+Hf5OQiFVpHnReeemHitURimoJ7ADpC
	GMfCPu3GPP
X-Google-Smtp-Source: AGHT+IFD1dzVaPjd75ZW6xF7NbuDRvrlMisxkkeIZupeaMoc65Ne74ve/Yf/Aq5gRDwhZi8axs3xXg==
X-Received: by 2002:a05:600c:468a:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-45f211f2eb5mr109286965e9.17.1757853756463;
        Sun, 14 Sep 2025 05:42:36 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:36 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] mfd: sec: add support for s2mps16 pmic
Date: Sun, 14 Sep 2025 15:42:20 +0300
Message-ID: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds support for the s2mps16 pmic, used on devices like
the Samsung Galaxy S7, S7 edge and the Note 7. It is still wired over
I2C, unlike newer exynoses, but also can be communicated with via APM,
support for which is not done (and probably will never be, as it's
pretty much useless).

The order of patches is important, hence why I've not split it into
subsystems. Patch 1/7 should go before patch 2/7, as 2/7 includes the
file made at 1/7. The rest can be applied without a specific order.
Thanks!

Best regards,
Ivaylo

Ivaylo Ivanov (7):
  regulator: dt-bindings: add documentation for s2mps16-pmic regulators
  dt-bindings: mfd: samsung,s2mps11: add compatible for s2mps16-pmic
  dt-bindings: clock: samsung,s2mps11: document the S2MPS16 compatible
  mfd: sec: add support for s2mps16 pmic
  clk: s2mps11: add the support for S2MPS16 PMIC clock
  rtc: s5m: add support for S2MPS16 RTC
  regulator: s2mps11: add support for S2MPS16 regulators

 .../bindings/clock/samsung,s2mps11.yaml       |   3 +-
 .../bindings/mfd/samsung,s2mps11.yaml         |  17 +-
 .../bindings/regulator/samsung,s2mps16.yaml   |  50 +++++
 drivers/clk/clk-s2mps11.c                     |   8 +
 drivers/mfd/sec-common.c                      |  10 +
 drivers/mfd/sec-i2c.c                         |  16 ++
 drivers/mfd/sec-irq.c                         |  46 +++++
 drivers/regulator/Kconfig                     |   4 +-
 drivers/regulator/s2mps11.c                   | 147 +++++++++++++
 drivers/rtc/rtc-s5m.c                         |  16 ++
 include/linux/mfd/samsung/core.h              |   1 +
 include/linux/mfd/samsung/irq.h               |  66 ++++++
 include/linux/mfd/samsung/s2mps16.h           | 195 ++++++++++++++++++
 13 files changed, 574 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps16.yaml
 create mode 100644 include/linux/mfd/samsung/s2mps16.h

-- 
2.43.0


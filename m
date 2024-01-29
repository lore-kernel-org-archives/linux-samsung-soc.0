Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808473F9CB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 17:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550430; cv=none; b=NTKU3pEH6xRZOVp0B6uxUkerbZIg97TiDg+Lqf6mRSa+rJp9Hn1qoTQLuUzYQL90NyUyrRuQyCQvouIsLC0+jhasdsuFJ2AiQv6nBcS8R+iJTKBjuxkbngR8WsbYajPc9Pk8H1HHeZEisnT6lcKaEUYhp7l5A4tPh1URtSqrp5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550430; c=relaxed/simple;
	bh=BynP/TqLMLfBOswfTcC8kC5lE1LXFmDEjeWNmLl9lz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ToX+W+7/ntGe0c807fxGA0bU6gLJZrHBCe9eJVXr9Qwue7qx4FCWDBF4nzAxjLunAt2jLu6emEknll97A29Zi8HZYxz52flE7YnAVIr2jIZ8fXIrzjeFAx5e/sXKlXhkRApoyGFQ2ObPAp/fbWhktGI8laiIGvLCyopoEexYTDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t9icrykO; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t9icrykO"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so3024170a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706550427; x=1707155227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jOscdCJLzZ5JXX0e0WvJ8V1LHndgq8+D5+LB5prqHn4=;
        b=t9icrykOuQYAjN3NDVzw6zhy7I6aFheFxtOcuFOV5Zm0rM2ur6NisDplNxC2Ii0lXc
         dhXcq+AGfS3QQG4LMHvLqNv2i3pQ6QVWH/JfzzQ8Fe5EcgZqYjcLiFoS2kYliJT5nIQg
         zE5Ei2SBvCWsG2m75nTHkHIe3NWsTz+VpY7Ex7eH7zn1NGXWO30Xbh/J7iphIIXpHNpt
         pZRBnaopV4R0FpVbSBwB5Q3YNAMYQQokw0XF7vxKZRn+R9WkVFLoONCm9b5gm4514K6N
         cxmZhqE7G3ov7ayUgHNdj723QeyWfLtz+3i0uPlT33N6BJs/VKQKziimvTIg9GA6fEgP
         GgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550427; x=1707155227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOscdCJLzZ5JXX0e0WvJ8V1LHndgq8+D5+LB5prqHn4=;
        b=On86asJtx9vEIQS5vFMT/9chLCz1737ageilI6x50U2mECRw7AzI4zm0dsAo/ChqCy
         57T3jaqBohoYqyHur4p5j14NkWHVvsEbcpEDOP3SDvPDGsDQ4DH2O2y/jOgcl5d/upGl
         OgqvodbTtr/rK5kfQNVz5BTXpNLUzAqHm4UB/a6SUK46iMjnO649/2aIRp0RmqCQ2IBM
         j7+SG/+CJK46ugdwBfeU2xxuPE+uk1l8wXB9o3Cn+DvNNfAbv/R+qzxWfplvpjqoNBJ+
         G4Gh0Yq1QsackAbdce3by2kiPiLfjVWTZ9X7H/7J5SfMtDX2PUKw+EprutvVadUIkdXy
         T/gw==
X-Gm-Message-State: AOJu0YySw+yHOm+OOvypjbTUPxsAxiuP/s01aurCHo+6OJxXlfC4JSEF
	BhMJzXhpZhrS+vHXVEA2WsENYHXvpNSB5Bl8PL6Yx7txS0JrV5m0WeMyIlic2M0=
X-Google-Smtp-Source: AGHT+IFYj6qEhmjznFH5sRPH/JysLmerRvtAXfaQEg/8K2UqFf1zZ/2Rm3XOT1uZQIOgPdbakQe1Lg==
X-Received: by 2002:a05:6402:22d6:b0:55f:13f7:ad18 with SMTP id dm22-20020a05640222d600b0055f13f7ad18mr1412798edb.6.1706550426761;
        Mon, 29 Jan 2024 09:47:06 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id u10-20020a05640207ca00b0055f08fa9286sm1000999edy.23.2024.01.29.09.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:47:06 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/7] gs101 oriole: peripheral block 1 (peric1) and i2c12 support
Date: Mon, 29 Jan 2024 17:45:59 +0000
Message-ID: <20240129174703.1175426-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series implements support for the 2nd connectivity
peripheral block on gs101.
This block contains an additional 6 USI, 1 I3C and 1 PWM
interfaces/busses.

i2cdetect shows all expected devices on the one i2c bus that this patch
series enables.
Everything that's in scope in this series works also without the
clk_ignore_unused kernel command line argument.

While working on this, I noticed the existing peric0 support for gs101
has a couple issues. That explains why there are differences compared
to it and a separate patch series has been sent to fix up peric0
support.

Cheers,
Andre'

Changes in v3:
drop an invalid email address from recipients list, sorry :-(

Changes in v2:
- squash original patches #3+#9 (Krzysztof)
- move original patch #7 to new #4
- squash original patches #4+#8 and make it #5 (Krzysztof)
- add short summary of devices attached to i2c bus 12 & add TODO (Sam & Peter)
- collect Reviewed-by: tags
- I kept Reviewed-by: tags for the squashed patches. Please shout if
  that wasn't expected

 .../bindings/clock/google,gs101-clock.yaml    |   9 +-
 .../soc/samsung/samsung,exynos-sysreg.yaml    |   1 +
 .../boot/dts/exynos/google/gs101-oriole.dts   |  10 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  41 ++
 drivers/clk/samsung/clk-gs101.c               | 347 ++++++++++++++++-
 include/dt-bindings/clock/google,gs101.h      |  48 +++
 6 files changed, 452 insertions(+), 4 deletions(-)



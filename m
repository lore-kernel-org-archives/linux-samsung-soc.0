Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504CF2DC792
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966258; cv=none; b=UCHPOaFusdc6g5aCjUj0xndAjWsTY8hmfLkSffRS1ez5U2ozABlg3SKdFP4J2fM5JPsDKD/51zM09iDVGmYIHrN7///OuTGwD51LjW0oefto6Xor6LLQx8iG4VeiEERQwI7IoAocZkciQKo0bBili21fBHBRKrEXleR9Ay9u0lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966258; c=relaxed/simple;
	bh=D80UQ8DT8x5gDNh37qxMkColQlMlnGetG+D6Y4IENvg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C1IXU8v1nr5XZDFesDSupZtno1pDonSI7dSYEl35sRgsE3jbtTpz3r9LUu8dfaZho5/Lh/9rv1rDmyXTwcfoMhjigs+6EFW2bouy5VLJBcWQqEyiVfKKu6zyZgAZopMLjyZ4HtPp/cjUQLShQYjN11WwMSqtgo6nvO5vo9BdyNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ooT9ab/V; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ooT9ab/V"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so75560966b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 02:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765966255; x=1766571055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pmx5Fh1q9VVmgUGBpn1GZZhSMw+zKOQQK4BKRiX9H1c=;
        b=ooT9ab/VXs7NU45sHldIHT0bAGl7MJkJxljRqp0hA6gVGCOb26E90AejzoBinHBg/E
         iyhgOo56mAF9NBrNUs1QipmqHZsArz6qwVT2uXpQOKtoL1tCpQ4SjUKrtlPk6V/K40e/
         Z8VFIGebVdD7d0NvNwqrN79ZhCO3ReGNMJcWmz0W7URdQ+6Tw68srKC/W0qIFbcJkiGN
         NPm1Kb32xjU4lappnOgAl8MjShI2pMNRlEej6GoA80TsNIIv3VhG8feJcWh8ru3QjB1z
         JHh0Pmby+pOeFAs/Zsj9+tkUWpU3aTTngX7ls9Bt+k2UK9ZdRuNdOOovstzEQkxdhrUp
         i8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966255; x=1766571055;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pmx5Fh1q9VVmgUGBpn1GZZhSMw+zKOQQK4BKRiX9H1c=;
        b=byAvzK22pF1j+UhOeO+RpXxyzYIqhNS6hkSMELTV3uttA8vtFCLuzEn/Xiwhmez/gb
         w68hRxKXfh7+k5LMCmxSQYGeiqcFgfl+XjzkvlrNm3Q5tEUuXz+5+Rd0+e21wUavfzzI
         NrcXJMvG7utfNXzmYq/HmOEfaoI9NC96Ip0Ht9MYzgY3uHkVk7YUwZd27fbhhcGu3K35
         LaCuzrw62XUpJ0pBfoGolI05A4mLVBPvv3hW5d5pGSnnuGdMAZsoXZDdThm4Cme+/bUQ
         GVTlkOUE8dR5E+IYJyG51j8mxPicxmtWobXrIRSQZ0NO4Wm5+28F5HcMyBNnpe/39SjB
         ECdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaAW0NM/V+YbIOdbm3Al0s3SOPQPcdtoFC1TVspB0f9vCfG/MESaZcMq2gaULKMFJzUnk773IM1nkaZQ7j8XxTAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybPrmgip1nsj4jPwYceJUiPTWpsa+dWBHqnyc0l0uf9StphQp1
	rxi4YXlGGK17AB8iC/6KedSdRSca5rjwEcUpqAkB8U98S2g4vXunwCC+YOjKVi0Rr7M=
X-Gm-Gg: AY/fxX78KFflNIYnj73mYKY+Nsab2J288WZNV/IoG8rznX3WTN+Rah3UEPx+8bQ5b6s
	XAJ2Yc799LAHEGi4nYxwEn2UBAJOxuMJnk6Fp8WQaB6FVeev8tf5NUHiqhRJ8ORy8Srm2J7XdUw
	Pe8V7cc3jysHAMpcVwKZ0xngrUTimZV6ykiQY0SAdzEIcEZA61jNxvizQMyJsI+1shetBGOgpWF
	GgigrMlPzcGrtiYRf/+984m00ZRyawd2mFP19gr8+uGvh2jL5YeHsMJ5qbDNUdKGtf9HgpA9FRs
	UKo+P19ZRbAkQxJOGfCwpbOQ/oxXMNKgUDinncc59cQT21W+qMmlp0l5cuDMsRPI6P6t3r+UTs1
	xHlBQuRhZKl5twTUHoNvc2YLASVH3TAaLDbKb6rzZxfG5STJFYGGgI3A+6sagSfobrSVdTAGhAq
	rEsVxvc0j5MivgSIo2lH+w+809Kw+Wu8IIaKhz4JR+l2vUiTF5AwSeqM91IEBdF7V1M9MWU9OhV
	6qMPwlAJz5EvwSw
X-Google-Smtp-Source: AGHT+IF5zm0UEFizopfWKiRe5Ec3MeSDOQ/+bpnMQXefKzphsbz91xocDwvtUI0VN/lqSomvkA6FhQ==
X-Received: by 2002:a17:907:5c2:b0:b73:9a71:13bb with SMTP id a640c23a62f3a-b7d238bf832mr2100181366b.32.1765966254506;
        Wed, 17 Dec 2025 02:10:54 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4f5a22sm2043811a12.9.2025.12.17.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:10:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH RESEND v2 0/3] Samsung mfd/rtc driver alarm IRQ
 simplification
Date: Wed, 17 Dec 2025 10:10:47 +0000
Message-Id: <20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

With the attached patches the Samsung s5m RTC driver is simplified a
little bit with regards to alarm IRQ acquisition.

The end result is that instead of having a list of IRQ numbers for each
variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
queries the 'alarm' platform resource from the parent (mfd cell).

Additionally, we can drop a now-useless field from runtime data,
reducing memory consumption slightly.

The attached patches must be applied in-order as patch 2 without 1 will
fail at runtime, and patch 3 without 2 will fail at build time. I would
expect them all to go via the MFD tree. Alternatively, they could be
applied individually to the respective kernel trees during multiple
kernel release cycles, but that seems a needless complication and
delay.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- rebase on top of https://lore.kernel.org/r/20251114-s2mpg10-chained-irq-v1-1-34ddfa49c4cd@linaro.org
- return struct regmap_irq_chip_data * in sec_irq_init() (Lee)
- collect tags
- Link to v1: https://lore.kernel.org/r/20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org

---
André Draszik (3):
      mfd: sec: add rtc alarm IRQ as platform device resource
      rtc: s5m: query platform device IRQ resource for alarm IRQ
      mfd: sec: drop now unused struct sec_pmic_dev::irq_data

 drivers/mfd/sec-common.c         | 45 ++++++++++++++++++++--------
 drivers/mfd/sec-core.h           |  2 +-
 drivers/mfd/sec-irq.c            | 63 ++++++++++++++++++----------------------
 drivers/rtc/rtc-s5m.c            | 21 +++++---------
 include/linux/mfd/samsung/core.h |  1 -
 5 files changed, 71 insertions(+), 61 deletions(-)
---
base-commit: 9ad5de6d54f306b2bbf7ceb27e67a60c58a71224
change-id: 20251114-s5m-alarm-3de705ea53ce

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


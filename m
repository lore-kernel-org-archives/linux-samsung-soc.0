Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C4E35E547
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474183; cv=none; b=LDiy36E5erEF5Nf4la3tGC25qKtk0xziSoFJ33+ow7R3+0xuq3r/siKSomqIJc4dugU2vPT7f1nx3bTmEjN96OVjQSgmCBJywio4GM1EQUDWekKR1GS5O85LAEUXLwxapprSwU5kVQsRrLvHF+gCBMAwj5VxaJfcOFzlLSlZInE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474183; c=relaxed/simple;
	bh=Kr8mEMg8GUIR0ES8nTKUQqU7gngQ/9e8fD/J6xaVWA8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AfnSuXIVpc2qmTqFZumbZ1h6WHSuUSeN4J2yx/XHJlxqVqkRuXgfXbwFFpqBDrc/gff/L3duylb5NQFBicp6Nf0rGw9Q2duWJVROGvo5OkL8HwwjvLEkD26er3yqqjIl+BjYam4V5orH4KT9+tOYb4TS5RM5ukyPQkV08IS/W18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jvpzAyTd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jvpzAyTd"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso19703205e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474178; x=1764078978; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGA59MK9dVZM5lN1BpwAauPGxOjSxQZOCE1Zm+eAl04=;
        b=jvpzAyTd8T8WORvEM4lohCAEj/0LLVuT2FZE4DK3gHtfS6MzO5WtImMRCmGfyM45yH
         Hj0v5vKQ4IvOjkvO/2R279hwWj96ZUdIC5Tpjti/577pWQ/7W7wReG5QJV/Ir3FnYQvR
         oyzSiTxFY7M1r6tIhI+ryelwF+tf7ypVDBw15Gjkpo+7Qvm/taSX9mk5lAmL7l27j690
         +gZv/vTtGaoSjRMfiU/J3b6X1CFD+vlVW5avVaUPe2nrP87Nh5xzKMu5zMA009opyHpa
         7xkfFD/BgJOfuzdzGLjLTrJS8mPZLIbeBV+U4YiYuhnr5/r4BMWpeeWhCWLZ2I9amzVD
         QsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474178; x=1764078978;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGA59MK9dVZM5lN1BpwAauPGxOjSxQZOCE1Zm+eAl04=;
        b=b+ecTVTVZs2OqWBQx2jnggsXiA2SyAMh55fhDMIQ6TC0c+2LPr9/uj9Pk/RbePkA23
         LhEbXEfz5+nynqEuozh1kklKbOU/qK29RFPjnTDQ1GlpSxDexhMt2W3iYcIxCb2W5CA1
         gmf2Wtze5WkDRu3wlYYrlvONrcp7187A6s3WRIZSqaPTs/PTUKZiiY6e2fJ+4KhXTqkl
         azKQsSE1xmIRZ5h89sb9HOdCe3KdPqpxh2Zb6fBZ/2K2zR7/gHPzG09wpjTrqRRQ28fu
         wT25oYtbMnAlt2FWt1K9kL1h9y7vis23KMbJQd3+ISse2e1obRNYAa/BYNxaNpypVXRO
         ryIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVln1tQ6a0VYWS9VYAnKlE2jVHTBZQROOJBPOiGfg5+mHKgOrXcUPR00koU2diocrCXCnFKC6Vzamy8eadc/LcgAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznNYS3l3eTKR93aTisZLTk5XSd0JRaA9odcZ7dGwFpYkRkMdIa
	w7WZUh3W/uPS1tvJVe1LiR7uO6yqabxrJ0d+muA/XcyC3lb/bzPbVfFskgWjreXIgI8=
X-Gm-Gg: ASbGncucrwd8cu+ruYto+7XrTOB0xxXFie0dZAzOwdiyNkLgCQL4272evDmaWnkiEJ1
	slfGHpu2LhRSelkWGtOCujy6z6ylpTpPxBj4AaBeOwrPnVu15zQwes5potIT+2sBnnn8RVRqoR0
	A+CpAJvQWnMnYsmKnmd5h9uLYoY1MMxER9XiEHx77E0TG/D5E47lMUTgPH4FnNMr7ksuwU1hdS/
	anF13xkrpHZYF08D1Oahk9GTMX7h0jNQEHr02tgHvCHiQlGHm9KxF8slCg2pbG/syw9i0pV3PlN
	azIhu/lXJsDrj34+2oTXufsT5tD36Ll4xE4cLaQf8qu6HirSZYhkpPuCcjMaul4gwWDFGvGuUyo
	jJ151EstruKrnuisVizUfo8+Feg6KgQXP8HFguqoeEp7iTX06K1WXApPSDHDjQjeQBdazynaCEZ
	v7S+wgEZqdCJHDD/RXcrN3XS/IzvvEobNpKJBgo7QrAEQ7VIq57UyvU6pRrgYBllnn09M=
X-Google-Smtp-Source: AGHT+IGZgxXdUzTGsmQijkdGDIfr7wMhee9CfrwEzDd8qB6n/m1q35GD6+YFJI552JcqQZiyv9YzDA==
X-Received: by 2002:a05:6000:186d:b0:429:d3c9:b8af with SMTP id ffacd0b85a97d-42ca8cd0d7bmr3671679f8f.25.1763474178264;
        Tue, 18 Nov 2025 05:56:18 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:17 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/7] soc: samsung: exynos-chipid: add gs101 support
Date: Tue, 18 Nov 2025 13:56:07 +0000
Message-Id: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPd6HGkC/3XMywrCMBCF4Vcps3YkEy8Nrvoe0kVsbgOSlESCU
 vLuxu5d/gfOt0GxmW2B27BBtpULp9hDHgZYgo7eIpveIIW8kDgR+kKCcAm8skFn1NlopZ2WDvp
 lzdbxe+fuc+/A5ZXyZ9cr/dY/UCUUaEZlSIzXhyQxPTnqnI4pe5hba1+rSZ+4qQAAAA==
X-Change-ID: 20251031-gs101-chipid-fd84da8afa2f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=2844;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Kr8mEMg8GUIR0ES8nTKUQqU7gngQ/9e8fD/J6xaVWA8=;
 b=LVRWlNp4X7IcullcpPaadgDLyqzRT2qebSKjsvSfkZjCX4eK3g7QnnM3DOTUjINKB9zjC3vfk
 wNdkuEWFaYFAUAUWVq3uOk+QcZszuFH+ip5x5/d7jyRSJQU4A9nA01Z
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Dependency
==========
Typical dependency of the DT patch depending on the bindings patch,
thus the bindings patch could go via the Samsung SoC tree with
Srinivas's ack.

Description
===========
GS101 is different (but also e850 and autov9 I assume) from the SoCs
that are currently handled by the exynos-chipid driver because the
chip ID info is part of the OTP registers. GS101 OTP has a clock, an
interrupt line, a register space (that contains product and chip ID,
TMU data, ASV, etc) and a 32Kbit memory space that can be
read/program/locked with specific commands. On GS101 the "ChipID block"
is just an abstraction, it's not a physical device. When the power-on
sequence progresses, the OTP chipid values are loaded to the OTP
registers.

Add the GS101 chip ID support. The support is intentionally added in the
exynos-chipid driver, and not in a dedicated Exynos OTP driver, because
we estimate that there will not be any OTP consumers in the kernel other
than the chip ID/SoC interface. The downstream GS101 drivers confirm
this supposition.

Testing
=======
root@google-gs:~# cat /sys/devices/soc0/family
Samsung Exynos
root@google-gs:~# cat /sys/devices/soc0/machine
Oriole
root@google-gs:~# cat /sys/devices/soc0/revision
11
root@google-gs:~# cat /sys/devices/soc0/soc_id
GS101

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
- complete rework, treat it as a new patch set please.
- bindings were reviewed at:
  - Link: https://lore.kernel.org/linux-samsung-soc/27a5521cd7ddbed0e870ac416dc829722f1b36a5.camel@linaro.org/T/#me139353334db535806ca6462ae1e86b01ff032a7
  - addressed Andre's s/if of/is of
- part of the cleaning patches are from this trivial series:
  - Link: https://lore.kernel.org/linux-samsung-soc/20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org/
- Link to v1: https://lore.kernel.org/r/20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org

---
Tudor Ambarus (7):
      dt-bindings: nvmem: add google,gs101-otp
      soc: samsung: exynos-chipid: add google,gs101-otp support
      soc: samsung: exynos-chipid: use devm action to unregister soc device
      soc: samsung: exynos-chipid: use dev_err_probe where appropiate
      soc: samsung: exynos-chipid: rename method
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      arm64: dts: exynos: gs101: add OTP node

 .../bindings/nvmem/google,gs101-otp.yaml           |  56 ++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   7 +
 drivers/soc/samsung/exynos-chipid.c                | 148 +++++++++++++++------
 3 files changed, 168 insertions(+), 43 deletions(-)
---
base-commit: 4b67e4c65c1e0740ac12bd0d790eb5a9d0091aaa
change-id: 20251031-gs101-chipid-fd84da8afa2f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


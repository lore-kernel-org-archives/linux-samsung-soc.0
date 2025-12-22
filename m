Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE0E21CFF6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 16:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421037; cv=none; b=PFurMvR0SDTiXhFzJjR9CYEYDa+SX71G9M4dbcwQzXgf3SjrTRjqlm2sSTtzhB8f4k2nR+dB7IxjEVHi4vzC/xN71r6bDW1hDVJGb/Usnhv0R3RFgtn8F5cFgF275fSBEAQ/muo3Sj8ReRPUKSG70UngFvwo3fUeudzouCoWrAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421037; c=relaxed/simple;
	bh=EK9FzpxfbOefeY4KXr9jO4jSMDYcEmASpCx7jpsgjTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GK0HkJ8s+HVR4T4LaOZrZc7FAEjt7GA+CWok8dc6Fc97fTHztWCgxFIchlA3K6H7LB9JUA41tnbsc5PJPUni6kIWBSv1hEMR4YGqCEpyvZrtP1ebe/MGB5FvDeGu0e/NX6wCUSDzntHs007KQEIT7ozvdjKt48jn8pJVTyoiqNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JIocIGq2; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JIocIGq2"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so1813445f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 08:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421034; x=1767025834; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ctl7eWpJT4ia0HLtsWNeK1uZK5cygsJY/3exL4pUDw0=;
        b=JIocIGq26Za5ugNJJUZgRoJKBwZ2pMiPut12dWeG25MsfN+r0kUdwWmJwq05/Tuut5
         iR/U9cNDyoxJ3t8uxq60LhN6cLoLzK74Ntzk7GmuGFsOLhk7EZYI7WWwcxMO5nlVhYbY
         t4bWZlHksBxXmhllV3h66cNCWT1efwyhSEnyoUA0+eZxzxgF40ZoGr+xQaHfotnHTgWs
         ThO0qRBaS8g1iHwIbYJGLZnPkR5sDkU8NK8QKfGyheZtZbBIYfpn8FtnC/PMH/BQrSEV
         rYjTg221cZir7wYvw4M2hz1rLdGdLcShU9Waq3TvX9vxJhrlpyQYG8toTcOeMFo8sFbu
         EuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421034; x=1767025834;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ctl7eWpJT4ia0HLtsWNeK1uZK5cygsJY/3exL4pUDw0=;
        b=liexF8kVRdL0ApQdncSNy0ubiZKol0kRnJikMjm9qxEG0dLgpb0oiZwOKjQDzmmuQZ
         ap/IoGW9PMEAJ4w6DyIpCnx+RMsC0j4yiEOsRzlJ0W8wObcS2G0F68aYM0yITBnPi61d
         103aJtzcqQXPbPHC7LLUcgvLZRdCWaTIUXBL+lj1BbTO4bv8dNGMj8umT/NvCSK/snOO
         3tkQQ5lxUnRc9/530ToS+stHpLghyPL0ysMfb972d8E73C7AQUiA03an7fl3jyRnXvE/
         1bkLUbW+iJ4Lwd1w2ytrTX5LtmTMqYIhhPyJSux3bsKl31uXGekt//6TzfM8U+JammDb
         cYbg==
X-Forwarded-Encrypted: i=1; AJvYcCX5TkLdBo4hQkS0X4GI0DMmyHlzWF3MftKDlqSgBeecSjR4zAI3Ni7dBxhNwn8JKz0sfSGmWLzs4aFt2jz9c4TAPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKrvHlwq01FoFtsYsTciEjCl6EOESULmL6AWWtql/wrSaBl9Y
	e69NIOh1CWPvp3gTaix5ep6V09V/MKTyPKnWYP83nkJqCBiY6K+y/GN8P3Z1JYsnL7Y=
X-Gm-Gg: AY/fxX6RmLlp++iyNjosNeS1MfVeK5xlNhovHyD0zNeHcWM5+kv5wXrsdTBzE6MJiur
	cmVrMR8Wbjyeg3FmDaieC26MBmQ+4bektNVGYIoSsqDJe8iRv8lHlQkfWPa7QMd39lWBJqXLRyf
	uj3WRmYkctGm+bUkprRY56KapFPZ+8FV7spaPpNg9aBPCEaHRS8XY236G7smzTC1XC5IX5lpuJ0
	UoVWBVugjFrnbeDBJy4b8HjBgYx+E8oPz6NgrkKnTBVwUilOwN+JDaF0ndT3z7EZXMm4ryUwa8x
	kevDMjSd+iFlzTOFRUzhGZL9C0KRmuV0XMw0eIyl9/5OzugRY8RwjVk41Sz6nmC3gJ7XehepSyy
	dWmrtdk248u+NckemIATzyDrW8AAUQyT5zJPv+ni617CvGSJ7fkwKc7R3QqTy7k6rTKQZeZodX/
	BU3M3kpRACKcIfHcv9dqIqL8461OjWi+5TxqB8YDdNDfENDR3DwsyuNcGLtbRILJun
X-Google-Smtp-Source: AGHT+IHP3TVcHJUO6fEEaJiZ3KZ9Y0M56GH02vB1nVQlN5qa+5+n8klBqzUFF9EIfIkkGQdDQHD3Lg==
X-Received: by 2002:a5d:4a11:0:b0:431:67d:5390 with SMTP id ffacd0b85a97d-4324e50d055mr12000428f8f.54.1766421033515;
        Mon, 22 Dec 2025 08:30:33 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:33 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/5] soc: samsung: exynos-chipid: add gs101 support
Date: Mon, 22 Dec 2025 16:30:04 +0000
Message-Id: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAxySWkC/3XMQQ6CMBCF4auQrq3ptECrK+9hXBQ6hUkMkNY0G
 sLdLWw0GJfvJd8/s4iBMLJzMbOAiSKNQx7loWBtb4cOObm8mRSyAqGAdxEE8LaniRz3zpTOGuu
 t9CyTKaCn55a73vLuKT7G8NrqCdb3TygBF9xp40DoupEgLncabBiPY+jYWkryowHMTsus8eQBd
 VkLVNWPVl9aip1WWYNFa02j/V4vy/IG2eUcTCUBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=3493;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=EK9FzpxfbOefeY4KXr9jO4jSMDYcEmASpCx7jpsgjTw=;
 b=7fNbpMRJGUwHd8n+eAjn9vpyQZsPG/Icp4tZm2ppyf+yB2A+3OGHvARhy6aXGA9g40Erat6l+
 3nSaRJ08bNZD39nbNV4/+5fUA6ssUv61fQut8fteDzn3gZ1lO4izqVl
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
Changes in v4:
- bindings were not sent in v3, human error. Add them back. Compared to
  v2, add clock-names property as it's needed for
  devm_regmap_init_mmio_clk()
- driver: use devm_regmap_init_mmio_clk() to deal with clock aquisition
  and enable/disable as needed.
- dt: add clock-names prop
- Rebase and collect R-b tags
- Link to v3: https://lore.kernel.org/r/20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org

Changes in v3:
- rebase so that cleanups come before the gs101 support. The inclusion
  of linux/device/devres.h is now done in the devm action patch, as it's
  first needed there.
- update error message: s/failed to read sub revision/failed to read revision
- Link to v2: https://lore.kernel.org/r/20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org

Changes in v2:
- complete rework, treat it as a new patch set please.
- bindings were reviewed at:
  - Link: https://lore.kernel.org/linux-samsung-soc/27a5521cd7ddbed0e870ac416dc829722f1b36a5.camel@linaro.org/T/#me139353334db535806ca6462ae1e86b01ff032a7
  - addressed Andre's s/if of/is of
- part of the cleaning patches are from this trivial series:
  - Link: https://lore.kernel.org/linux-samsung-soc/20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org/
- Link to v1: https://lore.kernel.org/r/20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org

---
Tudor Ambarus (5):
      dt-bindings: nvmem: add google,gs101-otp
      soc: samsung: exynos-chipid: rename method
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      soc: samsung: exynos-chipid: add google,gs101-otp support
      arm64: dts: exynos: gs101: add OTP node

 .../bindings/nvmem/google,gs101-otp.yaml           | 61 +++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  8 +++
 drivers/soc/samsung/exynos-chipid.c                | 79 ++++++++++++++++++----
 3 files changed, 135 insertions(+), 13 deletions(-)
---
base-commit: 0825f376d02e58e8ee4179569e0a386e1cd0eb76
change-id: 20251031-gs101-chipid-fd84da8afa2f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


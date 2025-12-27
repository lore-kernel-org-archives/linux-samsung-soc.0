Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4505A32E6BE
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838271; cv=none; b=rwGWV12/2iJ/0wNTckMX7LgQvZwg9ckFVALRZ7LIc6GrskNMLWgP7Y7/3mWubSRPlVE6mFBFzaTcp3EvNPLd65fRB3pceG/774gVG1Siy0t5wPX94aT6+QV52CxGHUxg+GNavn+WAnDJ2ZV6exICo36wBqBrWKWcsDHCvjHmMBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838271; c=relaxed/simple;
	bh=KTex+IK73ShDHUr/+eUBMDGpSZi2F2k19vra2MVqhjE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T2q6L3LPeIc6M6JRHP5Rp4bGOHgN1yorE8R6ueyz8PHIAIBfJs+I3LTeI09JbWf34JGPKmUcnIvonCN5sHAaIahgRjeXcLWNOpzl5ncKoHEixqVg9auGC1W/UsosoPGgGFmEXW5CaW4h0WvAwsuEpATQd/CcBNOaCijqtPQ1zKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9jsuxPI; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9jsuxPI"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so11455157a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 04:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838266; x=1767443066; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGH0cFqRp4xzenXbooQtVpIcUet0DTIWJ5faBpJKikU=;
        b=q9jsuxPIk7//Fc9FyGA5C1gY92+RVQGtskiEn1qMHA0JRO8+ctMXLeL1lg8MDjTQMN
         PZIHAi054rwpFXFnDcmDJ3JE3uehjBGxQChmLUUYmuGuQo2mW2C8FODi3J4WsvhW0urs
         ktLEt1bN3OfmE1VLhpslpsY1Vzq96qc9eRO8hkx6GfV48F6/WJx1tWUNNxXm+zrahz8v
         U7Nx0S1PRgMC/BJROAs1Lbr+CA+QieEm0LvRrTCAQNagIsOBMy9m2CZIL8giqZ5fB7Xw
         rqj7IWwSErdkjLl1NOaLa4yZs4w7gPHFkL+p0COqNsxgVj1gEyMpWEpCbFFqhmo6clf8
         z3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838266; x=1767443066;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGH0cFqRp4xzenXbooQtVpIcUet0DTIWJ5faBpJKikU=;
        b=vRHu83hwP1ih1ccuCUkSyo0DwqpLMH+7jLm6y2N+JqQoZdQooKaQekyNmw95pi6RfB
         8sTImduMLzBZzCK6cZIUfvZG8imkfUIMevmdq/LZScckJWBFt4xJGl5XeIFK7TwOOOyP
         4DVtygpFBylDwjBwapb/sxbh00jK4YPdPfS71Qww+pS+wfBSdXkmTkAM8Q6SfOzb95k9
         6WIIXMh1T91olwSfqDvX1pl6qBaM5+Jjy6Zv4tDkFMJ1qcoE+xrRmqH9ZvBXTcTT9DPa
         l/D6ev03JNEDnT8etu0PeDNA8jBuKGFke/tfyvQ7t7ETyxMEg9W5zCXtL/tg6jqfVzOl
         V0Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWsmQ7sKGIQIqNufv59tXe6Qp19vvT+8faCQ+EmyzdYV60Jgqvi5w7HwfY5ARznVZwS74T3hRJEEJLc3WsGokQmjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzD0rikzGIfXZDpAg0hjF0qrZb1R/EP1rMYr1yA6rG5WBQoWvL
	A1X7F+GMrFdZHDhlY6LrKAtaKGkYNCSUQsspLSy89Xf+vODArfIdbI4ibTG8RonWb00=
X-Gm-Gg: AY/fxX4i+l+OJ0I77CfxG+fajUVHHtZlCuDln6E4/DQ1q7f/L2KPiMJ+s9RwLH6sbGo
	NVTxEKwTUWl2dNK8NSpSIod7e/t+E9JeTAuRsrW9dUsPoGYyHw82hzHrA5azkA/VIDarlV65VDl
	EdgReVOx1IxwXaVjpml9EQbnyEnRImQx2UuhlEeBIlucuHGxXo8Fk+rkd0nRRO3c2h6AJukBYMz
	HsNcSmVUDh+6lD1wtuiadxpeThMmgiNjZYzBD419nhmJd8Pk65gXoRCmitvirfgHBrTF3PTZzKr
	rsEo06YPagVkfL+WSZKzWBX3rpQTuyw3FEZZSumV+kcgqdBk9ZHC4hKifiC7CytWWB5mAuwo4XA
	HYvgC6lgyEMu1NusSTS6wZXkiwpAcEhBRt4xRcSeXDgVoh5J0CxdCB4gSTgtqbpjE6c9dCPxEvs
	wvlu31/PS0BM5cE00q+ZsffF0O1e3TpjyRZtthbpg8e0SgTdLnucCoiQRApw6oBBgQrLFK1cqfX
	MLObQ==
X-Google-Smtp-Source: AGHT+IEWtiZtRka6OaW1djdTQ9NWsi4peeD9+OeNNmtTmuFtXOfs5BoDzhKrq9LOz2k3e54rOtW/Jg==
X-Received: by 2002:a17:907:1c27:b0:b75:7b39:847a with SMTP id a640c23a62f3a-b80372228e5mr2882858566b.60.1766838266440;
        Sat, 27 Dec 2025 04:24:26 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v5 00/21] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Date: Sat, 27 Dec 2025 12:24:22 +0000
Message-Id: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPfPT2kC/23Qyw7CIBAF0F8xrMXwKi2u/A/jAtqhkmiroERj+
 u9OfUVjl5cMZzL3RhLEAIksZzcSIYcU+g5DMZ+Remu7FmhoMBPBRME0kzSJ/aHlFxqhPe/sqY+
 JllbxupLGWOcJfjxE8OHyQNcbzNuQcO762JH5+Prm1BSXOWUUV1WlYl4ZC6td6GzsF31syehl8
 W3oSUOg4Zj04H0jtOB/hvwYnE+fleVoVM5oVxpgRfVnqC+Ds0lDoWFUbaAUulHO/hjDs6wIxzM
 Wf3o1Ngx380loZ5YBAAA=
X-Change-ID: 20250603-s2mpg1x-regulators-7a41c8399abf
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

This series extends the existing S2MPG10 PMIC driver to add support for
the regulators, and adds new S2MPG11 core and regulator drivers.

As part of this it was necessary to update the regulator core to allow
regulator registration to succeed when supplies aren't ready yet,
because on the current user of those PMICs (Google Pixel 6) multiple
PMICs supply each other and otherwise regulator registration would fail
altogether. This is implemented via an additional 'regulator-bus' which
allows us to keep track of regulators with missing supply and retry
supply resolution whenever new regulators are registered.

--- dependency note ---
This series must be applied in-order, due to the regulator drivers
depending on headers & definitions added by the bindings and core
drivers. I would expect them all to go via the MFD tree.

The MFD patches in this series also depend on my Samsung MFD patches
due to patch context:
https://lore.kernel.org/all/20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org/

While these patches compile, regulator probe will only be successful
with my deferrable regulators patches from
https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linaro.org
--- end ---

The patches are kept together in one series, due to S2MPG11 and its
regulators being very similar to S2MPG10.

The Samsung S2MPG11 PMIC is a Power Management IC for mobile
applications with buck converters, various LDOs, power meters, and
additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
a main/sub configuration as the sub-PMIC and both are used on the
Google Pixel 6 and 6 Pro (oriole / raven).

A DT update for Oriole / Raven to enable these is required which I will
send out separately.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v5:
- rebase against mfd/sec alarm IRQ rework
  https://lore.kernel.org/all/20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org/
- switch to async probe for mfd
- Mark: one MFD cell per PMIC, not per PMIC rail - drop or update
        related patches
  - making the series runtime depend on
    https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linaro.org
- new patch:
  - mfd: sec: s2mpg10: reorder regulators for better probe performance
- collect tags
- Link to v4: https://lore.kernel.org/r/20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org

Changes in v4:
- Krzysztof:
  - s2mpg10-regulator.yaml: move additionalProperties to after allOf
  - s2mpg10-regulator.yaml: use $defs, not definitions
  - split samsung,s2mpg10-pmic.yaml and samsung,s2mpg11-pmic.yaml
  - add full example for samsung,s2mpg10-pmic.yaml and 11
  - acpm binding: commit message update
  - acpm binding: pmic -> pmic-1, pmic2 -> pmic-2
- ensure binding file names match bindings
- fix typos in s2mpg11-regulator.yaml description text
- collect tags
- Link to v3: https://lore.kernel.org/r/20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org

Changes in v3:
- Krzysztof:
  - split s2mpg10 core binding into separate file
  - drop PCTRLSEL values that can be described using standard
    properties, and update remaining macro names (self)
  - drop maxItems:1 where not needed (Krzysztof)
  - samsung,ext-control-gpios -> enable-gpios
- fix LDO20M_EN pin name -> VLDO20M_EN
- move all binding patternProperties to top-level
- one (driver) instance per actual rail, not per rail type (LDO or
  buck)
- new macro REGULATOR_LINEAR_VRANGE() (patch 10)
- address some (pre-existing) checkpatch warnings
- various updates to regulator driver (patch 16 & 19).See footer there
- more descriptive commit messages
- Link to v2: https://lore.kernel.org/r/20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org

Changes in v2:
- s2mpg11 also exposes additional GPIOs, update all relevant commit
  messages (nevertheless, GPIOs are out of scope in this series)
- fix some commit message typos: s2mp1 -> s2mpg1
- patch2: drop | (literal style mark) from samsung,ext-control-gpios
- patch5: add | to vinb*-supply description for better formatting
- patch13: update ::of_parse_cb assignment
- patch15: drop duplicated ::of_parse_cb assignment
- Link to v1: https://lore.kernel.org/r/20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org

---
André Draszik (21):
      dt-bindings: firmware: google,gs101-acpm-ipc: convert regulators to lowercase
      regulator: dt-bindings: add s2mpg10-pmic regulators
      regulator: dt-bindings: add s2mpg11-pmic regulators
      dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into separate file
      dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
      dt-bindings: mfd: Add samsung,s2mpg11-pmic
      dt-bindings: firmware: google,gs101-acpm-ipc: add S2MPG11 secondary PMIC
      mfd: sec: s2mpg10: reorder regulators for better probe performance
      mfd: sec: Add support for S2MPG11 PMIC via ACPM
      regulator: add REGULATOR_LINEAR_VRANGE macro
      regulator: s2mps11: drop two needless variable initialisations
      regulator: s2mps11: use dev_err_probe() where appropriate
      regulator: s2mps11: place constants on right side of comparison tests
      regulator: s2mps11: update node parsing (allow -supply properties)
      regulator: s2mps11: refactor handling of external rail control
      regulator: s2mps11: add S2MPG10 regulator
      regulator: s2mps11: refactor S2MPG10  ::set_voltage_time() for S2MPG11 reuse
      regulator: s2mps11: refactor S2MPG10 regulator macros for S2MPG11 reuse
      regulator: s2mps11: add S2MPG11 regulator
      regulator: s2mps11: more descriptive gpio consumer name
      regulator: s2mps11: enable-gpios is optional on s2mpg1x

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |   54 +-
 .../bindings/mfd/samsung,s2mpg10-pmic.yaml         |  120 ++
 .../bindings/mfd/samsung,s2mpg11-pmic.yaml         |   88 ++
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |   29 +-
 .../regulator/samsung,s2mpg10-regulator.yaml       |  158 +++
 .../regulator/samsung,s2mpg11-regulator.yaml       |  136 +++
 MAINTAINERS                                        |    1 +
 drivers/mfd/sec-acpm.c                             |  171 ++-
 drivers/mfd/sec-common.c                           |   17 +-
 drivers/mfd/sec-irq.c                              |   85 +-
 drivers/regulator/s2mps11.c                        | 1186 ++++++++++++++++++--
 .../regulator/samsung,s2mpg10-regulator.h          |   53 +
 include/linux/mfd/samsung/core.h                   |    1 +
 include/linux/mfd/samsung/irq.h                    |  105 ++
 include/linux/mfd/samsung/s2mpg10.h                |   44 +-
 include/linux/mfd/samsung/s2mpg11.h                |  434 +++++++
 include/linux/regulator/driver.h                   |    5 +
 17 files changed, 2526 insertions(+), 161 deletions(-)
---
base-commit: 35eb590e66ac7e9a77033e8ebaff897ab493cd54
change-id: 20250603-s2mpg1x-regulators-7a41c8399abf

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


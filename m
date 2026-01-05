Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F54132AACA
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603704; cv=none; b=QGT5x1i4JwoIKs6nFnt4M3Eybnwhkpvu7ASuwzwmHKgerpyMCAu/ChsOEhqXfnAzWW7q++it6Qp0wtU2qyhf5S+Yw3x0chUyf9AgGcKMsw4luHPs70VpoOv6Wo91w3fhMQpWWUo6VNDYtidL7Cir1tX1pnrOLi922MBMKxxYt0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603704; c=relaxed/simple;
	bh=JNGRYavRZBxKgAHPEtLRD8r+l4yFNVT+msivM0VogR4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YPg9fJecrtb4dXFQcfv1LLy7hzwqbtuQkoka9bv8pC/BflvWovZPUWbaRgSTfqLRIuv/3w4nRA+yq6NlMqGejnYEIYZ8uglfbk5rF8k/YzRIbBpMgKf9MFO+mZg/o/i9CXYmuf0u5t6aS2V4ZAY5/yu2In/mr4VlxyQvlQdbqTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DqWXDejQ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DqWXDejQ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b79e7112398so2442378666b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603700; x=1768208500; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1JfLZgFeLXPduNyA8WJiqUlNVpPxf0/ctAEAqsxUYpE=;
        b=DqWXDejQOvNxOSv4fIgNtSAuWcDCpzWDusW5xYZda+IsvyT10G2c9h1H+Ke1iCGZhn
         22GebvZ1KYDxi3B7G3ufm4XGei7qrD55NAeSHcFOSLxJRN4MOf7tnqf4bsTEzEwBi4+B
         ZkV7RJ+1KEnAwBNoGLj9jrgDsJkqTqE4BXAurPSFelezhD+3Xx+kdMQj/iCXHMZ1Np0/
         E1h05qVe7p6JEg3aUzzjnWib+es7NbCmkyUfo8lDQnVWdU2aa7D53CIP0vAPm+OHzgHp
         SY/5uPGnEQ4f6xLevxBY6tsHkJD4eCLAQh5p3H64LVxvh+TYOYFsCP/dacI2BerYMN+4
         afPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603700; x=1768208500;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JfLZgFeLXPduNyA8WJiqUlNVpPxf0/ctAEAqsxUYpE=;
        b=R7FmSSJXBbZgLyetaSMaHqiPlYyvyxtUp46vgyVme+dEhTOcJHEho7wPbC0ikRLrp9
         6ayjXNObI6xQSgUBTzUcb3NbPE1VNsjakvlCxL+BwyXNcE7oEET+1b/D8VgVkozYf27G
         jinbUQTLgbSAM6GX3BhMEFJvPgnA6DSGdEt1CCaLHLeji0uO87S4WrAhbxtKX3e7JT1z
         SVZuMXSISQYKv0jjZ/jOBU7p2bajCmpA8zdDG++eQ4/djGldlK5yKLua0+D2o68yy2cf
         VjDxMZP35WdX9s4diJFG/RCtxIYd9IVLTWMIqr3ua58Ahw78ndieL2ixKkljyuyIIwwp
         AEaA==
X-Forwarded-Encrypted: i=1; AJvYcCV9PyI7v2yeKHof2ILSPOQZJD7kr83MPT5eA8xqW7Dbz2sEffDUwLFqAAwei53Ez6u0wb3uydjc4v/vKslZ+ONJOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7D9Pph5rpZVu1GOBiHU5dVHPTvK98wEJietMpAxrHTjn+LD6/
	eFYtyuu4WbDO/WnSQ/a81xOLI+PpK5TX3JoJVmWeHsPPqQvi96Q4ak6JTr5p65dsX5c=
X-Gm-Gg: AY/fxX4oCzvT7xX1CsHv36tS5Tjqa2/l/vEjSPwfmMu40c+1n82UrtsbHDIrPISJkEI
	3Su3DT8ZjSEFOof/8M03atEYtEBk/jTTqI+wxgCBMyYi3ccmHayUfERXQb8lPbA20aEgtUxigpC
	fm3nTxV2Y2JTFvH/y9cc+NQeCppIWYERWG2TkoxpS0KJsFbcpR6EN722txKQg8+aAadJevaj32F
	h3NMEvCzs1ZmpSBurT4LZEXfnnLEyRHWMGFB3brkH8ZXxv/I9GVmyfRqyjPnyv3Kyb2U36IHnI5
	RTysV9NUHhUg3SfZ+Ox4Pf+v+CzdbvxbSWBR0CXQb+XbZuOP8i5GzcwqAUFGKrUTpZcRCItdWA/
	59E1YE0B5go0mdoYDc2KgfE2Lr2Z3BB38PqwHUuX/L4PZ48fgaEUOIMso51IYG8FRiMFdTMzqxW
	gchBET3HeCvYnjEM18BFbCW5vVtyx9uF9ecCLz9V0EsmJMtbr+ZjQWB+WxENgrCwxqUpn8j1S0k
	DKxKQ==
X-Google-Smtp-Source: AGHT+IHP5oCWNvPtWpmIQhSRNr9jqpeHiO4m3R/bdfj1JALvF4+NtlK6zSTfWgvQ44F1fPJT/l9oOQ==
X-Received: by 2002:a17:907:7ea2:b0:b76:f090:777b with SMTP id a640c23a62f3a-b8036f13dfbmr4506409166b.22.1767603700255;
        Mon, 05 Jan 2026 01:01:40 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:39 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Date: Mon, 05 Jan 2026 09:01:36 +0000
Message-Id: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPF9W2kC/23R227DIAwG4FepuB6TOQTCrvYe0y4gMSlSl3TQR
 p2qvPuc7tQpXP4W/iybKyuYExb2tLuyjHMqaRopmIcd6/Z+HJCnnjKTIBswoHiRb8dBXHjG4Xz
 wpykXbr0WXauc8yEyajxmjOlyQ19eKe9ToXcftxmzWKs/nK5xs+DAaVRrNUTtPD4f0ujz9Djlg
 a3eLO8NUzUkGQFUxBh7aaTYGOrXEKK+1qxWow3OBOsQmnZj6DtDQNXQZDjdObTS9Dr4jdH8GVL
 aqtGQAR3ooAwEsv4Zy9fBM76f6fNO31dflk/yyOgf2gEAAA==
X-Change-ID: 20250603-s2mpg1x-regulators-7a41c8399abf
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

This series extends the existing S2MPG10 PMIC driver to add support for
the regulators, and adds new S2MPG11 core and regulator drivers.

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
Changes in v6:
- merge patch 21 into 15 (Bartosz)
- merge 'con-id' handling into patch 15
- collect tags
- Link to v5: https://lore.kernel.org/r/20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org

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
André Draszik (20):
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
base-commit: 5b108312d3874f2fc3d6e5ed119017b45c2eb092
change-id: 20250603-s2mpg1x-regulators-7a41c8399abf

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


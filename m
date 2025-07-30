Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D58D275865
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753867914; cv=none; b=O0eEYnatiJTToHfyqXSqmxjQgOxSlTL22jbbc+yb+13Id7TQfTb27noqvuZdRHHCswaj6gVRhgyxISLLrwliDu+LscipzP962MSuHt5r1+n15TZ+XBP4iRhAZV4GUs1oR1AvcLuQYWP6RGYduvPNgQJAEEz0EsrdzKuPwZDH4dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753867914; c=relaxed/simple;
	bh=JQvshfvimgHfM0RiZnHUyLwR4iIsBOC1lbymHIY70KQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uIzo4IyW5uKime5rCXtM1h9EwAmRaIOgu3zGzETPy3LZAEmq7o5keBpTlLKiErTM3AVm8Sh+RrKKwMeuhYYBEKlSFfCPtYPOeqAjxQ9svk31hbUmtHy1gxB/+hIijVlZSRURZqYIiX+vlpFnRLOFsr4Gl6DRMyeOEkadTBf3y2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZLCOVJYn; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZLCOVJYn"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-615378b42ecso5979844a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753867910; x=1754472710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=ZLCOVJYnswBPPpfve49dvoNBPTURF6JGwYE52NYmL6TDVwQbrcoB8JMOABRzBgzVxL
         lW7NC8GtIgB1n/fNWFFFFcjAZJjRk6w2HGXg6WjAG/RdjvVmvOcJfxlXna/QIGAIbjCo
         2bG4p1gx91lHn5XGnf47JqMwiOx48Iw2R4J5JaCqYRW7nGl/JgdKUwba0BbI0s/juoYD
         M37Qmy3WZrZvXXei2c3ogzJxE3wx24ACWlIEkjhd8kjJTej6UUcZkcJCVOx+3DYEEIVu
         fjdZQdII/L93zkLFY7bqhDz6q7JTWz/kZKfi97V6afm8vm21X3PrZVkaWvxaM+D3i540
         iiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867910; x=1754472710;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=aqmPlkp/rX/bPOjgw9vrcLIMfuOpNoXnFk8+bOFtTDzzkaeKBtcFy38NAeYAlqhGXL
         vi/RH0ORUURN6P7xLE5GyErzgXedM5l85AUJR+tX9H/+ucR9SxFNCBzRClEGnV08JVp/
         uDMnEtMSPwy8BIQrFuuw0b/1hPDa2brGUnc+DeZk8PMr1sXpkSKruHHfAz9pglK6MBz5
         chtC/NEpFviLMU/Cpk70axwEYiDQ/X5KRN2oy7E4olAx9ALaeR02LDDGKy5bYzVLYZWz
         AW7wVdy7rUvDZlS8QdCuixjPa2G61EDXbCwIZSscQKrDj0I7hXKqi0tISgENIyoxqv/H
         0nog==
X-Forwarded-Encrypted: i=1; AJvYcCVY5faczGJFxwEbWiilpvZNAoC3Y9DaWPUcD0ZKdZS3IBwt4uh3562dnK7WDP4n7DtEFpfkseYLzQ96TTLxnoj6LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyznqngl+znhU8BbZubdARB0KG1L02wtLwXo5wCnQBeZ1htBVXh
	a7+TbDYIwMNGIPnWcyN3KbJBeDMz8bAEa7GLbhQ1TcalvjtBGSwRsLldsf6Iri3OzMw=
X-Gm-Gg: ASbGncsGxRoW29rZLQCsT86k1MtOjSAVJvRataEHPN5d8vx8qPPHHf0xMrW3wie/kZa
	gvUcHqFf6XibOBHahAi6CkbTZZdvpa2xrQ5GwGuZFXifs5enVsRPMBi0ccGuEPq9YRww+Cjx4J8
	K8mvUH9Uisvz3z4UYqWAxm2XL1Mmv2VhE+zv3zrq5eiIPEGV2GRlqRz4cjBrAisveWihoI+9HYg
	U5HiCcxgOJ8e+3rQqZxILS03q/i++VmewZijsaFkQreCYLdhIEFxxI+7vtXXiObsVFYqgq2/yFN
	u88oaQ1N3/pE1tpQviuiB5JUolCyVqBN2iZP/mBY1WUzrA96ssk9ts29GKl8jz7ehZ988D6TIt0
	j3dSiGMyFGIdre1jj8LMxF8lhyjVIFvcclYTCezdZhFZbbj5tO3YM+XeYrhZ74SsFfT2Ane0HHv
	eVd8JOeQ==
X-Google-Smtp-Source: AGHT+IHblx3Qz+7RLXy0BsXAU+JhtlCfvSdqO2qWeJIEcuKpggfXj3qv90ALBrzdmml33C0iVYKiqQ==
X-Received: by 2002:a05:6402:35c3:b0:615:79b9:28ba with SMTP id 4fb4d7f45d1cf-61586eef0e9mr2633422a12.6.1753867909762;
        Wed, 30 Jul 2025 02:31:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61536916dbasm4090424a12.43.2025.07.30.02.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 02:31:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
Date: Wed, 30 Jul 2025 10:31:33 +0100
Message-Id: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHXmiWgC/2XOTQ7CIBAF4KsY1mIGBvrjynsYFyJDJdHSgGk0T
 e8u1WhrXL7JfG9mYImip8S2q4FF6n3yoc1Br1fsdD62DXFvc2YSpAaUgid57RoBnJy2goxFUMj
 ydhfJ+furaX/I+ezTLcTHq7gX0/TTgd+OXnDgFqpaYQmyhHJ38e0xhk2IDZtKermE1QxlhkYrS
 4ToTGH+IM5QweIivqE0qEFTUf1BtYT1DNX0alFY7bDOB90PHMfxCcaAvPNKAQAA
X-Change-ID: 20250321-s2mpg10-ef5d1ebd3043
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Original cover letter further down.

This is a resend of two patches from the original series that haven't
been merged yet. That series was merged except for the attached two
patches here. Other than rebasing against next-20250729 there are no
changes to them.

Lee, I think Stephen's intention was to get these two merged via the
MFD tree please.

Original cover letter:
----------------------

This series adds initial support for the Samsung S2MPG10 PMIC using the
MFD framework. This is a PMIC for mobile applications and is used on
the Google Pixel 6 and 6 Pro (oriole / raven).

*** dependency note ***

To compile, this depends on the Samsung ACPM driver in Linux next with
the following additional patches:
https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org/
https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/
https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org/

*** dependency note end ***

+++ Kconfig update +++

There is a Kconfig symbol update in this series, because the existing
Samsung S2M driver has been split into core and transport (I2C & ACPM)
parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.

This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
talk via I2C, but via the Samsung ACPM firmware.

+++ Kconfig update end +++

This series must be applied in-order, due to interdependencies of some
of the patches. There are also various cleanup patches to the S2M
drivers. I've kept them ordered as:
  * DT bindings (patches 1 ... 3)
  * s2m mfd prep for adding S2MPG10 support (patches 4 ... 7)
  * split S2M mfd driver into s2m-core and s2m-i2c, including the
    kconfig symbol update (patch 8)
  * S2MPG10 core driver (patch 9)
  * s2m mfd driver cleanup patches (patches 10 ... 23)
  * S2MPG10 clock driver (patch 24)
  * s2m RTC prep for adding S2MPG10 (patch 25 ... 26)
  * S2MPG10 RTC driver (patch 27)
  * s2m RTC cleanup patches (patches 28 ... 31)

I realise these are many, but since some prep-work was required to be
able to add S2MPG anyway, I wanted to get the cleanup patches in as
well :-) Let me know if I should postpone them to a later date instead.

The S2MPG10 includes buck converters, various LDOs, power meters, RTC,
clock outputs, and additional GPIOs interfaces.

This series adds support in the top-level device driver, and for the
RTC and clock. Importantly, having the RTC driver allows to do a proper
reset of the system. Drivers or driver updates for the other components
will be added in future patches.

This will need a DT update for Oriole / Raven to enable this device. I
will send that out separately.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v5:
- just a rebase & resend of the last two remaining patches
- no other changes
- Link to v4: https://lore.kernel.org/r/20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org

Changes in v4:
- various updates to sec-acpm (patch 9, Lee)
- cache enum type in patch 25 (Krzysztof)
- collect tags
- Link to v3: https://lore.kernel.org/r/20250403-s2mpg10-v3-0-b542b3505e68@linaro.org

Changes in v3:
- Krzysztof:
  - keep 'regulators' subnode required even for s2mpg10
  - drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
    'additionalProperties' instead
  - add some regulators to examples since s2mpg10 requires them as of
    v3
- sec-acpm:
  - use an enum for struct sec_acpm_bus_context::type
  - consistent name space for all functions sec_pmic_acpm_... to be
    similar to i2c and consistent in this file
- Link to v2: https://lore.kernel.org/r/20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org

Changes in v2:
- Rob:
  - make PMIC node a child of ACPM, and all related changes (binding,
    driver)
- Krzysztof:
  - merge defconfig updates into patch changing the symbols (patch 8)
  - split MODULE_AUTHOR update into a separate patch
  - better alignment fix (patch 11)
  - merge two s2dos05/s2mpu05 related patches into one (patch 14)
- myself:
  - keep PMIC DT parsing in core, not in transport driver
  - several updates in sec-acpm.c, see separate entries in patch 9
  - fix typo in patch 17
  - collect tags
- Link to v1: https://lore.kernel.org/r/20250323-s2mpg10-v1-0-d08943702707@linaro.org

---
André Draszik (2):
      dt-bindings: clock: samsung,s2mps11: add s2mpg10
      clk: s2mps11: add support for S2MPG10 PMIC clock

 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 drivers/clk/clk-s2mps11.c                                    | 8 ++++++++
 2 files changed, 9 insertions(+)
---
base-commit: 54efec8782214652b331c50646013f8526570e8d
change-id: 20250321-s2mpg10-ef5d1ebd3043

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


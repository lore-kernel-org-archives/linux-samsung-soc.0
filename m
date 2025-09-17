Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911A32EACE1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119983; cv=none; b=gyG/a7s1IHZEes8CfJ3puhvdAKCjfmUNNYsQo9bCbzPI1ulNGv3e0sM7i8Hh2QKpyVaWymPuAugkKvoarKc6v/Vk1ZmF4Y8FVmfahlAcsPTpDk2xsGh5vLFhPgIY/e5gFJq81Cmb1HGJQgwKr/aYmXpYWwHORusVQhblTSQ40VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119983; c=relaxed/simple;
	bh=JQvshfvimgHfM0RiZnHUyLwR4iIsBOC1lbymHIY70KQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C7r0jH6gwBgo9VoQHGE4J78Z+0H+WHAbRTssN3rw07YxIzRAQDNg+AGSXhrd9tq5oZfpZRib/eBnRaaIDc/DJ1EQoea2hWe4u3dVOJpJCVkx27sWkW1qAwECjtFfPRBBXRW8ShrF+fIeRB0QyswYiqORCjMwgvcPb4YLUnzvOak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dn3TC6ER; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dn3TC6ER"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso11417079a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119980; x=1758724780; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=Dn3TC6ERkVkuH0TCOdsDTLxTsCKp6ENyTln2iSx5Y/5INH004leh+wKLiSC9YCw5xD
         KrSlNNRxXfVKz5oU3rFo1yjXLbGikamf4KmwKLx7dw+K25hUen3xMMB12BedqNyGx65d
         bnjjDNoEHRGm0gvmFDmaD/TwxyZatq8G/MHLM6BZiCJOODhnRgOnrHE1h2p0kWaw2PFt
         f/A2B/Ym8mGTHAYIO93J4/bLeQjR7Z6QNXdwmCO4tFurRhBUgSNz661cNqrVVZTOq4Qe
         AzHFX29WCHTxjgA7nc3S9nBJK7mxE8++gfVAQRTA8ojQSxDHhA99+2+swzYi56WWNBDk
         /Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119980; x=1758724780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=FjCBmn5aETOuOiP5vH5nwyIzjEKHPgiPQlaVd3hmDe42sYgVZERAqDwSdrXfbn4F6E
         caCNVC4V0aNSTLoWM1mAiMX1CAM623GdD0uYhiJ4h5lugdXJm9Wis1us7NJqoIPPRUh8
         WFOeIumr1B1xFcGf3rrYy3pEYCpLlT/yMQ2P5VdLkJIwZBcelb/202+NLIrxZOk1X/T9
         Qy/6KW8B3IgdhAILVdSXoaUBdQQLxRSpLtRJl+RwiJfOYlmb6VsapOTqeXIUS1H3s5g4
         Je6FClAvaHAmg0vvck8HcG++WoNhOVrWQoggn4IW1XrpedLOywwjjfzqccdbc1awfeVI
         M7tA==
X-Forwarded-Encrypted: i=1; AJvYcCWKVMKRa+K2d1dj5N1B2bcyALZul1wgHrOL14pVarBPPEotPx3VrZ1dGiIkDXZGNJviyKWUDxKmty5k6H5B0cjD7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzNMWlqFgxKJG+nEvlgl3+BM7W6UxFM5jEPI5wnPzpqNzrj79H
	x1C/i4Jy8UU5yOKHRjRoIR45mPhI2gyB1LA12NBSwCHU5BAFtfxTo8YlZTK/bHtVKfw=
X-Gm-Gg: ASbGncs3eg5b15JfISDLtZMplrs2A5NBc2i9LCJ8MS4khPQ/gbCgz1T36T8Hcq974Ea
	fgol+RceQRsN91DCQvDFM8pJcBbHOpJxXhp86mTLlNfdyfer0ILiACjzQCrSn7RBFrZB/rzrO8M
	KUSIRk3Gefad7JfM0NKP2rRfm6JHQsSlnC+SiTTzJZhOE4mKKQqPry1Kc1tI3BwSLC99Vfkh37a
	+WVbMI9il85R9hXde9qNO61CI2VX05Vce3nJTOXucpzIyO1mC1iS6Zqg+gJMVK7l94+TREo6Sew
	iBqFofa3lR0uxri3+E8Grl8Y8I22CUj/LqvjCbacJcVZauF74S5ZHzRVJF52wIIukNMImyLESjH
	wvqLVxloky8uLsuO/sRNWsLneR7qhhz3a5dDysUCBBgX7+1TFdCDHFzC+6FxfTvuEQ1m48QVcq5
	NMuebw7QZ44Yrl
X-Google-Smtp-Source: AGHT+IFF8kxUes3UFZ/iPcURSxsxpGZGbUCV4rgSf6BC8Nw9XulL9xf8WQpD9qjmrn6KbrUO3AOgrw==
X-Received: by 2002:a05:6402:23c2:b0:62a:91d5:8844 with SMTP id 4fb4d7f45d1cf-62f84231fcamr2655601a12.21.1758119979856;
        Wed, 17 Sep 2025 07:39:39 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f317bf9f0sm7112464a12.49.2025.09.17.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:39:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH RESEND v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
Date: Wed, 17 Sep 2025 15:39:31 +0100
Message-Id: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


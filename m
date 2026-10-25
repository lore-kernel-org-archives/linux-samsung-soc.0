Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904600;
	b=c4gC/le3qSOltVkbY2OJi3uO3r6sPs41pk/yy89We1Fca+Gr682rh7pUmcaGLPUqytwc
	 GGpbPN5hi/1ctUuQkd1eQhrFVAnfUWuZJtomzcHDAUjC5G5EEvTl6csHt6r7bGBhu/IA7
	 9O9S55c4u7VTx69WQo2R/u94LX+Pjmq1ZDYbDs6vZVLWsBUp+0cBwiJGTh/5N4mCbns63
	 Xjo40M7lzc9/Fw2HdngjA4QeOEPIp+USsER4YeaAg9cia/OHWSIys3YbTD7aZO/V8V74u
	 teVI6q/bFZUNsyUYru3ppXY/1FLRXjAOO36Tps2mhxK9DBzGnCgpdixUepCgWsNJOxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=4DzG5D7v2La/sD4DyNjoiERdLKEODMg4TWNG90dgHBE=;
	b=rucAoYlyXP94O+/G56BtBMS7yZW0KNq928KGZI4+udsj6BGBE0bHRmi75xj8h1Yu2VtJ
	 vFxYSuWPZRqT6wm7VsrxLZbBZR6L4u1ycPzctJ2P7rQQuoPzsMbAOgU4MTwT29z21wzNs
	 WO3KvFwe9e5Cjg0XyefSX9rdVEZHDah1qZooCOEOot6RTL4hDuq6ZE01+Wpgx/wfXKMTd
	 UIRYiW9cgNttClKz09iA0eo0jrEHLvepyHkogaATiVT23XhYfvDc6t4PFPGb/dEM87MJR
	 aNaiKO+6s4kpLUqczkEYUD18uR2jvsQGtDCzjpajrZ8IkRc1Nk/reMgXLuMSKhYm2EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RGeuTC4F;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B648F606A31B
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Oct 2026 05:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B648F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RGeuTC4F
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35d0be18c71so3536976eec.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Oct 2026 22:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904599; x=1793509399; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4DzG5D7v2La/sD4DyNjoiERdLKEODMg4TWNG90dgHBE=;
        b=RGeuTC4FqHm8RpVRr9ob8Cj8TuYQSnGTa3lX9ZcOtrtx3whCX33An0L7oWWjranFCw
         cZvUCoh9v9j5dMSA5QH10zjRQeujZJ/wia2yctZ/yxdIVFg90kKIvWhkuOCeswVS9bps
         9yFwDv8upHhJQDunVk5aWexBLBpx7QYwxzHp3pltqpC2U9SkdPMLm+QvGPQ029LwBOIj
         daaEAWnMTaRKl7pFH0s0rqbAwOPy1sPff3AqmYoa9RWPaRG+176SHje0zoExWw1ZaAgJ
         /8rKuhdoAQzB/zNy2mncqkMoQUWiEP371cq6ZyTvuI5/gnmpX7gABrUG8+z/Oz9TXFWO
         3zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904599; x=1793509399;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4DzG5D7v2La/sD4DyNjoiERdLKEODMg4TWNG90dgHBE=;
        b=jOp2OjOV1F/pXk2O9YW7+XGNr+xl6tSYRLEmpzs81kWDeVqjAbeSjcTH6NTEwkETqH
         Zfk5aok9wEVhkPXqz6+YUYanxZ99JtW8dxhRbIIEuMw//ROGB9eeiP1WPMafGm1F5rzz
         dF6iKTbFUHwUp3lq+ZXdkqDm1Ut9mQs5qUqXUWR6S4eRNNtQkOWltoJntBqinTPi6N4b
         A0+SX4UIfvUp2BnGAZpdfPt0YUERz8BvWmPIZel6bXBuJM2lg2e2HHbYuTy6dtsWJxEB
         bdnJLLEcwmbCSZwL+qt0Ar+phtO+2+Ag7vLWMCx9TwOUmoeeLl5rcsm1CQphBZy+s+L+
         n9bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkn/D6kvUi7cq3ITbJqLGOWo+1LaBcaukebie6I5JIQYGEMhPZ/3YdbrL4qMh8NCP4p3rDn4ELOYAi8x8PWiM09g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJcr2/asMmh9ibADvC5nn3p342PI4yAxcHFcqPPNGn9kbmroKMH
	LGpRziVXhQ8P7VLUFoGFhh671cYlPyYy2ZvdoLrKQTqTU9r5JXXe6+UxvIqlkw==
X-Gm-Gg: AYBFou2DDSGWfQ6Ha7eb9jEKIj7ZPnayPoJ0PHJ1EpIixeKqAhrhygn5XQnJO24+HAt
	4AG7DDjEnmrs9Is/JCPI93I7mfqj7JgCN+C8pyK80sd7ahSu0wW3dx/pw/rtVT6076Rh/MmaW+C
	k2YnfEoosGO2K8pM8mbjh2p9zOyg6eWaURV/FUhIfboyMEri+kRuDOwgfIYBuKXBly9VdWakwFF
	anlhKDyFem9lwjFNDnRy92I1tK5dwdKC5E4oGuSs+DQ241CGc/B+DllqLvGMaszVFM7hXLRcUFM
	ZtnqvhMZtIxGiyvF44eJFlEquf7ur0qCHNZRZ831rPV27yIz479BLew1VlOJBg5Ikr/E1sXHYjF
	9jpWWAohVQVE9h4rcBvzVLZ/swy7dSv+HqsZScYuhyEIOf70pGToAbFFbXZwZ0HTB8RwBfms2B0
	HyG8KyM/e0YAm9TyzwrY1pLAgVLuspGr1g7F4uUl9EK3kBkKKdwJdv8dbtEhpQCJRdQgUWI+bc0
	6ABVB11YFGK746GPYb8P98plIva6tOD+ZuDdrQHXReUuHgqg3rPwwXL9h3BZAvR0KJI9rOktjaR
	fVDpPJTJFDRXwGI1Jnjcc3+v7BSkTpYikddz0SANF7I=
X-Received: by 2002:a05:7300:fc02:b0:366:eabf:ad9c with SMTP id 5a478bee46e88-369e8759b5fmr5049781eec.5.1792904598560;
        Sat, 24 Oct 2026 22:03:18 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:17 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v4 0/4] ARM: s3c: crag6410: Convert to software nodes and
 properties
Date: Sat, 24 Oct 2026 22:03:11 -0700
Message-Id: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+N3WoC/1WOwY7CIBRFf8Ww9jXwwLa68j/MLCg8WqIUAx0yx
 vTfh7qqy5Obc3LfLFPylNnl8GaJis8+zhXU8cDMpOeRwNvKDDkq3oszZB3y7zzC/QmGyFrl0HX
 IWRWeiZz/+8RuP5VdigGWKZH+SnB16oVsUJxUqxAE2OCX9GqWmOJ9iuU6Bu0fjYlhi04+1+H1O
 VhwS2+hlne8338pCBykackqcx7k0O4q25cid6oQX6qs6oDO6EF3nXZur67r+g+Z/U5xJAEAAA=
 =
X-Change-ID: 20240819-samsung-kp-ceedd4f2f720
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e56a4

Hi,

This series converts the Cragganmore 6410 board to generic software nodes
and device properties, allowing the removal of legacy GPIO lookup tables.

We add software node propagation support to the wm831x MFD core to route
DVS GPIOs to the PMIC regulator, and convert the peripherals on the
Cragganmore board (PMIC DVS GPIO, basic-mmio-gpio, LEDs, WM1250, and SPI0)
from legacy GPIO lookup tables to software nodes and properties. This
eliminates the legacy GPIO lookup tables on the board and fixes incorrect
GPIO chip names from previous conversions.

Hopefully Krzysztof can finish merging the series through the soc tree
once Lee acks the MFD part.

Thanks!

Changes in v4:
- Patches 1-6 from v3 were applied to the samsung-soc tree
- Rebased onto latest linux-next
- Capitalized the MFD patch subject per MFD subsystem conventions
- Added Lee Jones and the MFD mailing list to recipients
- Link to v3: https://patch.msgid.link/20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com

Changes in v3:
- Fixed legacy property handling regression in the keypad driver by
  separating compact and verbose binding paths
- Removed redundant registration of crag6410_mmgpio_node from
  mach-crag6410.c
- Removed dead S3C64XX_SETUP_KEYPAD Kconfig symbol definition and
  selection
- Fixed missing newline in pr_err() message in mach-crag6410.c
- Redesigned PMIC DVS support to keep regulator driver changes minimal
  (untouched) and only use software nodes for GPIO routing via MFD core
- Link to v2: https://patch.msgid.link/20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com

Changes in v2:
- Patches 1-8 of v1 were merged into mainline, dropping them from this
  series
- Rebased patches 9-14 of v1 onto latest next
- Resolved conflicts in mach-crag6410.c
- Removed redundant "out of memory" error messages from the keypad
  driver
- Added an infrastructure patch to register and attach software nodes
  for Samsung gpio_chips
- Converted basic-mmio-gpio and LEDs on Cragganmore 6410 to software
  properties in a new separate patch
- Addressed DT bindings feedback on the compact binding patch
- Fixed proximity switch event type for GPIO keys
- Added support for software nodes in wm831x regulator driver
- Converted PMIC DVS on Cragganmore 6410 to software properties using
  the new driver support
- Removed legacy DVS platform data fields and cleaned up driver
  fallback.

---
Dmitry Torokhov (4):
      mfd: wm831x: Support software nodes for DCDC regulators
      ARM: s3c: crag6410: convert PMIC DVS GPIO to software properties
      ARM: s3c: crag6410: convert basic-mmio-gpio and LEDs to software properties
      ARM: s3c: crag6410: convert WM1250 and SPI0 GPIO lookup tables to property entries

 arch/arm/mach-s3c/devs.c          |  35 ------
 arch/arm/mach-s3c/devs.h          |   1 -
 arch/arm/mach-s3c/mach-crag6410.c | 234 ++++++++++++++++++++++----------------
 drivers/mfd/wm831x-core.c         |  47 ++++++--
 include/linux/mfd/wm831x/pdata.h  |   2 +
 5 files changed, 175 insertions(+), 144 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20240819-samsung-kp-ceedd4f2f720

Thanks.

-- 
Dmitry


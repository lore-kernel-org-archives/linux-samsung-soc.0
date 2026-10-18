Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8622F499F04
	for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Oct 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327506; cv=none; b=kw+UVipgTHj5vSiRnnwmV3k5zdHGjBXxPXpYjAOiEc6M6jcl8FJYfr6tQsANiEcnSgvWyu+1JsWjzt7zSbu6oNxVZvYqrCoPKBORQaZlIYpH1vY+V2yMRGhEGLdBSmI5EJbTKcfe9uIgEMKHaT6eg3V/X9+VYZjCR908Z5BC2v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327506; c=relaxed/simple;
	bh=3I+4yCTTMxYs+18mWdxArezIbQagU+UQBy7qTOwjZjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=az9ESrfpISJ9uAwkITr6xje1MZCkSuXYzl9x5epMyMykoS8mLpMmv9YkOlOMs1DLQLCZP9Eqw/ncFnoK6efS3tT6qL6uGYKlp6Y/eVf5OEz1l+K2BmCF3Nqj0Hw27eOWsEHT/WBoTYUKA2OI+Vl/alCSXfk6Eizad1XzTlI9Zvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8RDj1al; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8RDj1al"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso8545455e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Oct 2026 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327501; x=1792932301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cw9JnxKH2XB78dT3C90Gx+S2oqjKdyT1Kqbq/lUTLGQ=;
        b=C8RDj1albbvMulghN4fv13ywPbmlZPvt410Ydr8ix/gJHRRHia9ws+7/viVDfO+ABu
         cLMyn2KDL69d3cDUDXDfFI/KKppYtlONY0girYzsBHYaiRYqFRD/s7J79uv8TsLX2m2O
         a7QLgcJW2waR5giClY1ZFyI4T8Dn2WM2T9iL4lSiDRRxgETbkfPAfcu+6F0JvNVd8snl
         XQrC+EmBN2wCxC8hDYHoZdv4Y+uRYYzp/BVATu8PCMNz2C9NvA3mZK3x/C+SMXITJe7q
         rGaRnEVLaPuvJ0vJP/R49iaIKGxSgTYFMjUyMlYLn3xDvi9IWOo1497Mnd0eTSOt2mbz
         8qMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327501; x=1792932301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cw9JnxKH2XB78dT3C90Gx+S2oqjKdyT1Kqbq/lUTLGQ=;
        b=kYzPvWpdKiwcRj1t89VlHhQS22Ghw4C/fuSzQg0Z5O8IZZfcLR0Nuu9JVDgHT64A+A
         rm9VPheMhhIGyL2yv/8I+t/XFjc6LeNNES76BY52V/+5hSAZOrXFFUfCm+7Hd2ILLdq3
         PZja8quuW8jt06hxy09eTf1ltsJAOxv+nqgVl6KT1vz93wr5QyIqo4iP/lvgpbgZsgts
         kUsWua/YouTyPF7aLG2FksBOUkUm+7z5KHhA3fpMkqqZSGf5VhKQe5EW0HNn6mhrIink
         atyTH/MuoSp/UekyVHMXfd5MjWLAf7ZRsI/747BUv5A8LE78kKgjR0htHqh7NJdE/qzs
         LV5w==
X-Gm-Message-State: AFq9FYIzGc9iBXErgldFndbUzaITTFsxMgSF5T+tp7tcz/8fAWRS3P1m
	+ZNXBPoBmXqZZpI+RFTj9GS0OcX+uhNd3q0wyBbsiNpzqIMT9iW5twLY
X-Gm-Gg: AYBFou3CVWJYEgiD7Vy3qLpkRRdsruAnX0Z/6CG41siualDRnbeb+edUlFUIIP3Sztb
	gbAALitV/TJINWkuq56EzUdrjl3VSF/py6KbCVRm0GiH26OwopqPrCqNHxZcSWii9ByXxEO3Mzz
	+4f0ZeWpzCn2MFnD5Cm3j9rwmIPvdTsblTuwBKR645Z3rQpxnxFwXXlrAT4q/w1jzYT55RRKO1M
	lnZEM47htz3rU4RJbwK/QvTj5g3yfGyzDpSDvrukQHVjZ5i8TCpM7EUVR/tCOdB3TRJLPYMwZY7
	YkoSQrHZBxMSpr0aGETbM+zzijbhPC4nTMU46YHR3MJ4in+BTAYkyFJgr57BKGSMOJWgErrxtai
	213knSTD7vxd6FYsoPUP/EMeAPp3gZkBiOUcI7Nja0inYx+2tAOgLzDoIbD5rb5ckueROXc92+s
	6GVLvovA9ebmnPaGlyeWqAzztkS0XxmOPm8tHgGF6pP4qAFUCZRPDJGso1qjh+RytU1/BPIkCRQ
	0BpYpmaZSExx7TyFNi0uqz8fPrnO/kJ9P6DIxfyONYOTG2RiPgyhGt3Mv7b70VgU09T0vSvmvUs
	4uaiyF4U10pXF5rzcZHrytyBB3MMYCIfTEJRPvYMC/SOC+iBAbwaNPryFp9Xax0lo03ft2lXhjA
	PlzoZeFEx/yjIE8VflUDe9h0=
X-Received: by 2002:a05:600c:4e03:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a1d75ffbdamr115371105e9.19.1792327501266;
        Sun, 18 Oct 2026 05:45:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-318a-f58b-5e43-a2b9.ipv6.o2.cz. [2a00:1028:8388:a84e:318a:f58b:5e43:a2b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm16386408f8f.42.2026.10.18.05.45.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 05:45:00 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: dts: samsung: Add support for Hardkernel ODROID-U2
Date: Sun, 18 Oct 2026 14:44:57 +0200
Message-ID: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces device tree support for Hardkernel's ODROID-U2
single board computer, based on the Samsung Exynos4412 Prime SoC.

ODROID-U2 is the predecessor of ODROID-U3 and shares most of its hardware
design (2 GB LPDDR2 RAM, LAN9730 10/100 Ethernet on HSIC0, USB3503A hub
on HSIC1, MAX98090 audio codec with headphone jack and on-board MEMS DMIC,
MAX77686 PMIC, PWM-controlled cooling fan header, blue heartbeat LED).

Key differences from ODROID-U3:
- The micro-USB (DWC2 / hsotg) port does not have a VBUS supply switch,
  so it operates only in peripheral mode (dr_mode = "peripheral").
- The 3.5 mm jack is headphone only, and the board features an on-board
  MEMS digital microphone (DMIC) rather than an analog mic input.
- There is no expansion header with SPI.

Hardware verification was performed on a physical ODROID-U2 board running
Linux 6.12:
- DWC2 USB: verified in peripheral mode via /sys/class/udc and dmesg.
- Ethernet: SMSC LAN9730 detected on HSIC0, link up at 100 Mbps Full-Duplex.
- Storage: microSD (mmcblk2) detected and functional. eMMC was not tested,
  as no eMMC module was available.
- Thermal: /sys/class/thermal/cooling_device0/type shows pwm-fan (no fan
  was attached).
- Audio:
  * Stereo headphone playback verified with speaker-test and aplay.
  * On-board digital MEMS microphone (DMIC) recording verified with:
      amixer -c OdroidU2 cset name='DMIC Mux' DMIC
      arecord -D hw:OdroidU2,0 -f S16_LE -r 48000 -c 2 -d 5 /tmp/dmic.wav
      aplay -D hw:OdroidU2,0 /tmp/dmic.wav
    Audio routing includes "Mixer DAI RX", "HiFi Capture" connecting the
    MAX98090 codec capture to the Exynos I2S controller.
- LED: blue:heartbeat blinking with heartbeat trigger.

Josef Schlehofer (2):
  dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
  ARM: dts: samsung: Add Hardkernel ODROID-U2

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm/boot/dts/samsung/Makefile            |   1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |   6 +-
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 139 ++++++++++++++++++
 4 files changed, 144 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.54.0 (Apple Git-157)


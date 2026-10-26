Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047319;
	b=ojK0KhAzNe++pv6bsm7EB9QT1nK95MQkYlJ5OcAoRrGyEMXq7GM0NaedAWG2sssTgacX
	 VSFVOquQOMC2LGTVMdSSunMOoGlub6MroZ6GYWwesVflC3r0sTK/G7kMLE2M45h28kNf8
	 DdikNDyB/dTdITDL5T8TFMoQP6Fc7h54stghDUKx63R7q+vYL5H82A7bMin8GVmFfomBc
	 i3CwPHPsE1PUmg1O1W6NHwzyUFBa15dRKerp2o8Yrwn+dqfKFM33axM+gSNk4i9Oj2A+B
	 cxJ1WVm+zWlIhnwCmRiemzDiLvyAlIQH7Zbni5VDA0wLps+kn1PJCPZPP556rXYK+LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=;
	b=stXnReuwL5kUAcXUbbfmAhkDaaj7uTK5fuO+vIw6W1Iwdg1nsNWWMQwLhyJSM3+izmsS
	 P5oJPeAU8YSSZm4+W5LuOEN8T5FPbyGq3MvSdT8ZhGs2wO+Mf//ufk5EGBbTXHbo4Rp8O
	 MZtygl2yG6YTndIJVhaW8s7wkpwYn39mwYl6c0Ry8cn8PCpg0r4AgX3FI9wCIPNGywzwX
	 Hq3kO3SI1XMewKfVYICRKy9PJXuzxhpbBcxqyrMlrOeW1i3NNdwlo3yKseHJmIMeQ9BMY
	 rwtOA97APpAVqRlkCLTNO396p2nX7ukFSVqE5nhuZfGCYaA3Uj3ZsS/sw8W5jn8/+eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rEy7fXB/";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07156606A31B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 20:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07156606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rEy7fXB/
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so12191865e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047316; x=1793652116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=;
        b=rEy7fXB/Pt7EJazrVPKkjLwXrOu/w1nFxNHnJ2U7Js3gQz1L/ffv/VwagHdsoDu2nz
         RU0Zse0ypyI/6Lw0SSIDlDnC1QLx+DvpNAF+TN787T21BaHEiADAps2ytXz+7Twssvwp
         QzogKxAGxbURrUgk3EovGOhc6iWMjg9J84XrH1IG1hrMXDl3JuoThhYcdmLRCpHc4lGg
         GCL0/V7XT6phqtiDn6NOrOjeOIb3ClQAzYvCVIEoRdJnudekpnI5KFjS+FwHk7Mc5h4s
         sdVptOwAzqdq4RixHaD5DPRi+ML/lyl8gVyrWmmD/wDh4yKLLzMAYjsBImuQYpwMBDvE
         WoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047316; x=1793652116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=;
        b=JiFcWWgVN70lZX5jVNxXkridnygFk6Nzy+LFtqtpmZYI3TuG8nXNJfFdmjgYrUUIjW
         0BVjsOSGSDQSLOpLc0PkOmcf2Lr3T2zvQ6yCer3dn8iWzfbnuThBR6Ul8MBZpPJx1TH8
         KE0Pn8FUwOMVbeRCqj5XfAYF6ss2/34FMxRMiIyVuumf4/vpSTxsB7Q4rWEyZ0H7uwyo
         BOw1YrGTgotk9HuOoMglXSvuBwKAg8di911Qb4uJQlzjp5V7yiLitWKV97mvbaqeHIvQ
         jiOeYyuXVFwIht2BF8I9Am46mqUXigXOtx/dWc1y+sJwWUcByvU6+MtMVU/znQVazm7C
         uNkw==
X-Gm-Message-State: AFq9FYLPUaKNq2p3MVPa6lmZJy1sEYPIMC1TNAwDuwWywXKPfA7dykIz
	ENBUpmw3dnFvzZMZQtA+dvcHLSMwABr5OrbdaUdeE9AwiTyMLjnAaMKv8YJIVd3G
X-Gm-Gg: AYBFou0AH5R+uDYTKG9p/T4L+GzHUEQV8cCA+0k1RCQjKGS5T3EQebL1f9U1GNyI8ST
	SyfDWCk1g3QEsbHDHvHsM+4PR+O4U4P6RR1+kSg2ZUU7Anxm5H92eDPAe3jqgt+T2v+iNDc/70q
	I8UDkSOALm+NB1ocugmlxLOg3nu9IjH4dYpUsoWU9bFxvY4SUKj1nlkuWlmEI+wSDPWndhFsaxN
	tc0fO59Y72VFYPR8v+rufc+bWMQMt+Je0xjaAzElkz03GsWFXZ2y+kozF6YBVPknVDwZTuzXvpC
	ZBsDuInEwzQTxR0v+gNyf4zqkr3aaaK1QYiGlW3apRjM+7IMBB/wVuJttWeHkfTc2qFXAS2cYeS
	+OOItm2XqKqBQ+6hC7jJztjC5pLjCTOo+fJ/u1pxqYBt/rbrh0SXoAKNudM/h/rwNejWHfqkVEs
	8+y01DMEV/WqqCwvxqrBZSx8GvmpQjQwtw4cTNy7Vg7zI7xGLcI11KZyBn1KQ2iCMk9vrk3fdWR
	oqRqGtq1qek2wQiIHqaCRzB75ZM4ULcaY7DqHTkmPGYnodEplqWjkqBv1JiDUZgnBnyVtoF5TLa
	zp/uNkP6mm3S2bjv+7fcCqifCs2TNx1GZP/jINV+GFTf8kXZvAhRk47ehvEWh5NXeBVOSKquRR5
	6Jpy7/tNVq3jseT/dl3kKAatz0QAx1Wc8E/YGunTieDNxXakGr4w4PB4QDyDnXigA4kPat6mNVi
	MW2rjK
X-Received: by 2002:a05:600c:3b02:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4a35ac8e71emr150264255e9.14.1793047316294;
        Mon, 26 Oct 2026 13:41:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:55 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v3 0/2] ARM: dts: samsung: Add support for Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:52 +0100
Message-ID: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the Hardkernel ODROID-U2, the predecessor of the
ODROID-U3, based on the Samsung Exynos4412 Prime SoC.

As with other closely related boards, such as the ODROID-X2 and the
ODROID-X, the ODROID-U2 device tree includes the ODROID-U3 one and
describes only the differences: the micro-USB port is peripheral only,
as there is no VBUS supply switch, there is no expansion header with
SPI, and the 3.5 mm jack is headphone only, with an on-board digital
microphone instead.

Ethernet, microSD, USB peripheral mode, the LED, the fan cooling
device, headphone playback and recording from the digital microphone
were tested on an ODROID-U2 with v1 on Linux 6.12. With v2, everything
except audio was checked again on Linux 6.18; the DTB is the same as in
v1, except for the cs-gpios property of the disabled spi_1 node. The
eMMC was not tested, as no eMMC module was available. The DTB of v3 is
identical to v2.

Changes in v3:
- Fix the line wrapping of samsung,audio-widgets (Henrik)
- Add Reviewed-by from Henrik to the dts patch
- Link to v2: https://lore.kernel.org/all/20261022055208.17746-1-pepe.schlehofer@gmail.com/

Changes in v2:
- Include the ODROID-U3 device tree instead of duplicating it, which
  also resolves the style issues reported by Henrik
- Add Reviewed-by from Henrik to the dt-bindings patch
- Link to v1: https://lore.kernel.org/all/20261018124459.3026-1-pepe.schlehofer@gmail.com/

Josef Schlehofer (2):
  dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
  ARM: dts: samsung: Add Hardkernel ODROID-U2

 .../bindings/arm/samsung/samsung-boards.yaml  |  1 +
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 41 +++++++++++++++++++
 4 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.54.0 (Apple Git-157)


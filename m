Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873903;
	b=qWDb4YTQVyPddvNDlRi1t0B6weVsH2XT9N3ZcxlUvTpaPcMMpXZjC3GG4TIsQO8kDWjt
	 +fqfC8EdMwehay43az9L+9PBe3GaI7ugCt5YhS9dTfwT8ns9vQ4wUV2YcbwJFI7ZAI/uK
	 ybvb/8rSEtQUnXHe4LvchHicYW9CWo54PinHSdy8MMqx+EIgZ/hm/zo5jvPy2Hj9zLNXI
	 PbxVwdRy2VEPpcJ/H1uyWr+F03OjKmvcSl9/Q3wSN3SP7mALQCUxe7Nvz1CPz7BhXHEJX
	 x4XPHc83OzhTVp/kxlibO5S9MNFXWPU5/rVcjQaAOSDFm6vGLteMMDsC0OL7b7uKang==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873903;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Rspamd-Queue-Id;
	bh=2a+Yri10/zFE3o9wz8FYNDHmwFSDAaf5+qNG/L9KbRg=;
	b=zTuCRJOit4lysj34OF2e7GDm4IcWrgVMAhR3TKI0dXNEJLD+lMSgepWDApyN6AoyQYk/
	 nXjdkvqOcUcO5Yd917ndI/ADQpjkSCB78qsW3RpAV0VR+oWu/w7trpK73dtOEF6NGG8v9
	 70pTQ4U+toWYEetjC+3rjLiFJCsja8RxcfoJxi/abm/2UXgpo+Xu07E0p5cD9UeHBzbQC
	 d12OSzElTdOH6ZaFWt2mgCPumDJDFg4EfoFoho2FIaYZ5kkHiLatSmGJdvCffpU0nOH1Q
	 fcx/CI5jgAXyqmZ+ob2xhEZ9aGD7H6/7kchHpMxZ+dsSVBTrY8IsPQxKFmdIrMu7K6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timmermann.space;
	spf=pass smtp.mailfrom=timmermann.space;
	dkim=pass header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=vuVekJQ6;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC96C606A31C;
	Sat, 28 Nov 2026 13:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC96C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=vuVekJQ6
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jcBXW1CdMz8tH9;
	Sat, 28 Nov 2026 14:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2a+Yri10/zFE3o9wz8FYNDHmwFSDAaf5+qNG/L9KbRg=;
	b=vuVekJQ64sop22dz12YCBiw5cfW3TvTYZnX8Q0AL616Xp0OjwpByoeYPUcnfigAAyLD/CU
	IwGoMtQIflxO29oAmD8Mcnruzg5PSLc0HYPDJV395jxfEQYJ9W6uhDNSPaXgdVprdu8HYi
	IfYRhK8L4LFOvay+ZvOM12mSWeLshbijlNonSefhRABzibODqOAXfsLqcUnuFXdFsziNvI
	HfI6aF0afY4c9iW+7iB4X4THIB2/8BD+wTUcqLKqXwZ9mMVqoOlytfCTF8nKAwqfn0R82+
	T7rdnOj7V5F39TB9V+d1+XDY6J136L2ZQiRSmvUDuOLBERW5F6tTlrnAidhoQA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Subject: [PATCH v2 0/7] Input: s6sy761 - add SPI support for the S6SY791
Date: Sat, 28 Nov 2026 14:51:27 +0100
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr2K6dgxTg0ldeQ/DopQp1NCWdEqjI
 dxdwBO4fMnLf38RTMkRi/tpEYmKYxfDBvJ8EmbQoSdw3cZCVvKGFSKMOl85Qx9jPxIkXShAjrM
 ZYJ44J9IeLCptOpRopRHb0JTIuvcReTY/5rl9kcn78m4MjnNMn+NFwd37K1gQKpBa2brGWrWKH
 tl5T8nrEC48aUOiWdf1C4JvBBrtAAAA
X-Change-ID: 20261011-lat3st-google-raven-touch-upstream-f19acd121f2c
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXW1CdMz8tH9

This series adds SPI support to S6SY761 touch controllers, specifically
S6SY791 devices. Also included are the necessary adjustments in the DTS
for the Google Pixel 6 Pro (raven) which uses the aforementioned SPI
version. As the mentioned board has a reset line wired, I also added that
functionality to the bindings and driver. To implement SPI versions
cleanly, the driver was split into core and bus transfer modules like
seen in other drivers.

This series was successfully tested with a Google Pixel 6 Pro. The I2C
transfer part was untested because I don't have a device with an
S6SY761 controller.

Known issue: on gs101 the touchscreen probe at boot fails with -EIO
because the very first SPI transfer is not understood by the controller
(the reply is all zeros); rebinding the driver works. This looks like
spi-s3c64xx applying CPOL/CPHA only in transfer_one(), after chip
select has been asserted, but I have not verified this further. It is
not addressed by this series.

Patches 1-4 and 7 are meant for the input tree, patches 5-6 for the
Samsung SoC tree. The DTS patches depend on the binding in patch 1.

---
Changes in v2:
- Reworked dt-bindings to require properties for SPI variants
- Fixed I²C variants having SPI properties allowed
- Don't wait for devices without reset gpio to come out of reset
  anymore
- Remove includes of linux/mod_devicetable.h
- Cleaned up array initialization around of_ids
- Link to v1: https://patch.msgid.link/20261011-lat3st-google-raven-touch-upstream-v1-0-2a9f55159b9e@timmermann.space

To: Lukas Timmermann <foss@timmermann.space>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: André Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

---
Lukas Timmermann (7):
      dt-bindings: input: touchscreen: samsung,s6sy761: Add S6SY791 and reset GPIO
      Input: s6sy761 - split into core and I2C modules
      Input: s6sy761 - add reset GPIO support
      Input: s6sy761 - add SPI support for S6SY791
      arm64: dts: exynos: gs101-pixel-common: add labels for touchscreen supplies
      arm64: dts: exynos: gs101-raven: add S6SY791 touchscreen
      MAINTAINERS: add entry for Samsung S6SY761 touchscreen driver

 .../input/touchscreen/samsung,s6sy761.yaml         |  51 ++++-
 MAINTAINERS                                        |   7 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |   4 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  50 +++++
 drivers/input/touchscreen/Kconfig                  |  20 +-
 drivers/input/touchscreen/Makefile                 |   4 +-
 .../touchscreen/{s6sy761.c => s6sy761_core.c}      | 228 ++++++++++-----------
 drivers/input/touchscreen/s6sy761_core.h           |  34 +++
 drivers/input/touchscreen/s6sy761_i2c.c            | 111 ++++++++++
 drivers/input/touchscreen/s6sy761_spi.c            | 171 ++++++++++++++++
 10 files changed, 548 insertions(+), 132 deletions(-)
---
base-commit: 56beabeaf17aaf9acc6afc6d6d21ea28d8f67797
change-id: 20261011-lat3st-google-raven-touch-upstream-f19acd121f2c

Best regards,
--  
Lukas Timmermann <foss@timmermann.space>


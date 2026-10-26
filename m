Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030486;
	b=NuncghHFzRZ6SSDAOfsGMvyxRtCGUUGAfrHBN4Gbmb3K7bx4sZtHm3PrZba0hXcB2zpn
	 ut+hSzja6aazKdXk1yppzDHwNYkuGVMZIB8+tDulpE42Wh2R7cFWGqWx10Lz61KC4mTXC
	 Jvos79EsNXSveg8Fs3nOiUp8g7YxCnPq8jRT2S2W0UZ//TuF2YpG94POGygh0xusoL8Ae
	 Y0hzqck8cQG9LqeLRB5sWXue8Hw0bdgzTS2ORTO+RObtS+USMPr9YuKq9JZP6nbDCN76q
	 Dh3uH4SosnFXYcrC/OuBwRNBB+klhnQ6Ay2fyHahHzeDPQC0eBaD6oReq9bfTCEzu6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3ymnrBNdKiljDdwgY6MK3mYj3Z4/pYbQqDBb8t0BJco=;
	b=z0HH18T9B/h5TSm3P5+zipRScGqixgHaQqi14QHQsKTo7hPhuwaZPkoP5u4Z8IGUojbE
	 DpAV5IotvZTeMmqo3F5kKE3hHrTInOxLbOkQG7bitG0ZfX4Y+PHO1kYl+FpCzEFtNsXwG
	 ekiKOuZOrZHyzcxUXo5n/ErGPy6y42gcDqFy4lMWiJcnDUurSBGi/csq4UxuHfNDVTW6D
	 w+5G43G4Z4vpFdQNMKA90XUQ2gVVUzsXlKc+Up8wACrzZNX0i3JLfYrW+5xNPRdkCGPpj
	 6LR/qc++kg9N/fUELxc36SsJ8lepcwkag5E/WA3l05h8vhCnxTf2KbEp28tJugHQPwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="NRA/3ho1";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06E1606A31E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D06E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NRA/3ho1
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c414e5d282eso362192166b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030484; x=1793635284; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ymnrBNdKiljDdwgY6MK3mYj3Z4/pYbQqDBb8t0BJco=;
        b=NRA/3ho1VkYXluT51itsNkGhX2Gabb7LiCt+Hjr3+9mWTqTTRTe/UICmvr0ko5eR/k
         5naWGkNyHYMQ3i27IWbhEPRdqM97PB3rHHQngBX/TdBfFxfenofyQDYpnCG48x8yCzIT
         nphiqeZPmJ5ssWd3lQZEZ2OU6cZf/lRvvxX1KLBfRxE7hXeoqyp97rD/HejegJbJPvrg
         ZRhZ2VAbr4st18rTsSUJbyxcKgaxHgIcHNFxxaooUpxl7EfkykgvdBZFMxJ+IFRNT3Mu
         PQjVXEAfGsmqAIEYyjXcFI2+YOkPHA2Z3AdxROX98Fq52e6bLT0U/JFg3oSogaLXl2rO
         pa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030484; x=1793635284;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ymnrBNdKiljDdwgY6MK3mYj3Z4/pYbQqDBb8t0BJco=;
        b=gCJuTDcFdTNgSJZZoici/eSTW5hMfLtjj40BW9Re2dF9lwgMQmaB8ixwrEhDL68bLP
         F5mPfpzBG1iFSNXZiNwV6qYfJZaOlZH7nZXB2vIqRV8tN8EAnb7eo5I/SkliFSt1+nkT
         ndB5F2nySVOXVkB/Keyyv2OH0jDHNMjfBCoilPdGQCh6nC/lTKQ2Du1XFaJzqhFtzUUx
         j1EiSrY9yPNi2Aru4af+PN/nfuIzani4U/oponIVIdjxDINhr/QMt+mfsm7SZHqwcrTG
         EdMVTN5Ktt7IKMNulB6V59q0M7NMgFDIGuQRBWBkN7tf8uRWGE/1/CnQ3iT8gHVkGuiR
         OSww==
X-Forwarded-Encrypted: i=1; AKwUvBw4QgQPUbmAs2WMTq0nNw72t63meKTXmPfaBCqiELjz6Co8bzxtcO3TgDFB1oPYu0M+gIFOaLTEG2aQlaCmgLDlFw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLgwb/j2jRNYMaAuyeix/uzdvRiXmmpwbDl1WzNJv9GoGVkfjlB
	BShPBXhwNCTu5vQ7Q0BAjxUdLIZwA0o4pYVGKn1BzFnG7pSqwAKatuCg24OtEcBYsDc=
X-Gm-Gg: AYBFou1lzAl1KFdDrkiA0ISLRNRgPSYaP4hsMhzd6foInf595a7dp3CIMiGqHgON74d
	oUrrQx1tIdi2YmboqBzX2xh7FJQHqYviRgIaMBy3SsO09A18GupHanPNDxSs88tkHhBxzSuDAK/
	8SkdcSUzvgjGQSX01aDlVXjYq6/gRadLrwtW70Rywtpda/TFg3CJDIJ/J8kJc8n3zL7gVTIc8kT
	zZ3hMnByYM6LcUZcpCkMF07PCKs3qLv5QLBdHMYmXC4gDnv8irDmhKdIwbsJkSCdW7GS7cJzpfx
	KEMVMnXg/NlHtv7vt+rM4OMLF95S6HAaJRoqK1tgoTtEQgnb/ekC92KUEPn/7hXDUWxw7BRcTTm
	v88gbPyJLN2J5r4KtUZWnYkdW8ObpTA4MwFum2G63SeDoyK/UoZ2imRChP8jESO3D4dQAyRYUpo
	aBM6YyKfXItSLpqQtwgfqiIHWnaP5+XCBainK9mHig3PKJVpF9F5MEplvwL1w0JBiQyyKLLcSnh
	31jrKcAogHkNYHb/PQbD15hc7daYxFyeFDsjqSFNjtyKNJ71QOLs+VvT10VUG4icrhppDLgYtyQ
	yuAgyHWaxDrq10OVLnQaPdQ+8ONjofPVk1jr
X-Received: by 2002:a17:907:100c:b0:c49:4450:6248 with SMTP id a640c23a62f3a-c4944507cccmr269354066b.16.1793030484097;
        Mon, 26 Oct 2026 09:01:24 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 00/15] thermal/drivers/samsung: acpm-tmu: Fixes and
 cleanups for GS101 TMU
Date: Mon, 26 Oct 2026 16:01:17 +0000
Message-Id: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAE5532oC/x3LQQqAIBBA0avErBtwJEq6SrSwHGsWVmhFEN49a
 fn4/BcSR+EEffVC5FuS7FsB1RXMq90WRnHFoJVuSVGDdj4CnuFCLw8nNJ0xjrSePDGU6Yj8h/I
 MY84f25NX02AAAAA=
X-Change-ID: 20261014-acpm-tmu-fixes-8788d122bf1e
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=2074;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=I/JMyWiRNIubE6cFu1pbLVDJyCCuA18f15y27xl2iK0=;
 b=R0jk61V3qMv0AjCuKodXZM/4F7Skr+tAD9gSsK7jMggcOhEIu3b3xJNKfFwX7jqgduBv21Dbv
 o2MrKlbxi1ZCgdxkUO6i50DEVapod3/A/6gmjJSXeigOqsylkvVv8Z2
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Hi,

The series is structured with fixes first (patches 1-10) followed by
cleanups (patches 11-15), so the fixes can be picked up for the -rc
phase if desired. Patches 11-12 are placed immediately after the fixes
in case it is also preferred to take the driver and module renames
before v7.4 is released.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (15):
      thermal/drivers/samsung: Select REGMAP_MMIO for EXYNOS_ACPM_THERMAL
      thermal/drivers/samsung: Depend on PM for EXYNOS_ACPM_THERMAL
      thermal/drivers/samsung: acpm-tmu: Fix acpm_tmu_resume() error handling
      thermal/drivers/samsung: acpm-tmu: Disable IRQ across system suspend/resume
      thermal/drivers/samsung: acpm-tmu: Implement .change_mode() callback
      thermal/drivers/samsung: acpm-tmu: Rely on devres for probe error and remove teardown
      thermal/drivers/samsung: acpm-tmu: Return -ENODATA when sensor is disabled
      thermal/drivers/samsung: acpm-tmu: Annotate lockless sensor->enabled access
      thermal/drivers/samsung: acpm-tmu: Fix IRQ locking and error handling
      MAINTAINERS: Use linux-pm mailing list for Samsung Exynos ACPM thermal driver
      thermal/drivers/samsung: acpm-tmu: Rename platform driver to "exynos-acpm-tmu"
      thermal/drivers/samsung: Drop redundant composite object in Makefile
      thermal/drivers/samsung: acpm-tmu: Disable regmap locking for MMIO INTPEND reads
      thermal/drivers/samsung: acpm-tmu: Clean up probe error logging
      thermal/drivers/samsung: acpm-tmu: Simplify pm_runtime_resume_and_get() error checks

 MAINTAINERS                        |   2 +-
 drivers/thermal/samsung/Kconfig    |   2 +
 drivers/thermal/samsung/Makefile   |   3 +-
 drivers/thermal/samsung/acpm-tmu.c | 232 +++++++++++++++----------------------
 4 files changed, 98 insertions(+), 141 deletions(-)
---
base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
change-id: 20261014-acpm-tmu-fixes-8788d122bf1e

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


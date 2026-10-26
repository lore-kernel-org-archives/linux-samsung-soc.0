Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030487;
	b=lYPsxbT5hFVN/TIzqQFzdSDUFch67VxFGGHIFoQYeehQe7/pTfoJCJAWjvzVZzcSkAeJ
	 Wiq++Z88SbodXA+DHz71ZFG+Pixyk7n8Wsap99nLdoIHwqgBFicpSBA4BOYoGVdzBhVQZ
	 2M5Q3Rm9ijEt99xmQ11nGjR5Ko6kkgWtcKTfUPP/hIk2iBBhWtkI6pdL+CVm67IDeAV/y
	 2oe++UENk5K79YjitfUofSzGini7ueWX/8dyS8lhjjvbM9qelxssSr7gPxlZ3MV+IGoIN
	 mH+OOU10MXlgff1AwokK84Oj1jkOqg88pduOchmi9bv8otFwJesTFbqn3PQ7JbavgKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ieFDF25dHP1edNybu7K5/jDCEdFup8w+Bgydwx+0E/0=;
	b=aWetnuHmN14gInWgLVSvDzHw8DOYaYk20bD/pHedhPPSRAvX+6+Sk0qqss1Jfdo2pKnm
	 U+MlTSIY/ADBvwNdH7W0vu/xTyzZYSy2hYwq35mUYpcLjIdcw2Fk0VKRd1cSopz0s6u5s
	 GH2vQwmsqQI+7zASgDxveMgTCvCTnTUZT2Is/oNSGPh5KHgCYYPsWvDCgcvl9dqzc70Qc
	 Cqh3bzVXoy5ItPYUcC68VvBENp+986QUoVvU4RBCV4263sgN5So+FHsM1PtaF8tV9pe8u
	 zYDC9Y/9LO264MQmfbm21gG9vJ0iNE17M77gB0PqL1Qxf51ArkeMkAwLGcxc7PvmpNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gsE9AsRf;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE838606A325
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE838606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gsE9AsRf
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso472374266b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030485; x=1793635285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieFDF25dHP1edNybu7K5/jDCEdFup8w+Bgydwx+0E/0=;
        b=gsE9AsRfp/au/VPClVtisPgS6NL256YXXHzhJBWy3p1a/BBvDH3CNC7dLlGzaId/YW
         pcOXtpWKTQYLZG12QhmvYxybnaQzqn2QsD+5YxfukWZr2gAbkqmwsLtrq0wNsrXeNJlP
         cqb1SzkAiWmtSCwz0Wlc/vT0MRZ1dVaiTkol79s82Gy5KEELqMsZ2WpuVeM+OaV//05L
         cWQ+CW0oT8G4nEGNsznxPlH9ZPL67128KDXDU5l5bGAxXBsOkRFptLyviLgsWLy5JxVS
         qcReQrkrfX3dtt0wKH7H7Cqd1dmRgKnpoJ+MNADCxuesWYeYESr46w0hAGZUTThKNIem
         FVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030485; x=1793635285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieFDF25dHP1edNybu7K5/jDCEdFup8w+Bgydwx+0E/0=;
        b=ElLd89z7aqG8USIGjJnUh5WJXN/UFuG/5GBf9SkXYiccEEaSMTg1QggomSHRMT4f9E
         n/Fiz+rEDSC1iRsBK/CTIDqMkx8/Kd8+0sdmegH+elUDJyODNgfAKKSdxUriNPdlxBDD
         5Faxsr5yVpA4hBTLxyYyWVyK6mslB4/EkLIrrGieHUjYGJEww4gJuteCHMlcpBn5DaT0
         qjQ5Wd015T6SfO5+nmWPqkvk9BunCmMlidfn5Ook5UpbOZu7kNV21qDJASvJ/xsUTdGg
         fTsC2rw20a5MgCe1f/JeKoI1daLnHK3Ocbcd1ZFqrRUheFLDAV2T0sf+xQWT/CgGY/gr
         CW8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwhfZc8wQd7ei5pOlR8sTuh1j1vpJUnp8GpmoB/8xEoO3zkrouvHKQhJyMZZ5eqJ/+S0tYemne67cDkqDjEDIwvyw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJw2SNYXOTF+Ps4aoROVswwCAHSuJacJRJIn5dfmOXKY6xQ3/qD
	CCPE/42JuyUuAkflFDcQ8GsFA3CTFcb5U3Q9jdH7mLh66TNVw2pj9kFz+NIi55V8S90=
X-Gm-Gg: AYBFou2h0f9FDDsqUSn1mYh3g5iR3xsYpWsxuCkMCULBxyh5xpuG0V+qFZUq0tlFhgq
	svJ+gRbca84KyRs5+NeE7toYTcVd9RRcf6R1egtlHDlq3QPG8JAbyRlIuOBpvtJoyq0O8RH2WvI
	Q1QisRVLDAY4GmKwVFRgF4ct3/wYIkCUugXkz4+xUYiABXTYzhAU4GExPFniqHflRL9j/Vv5cTv
	KV+6uqYWrkRtEkilkENkr+DeYzyb4i+rnoeFLxrLpw6ON0NFnTgu351L6JckIhQFNN4L7TMrGn2
	k7TeUo3pv3Vfb7lYuNTqHSUdh3Dm+OoFOAB51XoGd8j4AuhPcuz524chuoyb9T3W81JoHM9ikVp
	IsO4NARcABOWfFqnELBaGw3Mqoi2VWnxEWhEy2nph2eBxpZgQmDGe3t7xTjhAX8AmGDVJ5Sci4A
	6GfEb0umpdoi0TbvINkzvkSNxMIpUUbuFgiq41owEQXAb2b9YHaa9DhUgvaRCzg7qRgHSrNPA1z
	7c19ExzyqRIYSUqyVoj+GynKc4U4kB44uZBmZG1bGEHKavXUbaTnMZtsCankCHq0iMEYR3FYm4D
	N8ggwykInlub3L6vOchIgd/YsG9ArA4HOCM6
X-Received: by 2002:a17:907:94ca:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c46bde7eaf0mr1008564766b.35.1793030484647;
        Mon, 26 Oct 2026 09:01:24 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:24 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:18 +0000
Subject: [PATCH 01/15] thermal/drivers/samsung: Select REGMAP_MMIO for
 EXYNOS_ACPM_THERMAL
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
Message-Id: <20261026-acpm-tmu-fixes-v1-1-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
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
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1279;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=+KG/D0KvZbRCiAETwTUCvZNQ2kPMmB1TmI4WJYpa5dI=;
 b=2yYo0FGBL9w+ojSMILSlcsZfUlNX7O+SioBKk1y25nYproZ23ihVuFC9rL3cKbPnDkrkXyVRX
 NrWjK5uLAq8B/i+SeoGzPZ+7+BlB12MD0bUop+iIEYL7ezkPiyFgupH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The Exynos ACPM TMU driver calls devm_regmap_init_mmio() in
acpm_tmu_probe(), which requires CONFIG_REGMAP_MMIO.

When ARCH_EXYNOS is enabled, REGMAP_MMIO is selected transitively via
EXYNOS_PMU. However, both the Samsung thermal menu and
EXYNOS_ACPM_PROTOCOL allow COMPILE_TEST builds with ARCH_EXYNOS disabled
(COMPILE_TEST && !ARCH_EXYNOS), where nothing in EXYNOS_ACPM_THERMAL's
dependency chain selects REGMAP_MMIO, resulting in build failures when
REGMAP_MMIO is not enabled by another driver.

Select REGMAP_MMIO under config EXYNOS_ACPM_THERMAL.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
index f63eeae304b7..18ab4ffc8671 100644
--- a/drivers/thermal/samsung/Kconfig
+++ b/drivers/thermal/samsung/Kconfig
@@ -16,6 +16,7 @@ config EXYNOS_ACPM_THERMAL
 	depends on THERMAL_OF
 	depends on HAS_IOMEM
 	depends on EXYNOS_ACPM_PROTOCOL
+	select REGMAP_MMIO
 	default ARCH_EXYNOS
 	help
 	  Support for the Thermal Management Unit (TMU) on Samsung Exynos SoCs

-- 
2.56.0.257.gf7497c7d27-goog


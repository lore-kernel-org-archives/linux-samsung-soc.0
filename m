Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030490;
	b=rR/ybzcUp2FSAKQIb9JFi5W/xp3k0tO5jLI1TXfbzKovwni/2SVEs9F66KyZCxkcgiKm
	 DT7WnqIw4vkq5yNFNVydBKdkJZ1HIfqpKAAvokgjdbNRT26vF1NfR3N4KhlZ3eYb/kTWL
	 +e1SdGnKfictcNaoG/DDzv4zO2PEo3KabXHL037q+25GzmwQcB8nYJ0RWFwjZkKpOkrmt
	 JFna1XqFuZ5Y077AE5wGhICJRpModa5a2sic/8KmjAdeoTazlEMb8T6/saund4y0cN2ag
	 epIkjIH0PVqFLKpeKdKPg7O8gc/MPA9Ztn2PdMasYHonwieFMoeuCBJ4RBCtFUYsAlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XK7qHQy7h7fEOAcUVe+GZGt54pAG7ispME5t/pzPbRc=;
	b=M3dQa+UCCrJzIh4FUrR4mwDe911mRL3rMQ641mjGYx4U4sd8T0N6vS+5lh/SO9fDpnbC
	 +HPTc9P9mazJgfyOESJPQtpUOhDWEIVQZy+5RkchidAlz/fFamVghFgRmhVedZbHdRM4Y
	 D7g5SVGJL6u50J1ivdI2KXTWjSX+piD7uUaZ3F7PFbP/Kni06bCq5wtdaIJ+zRGEEP7k6
	 ozFHVT6AYOqFv30/hAO9LfB9rRml/8OrFJNTezzjskwESIgL+SQhAOwA4xFjczhTNcKVI
	 AQrS9ew89sgnrxYDue3atTphszpqpWrhenVn3LKRQKFVXs5HOdNSiRIj9jFKoZiRtZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ieUR3kYm;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A92606A333
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A92606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ieUR3kYm
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c411e139259so245400466b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030486; x=1793635286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XK7qHQy7h7fEOAcUVe+GZGt54pAG7ispME5t/pzPbRc=;
        b=ieUR3kYm3p4hIfOSxUoDSjFV1IWD3pQVNRWXlDRB9tsLgApSHkHf/RGj7ECfLsbymj
         SJ6Tq3aMHz3BkzycrYkIcxDPfJix09Rs+06ASpB2/Ao9+qV/mRvMh8h3aXFZHsmUCf4P
         8qFZfQMbuONsJKvol30wP7NsvW9f2Scsml+v+SUibIblbNJOW5+qniwKlh6au7xw7/lO
         DX2IDMiUq7N++2C5fkPaTH63lDyafrnNrjA6E4eexmK3J1tMN2VQgSCKJIS4qGK7gOkI
         /v/8ONz22x+hb4UxYM2FvyUp/ne77eiZnfHrqFejCU6FhjZSsRSAsd/6K/xNq7Ml339y
         kphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030486; x=1793635286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XK7qHQy7h7fEOAcUVe+GZGt54pAG7ispME5t/pzPbRc=;
        b=exy8MkRV8IDe7Exdx9Fpbs0YE2l6lesEP9O4f179gpvSmRqwTPbB5IPdMknzHlRkqy
         tFOIBYZnB/CtRH6MVCRBy3I+F0iBUo/UJ/QtIJBT3MSAaPPDF0xDBUsvs5Ya89yZ6o9D
         /Ukv9dh3e12spWGuCckgvQl/u/FNNh4UHp8acO2T45Tzfu6mSp1klw9gwD6F/7sDDh6P
         qGWeJwoAspGs0lnYIo5O5eQFim+rru6VQAYNPcjeM2z4mT6vN0JSDQ84xH/NyYospvKU
         l9spCLqSYspjpjqqvGjxvxoBAFo9ylqImol0MAeFHqTY7P5xzufSXq3aLDpZ/B0GIPj2
         TnZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKlSs54FtWds4ahT/SEx36Docegte2wAhE4Avs9bAixrAHEIvticU2fXrJpVflhq4jojaVtqf1NsPOQ+CrPhU9Aw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIrAN2nB1ksrTgSz1FX+08awLvIT0fvWUEW2jDcsFGriJd4yUxV
	/0vfFh5h4y4FNAa4RgUULSlwED+xLXCYmP2ZSiXqog7RyllD0aBxJpYUr85x1S8e+/w=
X-Gm-Gg: AYBFou2Y4v+tQ+10tbl8kYzNA9MaRiJLkRJiIe9NwyJNXmG6S1UDbWwrPZoaGh4qVt2
	xgYDoiHntdcpOBYvJhjAvS0ojnO7vTg91kceROr8sqSUf2B727oi5VW2QSJJP4iteqarvJSbE1x
	+/6/9DO/Jy07xqjKOSAbH/7hwPzgCc1WdFo3nUfWm2IpJVYO8ZBmDfjnsOHl1xrwu2TEONPeqhX
	Zg776Pej5elD7Km98tCL3YwLOwBOAwKSUzs/RwmH/D9qatd715anVxpXzKoaOVbjseqerXtZdKR
	5H8lcPEJlC8d0Xvx4UHwKJR4RUvmXjlvFZOD30teIAMICfhGv31npGyFAIoa0zxu+4BzldqMhlX
	/LK1pTYYiTTXQYWjh8GvDpitDk9dGDmEBJsSKJygQ6eBGkG2MkGFw5cWxiwdCPA7LPHSuPFbiRq
	UXPUogvXBBBtoPcRgwpv+FBWyYpLvAZOnBqhOqeBOfoHFSvLlS2Bj4BfAmHpEl/zlKJdCAAhret
	cPe9jNaiQh8F2UEunK6wI4GAGlPtJIgqaIwSrCm5bH/KiaiPeO3wP4pQDsxwDPAqRyftknboGaC
	0NOwaMR2UdIfVJvSvsqsootkSrw9d5bHF2CT
X-Received: by 2002:a17:907:3fa1:b0:c2d:fade:e089 with SMTP id a640c23a62f3a-c46bd95336dmr871688466b.0.1793030485703;
        Mon, 26 Oct 2026 09:01:25 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:24 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:19 +0000
Subject: [PATCH 02/15] thermal/drivers/samsung: Depend on PM for
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
Message-Id: <20261026-acpm-tmu-fixes-v1-2-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1174;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Dzhl0EEXao5JmHmXdbQBkEx1RDJKD2McfwIvQF5jBlY=;
 b=yldnHcVgig3g4YuaqhknJNmqQ0LiizU/8L7WyW6sz9Ri/9FOWRHr2VpyiIQE9S5ZTzmP6lMpo
 HHCV9rcJCDYAIrbrxD3SaBInPJhhz5uMQhuqE1CNV6B+NCUxnHtIT87
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The Exynos ACPM TMU driver only prepares and enables its APB clock
(priv->clk) from its runtime PM resume callback
(acpm_tmu_runtime_resume()).

Neither ARM64 nor ARCH_EXYNOS selects CONFIG_PM. When CONFIG_PM is
disabled, pm_runtime_resume_and_get() is a stub returning 0 without
invoking acpm_tmu_runtime_resume(), leaving the APB clock gated when
acpm_tmu_thread_fn() reads the memory-mapped INTPEND registers.

Add a PM dependency to EXYNOS_ACPM_THERMAL.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
index 18ab4ffc8671..b879a63e97c7 100644
--- a/drivers/thermal/samsung/Kconfig
+++ b/drivers/thermal/samsung/Kconfig
@@ -15,6 +15,7 @@ config EXYNOS_ACPM_THERMAL
 	tristate "Exynos ACPM thermal management unit driver"
 	depends on THERMAL_OF
 	depends on HAS_IOMEM
+	depends on PM
 	depends on EXYNOS_ACPM_PROTOCOL
 	select REGMAP_MMIO
 	default ARCH_EXYNOS

-- 
2.56.0.257.gf7497c7d27-goog


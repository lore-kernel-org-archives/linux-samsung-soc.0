Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030495;
	b=NwdQ8pPnyx48dC4awU5A7MFYYWpYg4RkPgFTHHT7Qe/74lkPZEkBdfOmWFlMwYOKZFy4
	 H1sPWOphJFhIZ+AJ4Qan+lzxSYKknQw2LUr9Ui5pLbFyrFSW1P4TMLzEweHSZDfX5DOUb
	 +d0BCse0ynx869/6dlUCT5qskjV5B5wkYgYVWn5A7N1d1+omtgYKKPSvnuhjpUFzXr9u3
	 ESA+Dw4QCmkB5o+8Rg3BJ7KRPbUoG1WZzwGj71ZqjlME6f0O0eO86mT6nrEvGLP69T9RJ
	 /GC15lfiOUTGrb2TbchV0aw6R4dqYZ/dWviqJqkbzJgs617bXvODxAiC2gG9v5IyaYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kBw7AsSPjsfDBCQewWzDRPOIx+yoCp8Gcws1tr4ymx4=;
	b=KPN3RNis/jh2gjUFS386hYSCVYRpgBC+Z7HfUIS9ivxpE9dHUHrqvOVl/WsqiFZISXcp
	 43zvSMwSnDW47Tdqd6/SyKij8zT6bgqA9kRiiZ8daRg/lhMxslvjv/BJRrSNZhoK+is7i
	 5Y3j2tsoNZy5Zbf6DMC/j6a4MFIObUMsLXN+FfQ6o6EuSde/6x6Eii38BF7lduxBvz5I2
	 ZljUrb1wfgMyW1n+yk5nIWQbMqmb3O6YUzZmZbgamDJBgNTF4/pOWfzHItW0ZUFKakuOh
	 MlUOTJIJCmAOXF2ybhJibAhklrEggMoezcnD1ifAgvvt+r2nxRcmfAGWxAZ82MYwvag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q2+gKLTX;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB5460A380D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB5460A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q2+gKLTX
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c445c95d553so412333466b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030493; x=1793635293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBw7AsSPjsfDBCQewWzDRPOIx+yoCp8Gcws1tr4ymx4=;
        b=Q2+gKLTXKBmiFtZ3oS6jQ/Alb+7Y8/226FUbzVO0UsRgn0WP/nSIudqsHDvjXVWlYe
         ppKS28mUWuunFTQtgq3SL7OpecpO5D87T58jH32UNB4L/hAPcqmu/8aSkrJM05L/ZNbp
         uijzsrmQDyDLNoCv4nswrIlEfI0NCvKa5H4/aZbyATgqu/ekcUtezv8kqOqPBFAyv5ae
         1yacVh897Y8xxclpOvfEbgIwheoneVYdNswZ9dkOj8TKA6JhrnnaBWLdv8DTlnd+wOfC
         dJUE/FDAWdd3OTlm4hD98Hs094pws974LOzbU5vUIrWNR2n1i2FV3SZwBuPuU0lQkAdB
         KiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030493; x=1793635293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBw7AsSPjsfDBCQewWzDRPOIx+yoCp8Gcws1tr4ymx4=;
        b=VsZMSU6HG61fpEoVlL7/sqMO6LMHvfM9fa7yOa0TgToP0LOpDioktxE8ON6VrqpLj1
         CGPTtsW4JWFDMVjLkui+dxsQYL6Hul9aLMM/Rd7eUcP4yorlqGTzvlBG+QY/T3GnO41/
         8zyOLpBU5Djthl8u2KVeF35IlxuG1vac/+3s74csX4aR+aevlqG4+HJX6FjUIzfKVyzR
         A10c8ylUdnNXafqg52k9Zz3bPzphkyjG6erV0wW3qNW7YB9l7qzg8gMgY8wWR10Y36Yo
         i6jjdi0oZw1Wknj4cRs2Si5rCi4cu3H55mUl1IPffGOTWVUmjNyQFbHOm+qIAq2sYN9S
         17qQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4/wxduYOMC9CFoE2PTpijsa45yehVyumF8fu6lYAouSW0kPFfM7nF3K65bWK/WpwbO3qiy0yqopU/xQB100wjVw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKLM9vRmaNPl/7wHryTAW7BGan3fw/kjdbubDpXtLtg3t1UWMol
	rfEdFfnM0P6ShQ4GLhp2KaCoMEEnqZ0EedJDJRd6LOuNNvypT7Z4q0gdsfG89NdiDPM=
X-Gm-Gg: AYBFou3SaT0PQ36AcfLTEAotK5ZDgqYFY/5gDWofAkpOdcwuXt3YdSmSxOojGK7gffk
	uLcp80Gvb5ZxPlTyjBmNIBotBxKX22kciIJwIgFof6hVQuPWY9jNd7k9YM2iGbcvrZNZ4k3/R6w
	qKixQfPhyU2L2TLMx9Qc3zPdLisc/smOiQnwhdQ7GAUM63WA4A8h/pMoxSJjuHlfB9uEn4d7VTJ
	aYqe8fl/UCQQD9ArsnGIe4JG1aQVb1ofdPTdCXFh4wgG+RW3RIo03vTwmKI9ukh6SjS6nNvRwG3
	whmSNsO03eF9s5fi2e9TRr+X4IyHBPsYPB9FFabhOqZvzS5tZsA4iuooYLhWT4xhLYVPoMrmm6N
	CBQtdrHRcgqL/Fv+9Ony9v1Gvar4vmvg6FHMROPgiRWpIQXNXQOguJVDc1zUIo5WVQV1qeTa/T4
	QUDDhO5swTBOS7w6DloHSx/b03vCEBFdfHSdAyDzPhnXk3UwQuPahqPp+PvT/FUTWTzqBagfPQj
	5b3cEJ8CxVCjv7yy8QNznXr2zkgHC8XNUjmTPBhG8PJejTrS/k3G/e4hANX7zlkp8PrXvbBn989
	wYns92zj0ClNaXiS07PtJGE1P+hZe0ztRT5NsJTPW6YwkWaOmk3R5V0GcnSFdTPDoGttRjaGV9n
	zIG41JmumAA==
X-Received: by 2002:a17:906:7952:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c46bdaa744dmr805676266b.1.1793030492733;
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:29 +0000
Subject: [PATCH 12/15] thermal/drivers/samsung: Drop redundant composite
 object in Makefile
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
Message-Id: <20261026-acpm-tmu-fixes-v1-12-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=884;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=SDTotlLZ4kEAoPrEqW6PvwCyKZkwJhZmCCGyB1TBPzI=;
 b=JadGXkbxn+EafNhgFKNtszZPIyTWdwhW8qTIY37B/py/BVkrrWmdJpOWgaeZTF461yBeuiH6t
 pQrC4KFxCwoBCxlHTzjvL6fSlwGnY2iXIZSE9WCw0AgKuhCRPGCehLb
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The Exynos ACPM thermal driver consists of a single source file
(acpm-tmu.c). Build acpm-tmu.o directly under CONFIG_EXYNOS_ACPM_THERMAL
instead of wrapping it in a single-file exynos_acpm_thermal.o composite
object.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/Makefile b/drivers/thermal/samsung/Makefile
index daed80647c34..d5b6e9e05377 100644
--- a/drivers/thermal/samsung/Makefile
+++ b/drivers/thermal/samsung/Makefile
@@ -4,5 +4,4 @@
 #
 obj-$(CONFIG_EXYNOS_THERMAL)			+= exynos_thermal.o
 exynos_thermal-y				:= exynos_tmu.o
-obj-$(CONFIG_EXYNOS_ACPM_THERMAL)		+= exynos_acpm_thermal.o
-exynos_acpm_thermal-y				:= acpm-tmu.o
+obj-$(CONFIG_EXYNOS_ACPM_THERMAL)		+= acpm-tmu.o

-- 
2.56.0.257.gf7497c7d27-goog


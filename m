Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030496;
	b=Zpy+yRKn05E/EwTuL9svmVs78+I63NmFzpHLJWr/QQ8Z20SXPzEp9FHD91HZUvr+WMLm
	 CRBADg74RaEgkY8Y81ZRS5Ze7IFfE2XnaDPQSX+1NDeLOHbp7ynw28Rw892eE4bcrqsjX
	 ASPGcvUIHZf5Owd3mDAdVwnNubeSI0qfYRtwXqY08xZGdzLHwUyLdeyk1tCnj2VPJ8EIk
	 EEzeiiZM9hZtRtL96RyTR4X7jELSoSbMIf1D9WV2YueXg+Ff/rfvbopgCSW6mm+MCiBo9
	 PpFDRfFjSwrH1rN0bjjDiUHS5VzGZjtyICbcjlxgzlwGVVRQL5vh1RvgNf4QbAeOyWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uVxW16mpXXGmdLmnlhGkMZ8vb/cT1vcxPz/t91VG3GA=;
	b=S7lL5plhgTyZOAg/zQH1sMyIOHzQOSfYQqBpJkSUy7iQ3ad7dn84MLxeEI0+yzIL6WCZ
	 COdYgeF4u6nrpUX5sKJNyX4QNKm9vX/xWdFOnvzzatUZ2nmp9Z8mtNJ0jxOkzLuVow5ZA
	 ua0DhcZHZGtSViAgILy9LQzCqy2nVRqk9n9OSstexd7g7KR39amU0Fdtcz5FJsCcduhvL
	 PHyG5BEEeZIa+3Qq5pjGvCHEJc3f/qPNDqfVYboZfYm9oItLJcmPyBO6CMT9zvZeHcf50
	 hUP9isBsdN4w1glJxfKNjIMhZ+zpBDdLF6HdN6gR0MdqAqeyt0jAAyJ5ecyYt64RXqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dKuwiBtA;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5860A3820
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE5860A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dKuwiBtA
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c413dea9ca6so504364466b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030493; x=1793635293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVxW16mpXXGmdLmnlhGkMZ8vb/cT1vcxPz/t91VG3GA=;
        b=dKuwiBtAhp7V4crTsQUnIcckkqMCIAl7G9TcxSolZPJvcCLHncBZj+KrSLJ/L2OQCw
         5TZD7o5PrIH4mE4SI5e94fqSF7UyBgG7fjGByocApjIkeIYJXkhz5cM490QzJKoVQAk6
         UTGoEtGTisqVCLdN+2mBOJ0tSIFwvtQbzb0VtgCqKTv5IzxR3oREk1K+4MwK9uVf2Yp7
         DDmIoXeKXRNsedlkqmDrIyupwlUNiWN77QVDJZ/VNsHR1tAeps7RgnTETJAMgDEm7msq
         39DiQQ5PIAW3fYuXr/fz2FTHB9nTNyVMA/dXysazNcgi6ZVvriFeHyju1EfY+jSkl8mb
         paqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030493; x=1793635293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVxW16mpXXGmdLmnlhGkMZ8vb/cT1vcxPz/t91VG3GA=;
        b=i4Hl7UwIY9Qmqul53SCSVpbSZZxP8DASLXDnbqGnUxqxryHPn2Gw3kxHf4oqWLUc+L
         PYlwNRApV0c6t/oO6H2e+WhSDIBuovxQQCzKD8yNVt69PeSmAqrOBaOmGJUbXg7oIi7i
         3zlq83Ad1Wpx6WiHSamOnoUQj8gOAm0QAsCy6ZZKxRhhiDjvABRroPnA/T2H8P2WputW
         o/nHG64PZFSab1Bc2xiiob561K7V/KY3Qc8WIk4qaiJ0zzesNIye4dS9KtVq2CQIhPmN
         jjAdPG3YPbJSnfCm521wne+Ipnk3JSmc5TVxV7peEt/fp2YVI36KpmveWLdcYVal0SoV
         cqBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwncxNWU7ncconyJwW7mv4J5i92uzOyGZeV66ch8w3CjZzBUwlhzyfO/l2fihB9E2X1Ewos5gWEbaGYzoQF/fnxdw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJQTbbQt2INMWam3QPJDn1Tg2FeyWGGsPYKuJZqLvvurWrYsIaI
	E42vn7JMd8XlaKWMBa1NQ+ZyhdWxIA7BNGQyzYD5hQ1qVvYvXbHcruYTg/WoQnTQOAE=
X-Gm-Gg: AYBFou20ad7n2sUBdzTGZX07G7dhynkTXhJcS8HUtGaVekaV758S2CnK7p9AXnM0K6r
	0/+cm9cEJy4zufDHifwfiEfU8jqcMUaNM54DqO6QvaZ0qkaujPkDQYS6RLT6AUho21u/VGYM3Dk
	PlpWUYlPrSWOgz3QF8M3XfUsHnSF8VWuWwC64h10WE6hbznDQkIfCibCoabLM+pSk4fXCHnsYIn
	C35rNXPTg6KziPRsZqgiAUJT6ibddUagkaJeJmhgjZDYTJVvfHnKNJLExMIoeBAAv4NpnHSzXTC
	VrdD8SBBtuZN+cYozEg1LBE8dGUTESCmV4Mr+a0PUqWZ7zX8Apt19L9xLSyy9nWchi81YsqpoLs
	5wXLtgwySE5Unab7/2D5+ouEyNXyt9AzRLhuLYhYN3CLgmhClA/nLtp2hFT9czoUVrf6NYIYvgI
	Aoz0FZpcRcoHZ7bSjqfMkEZRR96ZKatS85HIAfXtxeUVNNb39fa2C8g5FiP0f2TuUdDptFpJk/R
	NUSiI40DBcVdwoPKF3cZvxEnXHf3TlygfB9zxtgxNO0+91GCku6c5/TPeqh+mIEkY/Pv4Ygt1Wd
	EolKH8EhbtWzwWfvQqQMgEd/Iu2Dq34ZAGdL
X-Received: by 2002:a17:907:e93:b0:c46:ca2b:84bd with SMTP id a640c23a62f3a-c46ca2b8958mr640208666b.30.1793030493521;
        Mon, 26 Oct 2026 09:01:33 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:30 +0000
Subject: [PATCH 13/15] thermal/drivers/samsung: acpm-tmu: Disable regmap
 locking for MMIO INTPEND reads
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
Message-Id: <20261026-acpm-tmu-fixes-v1-13-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=900;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=n9oiBAiToV2j4imluH0Dini5o5jk9l5YDFDeRG4d+9Q=;
 b=7egW4kVv7aVKyCi0S0idVb5FBWfiO3hOv7yz0j+W9TmYVCqptWD0mnRVo2uyEHV17etYiyvBh
 TCUuH84NV5KD7i/ZAuGk68LaJMqn+KLQISgMVlqRMXgTK286SThIUKP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The regmap in acpm-tmu is only used for full-width 32-bit relaxed MMIO
reads of the INTPEND registers, with no read-modify-write operations or
regmap cache. Set .disable_locking = true in gs101_regmap_config to
avoid unnecessary regmap lock overhead on every INTPEND register read.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 2324efcffb84..fd491b4f305d 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -127,6 +127,7 @@ static const struct regmap_config gs101_regmap_config = {
 	.reg_stride = 4,
 	.val_bits = 32,
 	.use_relaxed_mmio = true,
+	.disable_locking = true,
 	.max_register = GS101_REG_INTPEND(15),
 };
 

-- 
2.56.0.257.gf7497c7d27-goog


Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888B1C701C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Mar 2025 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742990885; cv=none; b=LzbHJTjV5Tc2h7FrVxwbLfSfIRhVNnmx4N6M7d0IHC9qZmSPHuj9su3qxZ24sdsWVfYDcm0Z/1+ux9KjDvX6sC+Qrbkp2ERIqS//7SpUl3Qgu8fTUpWhq9tqtwZxHvEQmMZOkZz4qhtnLhF45y2xJhuEYu1s/XZwIt07/tw6x3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742990885; c=relaxed/simple;
	bh=jjnSTG3I90Mn5Ca9Xyv++q9P6Z4yvrzjERBIMNIYWYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DIiOL5XM2MDzPhcUn46YoSG+5UQ3C0l3VN8zVi4aPQFO+hAL0gDBq66hKma+1cnTDxk63R6RX7Sw9Cox7Z+/tnN1NgsesrzZx06UsTcVw3RgxRQ+Rd9VJBLVPnvCldNSfI3VuvGwDJTMjY08/VuyK6SZADFaluVBpCpPtuQi72M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7mlnSxa; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7mlnSxa"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso12189334a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Mar 2025 05:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742990882; x=1743595682; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6EOvw4ltGt39X6cSYI+P/xxRhDM+qmj120OFm+7gNRo=;
        b=b7mlnSxacG68Yn+Zs3UdGrkbG3EXspdbFsoFxpILRuE109HxFjaaUvjlDsZAPvZpxL
         9yPtCF7AITdD3DEwz/V08f+7QVex/xwXrbN7mf5yIQRz2ILabI+EFPJ7ZXw+++XQpzVw
         x0j4jVH4jxQQH0JwvRNf+NBEwvPd/hmGVNKs7NAjrgPNgjiGFOQf/FLpIb2GBl6wwbru
         e+yEzpPdjaprSk8pYbGFAv84sAPlO1w3zplKw9RKD/UGQFoN6TtNWlEevvFBobitftDU
         WcYW/O7/kmT9qr52UQvHyc2ELtssW7XNZCBSWTbFWkTm8K+Kc8i53BBZjyDsNBiEzlcp
         g1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742990882; x=1743595682;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EOvw4ltGt39X6cSYI+P/xxRhDM+qmj120OFm+7gNRo=;
        b=KUpddqOUX94f4prTd9ak9CyGYH69XkRzKP2EWNecAqZGwYr90OME9yr7p4c4//pv+B
         SPAHcbQaakXJKoS9C4yO/sGzL/O3vpLN5X++4vHEyhJCZQ03HnDxB7BtXhyZP2B2PSnV
         i+rSS+s8xu24gjQDBVu6sHYh6RTdtRKjhFoYBAXqJszCmtc3i2MGdHfIubl/P8rUPHfz
         r3otfXPJgNTSlg54KZAEpy58vWJP0PkmjCJ/OTfd7/t3QwCYp7MH8O00fX/vFlfffGqe
         SsfUKuOUMhlRbZhjiAxTFM3+jePaTLTPvOZEGW4C3FHMT6zQdiCTBeZfsvIGMZlvOqbV
         +wFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/YRy4TfWeKazMbhCx8KbMTmp1HKIXAv+DI0LGI0mmayyl2eEp9KSk57yi4Ok9uFMtbVIvDpQ6nLX2LmHL8azV8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwC6Grwdq6IHW3V5hy9e/AEREz1kZ2jLMeyd+Z6VgVbbFQ893U
	OwCis6T72Q7ttOfMHTLUWuSq0CR9sQGrIejUzverH8P0uru6DQm0s0x67iFfUsY=
X-Gm-Gg: ASbGncvQqnELsQvMA1d6ymVbmixeln9kZKVYwsjTGPwMC36EyP9N3TzMan70GtEHark
	XV4SJBREzsJMF0IW4mqyL4epdjVMKjOAZR8IhbrUB8uY6EqLHhKxgzfzYZSUGUC1oS0T6Fukr/w
	vVNoY5VWsLk9utIXx0G909eW5o4tOLgAyQ38rssz/X4pbuGs4urgRX9eJtXci5ciXFmx54yHiR4
	d7B0FPOQxMIVBERX3mO6jvuHEsDuLmW4W0VZ89M9ox/BceLV15uNCWpCPBKGF9rzRS7Q/lRLSJd
	ZgIJU6YtWL19loqz1BvUd949nAb9Oxaznw7BmC9EmiUsMFi/WmJ0MzdnIhIwV3kNveR/DcsztPJ
	+h2X7/3KEY56sPyB7brew0lI/st0jsV+08ylWZ8U=
X-Google-Smtp-Source: AGHT+IFpDQ47OkR0lnhRuhDWvB2zczsji7a4MYoKTE4Oj7Ls7vmFXhE9PL8k1vAEh0QTa7oPWlII7w==
X-Received: by 2002:a17:907:9694:b0:ac4:5ff:cef6 with SMTP id a640c23a62f3a-ac405ffd0f5mr1438770566b.31.1742990881985;
        Wed, 26 Mar 2025 05:08:01 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6ef561e4csm59334466b.119.2025.03.26.05.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 05:08:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 26 Mar 2025 12:08:00 +0000
Subject: [PATCH] clk: s2mps11: initialise clk_hw_onecell_data::num before
 accessing ::hws[] in probe()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250326-s2mps11-ubsan-v1-1-fcc6fce5c8a9@linaro.org>
X-B4-Tracking: v=1; b=H4sIACDu42cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMz3WKj3IJiQ0Pd0qTixDzdZEsDS3OLVPOkZAMTJaCegqLUtMwKsHn
 RsbW1AHqshmBfAAAA
X-Change-ID: 20250326-s2mps11-ubsan-c90978e7bc04
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-hardening@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

With UBSAN enabled, we're getting the following trace:

    UBSAN: array-index-out-of-bounds in .../drivers/clk/clk-s2mps11.c:186:3
    index 0 is out of range for type 'struct clk_hw *[] __counted_by(num)' (aka 'struct clk_hw *[]')

This is because commit f316cdff8d67 ("clk: Annotate struct
clk_hw_onecell_data with __counted_by") annotated the hws member of
that struct with __counted_by, which informs the bounds sanitizer about
the number of elements in hws, so that it can warn when hws is accessed
out of bounds.

As noted in that change, the __counted_by member must be initialised
with the number of elements before the first array access happens,
otherwise there will be a warning from each access prior to the
initialisation because the number of elements is zero. This occurs in
s2mps11_clk_probe() due to ::num being assigned after ::hws access.

Move the assignment to satisfy the requirement of assign-before-access.

Cc: stable@vger.kernel.org
Fixes: f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with __counted_by")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 014db6386624071e173b5b940466301d2596400a..8ddf3a9a53dfd5bb52a05a3e02788a357ea77ad3 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -137,6 +137,8 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
+	clk_data->num = S2MPS11_CLKS_NUM;
+
 	switch (hwid) {
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
@@ -186,7 +188,6 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 		clk_data->hws[i] = &s2mps11_clks[i].hw;
 	}
 
-	clk_data->num = S2MPS11_CLKS_NUM;
 	of_clk_add_hw_provider(s2mps11_clks->clk_np, of_clk_hw_onecell_get,
 			       clk_data);
 

---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250326-s2mps11-ubsan-c90978e7bc04

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


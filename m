Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D13918FDDA
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128180; cv=none; b=CH4Witb4r/oDPjCwUF1TMYasLJFBN3Xu8zt5OtKfOlYOiu82DhRC8lZAmrvW126yKufw9Mzqsfp6dNdespwrp621usJt05s8Hp/PWdhXbXRvVWa/UI7R//LrnFXSDcq8xcd1QE8FcfYkBy5GEIGFUEi2AimTaxLrAjHUBscsHNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128180; c=relaxed/simple;
	bh=fgoFdUktN0AC8jt3vFeTIBwCbSQYaBCYL6rp147Iyig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=irVl2YEv8N7zDay752J+NJb6k6Ke84kdAjobjC4rTTTmAOT5wBkTTFaqgglrQR5xBGaiikfO7VAiKIiSVJx+qa95wVYKju7dDY/M+uulv0PZRRecEwDGCIL2tx1hGNbwuox0WKwOOKUI6ofJUuqNdHbudT9StmfOs1XjqaBHu30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pqoLc1mV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqoLc1mV"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5b5b67d0024so1207515a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128176; x=1723732976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Of9JwvhLlmcEUvlQcUj1kyU6mPikzafRwyTDPy8iQT8=;
        b=pqoLc1mVvKzs73vcO/mdYukyK5R5is+E75F31pkVBJw3l3ByxDeCndPtALui8/pztQ
         r3Li7KB9eeBuzEhJgsyhGoFPONcu4KB6o8suqnRM5hD88hknB0t936B3RG17paNSNVTi
         fm2F1Ed0dUZKVXZGmJOW/x+b0qV0aBB0zRQ2YAzfGn+5l+uVFKAqvlggx7C/KhJRbvjr
         s2tnUTgGjbRv7rVKBVCm//wziuzWj6fJlb2DP37f1aLDdJlck0LDskKM0uu37k4LPwmh
         RwgIoZxPy8e20/7//qa43sonUHYWM/Seq4eGQT/4ciTw1fdPZ4qunjIzFU80PgHPk86U
         k/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128176; x=1723732976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of9JwvhLlmcEUvlQcUj1kyU6mPikzafRwyTDPy8iQT8=;
        b=XFxCSLC0GHK5paPEvF5JtV0uyFFbj0WYwRjB/VSl3fV7liZUnbIo1kn/vk260mlMgb
         DdGPw74rlZ7vjL5zq+HpFkbZnfExfy8SnsVj8hpFrt+We+POFlg+9E2FJUgykcseEMem
         hoJOv0ZTUobePRQzTGRUO13dLN+wJh1fnIkHCxK3f5mpxKuIdSG8dhnM0V61zJwLvOs+
         b2pvkr8Bq40UXRgpQp5toE304z593m1Y7HLIlpgC57n0YliYk/ZOShaAR7ZJyVJx/SYU
         Dx7EUfkYIn5W1xAmckHUP5iZKYVg2fUndnMkUUoIE7uATurq79TPzxn2tkH+0HIUtK+5
         X6/A==
X-Forwarded-Encrypted: i=1; AJvYcCVJocUM4Uws2uonEpf/3Q/7BQDqgS8T1cPR9D60Mslr/udKC8yLa4uf6vlpaJQDk8GPbeVcq5c/46FSdRjv2eaf/oL3wd9YtHRfvIjhkki+07k=
X-Gm-Message-State: AOJu0Ywzc5+JzoiDDNIHrRPUUTjDh/8pU2eGvk6O7x83/3ZdFDYbZMyC
	X6td1GnXcc3AmB6KwdIibBVULLuTIUTFu4e2MLn3OG/hyX5iH7fJhxojYxoqfK5OY07TVoP2P9G
	mp9SOXg==
X-Google-Smtp-Source: AGHT+IFSPGIEwEerUResLzza1dskdeBStZ+yQq7ZShNAdphCslLhbLSN6wQiNk3FONRiktC7/rGCQA==
X-Received: by 2002:a17:907:a47:b0:a6f:33d6:2d45 with SMTP id a640c23a62f3a-a8090eb48a1mr160008266b.60.1723128175854;
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:57 +0100
Subject: [PATCH v6 16/20] clk: imx: imx8mp: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-16-e91c537acedc@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The clk core now does something similar for us as part of
of_clk_add_provider() and of_clk_add_hw_provider() and this i.MX
specific call isn't necessary anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk-imx8mp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a..1c128c051199 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -721,8 +721,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog


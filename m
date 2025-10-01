Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08311262815
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Oct 2025 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759331613; cv=none; b=N19mqyH3s+pyw3UnzyzF02n7y6x910ZiK6q9j+1R8brY9UbBanH+dNhV2SjHNdfAwOTxXXIa9806EAg8Lb9GGPv1RvvF584cLAJbOwQUjQSeq+VV0mHGglxD3xtpABlR8ebYm0UbvovgfB/08k8AVwGpda7DEre+Gn6bfoWhp5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759331613; c=relaxed/simple;
	bh=zRnYw0c/jEYg6tUfOIO2XTCeocsoj1LuLA2X2KUMWjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sB9CJrtch/ZPKJasJ58cH++RxaH6YdiMjYjQgHJvnyhSPomXZIHa8XypobTRadNAKmlyk04iHzx9zCS+940eAaEcXfzOlwVh2XALfuuDH/x55HurxGl9NR+9dytl+dJAUDkOsBTsKUtK0hDyg0XRc4X9KXI2E/zJ2LhDlZAfqH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ci6/nRZ/; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ci6/nRZ/"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-634a4829c81so12575849a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Oct 2025 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759331609; x=1759936409; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SEEUny1Be1BFGwKqqn+oNj/RmCjib3ttC0W23b9Ns+s=;
        b=ci6/nRZ/4MuEYA0OJYZnxVJ21xzIPaqeqzs2qApreXIib0h2sZYflSBjBTDUvZvJ1J
         9ZKLaZTaQTRqKXmns1BvGnil/+2OgVe8LlsZVNkNzWx72AVeSSg7qpTcoFeQSofpKxYR
         rUUb7ceVKyS7LwM38RUxelEOWRm+eKXMynAhMQF/f+TAB0PU5CPznmftXaTee1xflzSE
         IP7aGHRzddI2diFu7+fs3WrjkdxX8JckmFnJ9sjNniKcKsPQEMXMcVRbWDGmtskepumI
         vC763HRwKFF7E1KIMrWmrCQ1j1C18K07+LX2Uq43H5/aifgtNN8zWA92boOUBUt4Nqq/
         zNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759331609; x=1759936409;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEEUny1Be1BFGwKqqn+oNj/RmCjib3ttC0W23b9Ns+s=;
        b=Vw9HOuyLWsnvRuIlkE6qAYLOr4zX/YZ1wS/sPYF4CHLR+HC8aZ72/ruNYzPJfZOHoy
         ggLDh++tZSsLWMa5v6OW25sXwNueNvOfYlhf1YgsEFoAkmMgDGI9LQBzji6wom9J4K+Q
         ZiLkHw6/XftZCIEUmrAzZrZ+e3LUGPb9m2ZB4eViOOo/zgZSeP8hUCfo9CxiExqJ1tg1
         8+/bVAJ5jx13nYd0b3kC/8S9Xxhy+R+8Fh018bplwlfLk1Wu4Jj3YflxgnJEq7G2GJBY
         Xgg7xFam990SHb6RSasSjFjIIe6Li3hTVCv9RE2ElPOC/8tGtMbIzYdJAyDXh535xc19
         Z8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoFFIf1kKX39BNic4cobfbgbEE3SJGtxw5GopEk5bo5FMXLt13rRgKhFdzZPEQPeJj8ixqGhSFM205CbQuEiIVVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7/bW53LNTEPU+vAczjWyd+NJbxbvG83H1wxa3RLo4eao0u2g4
	QrgjrldQgghRoF/eFYNG4cHsTaqzjErd9vuaX+anwqJTysJG2yHvjjqG9VCFcDWJIUs=
X-Gm-Gg: ASbGncs3eMnQZqk73SZOkqJwlFc0Geyj5z8g0eMMBi/BA2Xh+Ge8B2gu0fcTUVjXNGd
	Q+oK0IURG+rGnUKo2NcgmBuO4pukHhIzyLc19CsHZgU0hfKoL4mUNfW2PWZH1w7IGNLFTFmSQ33
	9vdWii/fSv3tWNCBrT1T7RFHLhshDQCgkC9gbAUB5PA//VGvtDv33UUEb5nuOt1ngLBYYXo8iRJ
	CV5qHeo+scbaFS0c3Nr3kl3MpGZHg7cGv0uhBfIGXqszEQjr/s5zIkcXpA5JeGjOqMKSNZpE5Jr
	33sI808X1acDGUiuEAiAt5WBwOXZ7W17cYdp/mOOxcMLCegVFlhow5sE6bpRfZQ1CP5g/GbO6x7
	qb7xFsoJoBOdJ4jfC1bJD2XYFmhHfDv6HjSCjNx2+Akzigpzw/YFlIDl2vLlT5ZST3Yo9adLp9F
	U43Wv3IwwoPSMv/qChHZwX+vObHMdKK0dmRo5f
X-Google-Smtp-Source: AGHT+IHBCc4NxqsoRLhxkWHk/fgJ6Xl1FY/slzvWV2YPuSfVBu5/dMpl+l0CNjy2qT0HCYNogprb6A==
X-Received: by 2002:a17:906:3746:b0:b47:70bf:645 with SMTP id a640c23a62f3a-b4770bf06f8mr246716466b.58.1759331609281;
        Wed, 01 Oct 2025 08:13:29 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cedacd973sm797226866b.49.2025.10.01.08.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 08:13:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 01 Oct 2025 16:13:16 +0100
Subject: [PATCH] clk: samsung: clk-pll: simplify samsung_pll_lock_wait()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251001-samsung-clk-pll-simplification-v1-1-d12def9e74b2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAxF3WgC/x2NQQrCMBAAv1L23IXsiqB+pfQQ4qYupjFk2yKE/
 t3gcQ4z08Ckqhg8hgZVDjX95A40DhBePi+C+uwM7PhKzhGaX23PC4b0xpISmq4ladTgt67iRRz
 H252YmKFHSpWo3/9gms/zB//yC0hwAAAA
X-Change-ID: 20251001-samsung-clk-pll-simplification-3e02f8912122
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

readl_relaxed_poll_timeout_atomic() has been updated in 2023 in
commit 7349a69cf312 ("iopoll: Do not use timekeeping in
read_poll_timeout_atomic()") to avoid usage of timekeeping APIs. It
also never used udelay() when no delay was given.

With the implementation avoiding timekeeping APIs, and with a caller
not passing a delay, the timeout argument simply becomes a loop
counter.

Therefore the code here can be simplified to unconditionally use
readl_relaxed_poll_timeout_atomic(). The difference being the last
argument, the timeout (loop counter). Simply adjust it to pass the
more generous counter in all cases.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-pll.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 7bea7be1d7e45c32f0b303ffa55ce9cde4a4f71d..a7e693f6983ec073bedd633ed8da7efafc1a20bb 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -17,8 +17,7 @@
 #include "clk.h"
 #include "clk-pll.h"
 
-#define PLL_TIMEOUT_US		20000U
-#define PLL_TIMEOUT_LOOPS	1000000U
+#define PLL_TIMEOUT_LOOPS	20000U
 
 struct samsung_clk_pll {
 	struct clk_hw		hw;
@@ -84,7 +83,7 @@ arch_initcall(samsung_pll_disable_early_timeout);
 static int samsung_pll_lock_wait(struct samsung_clk_pll *pll,
 				 unsigned int reg_mask)
 {
-	int i, ret;
+	int ret;
 	u32 val;
 
 	/*
@@ -93,25 +92,15 @@ static int samsung_pll_lock_wait(struct samsung_clk_pll *pll,
 	 * initialized, another when the timekeeping is suspended. udelay() also
 	 * cannot be used when the clocksource is not running on arm64, since
 	 * the current timer is used as cycle counter. So a simple busy loop
-	 * is used here in that special cases. The limit of iterations has been
-	 * derived from experimental measurements of various PLLs on multiple
-	 * Exynos SoC variants. Single register read time was usually in range
-	 * 0.4...1.5 us, never less than 0.4 us.
+	 * is used here.
+	 * The limit of iterations has been derived from experimental
+	 * measurements of various PLLs on multiple Exynos SoC variants. Single
+	 * register read time was usually in range 0.4...1.5 us, never less than
+	 * 0.4 us.
 	 */
-	if (pll_early_timeout || timekeeping_suspended) {
-		i = PLL_TIMEOUT_LOOPS;
-		while (i-- > 0) {
-			if (readl_relaxed(pll->con_reg) & reg_mask)
-				return 0;
-
-			cpu_relax();
-		}
-		ret = -ETIMEDOUT;
-	} else {
-		ret = readl_relaxed_poll_timeout_atomic(pll->con_reg, val,
-					val & reg_mask, 0, PLL_TIMEOUT_US);
-	}
-
+	ret = readl_relaxed_poll_timeout_atomic(pll->con_reg, val,
+						val & reg_mask, 0,
+						PLL_TIMEOUT_LOOPS);
 	if (ret < 0)
 		pr_err("Could not lock PLL %s\n", clk_hw_get_name(&pll->hw));
 

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251001-samsung-clk-pll-simplification-3e02f8912122

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


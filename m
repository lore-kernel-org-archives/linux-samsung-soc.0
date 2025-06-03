Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963E623C8AA
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Jun 2025 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965406; cv=none; b=BBU5x/xiwLAr+dlZicagiDMMqrBOTmBmn16pviAJu9PR0tJnN7uIHiMDxpOyDXwKTDlzJhaG0EjAAOrObKSFBc4edBii/N/KudLWMROuzWf6ycW/6rvC/mpawhMvv8N64IYlf4lkFBWChK7ExPp57nezgpy+zlzf+0E+oDgbpDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965406; c=relaxed/simple;
	bh=EkPTYV1qpD5I8FZtfNjsSjTt+gP3LGJ+qju8+Sz9SVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtBwclIE21b+QLoXLTuXv6jP5TWQ3P2wXbvJGBgOtEE9LXo4lbSFv8TdnkYuY4uaV5sl3XBlpA3K4xmEtcP0KmZUBg2oP+XOUtmSoVSmHF5qDLRfWNSLT4wuPK0PFNq14zyFjB4W7K65FZJ62E+ujqms5VozLRwl1M/fpGNpClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BxutIJ/d; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BxutIJ/d"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad69e4f2100so862562066b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Jun 2025 08:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965403; x=1749570203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIaiXwYKVn8R6QIWY00MiAnh81IbvOV/xhrE7RJnhkc=;
        b=BxutIJ/dVVDkhqTn+rJvrPb7YRQGvrzcANNN2JEvBYp4hUy0g9iZUXtuYKAgKeU0hb
         hq/jB6ehs+43rPfuWyv8aBOEtaUc83xRYBmYjAYjjElXC0s9PJx6PKWDvfgir7W12cEr
         8YxxBrcPIn9pWBb70sPeC5iw6VLEBUuwY+u4i46Z8bLWiCziydrlMQqalyL6N6E8a/By
         B/Fzk9iPHtpZIf2N8+K7q/WNZtDq6eZLGGRa1lV5HQ482Oq2Ix6a+nnTZTB3FsjGrei2
         oV+qhtAPDgyj4/oaTQbQdEK4DYP/KRjVjBz6sH7oGJvgO+yaNvanYQQXxP/elG9xj6ta
         gSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965403; x=1749570203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIaiXwYKVn8R6QIWY00MiAnh81IbvOV/xhrE7RJnhkc=;
        b=g9uctJUf7vJipJmWJLeMM3nOJKu5jN7fKeMsUxaxFGZ6Xy7T9lIPtujjnXnF+y6z03
         HmGNA4UVcBfyLPWiSooaQMuYJjadMsiPW0xbSwsGhc5ywxZbelbgGTVWGDPdXT8Ttl2t
         kLy+qPN9JgIfxEgYLo+IzpGXgOYA4lOXNGpVEzmWkelm2b1DylpRqH1nJxGIzYtXP/gK
         b+pg9PPT7sIvIZBT/2Fi1ElIVDvRugOrF51IVwhNKCZHu7uc+LUDl2rE50q5Dr2KRzVy
         ot0czJzzN67FWQQoGumQ+uTAbnhbO6PtikVMtxNQLQtP/XVavH4fMw6d4/tLZq7fp7JI
         D/+A==
X-Forwarded-Encrypted: i=1; AJvYcCVZMKN8hqDr0xdARMXgTev4m3Wx0h8+vNfCGc3uqvHyh/S5dK9/3DAMdgb/PTY0lqESowVbolYa4bT97jSPSjhmGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZGVGZRauIRd5GCGPn1QX/thejwHD7qxLpbbYYQLvdoxiB6fA
	AfrAxuxjwxqxre5mpS78z+jE2NRSUMMfvvO7vWf9Cztt7M2ugjEdCdWvr3vjiNWuQC4=
X-Gm-Gg: ASbGncvKFq+tR9DBupjuqMIZNDzY8X8NkJsSClQ3n65rIav9N1BJil242wt/EtUa7gQ
	+cS8259cY7fmvIO11Qowj9pQE50GnxzA7xAlaPXcXFoeJFiwDSqMCFjUWCm/kcFz+SHjKKD5UGp
	1Qxm4RW7u6Q//mZ6Ul1Tff8Bii0zxBNTsn4hyUAkHBUVGOQ/WxRXKe4nJyndRQcAnBbRHrgRIrF
	4og2GHApFOzR5JmcIPKPFdpvjJLfv8w3lAzOBYeMeg8nnZAePkhV+Xx0kEfLzg/Qdx0z7b+bXuR
	hjo17fq15KhfOQ4zBrBU42//zjatOTi6MjTUANyxv8tNSABNn+K5jSYpFQZpQ6cxEYQtHCaWDqc
	GddK8qO8CghxR0Wmq7LC/qKHHKqY3WmgVHIw=
X-Google-Smtp-Source: AGHT+IHuYQHqV4Udvsmxd2a4zxZaKbBte+8oMefdUwG0LYe9b8Y64CtnGXRSZ5iS6KwNcCvJD1IEPw==
X-Received: by 2002:a17:907:db03:b0:ad2:28be:9a16 with SMTP id a640c23a62f3a-adb36c117ffmr1500580166b.51.1748965402578;
        Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Jun 2025 16:43:21 +0100
Subject: [PATCH 3/3] clk: samsung: exynos850: fix a comment
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-samsung-clk-fixes-v1-3-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

The code below the updated comment is for CMU_CPUCL1, not CMU_CPUCL0.

Fixes: dedf87341ad6 ("clk: samsung: exynos850: Add CMU_CPUCL0 and CMU_CPUCL1")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index cf7e08cca78e04e496703b565881bf64dcf979c8..56f27697c76b13276831b151db28074387293077 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -1360,7 +1360,7 @@ static const unsigned long cpucl1_clk_regs[] __initconst = {
 	CLK_CON_GAT_GATE_CLK_CPUCL1_CPU,
 };
 
-/* List of parent clocks for Muxes in CMU_CPUCL0 */
+/* List of parent clocks for Muxes in CMU_CPUCL1 */
 PNAME(mout_pll_cpucl1_p)		 = { "oscclk", "fout_cpucl1_pll" };
 PNAME(mout_cpucl1_switch_user_p)	 = { "oscclk", "dout_cpucl1_switch" };
 PNAME(mout_cpucl1_dbg_user_p)		 = { "oscclk", "dout_cpucl1_dbg" };

-- 
2.49.0.1204.g71687c7c1d-goog


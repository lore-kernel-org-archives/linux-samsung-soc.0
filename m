Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D16A1714A3;
	Wed, 23 Oct 2024 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674107; cv=none; b=TLzUNOczhSzrswvO94BiMi8LRAVItjUUo3SRHS+3vwk7t6TmixPKwPEN20eNY6VZo2DNMU6a+Ng8NmbYXknruNznCuIYF/NSxP+OpfliG+wsMaU5WM2+RIeY2Prxgsvn2t7TJJ0wo0TnqSUB8YP6IBlKkQRCUNqSxcn6Pp9FtUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674107; c=relaxed/simple;
	bh=cXmfNpUQJjiH0RsHYWL90nQ/CNN6dYF9AUimuQsLdTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gWLbJv/X76J8wM3YqQFukCqV/pReFxM8AprCE6MhhP3fxaaOToLrgc/xGpe12O4pVOlcjpe+ing4mIiIWnbETPchQNBbbFmI9m7TaNUDbFOKSfX7pcIZe4zuRpeGL8febSNUcd95QcW0tpo+qYUgFeWpmmEPfA9y1JOnQPgeq5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC64plb/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC64plb/"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7aa086b077so791331166b.0;
        Wed, 23 Oct 2024 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729674104; x=1730278904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vm7LAbjk9UZeclhRsp45Bk1MVvIyLp4irLFys9bmcrQ=;
        b=BC64plb/qxwPP5hkU8Fy+68t5Z3fyqscnsdHFiqSACtYSbT7k2ZZer7b6bztqlsRzM
         r4Bwbhmxb8zeVbAs0bGmKFkaadzQeFM1xuqJj6hFf7GZ/iJvPXS6RJkViT8sK3vRFvWJ
         iJo43qAbQCzj57EQH3SvAs2Lq7EUtC1Mo8HpRGGyzGYDbP/ddpM4sBAWognzAz1PsX4Q
         m7wIS1ruVBgHwdXfPifLnMuweAbM58sEckTQUrA4/Z+ze9hLyA8aKU8OxfqEXHlY8yEj
         /LX/uXhRMIs7nhtQI3IYWZQ3+m+tj+RgOUZdR/gH2GSDh6fKZ/AjDO60jPOxEw9FyrFz
         a5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674104; x=1730278904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vm7LAbjk9UZeclhRsp45Bk1MVvIyLp4irLFys9bmcrQ=;
        b=g5fNtpIeVYUXC16NsIZ9ZgciJ+Vehl9tDVQYPat5siCySHTls67ocIn3fjneQYskWD
         Bho0BuzPfMXRVcN0RHL2HX3Z/3tYntKMv1AkXwqetTslsIn9DvFEc45soTURrcPp5is0
         dKijzSi5mhw4D9b60DNzoMze6Y7Ap4EcfN97VyzPTvNGJTTMK72LsGx9kS8vP1Qp/vrD
         3mfWG9ySw3AagOdyNT60RB+k8nxYBB7d46YHBIz2cCB6CvrnJPwi5IOtXiAeBA2fAJvQ
         WDgCOw4RXVVdmD2qTpVLIdPWl2RUJnhSbbdQi9nkNdxygDir1HgeXE9j5SbEsZQnuTnQ
         8CIA==
X-Forwarded-Encrypted: i=1; AJvYcCUDfCvov7clAGpObTTRO6rQhFL0IYozHYDWhidMhLw47c7cRzkUNT/rnI0lO2jNZbcPPxGfcCNTik7A@vger.kernel.org, AJvYcCVzl1c2us/F5IaWCLE+pZFOt+SnjTzr+dc45tih9N3vL+5ylok5LMxABgaGbH605rWhfGUg4RGOlURZ@vger.kernel.org, AJvYcCWR3R9PHUV+xrm8yUJa59rHhnAdKcCDGAVxhKeo3sjdCaLw0NzEViE571mmvXV58g/rjgxFa9KlUj66dGs1@vger.kernel.org
X-Gm-Message-State: AOJu0YwzL88L2sikPz17uFIIXHADN+KaplhtjRqeCcxR1lCj3H/sOwgl
	Cqw4Qiov+TxczTmvYK9hwkqR973MrlkmyDNNTGnkFDUK5czFVVwl7AMmOz8K
X-Google-Smtp-Source: AGHT+IFXdXCmQDwHXFejapkVSeC8STbxrfZ6+MkuiZny0B/dYKh+NdosUtdLCrAUdxVh2ZXGmmz5eg==
X-Received: by 2002:a17:907:7d8e:b0:a8a:6c5d:63b2 with SMTP id a640c23a62f3a-a9abf8759a8mr175413466b.18.1729674104305;
        Wed, 23 Oct 2024 02:01:44 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9159a23csm442767466b.205.2024.10.23.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:01:43 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] clk: samsung: clk-pll: Add support for pll_{1051x,1052x}
Date: Wed, 23 Oct 2024 12:01:35 +0300
Message-ID: <20241023090136.537395-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These plls are found in the Exynos8895 SoC:
- pll1051x: Integer PLL with middle frequency
- pll1052x: Integer PLL with low frequency

The PLLs are similar enough to pll_0822x, so the same code can handle
all.

Locktime for 1051x, 1052x is 150 - the same as the pll_0822x
lock factor. MDIV, SDIV, PDIV masks and bit shifts are also the same
as 0822x.

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_1051x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
    pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 2 ++
 drivers/clk/samsung/clk-pll.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index cca3e6309..be6b51694 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1370,6 +1370,8 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		break;
 	case pll_1417x:
 	case pll_1418x:
+	case pll_1051x:
+	case pll_1052x:
 	case pll_0818x:
 	case pll_0822x:
 	case pll_0516x:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 3481941ba..858ab367e 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -43,6 +43,8 @@ enum samsung_pll_type {
 	pll_0517x,
 	pll_0518x,
 	pll_531x,
+	pll_1051x,
+	pll_1052x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0


Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD80726461F;
	Sat, 30 Aug 2025 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756571324; cv=none; b=hs2V/vi3N82wrJ4RugBPxS6M12qt9TlcfcYnRnqxWP+aIAj+LVI7Gxn/p2iv1jOuF3ar1uLGvtEUpMxmxjr2rykI2Szrik9ncYkY7fK8hfkD0i3AQVY3skXQriIv3X3CDb2R842u+u4cNrrt4+t75SjMld4PxolMu3MonWvIGV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756571324; c=relaxed/simple;
	bh=6yax87RqbvYF0ActasAJerhVa1SUTvfy73gnHEk7z9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMwDYpdE3lmAAG3x1BIHe5xLuqW8mPYgNZB2TqCK8yqtvDuN3Xs+IoPQUYDQWMfPWi3KjxR6G4AajEmLeKJzkPzqaRCDX4T8Tr+VQkhFP4MtFd0TYcBao1TEbGvfTnNA62wHPeZkNx9LauCRsRRxMlU47Shhs2aRmCnrtpUzJ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTYbJkNS; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTYbJkNS"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7f77c66f13bso293220685a.0;
        Sat, 30 Aug 2025 09:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571322; x=1757176122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JB3/HRxiAmtWh+pEgNnmHQKJRpUH6uuEO8MQvS3SDQ=;
        b=PTYbJkNSiaXNUgomBGzxZM7x9z9MVZcxWrsb3WHBXoavncNq6ZCRGpzYi8pmr9h+AK
         smGSI8u9gr85BrGk0V3udWntR0J2Ie1Jz9nH/59iXFqL4OtBeqrhvRcXHyIh+oY1GIfC
         c4A6b7NX4nbostfSK/2RtEIKz5qF/rM3ph7rkaH5TKQzjB4Ll4kzmbSkh+lbQ6SeGCCQ
         fXxLscpTgVMPRzGpkPAXggi3b1b9ZCi8Cnv+5HdRHHIHjjjm9oTbOhPzY2HFaSHdHddl
         CWQuHOVggkfxOavt29OzssU5aZOVvKo+iAh61dOo9h6ngJPDO6g26fc+tQ8PBjyY388p
         y9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571322; x=1757176122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JB3/HRxiAmtWh+pEgNnmHQKJRpUH6uuEO8MQvS3SDQ=;
        b=jgcIao+ZMhENCX39hPXMAqWNgH2kLevfc+6Oor/JpMHt5x7UX0Znw78vrww4YbzCGp
         Ga1beZ9S0gi2cVK83SSe7SPYIQatGPp+06Zs/75JowLiloc2rhH0jf3U9XFWzRNkK8F0
         EFRINe5ESai+9ntkpazcZV4KUBFOkykePoBNp1RgfVgvvBQOxZnsBkoHlo3fRAfCd00T
         c+M5go/hckD+0fh2L8QLBqxDgKZLQH/qYoal+WVaDBZAJtq9I4eDCDq9iUU0ZfycF4/V
         SBiEtdIz1hDKS4tS+3O76FER2zFPV0AhGZ9JpHaX1BnoKOXiPTdEGmn7XlxTRQsA+MtF
         bedw==
X-Forwarded-Encrypted: i=1; AJvYcCVyGOczcXD7pn6jb36VUUVcDJdD/MjBhqMaab8iod/ylQV37xHFOcPVwwg5ktPUkC/BS+L8BFFBenuthe7V@vger.kernel.org, AJvYcCWQlCjOVQ60yfGKsK7+a+cE7Qg5lOf4N3duF72pe4tqImShGKoDQoJKphfIaC/A/DsXI07UQSoTf0Dt@vger.kernel.org, AJvYcCWhCsDk4OXzj5EWtU4u0F2oqwUgNJDgaueyZkxYE3WnpwmTkKfb1XF7BmZUVf0vZCMavHNRFG/9nVMU@vger.kernel.org
X-Gm-Message-State: AOJu0YwiCGyt+oaJKiNBi2WUGfIlbQzMHOBve7VV2Bgq7r8YVpmpEsKN
	QEqSOONJief53xX0ji2fY1QI7apJRLnnoAP834yd6b1+03M9QQSDHm19
X-Gm-Gg: ASbGncv13c3b9bEcPtY4ujHUL//i6yeNpAvBlBWlqbn8xAVvzheVa4QSiGaR7l3gczu
	rC3al2j1oVvRLz5zSnO33e+qoIFo09zvLvm2V6242098Wfteyju/2cRy6eYDnwM9UHauq1Net/T
	mz+LZtFeAmEp+eNLSuu92qGb+gBjy0TTdQvLlSfOB8q8lhI/tiHPoC5AsrPYKQ1TfohKnpZxoZp
	K7MLQiDK0r5wK5PNs3LM92IORHS6q15FdCuDBkjp1d9+oYcn+1++cKQFCdjL7nrw4DK3IWAoTsa
	sNwnBQtv+iZoZrAEOfcvg3lYoeVdhYvQl+Y5JsTJlMhUVD4+6l22rmh09HoBoptSJTi1+ExDVP0
	Yf2Bp73cdmBdRVUGmjrzyPKediHCv1vGhxz8jSVs=
X-Google-Smtp-Source: AGHT+IGnhEMMnBdR9lydAVMTUpQDQ/k7ZP81tvaRPU+NFS9Cml/2rz2bOOkl/9gh5lwSLSX/oq8avg==
X-Received: by 2002:a05:620a:45a3:b0:7f9:c004:42e with SMTP id af79cd13be357-7ff21cfd0demr298897985a.0.1756571321432;
        Sat, 30 Aug 2025 09:28:41 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:41 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 30 Aug 2025 16:28:38 +0000
Subject: [PATCH v5 1/5] clk: samsung: exynos990: Use PLL_CON0 for PLL
 parent muxes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-fix-cmu-top-v5-1-7c62f608309e@gmail.com>
References: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
In-Reply-To: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571319; l=2137;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=6yax87RqbvYF0ActasAJerhVa1SUTvfy73gnHEk7z9c=;
 b=BCbvIMxI7eRG7Yukaw4ERMJfQIzWK6VhM8NKMcnXh5upDYGzAtOTPVieAzFHIx6K4czcLEYoe
 JleTq1TdQLJDxq4lWQ+TFncQfCy35ey6m1XL8S3pVNDC2U2WTA4BgnJ
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=

Parent select bits for shared PLLs are in PLL_CON0, not PLL_CON3.
Using the wrong register leads to incorrect parent selection and rates.

Fixes: bdd03ebf721f ("clk: samsung: Introduce Exynos990 clock controller driver")
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 8d3f193d2b4d4c2146d9b8b57d76605b88dc9bbb..12e98bf5005ae2dc32da0da684a15133d64ed305 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -239,12 +239,19 @@ static const unsigned long top_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_SHARED2,
 	PLL_LOCKTIME_PLL_SHARED3,
 	PLL_LOCKTIME_PLL_SHARED4,
+	PLL_CON0_PLL_G3D,
 	PLL_CON3_PLL_G3D,
+	PLL_CON0_PLL_MMC,
 	PLL_CON3_PLL_MMC,
+	PLL_CON0_PLL_SHARED0,
 	PLL_CON3_PLL_SHARED0,
+	PLL_CON0_PLL_SHARED1,
 	PLL_CON3_PLL_SHARED1,
+	PLL_CON0_PLL_SHARED2,
 	PLL_CON3_PLL_SHARED2,
+	PLL_CON0_PLL_SHARED3,
 	PLL_CON3_PLL_SHARED3,
+	PLL_CON0_PLL_SHARED4,
 	PLL_CON3_PLL_SHARED4,
 	CLK_CON_MUX_MUX_CLKCMU_APM_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_AUD_CPU,
@@ -689,13 +696,13 @@ PNAME(mout_cmu_vra_bus_p)		= { "dout_cmu_shared0_div3",
 
 static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PLL_SHARED0, "mout_pll_shared0", mout_pll_shared0_p,
-	    PLL_CON3_PLL_SHARED0, 4, 1),
+	    PLL_CON0_PLL_SHARED0, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED1, "mout_pll_shared1", mout_pll_shared1_p,
-	    PLL_CON3_PLL_SHARED1, 4, 1),
+	    PLL_CON0_PLL_SHARED1, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED2, "mout_pll_shared2", mout_pll_shared2_p,
-	    PLL_CON3_PLL_SHARED2, 4, 1),
+	    PLL_CON0_PLL_SHARED2, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED3, "mout_pll_shared3", mout_pll_shared3_p,
-	    PLL_CON3_PLL_SHARED3, 4, 1),
+	    PLL_CON0_PLL_SHARED3, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED4, "mout_pll_shared4", mout_pll_shared4_p,
 	    PLL_CON0_PLL_SHARED4, 4, 1),
 	MUX(CLK_MOUT_PLL_MMC, "mout_pll_mmc", mout_pll_mmc_p,

-- 
2.50.1


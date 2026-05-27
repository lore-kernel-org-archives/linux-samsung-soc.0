Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF953B7B8B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 20:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779915244; cv=none; b=X7iIshfUQig14qJ2Tt68YLv+DH0E4nqTt/GNkPxpgS7vsDy5RjmHrgSiyHftNX8l/d1QTsQ+f0B7Eacw9gCBXvTxn7NOIBpbzP6ifUYoUY4MioEjR210SKO6VUh6lgK7W2gJ6xgzYU91xZrOOn2iAwjJ50tyRpy70+YKF6oLzJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779915244; c=relaxed/simple;
	bh=36umg5EeReN0uvdh1jKJQm889m98jMU479H9iaXautc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OkGxODVnGDHiyaT8xdnqh4JUsggZ63LIFFJkx1Ln/tJgTiAcgNgDGt8stu6/1CXlHXqGiDiWjCZo58LyT/20/yN4KaOHLiB8/p3nQr/xRCmCMwUXYHIASkv+hH5xAaQIyMenX+ETN8Qcm8MvSVFn6XLntXcj5mp/ZpP4Na+b2yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rc/OjL3L; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rc/OjL3L"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so73428295e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779915241; x=1780520041; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5q+7XrBx/m8kVZrsVZ4GF+b+XEuRWjJ2WtK7BZt9nOw=;
        b=Rc/OjL3LYLAphYRQ3CeXATYoJth0hRw9aARM59sr0DpZx0zVLUr77I/JKew++iK7fW
         eyfk8077bA8t56dPF17ITPunlAKBCbCrcWDu5yiUpAeCeQiKom9JEXi0L5dFtO11O2V6
         pMLJN1luIt2uDmbyqM7FQLTEDiOtVS/AZy6RNsOMQjuEqBQOhxamdrpylq32lqhVrXWY
         fkBrzkGXGHnMts7rqxMkk3YilVY0Een8V8GLdiWceZrfRHSte2ZPMOcTpzlfzASgy4z5
         DR3eBo9qfe1r68XM3dzLRlGc7HYjZUVgBmvmq7/PAgdC6626so6UBLNVmhz4rgwX3/Cf
         2aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779915241; x=1780520041;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q+7XrBx/m8kVZrsVZ4GF+b+XEuRWjJ2WtK7BZt9nOw=;
        b=IR9qKzSdyf/LzSOq4MAMk8jOHguQEzYKz8pyhpUiBwiIknilsNOTl4Xd2nypecN4PP
         phqdT8qDQ1JfaJOr/IXuf3xs1A2LZdSaIcOzRMMbFS22q92KJIAuc5PxyJ0ZIkDT3FDv
         8qDb0KwWvs3zWCE5/2pM1sVaP7HsKsFPxcNvL/kNaae9pbMeorDiF/wdtaZxP48G72Ak
         8Zhi3QILOJbMM++TZmWe5/qBahfdrH4/58ClXzanN3LP8pShoAyujhfHJGtic/HIcSNL
         BIuourIwZihEqe9v2dfS3yw3tDQ97SpM4X1FHd3k7gCaU6ILby6WUxKNtBLFI+vf0QOp
         g2sg==
X-Forwarded-Encrypted: i=1; AFNElJ/4sSQn0+mAFvPtzDIoH8k/hhQ69dIO/ZmQbytTouwPPnioiPG8oOCH8oa1NuueIc1uRPreuvbAJF0eVA6HYJlmfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhUJoyh0YnlSKmGSNWn2d7a3v1Wto64gMxEABqRvY+CNdkq4Di
	yHoP4EHM49epDHLT4aY8895ktX3XD10S5LSSas79PyjBYWs6FGLzcG//SUfIhcNswtA=
X-Gm-Gg: Acq92OFJoPMF8Z3KUikiqBXxE95wZP4nTWJyv0egWardREqXGqAmxfm8i5bwAAQBXLu
	0aHaR6mwCRE6lWLW4au/MsB4jnr1lRnHDrQHoGi2YDtn/+6JPjDlznmIcjCxTqVS0XBDyOy9Pnb
	lZCB+MsH7RSFAcPn+aBlf+C2LWn7XCmVUKtW8USMel1wcmLmeDtqTG3C5RRK4ZGPaLMVIgsQOnr
	55b0kyZf79LCtibydZNenGQChHBVDXsCrrafmvEUn4y0t6rSTEcFl7fhxR2VcTJxHjRWm1NLAfj
	LMEorn77q2fTIv7xt+yhM9DUNWBdD2XLk6C7MP0vhO2hcVkNRWdFTKq1dbyjsLZb+gkfooH0a4t
	1Y5fZlUB1YrtK9l8miJa2Ckv9m1Pn8VXJWgPr01RSb7EfZ9Z+JbL/20MgfGYtJPslFoEE37xKWE
	dpEweXBVMsAwziHpw27oetHJBsjrMD2+Edj2aA5OFtUaSrELUks3EFmNF2TsJ+IWvyfm3qk0Wh+
	l8QXw==
X-Received: by 2002:a05:600c:530c:b0:490:5527:3be2 with SMTP id 5b1f17b1804b1-49055273be6mr321464225e9.32.1779915241624;
        Wed, 27 May 2026 13:54:01 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3124:1301:985d:3d5a:fde7:e337])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908b59c53asm3024955e9.6.2026.05.27.13.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:54:00 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 27 May 2026 21:53:52 +0100
Subject: [PATCH] MAINTAINERS: add myself as a co-maintainer for Samsung SoC
 clock drivers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-samsung-clk-maintainer-v1-1-97b179224ca5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOBZF2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNz3eLE3OLSvHTd5Jxs3dzEzLwSIE4t0jW2NE42N0lNAyqyUAJqLih
 KTcusABscHVtbCwB48J2uaAAAAA==
X-Change-ID: 20260527-samsung-clk-maintainer-393c74ef6058
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=36umg5EeReN0uvdh1jKJQm889m98jMU479H9iaXautc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqF1nnvkAYqCzNZ58ckx4fYSHxq75Tk+BDT2Ykh
 X7oy8vJJA6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCahdZ5wAKCRDO6LjWAjRy
 ukWID/4lo4SJ+sJ9lnrgiVupYXQ1Zh7MjU4oq3Ma56XYd5QQrlcj1SWca6xDc3OkhrX4dbdrQfV
 0IsqNstUuAirPoqbzZxwM2Ul9xZkMlJtHyBNEgndBlLXFfVwE4SBWaI/YxrhDiPX3v3iSfrWwJD
 5VPm/xdF4bCjX54NfMAc4zP7phuOX0wwVDJNVlv/vEYfZRASXo+bneI4iLu/T3bdsN6tRUx9G3t
 7+EmrqAB1MeNuOIRCYyjEurhj7aq0a14VpuSW8n74eST3LvjG7V8fBNW/c42L5sZe5Ef7ydx5pQ
 xKtqbwQ2nFIxdnR/tP1KsCLr9+TYFIO9kuFAGJEpZp5vVRgibODht1jvI13x+vx6iBry+Htqg2Z
 qLEkUskuxU85KMnh3C+6VtbLAOZYOqgrRAUWUljmny0sp5W+g80vHMOwAv3qO+omO5Ys51lYW8V
 8oY5d8pf9LNuixO7q6q5Afke+c+khmPlLon3PdaFyBqkTPD6zGSFXoPKPuMn1FZFFNual11Bl1P
 J5knSNYiKqzDGLshRO1edACS4VBz8GtDISbOj3QJp1Mjdq3J1UIixqA/O7hNTjMgLOIMHMMJSAf
 77hzx0cJm8ycY6MpgQB52sbaUMD1UbUOSy3HP1yYWLOuRkfFFD9RYWzNOLjR5du5chyLlEE/k6C
 /TDN90W5JQaIzBQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

As Google Tensor gs101 is based off a Samsung Exynos design I've been
working on the Samsung SoC clock drivers and have an interest in helping
maintain this code in the kernel.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
This follows discussions with Krzysztof about expanding the Samsung SoC
maintenance team in the kernel.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..9f96925273c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24055,6 +24055,7 @@ SAMSUNG SOC CLOCK DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Chanwoo Choi <cw00.choi@samsung.com>
+M:	Peter Griffin <peter.griffin@linaro.org>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260527-samsung-clk-maintainer-393c74ef6058

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


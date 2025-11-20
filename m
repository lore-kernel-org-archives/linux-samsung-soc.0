Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F2F32F774
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 11:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638185; cv=none; b=NsPJQ77pvXw45s6uoEmV1sPSfgGBbecemlCpTabWp3+ty7orhwPaCJl/Fvw852w1y+wDqUjtBafIsfL67AVHHpIzovZdDuhzeEnfGxksmA6npquCZBLGi0sjE3Fw/Q+qnX6zAAEAt5MuLL/1KTinGZoCJE8x/uLPfUea2vsRdAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638185; c=relaxed/simple;
	bh=QuLzD1mgISg4zkjQX+NNcW0jz68RwUFmOx017oxWLlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BOM0szpdB2QRhbYczDMBhU2cuF76UmtVo8wZxHwFP3cYJxoU2pN0FSmGRIEUlF2O0QM10SygNQP0fqO7pjBeU3ntXl5Z5QVAU7HUeeOEME9sUG2vW/uUn84qK3Ie72X1Ylkf0yi7pN/W8jc/KIrc/Evng7Vc5dcTTdyyJ2N8pLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j8twkoKf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j8twkoKf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42bb288c1bfso487317f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 03:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638182; x=1764242982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrfTebO8rNsGDrFrDajdUyVNoAVMli4DcnLnNa0zpcw=;
        b=j8twkoKfdnQ9GWW7GDaJldMC00UajzS5AivPA7Fc8gjZFpSoPpiKMOmo5dnSdxxRYL
         UGe41LbHENmdTNkvixXtX17gv064qCnWp/EDTzObvlYNkOya/cArlGDoQzNGksk1aw2l
         87nK/ZC8xwB+WrAiFTVpNIboV5Vyo95oX5/SMpcBtbJMg/idsGWavozjDto54GcgJp1U
         3MSZ77IndXUAhP+m3axtTuDJmUExIn1BWpIn7J2BOmsa7AjXjcYn4uNU9JhpczNZvdye
         z1x+12RWiO85PfIWVgCGzCghIyZInO2XQSyuIFMKHMD89nACfnLft9vcFCz04UcdeVoE
         NkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638182; x=1764242982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrfTebO8rNsGDrFrDajdUyVNoAVMli4DcnLnNa0zpcw=;
        b=XEn2Tssmtz2Bxtpcsv9UfRO1ey8C24e3E6DQJoYbodZNe7dsP6atonWVxWxvENtK5w
         PazRXeJPkmpTZhHUOkkH12vUY9xwXpJoDWBNBD8pac7oQKf4kDs6mU+73SUe3SdYnuAE
         MrnKa88g3ggUABbEOlbGlD42t0d0Zqo2C7WKdsq+gGexq0tcHlqAQ1mpuhTlg4f8wSe/
         kJ3IwzaNPJM8k3v1T7nos3umBO/lOc3b8ZyRcwS7HMcWySuK0ZSgu7Virj/WxgejSF1J
         tePR4euNfCwV+p+dLpQU7IZObXBkMTdlsmrW+2OSWDERYUCpB7F39R1vYP2xPm4a028x
         FZJg==
X-Forwarded-Encrypted: i=1; AJvYcCWHrvdFLgFgpsCJUzf0TGf7pTG5flZrLEA8pEd8dFTDYFA2cCEcPSFOVGcgXFRVfQajQQlpBkIQXmuPMDjJPu4P0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQOf3hmiwqtNqVIa4cU/dApKIlS0DhffHG7bBWm5vJdnyn6+Gx
	fJe6/Hgw4YgglICsuiE9Uq+mafp46chq2AT+Ef3A8IoOpzloT/TZLjrN8JY/6aOBIfY=
X-Gm-Gg: ASbGncvMLVO2ewDlHVeERUj4bW6enXd5I5ep+unQv+TvXR427/0hmN14ldHcxhWJk+E
	IZO8lUAubJ0ou1LRHHW/pH7jrqD0zWlCgr2THYDJRMerjATmchwj69mSTvVpK8fns+SocWIUUyS
	8PeNbA+MW26k7W0Oab51MnZlEHDCI44zI9n2mV5QHj7u0Tzo0DJYEMcjJMZpxyLWi/OWQmU01mr
	muLmpB20DQqI2mPVy42RzEC30qmO2lARQQXIlaRiysj0CkhodnZdJbyQLw/xxzRzaWOp+eOalLQ
	BqQxx6U35ie9HCAkJJwNyaTXGPfyZqSusPmuGImUsc2MxoAbPwpi0ofIDwdgpCZGXAkwdnHbbRW
	7UIFsRJChnrFP3HUFvnyIj+nyG0a91yBnfGIayw2x6OksPxG4K5a0Z3GbbcfqmRIuGNioh1nwue
	GxxjrOB2S5u2VSsunckamNBQbf95i8lCXTWn7CRLJ6ue6/7DQIGFFNxIWQmKmS2ik+/lMuj2sQt
	7jYug==
X-Google-Smtp-Source: AGHT+IGMAZHNjJ7KaxZQW1CKSy0e9pKm4Sui3wq/A13ZWcUF9r4m0xVl2YKFgMjFczOXBPsIBVjfGg==
X-Received: by 2002:a5d:64e3:0:b0:429:c2fb:c268 with SMTP id ffacd0b85a97d-42cb9a7091cmr2496273f8f.56.1763638181851;
        Thu, 20 Nov 2025 03:29:41 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:40 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:37 +0000
Subject: [PATCH v3 3/6] soc: samsung: exynos-chipid: rename method
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-3-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=1404;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=QuLzD1mgISg4zkjQX+NNcW0jz68RwUFmOx017oxWLlg=;
 b=QwrG8SY+YQBiiH7MPcJkxfx1Dq3aLNOQbU0oxhLO628nA25GYuZ2PBNpZnlbdqR+mDmqspLbe
 gtSnFLhRo5TDgGu+KU8rF/8hHzrHdNmGF12KCR3TWXjovKn+lNDkDqn
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

s/product_id_to_soc_id/exynos_product_id_to_name.
Prepend exynos_ to avoid name space pollution. The method translates the
product id to a name, rename the method to make that clear. While
touching the code where it is called, add a blank line for readability
purposes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index b9a30452ad21c326af35c06a341b28491cee6979..88d264ef1b8835e15f774ff5a31f5b3de20f74ea 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -71,7 +71,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOSAUTOV920", 0x0A920000 },
 };
 
-static const char *product_id_to_soc_id(unsigned int product_id)
+static const char *exynos_product_id_to_name(unsigned int product_id)
 {
 	int i;
 
@@ -150,7 +150,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 						soc_info.revision);
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
-	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
+
+	soc_dev_attr->soc_id = exynos_product_id_to_name(soc_info.product_id);
 	if (!soc_dev_attr->soc_id)
 		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
 

-- 
2.52.0.rc1.455.g30608eb744-goog


Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FBB78C73
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 17:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720458279; cv=none; b=YY5MhvKiSQJLeHbJPiS19mJzqWds/1pflW1/YwoZpLNgWY5weYZqlJ1ZnMdefnFv+HlrZQAkY8TsQNSvAE9k1p6MFNIPp3A4rj1pof69IkAqw5MX0cakfwSfPPUqYK43tzWp72/FQR9Z/JpYtv0aSrFOTBF24kmzj7MMuJ6EY7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720458279; c=relaxed/simple;
	bh=/gmKHTdKlikA3tWSdvm57nrzkaxKksXD8hG0imHI3po=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l9A/jMRwHcUuPLJb30LoA0y1ntd+xEc2jnr0e+xFvk1orR6TzNbRPF90eToCgTe4YOsZWeXQFJuKrmBt4d7a5dxNz7amaXcRZSKQ1KMWWssnK+YH0VPSPBtz9iNlY9aE7lo7SGSRB48N1eiD696ptTllWpHebypx7OmSycIJiLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tjQRua5M; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjQRua5M"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5c66b5325bbso1058894eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2024 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720458277; x=1721063077; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvpNrB9c9Hl46wWiT75cgTZb/z1ngLdiVtG52BbExk8=;
        b=tjQRua5MzuEADRG2sorpjqbfwf32Jr5whuCq9gD/AOjw4v8Ev4WYuHvsjld7B1j0fE
         X7jojRJ5hEscYzLYLX+I4Tqcd68a0VF6TV623P5WU08btK+3Ft/faTqcJkrvXxXzl2iG
         3/X1xiMdbZ9m0nk9CMywU0MQkzbJ0deH5Xf/4i2EQES/aCXJOpY2yWIv5TLTDBoqOfOE
         s2wbUN88oNMFM2kIyUTA83CHMofo0tiNtRqkIRUmUNvtPDVmEpWdnMiO94t0MrzyhB72
         1APXl26xrpCIuQbtegcOFjrHlOZLsjKEfR+pK7Zpm97CLM4dCBnXy60foSMwt4bdpQ5S
         +zVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720458277; x=1721063077;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MvpNrB9c9Hl46wWiT75cgTZb/z1ngLdiVtG52BbExk8=;
        b=roTrmziSMIKTmuNyo1StnmFM/MLnCEw1R49R4rLz/9IBXpHtCnfn9d4V/R7m5lEpj8
         qTyuoLfCrBh0jyRh9s615fuwYx6fdfc+jh92oIC6S7zbXBnO/iUjEdzygHU/AAuYPmtw
         SZaFVS5G/gmDfp2tmaBb9LtN8P8quF7z4voi4ggZIj0LfH/hsc/ZKWnfOn1kR4RFot9N
         YhEupZiOd+l3153WycHkhiHoaESrHLZT6dWhKd7BZywxEVrx7XX6Co3Y15Sr8yimziWP
         aqcigN2QyYpAtkRw7At7084Pa0tuSiq/j9dDBjY6lOdoB5Ih8sdzyTrb3PstGcKMOJwo
         PXOA==
X-Forwarded-Encrypted: i=1; AJvYcCXxGWgy5Bta7k0eYURANUb7xUxdoPW2lS/3LcJ6jSWMNhrQtknVgQj7VGvUVeoVz7QCv86OXFMvhAxcDQrLsNbcCVqjg+dhaLuketCw3nWZa38=
X-Gm-Message-State: AOJu0YyWII8Ids7vriTGtvhGAmJiLK3tiMPU8BWlq/VV4R0fUwBBTzrk
	c4ZwH+uH8ibk4i1vcWLwNU6tcrvMb8o1dAgQOMt+1VG3wHDl/NMBaURd5vW3obM=
X-Google-Smtp-Source: AGHT+IHBVVH6omPzyI4LtKLmO7vYBh9XFRpTa35ZGKUdJwwwS7iIEWOMqHJsi48/VsYlkMNnwlk8qg==
X-Received: by 2002:a05:6871:299:b0:25e:170b:4470 with SMTP id 586e51a60fabf-25e2bf1e4ebmr12424412fac.50.1720458276907;
        Mon, 08 Jul 2024 10:04:36 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:cdd0:d497:b7b2:fe])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25ea9f8fce4sm79026fac.8.2024.07.08.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 10:04:36 -0700 (PDT)
Date: Mon, 8 Jul 2024 12:04:33 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Rob Herring <robh@kernel.org>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: exynos5-usbdrd: fix error code in probe()
Message-ID: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return negative -ENOMEM instead of positive ENOMEM.

Fixes: 497ddafe915e ("phy: exynos5-usbdrd: convert Vbus supplies to regulator_bulk")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index df52b78a120b..9cbf90142950 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1745,7 +1745,7 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 					   sizeof(*phy_drd->regulators),
 					   GFP_KERNEL);
 	if (!phy_drd->regulators)
-		return ENOMEM;
+		return -ENOMEM;
 	regulator_bulk_set_supply_names(phy_drd->regulators,
 					drv_data->regulator_names,
 					drv_data->n_regulators);
-- 
2.43.0


Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A77D35F8DD
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474187; cv=none; b=R7JSdyJIxk1Z+RgT3aHRlvfeuXFfItFalo3GwvildDNhQ31v48+8p6juWSiyRnpGfO2N8WdG0M3zzRDWW1uIR/S2fWTFpZpD2amxjkBF0rCPbpn6xs4/hkyxEUU5CbPVJXP1Z2XQSKGG9DE7+RP5y/ej6wnEkCQM/jC3e9ErqPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474187; c=relaxed/simple;
	bh=pz2vFfFg816pMsi1tjWB3WxH9y8mdbvU/JiEbCPeYpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cszsuac+LOkkbBMrX69EPEKB5C4Fs6IpGYJkWp/B2oEryCyN0xc7/3c0sFMDYFXAzBnv90Yyu/yl3cslOHp3w5qHgnd2kEkjFap2hVTA6RY9iET6AEuHEK8Z7plVYd6DU8DnOVFFj8bHBbsoKQm/JTahWKGF59JHREhfBzKVhCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yycJiRTQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yycJiRTQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso19703975e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474182; x=1764078982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gwKtEZS9ATY9MzLxT6ci8qfNsIOwy9wsbqfh/IjTRA=;
        b=yycJiRTQGrd7iaJAk2A1oZoTStUecZrnRSxr6lKZemKVgE3Jy2W+aH9tNYsqzTxRaw
         JbAo7kuNALUojEFEqpc5MupSg05PyO6RaER43CHLKfUG3ZZoOjAqkZpdUhSQWTiobLS4
         X0QcuARxWCB1ENfshU33/t6CsG3dJSA/fnMdXOiwW9tCN5PKWyD5yFuv869iFwbo4wHo
         4Y6836ED5UtEnIMfIZuQclQVnUe+BrU/M4cIdS0Vr7GKl/wi1fSfhkQAk8L5BAEbjU01
         zX/B8Rm9bA3FolGvL2UjG8Ln/lv4jUfyc01dyHCtHIMcI5H3+dBn8reyu6+jfbp5rcqz
         6y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474182; x=1764078982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3gwKtEZS9ATY9MzLxT6ci8qfNsIOwy9wsbqfh/IjTRA=;
        b=g50eBNCpmOhtuG7uucauBlqX+Ytno0TmRMqUxAWTBB7leySSwuTCnOPSoILkoSahww
         hK7xBFpVohzIssgAEwsI00aEi8O12fgDYmEbnwA81VZJQxqrbNdybV3Ph/pKQbsdiXcv
         NN9tFL4PQ/9mIm/HOmTDh9Oy+nZBSTLvQVTM03rwDpQSyNh5uZMuRrf5VG6T9oFqGgwK
         PYKVU6ZHKilsyRI/pDjvZx7conX35liLVvDVGuHzfwR7QX1QyA4NpfiaBbO0PjNIHswJ
         EhcU76eENDbzBRMKA+StFwoFmVIK0Y7avvaCKB7zmV6NEuP8/aPdZq77s6lgjKzD3H56
         BmYA==
X-Forwarded-Encrypted: i=1; AJvYcCVud7/nRBZ4f9vhcXnHZuc5ZBi3rbYCOsMSNw0CiWkfG6ET9gQaVOZEsYAlVJiI0/1ZHklsiSZk6snDD35qy9WOcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/OkuytTBA6eakGexlLAEMByCFRIxjWsjwe7k09GBMmRPJc0Ae
	ciXse6OANE36SfkB00eutuNb5WUUFz/hAVwNfGpHyZvOtC9UOaxK7S+s5E9bJUqqk6s=
X-Gm-Gg: ASbGncut02LLSFkVRc9K8cwTiLzop9w15ZtcuzoQECQT1hxZ5wxN1USTIDS7FAimlSv
	JmbgHDEgQz7V64Ig6wAWhmp8POHLa/y0hD4CVPWaa0gN9yp7KTkVXTs2pC8B6QgN+CeM/Thzp0C
	dHrjs4d0d+Hot84udmB9i4cV2FhbQmFerUScvPvZZGYKOjBUhLeb6umXtq5LCaaBysDpp/yF7oB
	rJxV1IpxV4CAzz5CfT19kn3M4uDcXxDlYkE47sGMG/55N85V1QBiFaUmMRhcM+HCWfPE07Bbw/H
	rpz3BymK3xjYvLrHaPsNXOqj2OlwMemQal9E4VdTkbMcCf+uPgamLOjQXQOgHIbeCPu+lAKAkoL
	5kVu4k14Tvbmk2r3KKGQAcuo1ymdEzptjg6varp8YG8fgBvWRsyQIHK8jUMZyocvwzmHZgOO9gf
	avpEz0oEiEFk9KlzvK4RNcR7deZfHZ0t6geHFJuTWSgqB6lbMZ3lf6OQdDCMtl1s1F/GGmlX0t1
	51PTw==
X-Google-Smtp-Source: AGHT+IFa8oKgKktdspxmJlkG4/viJN34IUfCpO+WsyI4R07URExLBajDeg8RAjbULRVDTx5x7IMutw==
X-Received: by 2002:a5d:584a:0:b0:425:86da:325f with SMTP id ffacd0b85a97d-42ca8cd213cmr3206208f8f.27.1763474181596;
        Tue, 18 Nov 2025 05:56:21 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:21 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:12 +0000
Subject: [PATCH v2 5/7] soc: samsung: exynos-chipid: rename method
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-5-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=1394;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=pz2vFfFg816pMsi1tjWB3WxH9y8mdbvU/JiEbCPeYpo=;
 b=wh9h+nJ2m38labT5RhsxjuLGzrUVsY6uL+fQUguC27NBHoTBMpaM1lMG18cS30VkIg8IBfNdw
 8Bp6rNoERAVBlMoO6MNx4mWs7Y7PSqel07YFbs2s2TXzaQRhQaL3WaF
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
index e7dbe1bc45d6af58527125f512c0ff22c03a9629..7ed7f44b6ae5357b71fee3994e4a4265aa870d41 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -77,7 +77,7 @@ static const struct exynos_soc_id {
 	{ "GS101", 0x9845000 },
 };
 
-static const char *product_id_to_soc_id(unsigned int product_id)
+static const char *exynos_product_id_to_name(unsigned int product_id)
 {
 	int i;
 
@@ -204,7 +204,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
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


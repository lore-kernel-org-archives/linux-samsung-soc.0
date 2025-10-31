Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FD634B68A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915374; cv=none; b=MKbfL/LQC03detIcbqr+kD5/bL9rCjSoPyqZ53zntguIFgO9+lnXhveVBp3nhbwqVeUO0J1B7n0CiHLeUnteg63Tw5X9mAE+KsTODhjUppEgIRHLlnIIGCrTtQaKVNswyneKeib8jaucKF+ZE10L/gMlqQt3L9JpjnEOkCHDY+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915374; c=relaxed/simple;
	bh=9SkaUUiz7kTIzusyZvFJbNhQMbW11/ifo4mNZna+tJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l83sRKDOrG5Uqhgh4j6sP17Qo7k1q77fxVQHJHzu6lYMbSPCADKsRVpZcYmisjYdPA64R/ynMEqvL1GIazaJCiXd3zO2VlPs2dwSB3erqC+vv7l+g/wibSqlOQwf3BFnGLh8UkvYnOOpsr+9wVXJuCpb04mMZ24F2/6N/4NFUOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pjcqSf8c; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pjcqSf8c"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so22551495e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915370; x=1762520170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOHP7nyDdbsMDvdN2HPmSUfNbw9SBzb4pYxZJwfsKCY=;
        b=pjcqSf8csRvMKhXpsMNT5GfCy/ENV258BI/DdZllu8DN/pdAiGBnqgaygnI2Zmvs2f
         lr12n7FM7S8fhke/yul3Brzf+SejwIVvXyY7cJUam1bUzAkgAk57o7kDehd+D2nRPwq5
         8nONXCFTsEHX2zG0j1TRcw8YWt5XWZUUQIQY/k9/+jkaAvwKqDjhe4EQ5KsbHTh3gQ2j
         lsvzBEvJt71jVAWIj238hncwKT8qLuVLpqFcJbpCjUcJJbic7ujkCE9bgWVwb9k8QH4e
         1XGkUt0JFILfHs8umMHD1QuEvr9z013GauBDtS5pBHhjsd8nsXKb3odreTI23iqWTTzH
         6BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915370; x=1762520170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOHP7nyDdbsMDvdN2HPmSUfNbw9SBzb4pYxZJwfsKCY=;
        b=njbh2Pw61UJekMCQDn0mAMMCtzUvARZe1muEzN6ZzCnkcylQfCfrT3yC3N3RG9NQG9
         d/zaixiUeRRdXN1SntU+oraUYOt6CHGesfJED9NjrPBHmWZZoKKdZcQWsxoMibscgVNn
         bZ72a0gUF88m2KRpZvVdrsLBxyFDuiAPl6GGE1q3GaJIi+mO6pVCQJ6kIwUuuxiCOx9a
         Pu6Pqpi98GH9jbFZvB8vmIcGnoJRZVDMZUqWaTr7wIWTBrg98vcV7UU2BW9z0bM3Ak6L
         Sh7s1jcHF0RH9gvkLrokwkO5OFBLbPeyGthRL70+q6ioXtG4i1/xdbwvm6IxfdWtp8jm
         bOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzOkahRZHcMFj2gwzkmbjBdqcS/KQn7zi72hbgYFKXc/waySvzBY5OyO3Kvz/1fA1FjniMdHubkcEQEuWqXnZsLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoJUCc1gY29PKOrSFIoBZstgXOnZNYUZpKdVVhCK0iHff7slb+
	owaM/LO5EEmxciR7KWEA7ttjg0ZcoaBI4EOav7OerY8GlEt4rsyBmOsuPiiVv6mzaFo=
X-Gm-Gg: ASbGnctyzM3DlM396BnVfmSaBryPAMQt6Vd5ewLEo47QgBjEQywyxw4VcKgTPXncGJ/
	NUyMz36F7hlW+wd4gnsBk6KGA9XtcWZ87IiNQddrINBAG/wajteO+WEQHbuLOfmK5atls3I3+yZ
	xo+BRG4SQ+NQY3vtWFDhaG2jnX13B2c1LiVj4vFAfA6FbZYZrUEaNP1BrebD9jESKVakL9HrHCO
	MWTr9Vxcz6emplUCctBvlzx+gwo6H2V3YPcmB9f/nlh6Qku+fSIfrI0GZMkOiDiJzWvDFx7bUMW
	y499XWNXyTpg0kuGpcRgi9Dm+Vf7QoeGpUV6p2bV4+xyaS5ifyG/jY3UK89qjYac7IrhO+sgFpf
	iZwxBI+DuIA/MHheb5pFKvhQ8Prm4IIYBVhQ4bBUX7yRHZrOodSIMHFthNwdoaSjmCLiiK2QyaA
	TgKYWT0jDgAUVm7q2fO4U9Fb5WDQIHfqurnhv6e+aRrbR5dBVv/oPofv9Z+z64THNi/75//Dbmp
	w==
X-Google-Smtp-Source: AGHT+IG5tkb1EJ/8aJ1Ee+rlCTIqPTTaT+zFP2s7onbxjS1ItcgDWPxmaFF+3jJVap3Qn/JSHQQtdg==
X-Received: by 2002:a05:600c:a345:b0:471:1717:421 with SMTP id 5b1f17b1804b1-47730872584mr29116745e9.19.1761915369981;
        Fri, 31 Oct 2025 05:56:09 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:07 +0000
Subject: [PATCH 08/11] soc: samsung: exynos-chipid: prepend exynos_ to a
 method's name
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-8-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=1201;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=9SkaUUiz7kTIzusyZvFJbNhQMbW11/ifo4mNZna+tJU=;
 b=nVOMdUvG1eXJr+DmGEMwRP9k/VrvAUTj6to5NckxRVaBgVO0QjELdEXrxI7Wq+M6ZeX/ijI4h
 dh24nYIEhqCBdabs7dGrkSupGP7jmC0xwBudDXgEZ9PZzzmF0vMd5kr
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Avoid name space pollution and prepend exynos_ to
product_id_to_soc_id().

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 9c43c615167e4bbf15d00d42c2e52cc64d7dae1a..92cd5dfc0a9b641428d0d047cfefd4256a893ac0 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -84,7 +84,7 @@ static const struct exynos_soc_id {
 	{ "GS101", 0x09845000 },
 };
 
-static const char *product_id_to_soc_id(unsigned int product_id)
+static const char *exynos_product_id_to_soc_id(unsigned int product_id)
 {
 	int i;
 
@@ -222,7 +222,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 						exynos_chipid->revision);
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
-	soc_dev_attr->soc_id = product_id_to_soc_id(exynos_chipid->product_id);
+	soc_dev_attr->soc_id = exynos_product_id_to_soc_id(exynos_chipid->product_id);
 	if (!soc_dev_attr->soc_id) {
 		pr_err("Unknown SoC\n");
 		return -ENODEV;

-- 
2.51.1.930.gacf6e81ea2-goog


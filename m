Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6501325782E
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757849393; cv=none; b=L/JWPXmnC/rkDL5UWnf/WOy5H2A50Uqytt8z6cQwAVkKIW4NwsnK+wg6XHTAV6c6hmVdFXajgRsSRuXY3kJs9MCqrQPYF0Rac6NKd/sP5cIdZtitb9hvdTgdUr1h9EFXsGx/4MfDAXLYPWDG4K1Mb6m710wQqNNl6A+CTWowCIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757849393; c=relaxed/simple;
	bh=eGhvv9/N66YsxzDcDqEg58aZlG9m/MLJsOnFOeq3D8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sw1OMVFe2Pu8v1BJ0ympg9p5g7nTTMjJGpPhqE0KJiCLUy43aAWkk4xUOGASfChx7tV/vOIh+5c0Puh8WHNMKY6NF3tpB6+Md7mvzUhyj9il7YDOGutlk0SVwvx2in/n0pV5H86jxC7ZL3ZHAM7EnI/z0S5rfdTYBILFtCJ/bq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zyq+5QBF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zyq+5QBF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3e9042021faso536500f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 04:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757849390; x=1758454190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vsQY4Dw+NKWkDueuyiKs+vcdnaBKygRmkUmRr7JUuk=;
        b=Zyq+5QBF5hC+ZTkBwgK9TPRZ90TD9wnHf8TOy9nCbJFiyTDPc9uGAWShZlA9I4evU2
         EpmncFCJZtFPNvCRXnNmaPqxKq5TqR7lCobsFZlqxd7oaWVj03WYIGQLpetSsMP50Wqz
         96mioUN2ADah1apBDjrdpwJJtfRxfOo9CZrg8WXR6Nbgk4XRuf/6koK8aD1+41L1Q+91
         F+hvGmrYy+IUUFSxtdvdSg7YDh4JuNd5mrcuF1ceYJmOxTiJkoadtLk3m8UFvK5qjjOZ
         ua1UKEFlTqa8Uv1ARJOjo8ASgVLTkdaMBlxz8gMEcKVxX1R35UTQWneSewEZWO3JT8my
         TDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757849390; x=1758454190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vsQY4Dw+NKWkDueuyiKs+vcdnaBKygRmkUmRr7JUuk=;
        b=lkUITjyoNJ4ufYrtKZKlOpc+XrRbOWXF3GGW1RBQ2LYjoBOuRjlFig8e5kkF+uZb5i
         iUH7Ydk8XBqjOl+iEV4nBATW/crccvT1XFmT+qLHmqfe3Bot8uiEicozE7wUVCfUgPvy
         3UlKGQw/52PW+wm25ZCgqZSN2bwnnqq4YVvr7Cj0/+NRBPXlXeCslULpi04JCxfWZCii
         id8X8tOlUBIBG5u/sLYbS2V35WoL7Z9qbGjKJ21z0joAgyjW+03TanCvDjrgjVTiqxai
         JgHnix6Y7ln6nVUWH1tksBGx34tGsOi4AxFnzJFhQkqNP4jsqPxeQG7pHsLOcrBqVNku
         9ZIg==
X-Gm-Message-State: AOJu0YztuM878Vt94CIlpwNizH+T1KI541QzvkK4R7ko/ux4q6ZguqFv
	D4vEHfhV7VMFvMon1eRgDEZu1J1wavQ7hyyn9xjUEx7XzWsMZjyCkzTK
X-Gm-Gg: ASbGncv2vBpmvbElryjC9D1jLAh9TLXULTGXkzioEeD35aVLToLsYiwT0b7MRLc41EC
	NL3t1kkLOK5UgMR9JyrftMJnuqx0yl+A64fGzKsUnlZ2bpAxL8T+8anxmwnWi67b+32ZCFmfmSm
	8uu0eMgiMVW+F4Ldihm40Y0oc3rL4XwiIKLlUTF9Cx/UVEi6lMUT+9XWnq8MREoLJ4rNTEoras8
	UMprIL0UJieUHH+ywrhtt8erUM1dNXAiVV1jmVdor8DG6Ba9shB5GxJa4xmZSlA+Eo4GOToOVeP
	zkMcAsgUzc2JFfhzpRKQpWz7yxfXI8TIsiIhGps/eQ5L0+kC2O3B3JS1MVOROFiZcTuB+Tlzl1Y
	TC5jkGxIcLVHLzm1feFqqfXbFdNhB2V3Q+7+OyxM9UKYjwidudrzH9GO7aARmqZpLVgxoT7A/rg
	==
X-Google-Smtp-Source: AGHT+IG7cUFQKEKzCWjaXCRFkeDZbrdH3vz4KY4We/ahlJdKQNXRJ0ZP4meSLxgeXXNpvydWJj/Jiw==
X-Received: by 2002:a05:6000:2584:b0:3e7:5edd:ce07 with SMTP id ffacd0b85a97d-3e7659f3bc0mr9180559f8f.40.1757849389608;
        Sun, 14 Sep 2025 04:29:49 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8346defd3sm6591268f8f.1.2025.09.14.04.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:29:49 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] soc: samsung: exynos-chipid: add exynos8890 SoC support
Date: Sun, 14 Sep 2025 14:29:42 +0300
Message-ID: <20250914112942.2604194-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add exynos8890 information to soc_ids tables. This SoC product id
is "0xE8890000".

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index c86f1058c..02466f916 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -57,6 +57,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
 	{ "EXYNOS7870", 0xE7870000 },
+	{ "EXYNOS8890", 0xE8890000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS2200", 0xE9925000 },
 	{ "EXYNOS7885", 0xE7885000 },
-- 
2.43.0


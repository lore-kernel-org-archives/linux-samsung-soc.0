Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2AF1DEFF5
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756552626; cv=none; b=jTFbzcUqd5hq8+CP1mM/IaEOlv+EjQEm/MCEQ4A4Bg85AeVcjnHIzgBtULGOCbFpVoyDp1zyEb8QkZ7i+/i5ZNKY9qeTM0XDvEb6vbAZxSYto5wEiZthjZllFTpJ0WWBHRd6UpwKO3LkjoHgOWhxmu3gR9XhpxoemzUYyp2/Ij0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756552626; c=relaxed/simple;
	bh=E0gq6DxSh3Mfd2fh/IwMmACtaozlVHjrWxf6F/SWbtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dlDQgds3fgpa2guZkkTVjAo/PS0m0eQL2fQaUzObJ8SBtsVW5HNT2C8KtPESlC1GvuKZFogSTU7wX+hZ9fei41hlkn+RwV26bM2WXPhECUHHA+JW7b1dZlL8dFUIOi28BBVADUfMQkHYjCA7HxKfm3aHE4n+OTYEYjQx/sArLKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aI1QjPud; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aI1QjPud"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb731ca55so43464666b.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552623; x=1757157423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrtE3Q82QK6+GBZEOdbY1kXklQMDVX/x3b7hwZm2YeA=;
        b=aI1QjPudCyTq/xp8gEd7LybOkLQdjMZLCtxKRkFu9OdIrvN3HPg6YuapnlTkY/JFcl
         b2gdu48tNSSSoc9vnKEfnGla+Xw3c2R75c+XV3q5oAK9WFP8gzb6u5aoZ0h9wxP99XVj
         Z5v9mARDEe9aNdV9wk7tg7Kwu3O1sE0A5QE/kz82IIB6WmNxmyotCtIj9075zK3k7o8F
         iI1XveOLoMjeoGvDFSi1jVnnNyZPVhCMFL9lkShc5rsUtZC/0zPvws+rGBw5N2DEO4k8
         GwJ0WRWOtf1koZB0WXvpDERsDdD23E/JHvoakWhnzMUUS4gqOMJ+gQ7EEXddNmEjp1ZD
         Wn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552623; x=1757157423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrtE3Q82QK6+GBZEOdbY1kXklQMDVX/x3b7hwZm2YeA=;
        b=HHne/7embyIOBgbhNBF477M1eWVewv9C6VOeq2wYqRkpdi+O05FC85IyNsWFw0InPe
         5u72ad8hZPzbOiH2HPxJcYRDXO3i0I259wE+Hb1myRoWpxAoexF69gTK5oRgpgy9nt6U
         0vUThc25YKXt+ZVhfmXXWq+lEEB/AnU+zzX8ShzqicYfvQhuiKMj+dw57m44rD+oypfk
         n9yEIHuLMqQN8ok3F6VCE7crUpYc42YvD1bJNez0YQe+VvqZzpNvbODClTTGuTQDkrOV
         a/RKaY/Xyul+UZ9uDxfT1/iiKY5nrS8XEU4YDq/6C4e1j3nRkTSKUQb76dh6qe4dN7Va
         if1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkXmcaUvSX53BtHjh90kiO3mI3JpDEY2jvBTbnxBUEGUDeeeMtbp5SReB78HzxrBMNuq3NJLAcSE+FGWdy1anrdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ZpzqwXBD4bKLYeualhEJpqLeddwYvvs5kDw7Lad6rzrxsFZF
	v5eqO1eDzw9w3sw3k3epOVotdnWOfYMHx3JP62r1X3+jSqjooxw+7fTswrPOjBxTDaM=
X-Gm-Gg: ASbGncvXwhTvWvL/95+Ju0xgaswCqQMrYEpMTkyCmiN0BeuTYRJiJMAYnMplkGvzH8h
	c7DtbWuIPTkTmMAI5PjGFrgryGsfYi3OOhJV+VLMsvYQ/m3z+sFgGdGPRN4rH0RGzwIfywKcrgE
	DDV85DIbfKXtEAaglAPDRdcInqhqKbRD0LplectDV30q9GM5h0u9GIVGq3JqEoVRDlFpHZrmPW4
	qm/+YhUmQVxtfIpRdHbpGjXIcyPvEAeHiYyoHVlzYs6cOz14Pz2TJsVxG7GY8fIFga4hEM4xtj1
	pYLlBODD5SJOFidcY03mc5O89by0+Ymy8lWXL/MXC69YYWnxNaxJ8E6JpBigx5B4/jNSZNhfMH7
	jwcTZnvLZuIjGIyD80Cr+8DZOXPgZ/Q0s1T/uPOUNowEF1t9VYgjtUyQ=
X-Google-Smtp-Source: AGHT+IFmornV4ZdIWfTm9SgoE8/HBXaeK1TDUM0EwCR7nq5XRu9/CMvRo+RGrgPCIIEx2ABNZ1/nTQ==
X-Received: by 2002:a17:907:60d4:b0:ae4:1093:d41d with SMTP id a640c23a62f3a-aff0377c96emr287174666b.0.1756552623239;
        Sat, 30 Aug 2025 04:17:03 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0236d310casm117780166b.44.2025.08.30.04.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:17:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: samsung: Drop unused S3C24xx driver data
Date: Sat, 30 Aug 2025 13:16:58 +0200
Message-ID: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=E0gq6DxSh3Mfd2fh/IwMmACtaozlVHjrWxf6F/SWbtI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBost2pee9d1wG5IpSYQufkayn0uDTUfoHK4Aojm
 OXjHWzf67CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLdqQAKCRDBN2bmhouD
 17DuD/sHmEpQOmJ+f3J11DHtrw0RH+Din6o+TGdXSZkDpyWNmfyR3Xbulz29+2OQ9GyJ5fnIEGH
 OLRyAgwoUVLWTc07Fjl+bEhfalWAR2p8AhxQF0SRmS3m2ufITSQ5KdAwimM/8W6Bw5PGfLvrhL2
 KC4E83y8qrf7Krj6osG0+HAEW8S1TqGswumOelaNzFH/sWoBWgovhA3ypaBGd867OQy9UnrCtkG
 8pTI4zK8UteCTyGOw7Gfgdtr4jGfMQEMoaXg8GDKHwvtJNgRd4EyLrW6vTtHi5gbTY5/5fsOH2A
 wUUAFzC5Ao8fwf62Rkk2NDtC/DObwKKj0hWv0LIfjNx6dgoJ2hvW4Y9puHX20m4FMHiLI8tU/AT
 6V5/uEJ6ZNJKoU0IG2kh0AU+rjLyxKGrJZr0YQEFdr61FXzNau5KyvXFyrfjPn3Z9YxEg1hrpq4
 9nHiBgQknrqncCa9akOgrJtcvM74QO5ypeMcZY2vw5YFmbsBjHPTk1TLEk1cnsM1UHziIBaH9O8
 scmcmclkkmZGx9YwJqpsq7HDUGXYxBXnyiDrRQUh/oa6QMOkCSdjOYyRUQHKWg23Zwtxzyww0Oo
 KOnEucRZFZvUrDPek+tDpT5WPFVH6xlgcf4RC6f2XkkGTQK9v7N7OsY/IyEBYjtGbt+utUqtSnO owzZc9hxRnRPe3A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Drop unused declarations after S3C24xx SoC family removal in the commit
61b7f8920b17 ("ARM: s3c: remove all s3c24xx support").

Fixes: 1ea35b355722 ("ARM: s3c: remove s3c24xx specific hacks")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-samsung.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 1cabcbe1401a..a51aee8c5f89 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -402,10 +402,6 @@ extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
 extern const struct samsung_pinctrl_of_match_data gs101_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2440_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2450_of_data;
 extern const struct samsung_pinctrl_of_match_data s5pv210_of_data;
 
 #endif /* __PINCTRL_SAMSUNG_H */
-- 
2.48.1


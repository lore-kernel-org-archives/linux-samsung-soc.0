Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9F722615
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 17:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706289369; cv=none; b=TRMAhXn0JFRIGVjH3LPvEKA20J1lgc12xXOe6xb0MtAiHwKFGmX5Gunety4uDjyX9+MVBW6M9cbNz6dD9Zsh04Fics7fJU20QQbVfkrnyujFE9eMOoNLgaJwug+eqQMrEhYRyymgPuZa1XylPvmLEBUJmXnlJDcsCujEs5ifjSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706289369; c=relaxed/simple;
	bh=raOIdRyhO8tHaPvaux5xDqf2Hk9QTHy/XAkEcRROgas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LC/I+et9ST9gc6IwnzM6Zezv54aqmO4CWJS5t1b17G1lQhCMURWz729yn0BNQefua8hze4KtETKtDuSwlcISUvSLzdUsYfjFv0q3lXQlPL6E2v6rwKQrXK6WI/Cl+3OF1raXeR8nstAm9l0GlhHCorJAHT/fr6B1isSjepVbEu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=afhk/5YR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="afhk/5YR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40ee82d040dso5844815e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 09:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706289366; x=1706894166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3BUKyeiRYW4jeA7TZoHpkhbR6vvjhTD7HPIsfioyFU=;
        b=afhk/5YR74/ZEy5ywVT8LbSHfOvT5u9TpYE3ou5/fO8jF9//waWgPQOH+5YPjdvaQa
         XEaYf++hM7ixBJ6UdSA6mew98hYKVSKYK/HGjHBE7t9Rt4cCwEPrbRJedvaq1pOmLH/v
         IjrLXM4LZ4Ll0rmzJ8QiqnOzsNHzdvisBNs6LmsPwjWv2a53Bvm7q9uKLQjfjhmnIc31
         sFaXE0ufEEmNXbHLi6oDQPyp/aG8E0OycJCqqAMRljITcAgb+WDDL2gdvRsBnDQmEJ/g
         hZDhE38pEclpER0kqTtYPF98AbaElDMBczjQeACwE1D7c3Ss6UrDov8ozlndYL+L0JSi
         flqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706289366; x=1706894166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3BUKyeiRYW4jeA7TZoHpkhbR6vvjhTD7HPIsfioyFU=;
        b=gZrwbvALRc1CPs1073dbOp462xi6TAaAcUgcIllNbgD9tXjiyGtd9UWdfCApD3xYKa
         TylFG4mC0a/ExSa+2Vy1JV4j/I1FAFxsJxX0OM5XxOuLWU1PnbcShO6KU+Nv2ydpt+Q7
         LwjTj1FCZ9NkhhJlDoi0wibYBFIhYC8sdTL1ksAkHDGFxUncKtDP2tmSaZ87Ea3IfQUo
         livPI40frVNVtLDWdZRl3eu+aypYdUImueP+yF2CD/YoTk63NZkaD7FLcUh6oSDDDlWk
         z3t8GGnhdpZ8OCwxkSr1BVBRiKvjb1jtC7zpxXGfPHFi0kzKqfK3FSV6FNJbM72vpj7d
         67Tg==
X-Gm-Message-State: AOJu0YyoNqlQVW7ZAMx2b5oe/LvbSFwUqoVoaB2yMMBDB9rmGuAPrbJ1
	PmCo7S4TGgN6kKR/9jspXdHMWMyDSqgXxVUbnHiAm4TqBJzLHYXvri2kBdHl/0c=
X-Google-Smtp-Source: AGHT+IGXA5OdbN/hZ+PSA1B3tx0eYhNTDcxU0ip6939VswQMQ+86fcDQfDoKgCsYLdXwu540N2Mj+Q==
X-Received: by 2002:a05:600c:5698:b0:40e:44af:8b1e with SMTP id jt24-20020a05600c569800b0040e44af8b1emr66917wmb.160.1706289366387;
        Fri, 26 Jan 2024 09:16:06 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b0040e451fd602sm6287286wms.33.2024.01.26.09.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:16:05 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	jassi.brar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 14/17] spi: s3c64xx: downgrade dev_warn to dev_dbg for optional dt props
Date: Fri, 26 Jan 2024 17:15:42 +0000
Message-ID: <20240126171546.1233172-15-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240126171546.1233172-1-tudor.ambarus@linaro.org>
References: <20240126171546.1233172-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"samsung,spi-src-clk" and "num-cs" are optional dt properties. Downgrade
the message from warning to debug message.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 08ba14adb428..dc779d5305a5 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1109,14 +1109,14 @@ static struct s3c64xx_spi_info *s3c64xx_spi_parse_dt(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	if (of_property_read_u32(dev->of_node, "samsung,spi-src-clk", &temp)) {
-		dev_warn(dev, "spi bus clock parent not specified, using clock at index 0 as parent\n");
+		dev_dbg(dev, "spi bus clock parent not specified, using clock at index 0 as parent\n");
 		sci->src_clk_nr = 0;
 	} else {
 		sci->src_clk_nr = temp;
 	}
 
 	if (of_property_read_u32(dev->of_node, "num-cs", &temp)) {
-		dev_warn(dev, "number of chip select lines not specified, assuming 1 chip select line\n");
+		dev_dbg(dev, "number of chip select lines not specified, assuming 1 chip select line\n");
 		sci->num_cs = 1;
 	} else {
 		sci->num_cs = temp;
-- 
2.43.0.429.g432eaa2c6b-goog


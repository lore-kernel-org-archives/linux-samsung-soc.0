Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DE74643A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 14:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707746644; cv=none; b=GJE34WCD4JSaOyHMqtSSudpOcsYEPF/CkEjDLc00nr6nqWpTP3NzccOo+4E9wSH9uUuqeTXACGHPI1qNomYKIUjcE0iERsvtAs9zJOKQo8LZPC66mLDTaELOpx+Bb4eo47eHbmOZm+ZOd99ZzvyQ9hGyMbvYQKmX2sAAogeOA78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707746644; c=relaxed/simple;
	bh=QT+y60mSzKIxUoqowiAzQyZMJ8QTQOIyVLxdngAbOu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtX7IAS1PU8xOXmTX3x05FJeCqZoqqoXUNMrx89Q4Tdt5ozkl5+nFTf6Sv+rjHAJhFRfNnIhwIhwAZLZu20k4lNF0ylhqyhRF50jerAxpMwdTWvW3443V2R7khoQMHgroYnqoKUNTTb8fwKj6ga7jIarAAJ/niMUvHS+egyijHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D3snOylN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D3snOylN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-410e7b08252so4838275e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 06:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707746641; x=1708351441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLhU5Fpjpt+G1J97uCF7eZiB9eQQAYSw34EErx851iQ=;
        b=D3snOylNk3noTRcTTnZuH9sGLv9aTOh4RITBtgGqT3SkEIKcRrBllPwBpvfIspiOLM
         09NYUTvpDGRdeAJ0jIl0dtKSgrpecLVy7mdHRZuzMd0VLPFCn/yOu8iCu19xwQmJi3Hk
         vijK7eldGAFt1Gy90enFDWohQkXzZOFP5wJoftPyvJz4I72K8MJQssTyIzC6eRMXukAl
         ZJo4lENz9ld/iOvcm+CibphLEvHJzObmoyjyJeAs6bb95ma62Fmpumh3Z4HAVTTmzfUW
         cN6+HsfuTvqLP7tVUxBbhTrpEuUzd/KQU5HdZY7l6opvy+jpZeJ2N5P/5spIACogqdK8
         +/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746641; x=1708351441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLhU5Fpjpt+G1J97uCF7eZiB9eQQAYSw34EErx851iQ=;
        b=Y/ed+cmh/A/4pXmFO2WEoAoEAknU7O/1ZNIhZ+M0aGkOmv9hnmkqru0uEt3VpH7x0g
         UI8Xae+6E3ZiVtnN5cNHNa38WK32zd7w869TI9m0Eycuj4x5YmOpN917nUD0wwYYHc8g
         qnPSfqrue80xpga4/ssDnVjkNDQYJ8ziU/1IkqUK0jyMh6HaLo45DEVFA4BNfNWcD5GI
         9v1y1sITQyA/eni3JYR1nfMhSWJgtabAp9KtexuaaSfTBNh0D+W2SrlIqAafqBaw9myv
         5JRWFgmXFkOiuv7tCASr5Eu1G+zNGiFQJTe3Y89vR0URKVTgehPlVJXCNlbs0jIv/T0n
         Uljw==
X-Gm-Message-State: AOJu0YyxlkjValyh2u8y91fJRH97Uo+jF+HZnWF5HvV65MsEXCC0tjTm
	6fEafMSkNtJu7+U391bsGVPeD7Irgii4uZqEDP9sqAtlWSyONb6cKdlO6/JpTIE=
X-Google-Smtp-Source: AGHT+IF/I723HEKivTWirm3wyE2xeXsOblRKelpXELYMdzvVNFfyRkU9wYHLuZqgHwIuGGr1Jyru9A==
X-Received: by 2002:adf:d1ee:0:b0:33b:649a:1a12 with SMTP id g14-20020adfd1ee000000b0033b649a1a12mr6445402wrd.55.1707746641214;
        Mon, 12 Feb 2024 06:04:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKfTIxuJNqeqR/0k79+N4mN8gU3DXXgyJK4cNRl7jc6UrPjOB03vSpehxjuCkSsz6/jiG7FClGbwtsjghFuNXQwQ9jn5Bzhh10HYoH+LR+iNk6rL+mkwWyVZC4tqZ7n4pH97ux2mhKRVNYLCuAs2pYCBzoxpPcb+Jg9jb9NSAOGY74ZqPLkz/sqrRPbBv9wt11ITpBvwqnJw1JGZCP/O3Es7J29u92JTs8NgUbXXt6i6nab3Qw5bes/PZRwIfV6Cqr0yD+Ct/7QXjG+cxeSpOxSxAwAoz9pnsl7zMGtVfecnl1MCsPQHBxZwj+2+l0TtGxx46UzXkMU+P2QhNduIeEPMqyteM6AsnisKqNDB7flvOJNoeLJOnB2GsuXnZM6DXxFY9CzWEXu1kHGm8qpy9NYoaRJstzXEVvZxPaWGfSHECTPVVK3eu17bkCd2cIoNyi+W3sy+QGOChsvnoO547YoF8j3d5eZx4PR0NSOI8TzCT6Rp1H/fNzG0f65rTc1S7Y6jFXWI6BrG0tpsagVTm46rbq30t2LGVeU5jUtYFgWq7Ifn3ug6m3dHpEUUO7vceZa3Auzygr3yeYeKcZnWF+GxbEKH0h78rK608lkQ910F0CMi0=
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d4b09000000b0033b843786e1sm2135356wrq.51.2024.02.12.06.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 06:04:00 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	robh@kernel.org,
	andi.shyti@kernel.org,
	krzysztof.kozlowski@linaro.org,
	semen.protsenko@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 09/12] spi: s3c64xx: get rid of the OF alias ID dependency
Date: Mon, 12 Feb 2024 14:03:28 +0000
Message-ID: <20240212140331.915498-10-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240212140331.915498-1-tudor.ambarus@linaro.org>
References: <20240212140331.915498-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compatibles that set ``port_conf->{rx, tx}_fifomask`` are now safe to
get rid of the OF alias ID dependency. Let the driver probe even without
the alias for these.

With this we also protect the FIFO_LVL_MASK calls from
s3c64xx_spi_set_fifomask().

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 40de325bd094..d2d1c9767145 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1203,8 +1203,12 @@ static inline const struct s3c64xx_spi_port_config *s3c64xx_spi_get_port_config(
 static int s3c64xx_spi_set_port_id(struct platform_device *pdev,
 				   struct s3c64xx_spi_driver_data *sdd)
 {
+	const struct s3c64xx_spi_port_config *port_conf = sdd->port_conf;
 	int ret;
 
+	if (port_conf->rx_fifomask && port_conf->tx_fifomask)
+		return 0;
+
 	if (pdev->dev.of_node) {
 		ret = of_alias_get_id(pdev->dev.of_node, "spi");
 		if (ret < 0)
-- 
2.43.0.687.g38aa6559b0-goog


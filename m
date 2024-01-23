Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0F360DCC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024080; cv=none; b=iukckHcq63MjhOA/R/JryrH6025gYdnqPowN9GcjGIcy8NDzE2SqAbhOy1Mg60ENGiT3EPM+S9xTlgd3rBEZpZCkJmjvrxatsv1BDRlVJQqw5Z/vOdQb0FtoBl2A8MyaLeh3tT/SiVeY2URGu5Hll2yHakbtYgzF6I3n1GWzHww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024080; c=relaxed/simple;
	bh=azFcV/mgHmxVyLvuazK3I1eqSDB4DgGiyfhf9SMqDgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggvi5rYRkLcpMyFRFBTkRUQHSxJgluDSIItv4nI/AO7mZtGWPoDMuSKoakqYHjVXbpbSbY8E4o5S4MW+QFMNgJ+Y3IGFsPvQ2A6g0Cdx3QgLJUSDLrhnEXwa+PujwI6hziQPfE1KXcJUJods0O+ME2rFRnuH0/7s4oroWWjswpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mpekW4G5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mpekW4G5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e913e3f03so56392365e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 07:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706024076; x=1706628876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+YMzDyGNc/zXRSdUvNiD+W2fMYH+c8kFJSxO3iDixs=;
        b=mpekW4G5d289qPbVUvpkAx8dBz1CQgT4/WEtGZYW7xdwyvJSb9jRMGSPwByj1kCtgF
         2LdcPLya6CDBrGEfsyh2EV/dJdPCVn3YQ4C0xEOFDCy/Eu6OUXZu27B5pyfGy8fcYsxl
         52TuZpwdJlbRz88Wyc/Ou58kG9b70Oelvt32wxIZ05LGnT1mK/egInn2APLvu4brVNQN
         3enQu9MxqjIZoVvFdlZw86KAQJKCbxWuDeZ7sJC6cNQQDqkgGPK2RO8uOH1CWZiuP7NY
         Z37j4r6HSoQyIzT1xgKfjEDPcNlSJuJAT3JTstiqQAWY0E88S3MLVMrBB7NTP54WiSj1
         S0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706024076; x=1706628876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+YMzDyGNc/zXRSdUvNiD+W2fMYH+c8kFJSxO3iDixs=;
        b=OPnm717bs9gAXDJgRpCcxyIFqdEPAt6IUYyBiKo7A5G4gZKPiAJ2GyqRuKF+7PskfU
         9cJjv8gbPujUU+ysL3CGFCz/ChzSxAbH6WJc4vD9wasdaSt5AuYCNHvlJ3qzkKR8sSfV
         Fl/HsGZyxVz6XN2PLB3XhHsFJRR0xyKV37x8H5j9aoXg9ZntyQplQ979Ml6Wn8sHllfY
         A00d49J/IABq+OgbzKvIcTab385ps9s7sMR+GuoEBxU7YsMHdATsb6m/IXZ4eQmD8Wee
         /Ah/2G6lkrHU/duycGRRuhPe976mmbgw685dkF2Nei6lEX1ecwhrS+E0g7isvb+df7sx
         8Neg==
X-Gm-Message-State: AOJu0Yx7u0aCJpYNfhUXWagM2OTL0x/op2zFE81+NF+55xPBJnA6PGSb
	4ZAKFnNjDe7rY8JO1m5vAWAk4VDw6ETKsPXRrhX+a07EUNSTMguu/P5TcLFJydY=
X-Google-Smtp-Source: AGHT+IHzfN1qnVR4UVsM9mJTMqExDKUWTqRX/JTb9E8bTyCwoGow8h3nokE07jWiTAJ313YlGKAHHw==
X-Received: by 2002:a05:600c:12cb:b0:40e:4179:d060 with SMTP id v11-20020a05600c12cb00b0040e4179d060mr280263wmd.65.1706024076431;
        Tue, 23 Jan 2024 07:34:36 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b0040e3488f16dsm42457536wmq.12.2024.01.23.07.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 07:34:35 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	arnd@arndb.de
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 12/21] spi: s3c64xx: propagate the dma_submit_error() error code
Date: Tue, 23 Jan 2024 15:34:11 +0000
Message-ID: <20240123153421.715951-13-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240123153421.715951-1-tudor.ambarus@linaro.org>
References: <20240123153421.715951-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the dma_submit_error() error code, don't overwrite it.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index cc33647eab14..2b088a190ab9 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -315,7 +315,7 @@ static int prepare_dma(struct s3c64xx_spi_dma_data *dma,
 	ret = dma_submit_error(dma->cookie);
 	if (ret) {
 		dev_err(&sdd->pdev->dev, "DMA submission failed");
-		return -EIO;
+		return ret;
 	}
 
 	dma_async_issue_pending(dma->ch);
-- 
2.43.0.429.g432eaa2c6b-goog


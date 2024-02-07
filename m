Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA805A4CB
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307492; cv=none; b=EjpJkdoeXqQM5+TmNMZIGIX1ICQTYehlBy1jSY9dmDJ4XXcdsrlOFwMMJlFqfd4JjfeVAYE5k6Yzr5ZItNPeG3O2kZ4hTKFq/IoJ8JMRpnFtjJ309wVD63cfI813LH8C9LySFXwCyVB88y8hHQx3TcAuIadQLnNmgnxmZySWRIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307492; c=relaxed/simple;
	bh=PPm4DlAfp85sniPjf5hXivYfBycvC/yIAOilieHqH6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+UmGE4E6lWPy+aBL87SBBoGGxhWMcq7jDg0DwOOqGrV2EIUbkxMGAMJbpzsAZfzD1iNOg0EOv9UOZ2hXAl7aE7A3CwMK1F/fzzFft0YNtZQ7IuBY0RbxMSU3yblw6zl8USU9VMxn8dgDCt+qbyDtdvdu7zL2leAkL6c4xrqvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EmHrfdAV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EmHrfdAV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33b29b5ea96so321192f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707307483; x=1707912283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1q8cSxh6TrpypO1wLgThCm1+mYzOLff+IUVZOlpZ3vk=;
        b=EmHrfdAVId5MunvoG7KGkeWT9o488d06Zf9wHg54KyTKQC4ZZoOs4Voz17+RQjruu+
         NMboEPNyfCfDMNvuaaE/SAL0U/uOW2uyREAtxJpp27Z0hrhKiedNA01aY7a3FSOHe3xk
         wp7Y9w0IxH/dbaGSN8vJ8xIafqgguabZwercgIWYLvS7ns4U0OFTEcxXJnGNRKRqBA9s
         UV90Kpr4ODZ1sl2DoH56eid9OKLGu4d5j0OG9idDTras0cehOpzKVjgQYq5Dcbgj/YW2
         7UwubKfM2DuxUBLo2DisqztReA6FfIXN4+Sku1q5k5nmS3IpqRfQooA2JCNvFDH4afqQ
         3evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307483; x=1707912283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1q8cSxh6TrpypO1wLgThCm1+mYzOLff+IUVZOlpZ3vk=;
        b=YY9iORBmp9RWN0AQLoblZIBQZgUBlbDrnZipXvfF1EwTCfwD/cD0mDrUhzRftOjEfX
         SFtFMatxpHmYtMlz8N6u2ewxDlNPeBfFQ3sztY5t3/Gj7D0B1dBl7pxoiCwMSW65HD4F
         aRJu5lJm6TPuJXuSajOxXovhQRpKPDiWOshzCL11H2xwITpi2kmTa/JbyI9M9UIDcjQG
         ukD8NLf5Cg639opxektl1L2n8ayngquI21x8ZZq+TnCSjkgu9nIJex1kjPbWgwMuXv63
         2zcgQ1VgrRvOoTeXJf789XBpVAWJ75LqRQuQrpenvapzB9p5mkccvFRM7JoonQ1SBvKT
         zYNg==
X-Gm-Message-State: AOJu0Yz6c6HhAhpCZeiwggiTBD9ZO2bp88/j8hLBtP/s3ISca88T0mUZ
	i1Zz2JT6SPUklO+hYT0uuTKFHpknz4yHtxH/guG/S8ialLqjURKIijfRJO7s0FU=
X-Google-Smtp-Source: AGHT+IFVobAsTSE3Uc/CG+Ky2imtFMA2qH3wf0hCDIYvSbPcVABLR9T6lhsZJei1D7b2E4AFsxdrCg==
X-Received: by 2002:a5d:668d:0:b0:33a:e9d5:a760 with SMTP id l13-20020a5d668d000000b0033ae9d5a760mr2947738wru.14.1707307482943;
        Wed, 07 Feb 2024 04:04:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjUIH2HOb3+v7DmYuHoRwUvrh09L89YHciI+ZCWSLcJmGofKMWoB6zUYAffjtzi9pOI0QqS9UZIF9xFutPY+taQ2lbl4joIY6ZHMQCdAlF0BDoCoVAM706ao++eRucDEUupgSNrUMI6UkAKvOVJplYfzDgXoWBgzfpm+DQ8/LdBAbHPbLXCJKFZ3Vxjdqij7KcjbDqM1MR7I/JqElof1ZQ7vGf4U7aKJpqrfCchA6HQZhyO1oj+u2cEOXMPu6Xi8WHikMTL7KTPCgaFsW/mc99t5wMdAl1s14PVGotT6iziI24ONeTqX9cXgzr1YK1cDn/2GJWYfYf68OykP9Q/jc4E0bP8KeA6CFLrNZ30o2uVMNgwL7WkgBDxW0IHYzNmUIs9azXACpoVVqlQ1Eh6v6yoaxDjmTxM6cLD0WgjowwCqWVV7pI1bKvn36GrEeQ80BJGaLvdOiIA4m5GmXt6qGrvE+ONXgNyaNhTqzMepfr0i9nLAOpEjnwGpcX/g==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d644f000000b0033b44a349e1sm1349967wrw.38.2024.02.07.04.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:04:42 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 06/17] spi: s3c64xx: fix typo, s/configuartion/configuration
Date: Wed,  7 Feb 2024 12:04:20 +0000
Message-ID: <20240207120431.2766269-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240207120431.2766269-1-tudor.ambarus@linaro.org>
References: <20240207120431.2766269-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo, s/configuartion/configuration.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index dfe78ddfa233..93d0e55e1249 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -182,7 +182,7 @@ struct s3c64xx_spi_port_config {
  * @cur_speed: Current clock speed
  * @rx_dma: Local receive DMA data (e.g. chan and direction)
  * @tx_dma: Local transmit DMA data (e.g. chan and direction)
- * @port_conf: Local SPI port configuartion data
+ * @port_conf: Local SPI port configuration data
  * @port_id: Port identification number
  */
 struct s3c64xx_spi_driver_data {
-- 
2.43.0.687.g38aa6559b0-goog


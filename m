Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889805A790
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307493; cv=none; b=d1pkrOoH2YiByi19UTslNlPCyFMHWA1CfPpbGn8ccjuuWEVXnMUX/5sZ3X7iKhBg9mO5TTv8lqQMVFZpDJfIvMeCgusA91rzyAaqlgvmYvrwN+VidbftWc1jYsiI2J3qDotxLSQdeOGx/yJYHE72zQqm5hi4Mi2w/L1mmR5S6FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307493; c=relaxed/simple;
	bh=5yblC4DYa+83TmHABcaUQaBMypAvRcd5PI82cq++E78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpwu4qAL2/J1M95qJ6swflQPXwGM7Ruqle50TwCFCgar7Kev+NNyL5qvxO6dZCD5SmMqUu+VzmbmZZx4ubPtRbP+zNUPC+Kz4I0l5LgRWhuWGjB7EZDny6S8bmf5lp4mSgejebMJi9ZhppHw/8DjaYpFfz25Q8vXHQxz9MwGjbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfWbWomj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfWbWomj"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33b0ecb1965so420237f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707307487; x=1707912287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYOYbNjp8q3KZ9J1S3sEcmw6gmM/Szj8HuSkdRWXI4k=;
        b=nfWbWomjMQRtFji2KWC9OmZUrDPTDjSJ+hFW8GnPTy6OdlHyujHHZLhijbFBBZ/9le
         4BRKDqZQxlrA6u38Kl/E8bF5maappV3awqRf0A3giBk2BRldMYWBZQ016z51lIPm5i3u
         T8owm8U3HsAr4D9bYPg758ELrEjbUPdIonXQpMsU3u79/55e49zibxalFJB/TTsqRVkr
         MxgOFr1aA2x6WhX3nuML9C/tdxZ129s0Qq9DbGReUuIZNHQMe6/EKDRhPvGLQ8GnNn1F
         KH8oLMILy+MqdR5pBR7zJ5xodXpr30Pv5tcebFLGWbFgp7uX0xBsCFHXXu9Jcja3vYRN
         Scgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307487; x=1707912287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYOYbNjp8q3KZ9J1S3sEcmw6gmM/Szj8HuSkdRWXI4k=;
        b=mMPC/yhEv3/StMXJOID9xjlRVMO7xU20Ko5GZVdg30V6G13ndKf/gBf6Or8FXdCboE
         QYpa/Yyxm0qyxY6OUdAVHQZvqESvzqGBD5zaQt9SL3qq4SWBoXtc910MiAC+x+PqJ2TX
         JLF/x1ELUvtZTxecJw11+d48h5uPDlk45z6qUGspbD+qsds4Fkr2HWNsIUNNAIP6KP/S
         2GhVp/9Yo/kfJu5Io7PJsQqMLRM0N7KmxLffT9uRxf0fXbFmuHJ4eFhNrELy9YmvxGFe
         rtUippPFCbJu80pkKpUxMR3jyR7U/2XoRbmlcBrYolqFI3c4qRloO4T03mk72jE8HiHP
         wz8Q==
X-Gm-Message-State: AOJu0YzLyWejhTb3cETBB14fzrQe/xXlukEczvMeOhsznb8CqThGXphM
	bPvGs0os8FbrZ9LFCJRdBLfToMz+a0WZPw9+eZR1StksQAEomEhn0EU2umInt1o=
X-Google-Smtp-Source: AGHT+IHZddiwCD4E4fn4x0Ro9O6jst0BaUSZMFu9cJdM1Z4p21wwP8+SqVAjqMHPluqWfYL1ZsQ+pw==
X-Received: by 2002:adf:e80a:0:b0:33b:10f6:151c with SMTP id o10-20020adfe80a000000b0033b10f6151cmr3549908wrm.53.1707307487237;
        Wed, 07 Feb 2024 04:04:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtMozbSsRdSCEaMFMJZbFv9kuZr/hjz6zmp7GQ6L59dxFOzKCW8fwDm72xAABI7DneH2cyu5SCP8KdpzK7MmnD+C2LU9gIBj/b30sBsVUi35Mhhop51et2L6wzoyc9PsRyssPwwT2tWMe0jmMTA4WLGA0UGXuUK8YWr5U0O9cs3XwxCeoB1iWT/PdGaoju1pXkvQQDYrSQZb9132pT53pPbSeFnr3TNLdXBg+wUqgpPS5d422XU1cASprBkpP3mon6KuSs2TwqBbgXp05nG/BdHbQMuYJB3ClWthJ4xXE3sT0nYdUoN58Za5EJ2CRYBC7ABA+HQaGFCI7LYgtwRC9+t7thRx9+lYCeHef25wzQvInOf5lDECH3Mbzj9LlcT6nKgvnByzPdJMFQI9JBCo42f/XZuWzvcF/FTnWducUf7RjQkUpPXupwOKOMlKStpGULv2z/UEM3bvyZsghrkal9aJVmIl9s9mpsgvcim+95ZpFBQExi8Ouvt20VpA==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d644f000000b0033b44a349e1sm1349967wrw.38.2024.02.07.04.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:04:46 -0800 (PST)
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
Subject: [PATCH v5 10/17] spi: s3c64xx: check return code of dmaengine_slave_config()
Date: Wed,  7 Feb 2024 12:04:24 +0000
Message-ID: <20240207120431.2766269-11-tudor.ambarus@linaro.org>
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

Check the return code of dmaengine_slave_config().

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 4ce6cb3b43f6..1f7356f6e5d2 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -305,7 +305,9 @@ static int prepare_dma(struct s3c64xx_spi_dma_data *dma,
 		config.dst_maxburst = 1;
 	}
 	config.direction = dma->direction;
-	dmaengine_slave_config(dma->ch, &config);
+	ret = dmaengine_slave_config(dma->ch, &config);
+	if (ret)
+		return ret;
 
 	desc = dmaengine_prep_slave_sg(dma->ch, sgt->sgl, sgt->nents,
 				       dma->direction, DMA_PREP_INTERRUPT);
-- 
2.43.0.687.g38aa6559b0-goog


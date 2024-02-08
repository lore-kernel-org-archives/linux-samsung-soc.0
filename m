Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE847B3C5
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Feb 2024 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400263; cv=none; b=hPeKl/mlQZeAv+M42Bd+50Zp0WxkSScLTuOf6hneTAg/0RY8NpD9ojvGoFWomV68M6GQR0lSWwqPHKBy6BG1h+vmF1F46BB7hiaRfd+Jo2q9DlhgjSTJoFHCUA4BPEXXHnKXXCq7B9eznpvYALbiar91BRiqBYX9i7jlxs2TCX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400263; c=relaxed/simple;
	bh=LEhcV/DRGuck7Ycrdv2oDV0m9G3uCaehI82ftyxYpr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDlfoD7mR+MaMOqlKavwpgz+u7aY87OgB8MZ2fmuxAi0Wogr7JDL4Ydeh2aU5mO6xZh66Z+ARUJQS8+H4Wk5ttquZzRZMYyX2SlT1q4NA7bDdj+DpYrTqdmaUq5pM4d/I+zaMNhTWfF6wB7bvI0oyT8SciJY/z9znLSycHQZoH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zC6yuWek; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zC6yuWek"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33adec41b55so1002788f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Feb 2024 05:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707400259; x=1708005059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbvKAanWHb5NHCc78DYWj3IudYbRJBQeeD4twXOiMjs=;
        b=zC6yuWekFYcrKiTWNl7Irxn4vEeZ17gByRyi+df/h/PvJNCK7b3T4R4EHCimll3BKE
         nIClfBMPifpaXiXO+WRIt+snDCL7l4wEkZfx3mP+wVgxzgPvDsI0FuftZxCAhzSXJ5Op
         7q5vdUmcIyGKAoA6oINY2QqJs5nj4fC60ATlGrGoepcrurHhzI+J7m2x6o2p9X9jwhDB
         BEV7O2mhS7Fe18rCIIfy1I8egOHHDdlIFDiek0IzFpSGPy0EcU+O2GkIf56BgaWAVkR4
         EC/u0Du7oYuAV6Ikhk+zv39prZO5ew3p/9AZn4PsBxjOLrHRqY3pvEw8grKp11JpoJCp
         DbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400259; x=1708005059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbvKAanWHb5NHCc78DYWj3IudYbRJBQeeD4twXOiMjs=;
        b=Su5NV+AUnDkqz0RC3k8Ml+XjLclBNgkt2b5YIgqTQyNfyhxLJKOG67nytB0eMdnTEu
         a2LfNvDMIU8YNwIqx1Z6DnMk7J+0r/PyU+I8pAUTIawmm99ZlknBt6fE+gmnqn26YHdO
         8Hbho3SuexCzObv0soLz7FCsZVzTgQWRfTlENWfOZsZVg2pGIY3hGJF4kz9hpSfsr2Bu
         BRFxK/c5+B9zcjBoYo3bUUuoJBe71b3NDIgjE71In7GtJHfbmaPkAdO1jpet+aLM5LHU
         Ub8KPafqhmyJ9NZvNASEdF3P9iAv+lraPH+/+u0fkQziZOyySeHVr5kRn8nlvXS4Mdqf
         QD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWx9K8LXSFDwoIdEY+RVL73MOrgvr9Ei4zI9LAsmlK7DG8U0hEefy5Z9gXfnYDgSGE9TZE4hX19utOzw2KFtb71WvdfuW665PrKxLSS/BXPAZc=
X-Gm-Message-State: AOJu0Yz0+G8S8xJfnTe2fG8Iqo4QtpA73hf5dvFnnlt/FO+oBCWHlod/
	FwYG13uFQWGBVg3h6K6U14E0k9K5eL0YZStZflgD9+pvTXtJzYdO2oEPpIBwM9I=
X-Google-Smtp-Source: AGHT+IFUzkhaUujf4GgqWQ0I1+zvgk1H9UB+yBEfAIYSdQoxRsOTICmWA7epBwEcg1Dj+k6Lb4Mawg==
X-Received: by 2002:a5d:6da2:0:b0:33b:48ee:87f8 with SMTP id u2-20020a5d6da2000000b0033b48ee87f8mr6419735wrs.29.1707400259539;
        Thu, 08 Feb 2024 05:50:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxecFnI5ihH/Uv6xAE+LBWZjq1Z4+yqXFAecpGoWOAMHQ29fr+wxVlBVy77BGkFo03I7SflzCMNZ5/D8ccCrjyEkEb63tIKUq1geecG3Xxh4kF6UkySVvixJ3u7nCL2jhCh2AKa+J8zjx56TuczSW8oh6o4dRRhagDl6MCwa4HOWHstI9QrOl7IjrLsGnk0fFTELH98+sHwIL3X5BHto5JRZ6mnl/xcLwjdbr9bZ+9HcYGK8ZDEu0/7tWqd70cBaAhNBIlviiM99BdfEgcdxdUCvLBaXA80NoSLWRn2D553cWEhLp4Gtg59m/t6L/G//O2Iv3iS5RPaAkEw1FxJ+/O4p/6CiU8QnlyjG9+/KAeM2akjgLJJehEc/7Bxe54BLQtqSitOsFB9bdxA239Zwes/r/F9svXbWNlJVE/Zhv+Es92ZBIlO+h/F97UsvmnVliTGrECuX0ARQxcoknXfkRAJCmku/VZRUFUTg9RYaWjzskW8oq4bdE/wN9jqypjttlQg/MbuD5cs3+Al3R25qPN2By6QkJuL3ph95ipsKRcUrB1376CPwWjkBtDm4yvS3qddVVm4WXFf7ylc+90yIM9wLak/jGUYYYJsmhx/Q==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id m20-20020a056000181400b0033b43a5f53csm3618820wrh.103.2024.02.08.05.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:50:58 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	robh@kernel.org,
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
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 07/12] spi: s3c64xx: let the SPI core determine the bus number
Date: Thu,  8 Feb 2024 13:50:40 +0000
Message-ID: <20240208135045.3728927-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240208135045.3728927-1-tudor.ambarus@linaro.org>
References: <20240208135045.3728927-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let the core determine the bus number, either by getting the alias ID
(as the driver forces now), or by allocating a dynamic bus number when
the alias is absent. Prepare the driver to allow dt aliases to be
absent.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 68f95c04d092..ac47755beb02 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1279,7 +1279,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	sdd->rx_dma.direction = DMA_DEV_TO_MEM;
 
 	host->dev.of_node = pdev->dev.of_node;
-	host->bus_num = sdd->port_id;
+	host->bus_num = -1;
 	host->setup = s3c64xx_spi_setup;
 	host->cleanup = s3c64xx_spi_cleanup;
 	host->prepare_transfer_hardware = s3c64xx_spi_prepare_transfer;
@@ -1360,7 +1360,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	}
 
 	dev_dbg(&pdev->dev, "Samsung SoC SPI Driver loaded for Bus SPI-%d with %d Targets attached\n",
-					sdd->port_id, host->num_chipselect);
+		host->bus_num, host->num_chipselect);
 	dev_dbg(&pdev->dev, "\tIOmem=[%pR]\tFIFO %dbytes\n",
 		mem_res, sdd->fifo_depth);
 
-- 
2.43.0.687.g38aa6559b0-goog


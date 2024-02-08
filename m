Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9635B7B3C5
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Feb 2024 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400266; cv=none; b=i6xqudrysf7vi0ifeDDw2Hk6CqOOpzYCk3fuA9dxu64vCmDhILD7kDpAyotP1ItyNdDN4aVJ08u9OY2imSxfsc+1RVHxBU3GH+if7B0z5MTEADgncgj4vp58ZmxGmkAmQa9s1ZooJq+ic0HbdTqzGhsEsbBru7rKyGDR9/e1X+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400266; c=relaxed/simple;
	bh=QT+y60mSzKIxUoqowiAzQyZMJ8QTQOIyVLxdngAbOu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjPwMz1z4K74OHiQkD7w0YNGU9tLqzsFE1TvU0ZMMXpnbDSU/F8Ucfs93YO3B3sLDzSz49ReKDM18ScAGc3YGlHualQdYQNEHsNc0l99bytvqecr45ldq+bGjm3vAUNPa/Gu18n3yCVPV5oPWTQ+zRjhGo3Xoj98SFenoBsvWAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cl0h5BjN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cl0h5BjN"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-337d05b8942so1365314f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Feb 2024 05:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707400262; x=1708005062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLhU5Fpjpt+G1J97uCF7eZiB9eQQAYSw34EErx851iQ=;
        b=cl0h5BjNN8DyUlxviFov3uzqJ6AVbLA4WK8+cEA49t2VDNWiB5IKRhIgHB7fNPyjyI
         kLHGhxtS7eeqhD3Us8aJcPeUy+Kp5vCMIYoAuBpZPF52DD31Lu+5Jwbzs9l/3MpG8Qmz
         C87lgfsqWUelSs7RwrM7e2OOTz8WoT5gAfuMM3gODB9MkT3tPotMbjFdfdilk2THfY2U
         Lznsnr1E2l3JEehJNzrDlVWdGVt2d9iHbh+TSPvFFBEQGN8tu8NMzRadCIYhJaWJxdq2
         MNIjyqHyIsRA8PMfFnAaZ78JPxvnULJlBsBieXz1Z8IF+xMIdqq7C+KI65BHjeaVu79F
         3NKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400262; x=1708005062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLhU5Fpjpt+G1J97uCF7eZiB9eQQAYSw34EErx851iQ=;
        b=o+8ZsljkKw7w/u4+MTLIzGi4Rv1Ql66BLNfDV1etng6s2qBi+2T3S30pyqOfDGT6RT
         IcPM0MY0Wyzix9GOBZPzPfSrlS0aprGZJ/+9gAzYbYfVTOGpycBBcyE32iYXTZ/7nWmP
         Rn8Gocc+G3hQym4yYFEY23yaQbH1fDIV/7xvh9Z3KSO8wrBu5DZAy7Ul3z4vOrI6dFgg
         ca1Si+7zt0Uhd2HpECw2rrZ03Pouc1W+0YpeVUUozjs0Teua9/n5I0Dk3L+bfXtiD8Rp
         fRHJrJehIGss6WLTQS0CpEyWnsWE5xXtD9CkirUQief2j8Tea4JfwTiwfmAvJXMKc8Y4
         V3Dw==
X-Gm-Message-State: AOJu0YwDJBexzsVCJoGfYfXrUSJUjN5XJzWgTIy9/bfBmzmDK+a1ZN/X
	l8raqva/tJyLsVr4kbY4J31NmW982G+4BeRFjtWoDf6hUbS2yph2DtVYEXLXq5g=
X-Google-Smtp-Source: AGHT+IHns+BHVtFEhDBzkUaUKThMIn3Nm7jvYrBz2Aa1EQ9t5XpIkI/Qn1V2F2YvYK9jf4N/ZSjxog==
X-Received: by 2002:adf:dd8b:0:b0:33b:305c:9de7 with SMTP id x11-20020adfdd8b000000b0033b305c9de7mr5933626wrl.50.1707400261850;
        Thu, 08 Feb 2024 05:51:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX04YxY7bgIeT1zEkAUAWfw+eajcEdLz566pIWLkq7UyfhJITAPdzpAmxdhazwP9CKDa9dqAZD8ZW8QLjVrNLySP8nj0zk6xDMKFiCF11PLrF6F9hGj6tj7aWYbNqivvkD7YAsUSwwZh6fQUo1ZX64ErQVsJuHkkqAoZayobB6h7ZwjlMJsJL/+KqDuCNBDM+bbg5vEXeDak7XlOTGKIiGwgHa0MoZJs5qV7v2P54iLMyqqrhvYqpls9aMaEt9+Uc/YoSs3lEZ0U1A1JK4V9461747FL3Rwz2Wb4ZUIkJ54VcD7cU10rIq1uVs42k00LEv0VWQohNvnxT+JM0/ncIjjMBfdBgV5l1S1qiylExzlQ0Amzd4rgi7riJxXsKZhWsygyNdI5/6SaQLvycynC0Bl25D/QqbM8Kf7/AJ5Rr+EPaReRkMkSxdOdpgjN0r/2xxDe27PSWc5/DPIeapY300GcnCbH1Gb6hyUR/0WjWgHd+A7cSaxwwg75h1ET1rwY42Zz0rQEywyu5K2SFQKbDR9x4I/IRuJtJGcDLdqomgTLE0hteB5UcqjXEGnQD1oMO6m65aygL8+A/ep4Sd5/AUPm3Alt5UGQqJZgYk94g==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id m20-20020a056000181400b0033b43a5f53csm3618820wrh.103.2024.02.08.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:51:01 -0800 (PST)
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
Subject: [PATCH 09/12] spi: s3c64xx: get rid of the OF alias ID dependency
Date: Thu,  8 Feb 2024 13:50:42 +0000
Message-ID: <20240208135045.3728927-10-tudor.ambarus@linaro.org>
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


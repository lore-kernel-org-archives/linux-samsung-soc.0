Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F6F2C877
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137133; cv=none; b=YfWlcdaUPHTgfx/GiT8u77soOiHy5pFSEDZl8jJK1sumhRir9ydY2lYQlVGGPomTo8KGre6udFj9m7s1OuHXvYAhsZzt+LTx+kPa87O4xvf3eA12tXlwJ+pGfUncjLwY6YDH6eWfygGfm/IWOvh6IUx8cCbJOVRPJb7VNX7i9XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137133; c=relaxed/simple;
	bh=+SyzjPnMT/SK+rtssQCg1kucXywzhF3SnUsMWqB5kHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyK1QVZ4n6TA8fXjne1r1GWQhelqLEPXuWbhlq6rDDrQ+w6gvAe6c2o3/o/gWbgB2BKflRsXn7oZKuRj3te/kesp2AIPItZiMPa6Uh7GCIEKA3m5hV5YDjSfUQ9QFXcG48WOkb/cUF2ETy02y5Iib3z++DW4y03kLJw1QY1XaPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rt6X/xp8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rt6X/xp8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33b18099411so730033f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 04:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707137130; x=1707741930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMdPKuCa+A0pku+lpKMRGIhG3kodHHE5iXFOt26r9zs=;
        b=rt6X/xp8dU8Jcuqj0H9VP/pZ0rtbWiSR5mEI1wWqNQZacpub6W0e8fIDpKGE6TDon5
         rxOkOaSJv5GkzCPf5Sq+Kv+j50iIbMYZhBrKGcBAzQPHd9+4HR25MYnQHYNCTATgWoNR
         su+2CpqPd1AhzQK8WJf4reFISSvpe5QoBBCEhUyoMzXo7ryoNTV9RIecHVXeR2HhMpcg
         r6p3uSSDMDN7K3iLmw+ZMIKRuhvSYaevkqrYU5tEa2+zFbqHLgDf9UY64ALQgAyDyzbF
         Pi+g6pGKY6H5Bmp1z+KWyndgbn0P7VQFI0u4t2Pu7KnPEP2JJ42iU5pA9S3orK1y9yrc
         xVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137130; x=1707741930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMdPKuCa+A0pku+lpKMRGIhG3kodHHE5iXFOt26r9zs=;
        b=ovrE5GGTLqbTjxewWKWVAsJL0pI1JATnvtFhiqQolot9dKayKy1rSG0T84D06+P8aN
         GNh1TCKgyyroQ4lMs8O6ArYwtGirWUPHIfQxsCDY5M4wzYLFCQBFji5naUBnw1QjqK5J
         4P9nxZkbYK8c0W9uZgJFQN2t1BRrT3KuTbk+NFh7poW/X8vdVa3+u1cGPEgY7g09JagN
         h6pUBGPL9mhLzpo752MPb24BkJlOzSYfHCN43GV2Ed7rZbNw6ETCvQA3cTUOQWujHoJa
         cZK/kgeS1YZdKfUh2Lj6FIjiP6oY/0LZ7dyw6HkgkcwBKTXioDOe2SJF6pc10kCFOhuH
         Pmzg==
X-Gm-Message-State: AOJu0Yz4HpJvjUl7SwU34vUs5MI8E9xYuIzCvA6xlur5EbGQUTFCeag5
	SjH3a4I9A73NaOEFEhll5ldAF+pT7nJ1ACIlVr1fbC6CZ4p+4NrO6BvD69TgarU=
X-Google-Smtp-Source: AGHT+IGossleR/t3Dta3NCg2Z2WPIoqoJE6vcP3vID1Krxh75KjzP3TERTiV74XdiyGuaLtdV0xObw==
X-Received: by 2002:a5d:608e:0:b0:33b:3d6f:7a2e with SMTP id w14-20020a5d608e000000b0033b3d6f7a2emr1870007wrt.49.1707137130247;
        Mon, 05 Feb 2024 04:45:30 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXg3qJOH3WJfmlDrm2ZHHrIR7JlWC3n66rAo3+txIBb+YdC1ewlKXR6QRNOinsD3/ORZJtHBzvEvZ/0t1Xnsi1Pc7WBZOViqG6TZhbIrRxPFDFOUWU6t2Aw6WbbTTLkpru1N5NQP1Jm0gPjsWkzx9ma/8bhKWO1YqaDBGuImg+p3Ve+if6M/tXtMWD1B9t1NcnrGaHpoyDuT47xg7eRyMnefKyv5gYPFUOcY6ypLx77FoIe9+ovMJMfwGhXT0rB04bv1GFTgcTlIOqrVbdHhRk1CiLtcQofE5Y6S1+sKak+XYw4qAw0Dj6Re0R1UniB77mBjiopJW8hEqafNZ1d4k0xSjQIRaGwT6g+0iHZZC8BcP/qxQyIFX+nSe/ts2IGcVeLhX0nWuvsQ6J6KgCPkWT8Df3lfnsPT7J5/qzXr56uwXt1/XD0WLlimQ4/XNgc1AwNjJvlRRcOCAlciIkOHFM+NA3Nbk+2bbFTkm6UybgsBtWaxiINQSu2XSz9Vw==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id n9-20020adff089000000b0033b35da384fsm3650812wro.33.2024.02.05.04.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:45:29 -0800 (PST)
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
Subject: [PATCH v4 13/16] spi: s3c64xx: drop blank line between declarations
Date: Mon,  5 Feb 2024 12:45:10 +0000
Message-ID: <20240205124513.447875-14-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240205124513.447875-1-tudor.ambarus@linaro.org>
References: <20240205124513.447875-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the blank line and move the logical operation in the body of the
function rather than in initialization list.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index fff430b9e849..1b84f5fdebce 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1320,8 +1320,9 @@ static int s3c64xx_spi_suspend(struct device *dev)
 {
 	struct spi_controller *host = dev_get_drvdata(dev);
 	struct s3c64xx_spi_driver_data *sdd = spi_controller_get_devdata(host);
+	int ret;
 
-	int ret = spi_controller_suspend(host);
+	ret = spi_controller_suspend(host);
 	if (ret)
 		return ret;
 
-- 
2.43.0.594.gd9cf4e227d-goog


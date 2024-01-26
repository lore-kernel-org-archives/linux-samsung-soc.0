Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443BB1EB4D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 17:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706289353; cv=none; b=KcDbpS/rqPw2BijOSI5hVddYOVK8CjAb1Fn+DbvMsdvzra0lDoZDLJVjcRVcS+ca8X1oHK5vYHZGkrqSrXQgQUpHyqhpPuYCYRoGoy2REQMZAEnOH+qn1dF9BQ4YVHRioi3wqztra6V4an2vOG2pJ9WBOPsIcd9EZW2oNDqbXWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706289353; c=relaxed/simple;
	bh=c7iSgUJTrECnQEQ+PYY72b3yXlblzBzUREV9meR6/uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bxf1Sv97qDcFw+fW5SLbwSinsQccG3hAyE+3Bxgfyf5dpkBhF8+F1MIlhaUtotpb8nJWUtcSy+hyMFl03mEjcdu5F4EVpYogG/GiCmXqOJYXcRzd3kGzDAv86XiOUtn1Swh2a0E0QNDdgyjMoeGGrHbrWe7kZ4MrvhseLHsQi2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpBlhoc+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpBlhoc+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e5afc18f5so9670405e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 09:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706289350; x=1706894150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8tycZHq++FMKvH1QpORqsbZ4vIzt59SLtlLRtqr3vk=;
        b=dpBlhoc+jYWT4TrtWnB/DOzlo4cVLvDDUoe+5lYzY2siAD8fD0PBCn8s2JBfe4jwj7
         udnMYSssKs6SO0JavvUcaCrQRza4ssH0j6dxKTqI1qngOlHcec+EVbBNPfCM1IQL6/Q1
         2890QU4OGv52nmTde4PialPCvl7Ql85spShd/FpZmahYWYBKgRWYtWzKT1KDfXA/saaM
         84ioRs3IOl7U6zsAc9AWn+Ah7sp4we1HdYs/k/o5TEF1iQYVV4RUt8evINlI79QbTBEg
         jMBf8KrOy8kV6qVhedobIvOrBkzwLeHk27meAkrxLEXiM/+iIXrXl2YKeCEW9U0XiK3u
         feCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706289350; x=1706894150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8tycZHq++FMKvH1QpORqsbZ4vIzt59SLtlLRtqr3vk=;
        b=jQE7hrnU5QitZqApZJM8zUHbbtIPsQ9s88TttiicgaB+mQmIgTYSb2zhk1RRPC++5G
         r51wXrK/aPZzC9H8qXofbvcK4/5n479KPoJyZSDMS/iKRAnnngW5Kx6lHBcQU55yDCHo
         p/jLJ8AQJVG1Ae9AuyBx1B8RF9GeOxxMcOq56pfx3LAkvCmmGYrhpODISD4oshUQMUXT
         IOT9ErTawPCfvgB6sKzT2zJGVK/vvlVhHgshe67Qmnud9pA5acavi7xaEO8uIYngs2rO
         Fy03jQVE8fMm4PGjQE3rkECAJJLLFJy4Wm/94qjZj8FhGE2GiVI7K1+Ylj7tt7w+hqk5
         jSmQ==
X-Gm-Message-State: AOJu0Yw+o8GsgnAcle+7oNbXfK4yFQD32NUPf1WBzSyH3YDht6mgyXHG
	xkTvZiYbecah2scBcgE8ueXCicsKl+u9op8MMdUkeSxVvPNuowpMVoR/XIsW3dg=
X-Google-Smtp-Source: AGHT+IFpJ07QZ468cZz+H4b0+wED6nysxjU6/1yUoJI7/D6+IBIi5z+GZjqWxTNkdSU2UKwsAbuMig==
X-Received: by 2002:a05:600c:a082:b0:40d:8ff4:ea02 with SMTP id jh2-20020a05600ca08200b0040d8ff4ea02mr89344wmb.86.1706289350653;
        Fri, 26 Jan 2024 09:15:50 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b0040e451fd602sm6287286wms.33.2024.01.26.09.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:15:50 -0800 (PST)
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
Subject: [PATCH v3 02/17] spi: s3c64xx: explicitly include <linux/bits.h>
Date: Fri, 26 Jan 2024 17:15:30 +0000
Message-ID: <20240126171546.1233172-3-tudor.ambarus@linaro.org>
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

The driver uses GENMASK() but does not include <linux/bits.h>.

It is good practice to directly include all headers used, it avoids
implicit dependencies and spurious breakage if someone rearranges
headers and causes the implicit include to vanish.

Include the missing header.

Fixes: 1224e29572f6 ("spi: s3c64xx: Fix large transfers with DMA")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index c1cbc4780a3b..2b5bb7604526 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2009 Samsung Electronics Co., Ltd.
 //      Jaswinder Singh <jassi.brar@samsung.com>
 
+#include <linux/bits.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
-- 
2.43.0.429.g432eaa2c6b-goog


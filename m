Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326051EB45
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 17:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706289352; cv=none; b=IwUDnO/oHrwByhi/EyRrcVPSa4yhjPGEvaw+bk5RaGIwPmei+Vu7zFSiL6XtL90E9KhdVoPXnnR3TtEgI+3AuFB4FfTOl+EpqXtMrsVJrys9ssw9eycbdnkbyo+2iNokqhaXIKc7KoKjeQ4r2B79t7w1LRyqu+HbTMY00f9MwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706289352; c=relaxed/simple;
	bh=ESbWEf4Jl9fYqrFI7JEFHOnujDBpgh6Ob+8gu7+WPuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4a81/9xZdHOOzX0n9MTaFVvNQlGR0cnM9rjFO4sARdPMMxL3Ox6qoFazOAEYabMF9nuU6dDnYzWZuJCfDEdGn/EpXgjKBjWgk0n5VMNxXbG0XZfpQI4Rm30knZkwM9oDywPbhkRbEAUSOg9VaYhb6Wqjo/q4T0QRBJ5EInDfiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zgozXHhi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zgozXHhi"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e7065b692so9304875e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 09:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706289349; x=1706894149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=600VwywIwYkKhIBCMOdOgBJMPRHlSjpGBD3EGORG+P4=;
        b=zgozXHhitCfcIHbUu0rpKUXPRmyFrII4Dgqc59eKK4RyRtc3tXcotYu82pLT+SG47Z
         hbFRMg3xaDpDeqpMaZtGK5S+pkOxVBab9JSG1QT/p5RAwBxB1W1YTHjQInTovZCknaVm
         +t4MBVvx06tsA/mbsJC57v8wWhSmWxBiZaToXZUuTg1C7OXAOBDosZnh9xqqia0C+tTj
         JJ/dTiceArq2ZrbKAk8+s+ArPl2DV649rusGQwyXNnwPFs3Tm5jVhycr7zYkkw3ZAHy7
         x+zr87MmpuwZgdJTnwA/WUgJEi5kCK0ClcJ729iyH+v8g/x1y/fBX/Eqql7MVCdnBbdA
         M/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706289349; x=1706894149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=600VwywIwYkKhIBCMOdOgBJMPRHlSjpGBD3EGORG+P4=;
        b=c5wUofvH8SLN4csJhxG///Wvknzth9q+KLSCUCCi9d4B8TrHG4s3gLfjlIP7L5Lg31
         C0fCNF998QbHYgvGFIXp1gfBGeb1OGadgCXOQa3Vq1zhLxiGZ0STMPaUjbvTFyCfSCQ9
         a1c2RoKqgwcz2je9zZIAFwoIM0NFSjENp0TqAo4EfV9c8iplqMSTJNVviyuf05kyrpV+
         wW02grVg/bTdYpmkCrXOzEs8/ySLNBMSgkniYDM2PZ4QNlHwNlqln/eN8aMrOhGkxrXr
         ZJCY19luF02CkZ9CVqPL9UlFWcFd5KDnVuTgUn0j+cgRXA/VDLBHOWiKJxvf4XclfI+U
         Reuw==
X-Gm-Message-State: AOJu0YyNBb20Z3pGEmcaaOi70eFBE5ThDNcLBXVHBLdVkvZUu0UIiasj
	w43ef/cMB4V7ZH2XUQ4VBat6iVx70jFQrf3kh5y/q1fA162Ks4u6tYEBKY2hPAE=
X-Google-Smtp-Source: AGHT+IFxC11M+LjBfLJPSBh9/EVnhgXhYyzN+hO1o/eiQaDN7j05eFKx0HSJPEBY9Ly2uaqGYz2UCA==
X-Received: by 2002:a05:600c:5492:b0:40e:6710:c10b with SMTP id iv18-20020a05600c549200b0040e6710c10bmr84903wmb.117.1706289349415;
        Fri, 26 Jan 2024 09:15:49 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b0040e451fd602sm6287286wms.33.2024.01.26.09.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:15:48 -0800 (PST)
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
Subject: [PATCH v3 01/17] spi: s3c64xx: explicitly include <linux/io.h>
Date: Fri, 26 Jan 2024 17:15:29 +0000
Message-ID: <20240126171546.1233172-2-tudor.ambarus@linaro.org>
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

The driver uses readl() but does not include <linux/io.h>.

It is good practice to directly include all headers used, it avoids
implicit dependencies and spurious breakage if someone rearranges
headers and causes the implicit include to vanish.

Include the missing header.

Fixes: 230d42d422e7 ("spi: Add s3c64xx SPI Controller driver")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 7f7eb8f742e4..c1cbc4780a3b 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
-- 
2.43.0.429.g432eaa2c6b-goog


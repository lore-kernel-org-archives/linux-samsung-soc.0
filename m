Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE6F1487EB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 20:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905441; cv=none; b=fPX7lZHYssLTmnoDyw3ZH9UmryIsCtM9MrAPvUXh0PBSgdkjlqmjHecKU9Z4wHj9txFslANjod6xYTaA/+NOxEuD1WjkcF83mh08eFoIib7kDWyqgkg7rC20eRk/HW5AJxJibf61mJpMEHtAPuIPLq2BNVP8WagsyXCZGrpvMpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905441; c=relaxed/simple;
	bh=IMYKiq52emn3Dk5Vs4D46brLTo3TfZSVtNkXv8osBGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSMB/u/hghBo1GDHwlCoYVVFeaLPoN5Q1t+fQ8nQ3PfGez6lONwoM3EI9tNAl1GyeytB/nftVelfS5OTi14JaSQzjQm+9xVbuIbr7vx4F/PwyhSJ3K5COrND+c47KfoNYTQWDAb3B9ZO+Iok29L79rOnc3+9et4ULEbPSgRMrVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XD2/a67G; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XD2/a67G"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41a0979b999so22755765e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 13:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905438; x=1714510238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InFnIY+p533KdBP4NACQo0sZ0V7hrv1Ldx+BeIELt2w=;
        b=XD2/a67GFAI35JBE+U+pYbkE+dHl31lotCNQbebR20nCvME+hdN9cBvugiVzqr5heV
         EDJLPQ4kjtNEgDUxDOokYNdeBQDC0CXsHuoIaX3p8i1r3wcW4Ih9ZmM0fmmc6J4+51ZR
         0Vd88T4wemN0kfVJ2NWp+VauOfSJahbui86ekCibbIGpDkwxJ7K/wh7RAHxyxcfMaVLa
         mJsxxPVcX/Uku5QF6hLQcpkHuyQW+2V6PHfMwwLnF4vPYDwfXEFFw57q9wmbMhMKPDc+
         lKsqf3A4mVQBuzsRGD9I3skRq4CBOn3EAKNmmJiv19b1+p7/CWSQ95T+P7Z+/GEtiWV+
         XgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905438; x=1714510238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InFnIY+p533KdBP4NACQo0sZ0V7hrv1Ldx+BeIELt2w=;
        b=qJ0cHVlpaZBA93sF4Zi1T112EoaaqjIYjUtZLXAPIn1vZaswzupshvXuXhUapt/xpd
         Z3aaJOsszYC6eBUD2xWLqEa3YmeD6JWk21+RcnrLOKYndjSOuVkdkYXMHIY8WhFeckS2
         WDHboiEeq3AZOdXDbhumIdVi/mYB88+cuY68VUAEjBcUBVlELC+g8dtK2uwv9VOgqevT
         blL6rDS/bLi2TYBbNZjmnlxpTLdlQ8LmlQS5V5pWq64CWoElmyQWrvA/QYLZTnLrVtwz
         thrRGetr3Tg7sg9K+aj6RvP3f6ox9o4ftpsu/yVtxZJVLcXMGrjyMod5iLWTiWPAaH9A
         gm0g==
X-Forwarded-Encrypted: i=1; AJvYcCV2kataPG+t9rPHcQUcUBjAP6MAeE8So3MlVX79U4LwRTDbqpS1741vuFqi2slF8YNBFevFNx4LRcxgiTAi/vgApwdA6M1KhHt61M5hhK2lLaU=
X-Gm-Message-State: AOJu0YzU6N7M09+vh5pVUgVA1FGxNvda34SQb0oRnsTLds19ExfVUCwI
	Gr1GRIoFYuXSdz5/LWyBmuQw0jMzl8GE9PX96uqqshrNtDhnA3QTDBM4ZCKEhj4=
X-Google-Smtp-Source: AGHT+IFwW0Qe2OJNFDAP49c6EJtw+kAQOSHqygzMmmEvDFQ3fb8+GmSzGKcIdG4RXGhib6lwlZrI8Q==
X-Received: by 2002:a05:600c:5405:b0:41a:a08f:2696 with SMTP id he5-20020a05600c540500b0041aa08f2696mr310906wmb.12.1713905438258;
        Tue, 23 Apr 2024 13:50:38 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:4269:2542:5a09:9ca1])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm13065443wmb.41.2024.04.23.13.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:50:37 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	James.Bottomley@HansenPartnership.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 13/14] phy: samsung-ufs: ufs: remove superfluous mfd/syscon.h header
Date: Tue, 23 Apr 2024 21:50:05 +0100
Message-ID: <20240423205006.1785138-14-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240423205006.1785138-1-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mfd/syscon.h header is no longer required since the update to
exynos_get_pmu_regmap_by_phandle() api.

Fixes: f2c6d0fa197a ("phy: samsung-ufs: use exynos_get_pmu_regmap_by_phandle() to obtain PMU regmap")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/phy/samsung/phy-samsung-ufs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index 813bce47121d..ffc46c953ed6 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -13,7 +13,6 @@
 #include <linux/of.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
-- 
2.44.0.769.g3c40516874-goog


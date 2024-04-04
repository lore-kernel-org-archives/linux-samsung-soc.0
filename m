Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7786613664C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 12:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233657; cv=none; b=ZTf3OXh3iFHpwc/5XHg9CpMKfPCyJORapwUq2Kmnz8X5gFxQrlEOqJ0AMeDGlH93IiLtdL43fDCgfeQ3OJecI7y9rKv1+WRIRS19S1ycQnlwgOY7A0t/yPO9J0/qLJd0ZuhreqzaG27p4dAm6qTtUYms2nzUdEGAU4NJ4QGaBMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233657; c=relaxed/simple;
	bh=6E4PP5FfeLNXR6MMeKA2Ut8lL0g1LcQs4+c0K06ivCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2sj0QWmsGiGCzGrYsXO3V7tz5KSPs3iWjUAJtqQsWz981pWsRq3JBKbUHRqs+M0NKWZEamNwKYtV7m7K7IT2optEYfJ/8osdBTX34OeklqVGd0dFNG2jHRv1rkbz1CGJHKg9wE9Gkpw/qLBjFbEFIE7GhefyaGHdzc55rwDoGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdnR94Ie; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdnR94Ie"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4162a6a1f84so6086225e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 05:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233653; x=1712838453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BekuFHDEQz3MItNlFSbu6RpX09gKsg0FByp3fiEppHo=;
        b=cdnR94IeBlsUbQb8jyNe7g2mSQ/NXfeR6aUnmb+mGuScdAiefR0QNooz2xyyvYKY8S
         m9VmZUa+VbjP8RXKfCHtR+ZNcrcVy1W73UWVIWtmpq2fpSo5+2TkedmT1JPU10xy4zx4
         YVd1fHdffQ9BEIVUqf16OYPxEox/CYkaOsruHNQzUSFAWKFSXs0BGx6wm5WZ67MjDyeS
         +BRc6RKUefTq9cn0FHPctDESkjg1/cb0tlBLv8jGdL/Lpzv5UM+D3iNuj0vWBWGR1hL5
         lyl2mSlnkdqP8x/eK3GKd4PIu8kn5YrwVvGOir2wBlJwWqfXxVzyitTrJQdwJdBVLTtN
         3qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233653; x=1712838453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BekuFHDEQz3MItNlFSbu6RpX09gKsg0FByp3fiEppHo=;
        b=NgvFoyDvlqwI6S5/dih0IWgYDJKKpXsK1V8ig1inhf/e7485sTtksYvbIhpI7d3s/Q
         7C+2SZPrNVrk9lzRQ8f7B781MaeExkzotKWlx9yjWfD/xj44HWdF8hJ02r7tv60jlHoA
         MIE38yFHsjZm6GJWeDaqWVm0yfCKY15YOUpjO4WidEGNmiQD/M18SP72O+zpYCFrB04j
         NGHfyEvGJrk3WjUUXEF1GXKSowV0OtVu4sv2z1GQtLA4y+pg6uaWR75JRilpQZt31s1C
         tugLXm3l0cTffA5cSrmHNZgzeLG5nTChwKuHxZPvdIOS6kmtdjsK4CNHeDrRXKpBJ2lJ
         fqpg==
X-Forwarded-Encrypted: i=1; AJvYcCXfYp5Cl+3yM+Qwm+0KqS33fhZPxYZEFdOySUBmYIgM1ZcPbg2UOXGhtX1hUbRDqx/v5Fl9GP7CPMIJDYrzy6WEMt71xXwpfEsXgCCBN1/4aMg=
X-Gm-Message-State: AOJu0YzJL9Hr0ctSx97/SyOfgIP162L7aIXC7HtKAAorsbvKiGu8HjB7
	Sqb3XCA6h8a1U3bmSwbQawuz3bmxXP60SMHiGo4D/ngxA5htkaW7pKzR5M2A3vQ=
X-Google-Smtp-Source: AGHT+IHo0UA4VkLq9YNMWVrdRmiVEAsMxBZeIPEoAivlBSwwv6+wNOZwB+W4FPP8qAuWikZ3EcwZ2Q==
X-Received: by 2002:a05:600c:54ef:b0:415:533b:1071 with SMTP id jb15-20020a05600c54ef00b00415533b1071mr2319673wmb.19.1712233652986;
        Thu, 04 Apr 2024 05:27:32 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:27:32 -0700 (PDT)
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
	chanho61.park@samsung.com,
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
Subject: [PATCH 14/17] scsi: ufs: host: ufs-exynos: allow max frequencies up to 267Mhz
Date: Thu,  4 Apr 2024 13:25:56 +0100
Message-ID: <20240404122559.898930-15-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Platforms such as Tensor gs101 the pclk frequency is 267Mhz.
Increase PCLK_AVAIL_MAX so we don't fail the frequency check.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index acf07cc54684..7acc13914100 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -116,7 +116,7 @@ struct exynos_ufs;
 #define PA_HIBERN8TIME_VAL	0x20
 
 #define PCLK_AVAIL_MIN	70000000
-#define PCLK_AVAIL_MAX	167000000
+#define PCLK_AVAIL_MAX	267000000
 
 struct exynos_ufs_uic_attr {
 	/* TX Attributes */
-- 
2.44.0.478.gd926399ef9-goog


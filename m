Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EAD2141C4
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 20:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727900177; cv=none; b=Q73/7baHNvhGLeGgmkPC6LPUm/yqVreNMlYmUBvYm2ilNRjgpq/eqTR43iq2z517a+o02ufHudB/YlTRacZaBk2p2dPuUID0zlowLRB/0R/akG7kfoE+Dyv3AHnL/2/oh6yBTEPm3mjGazq4R3tIUHR+XfVDPZv89e73VwKorrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727900177; c=relaxed/simple;
	bh=jeQ1C5PHQbzYDTn/Z+W3aONfRVPLcQBP4SwmfKLBYow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjVYpPZAtkXwQih2NEg3PL2Wqtg0pTVQmTcgGZIxsAESM1s9wcsWw7J2P1wYRRWiopSgaPHKZ/jraCW3Q4n7PlkvVpDxGJHCrpIAMiHpz5dqEvVnio0N9JA4wxWnLZcO5wS7QXNhgeBedTHdfP9omW3/0772HR0BpSaA6UxgQeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VMMEfJB/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VMMEfJB/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so1083615e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Oct 2024 13:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727900174; x=1728504974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jX211dAZAvJkuP8OIZ+el1p2Mcg021bO+6I10YA2EY=;
        b=VMMEfJB/jucF9fQukBehVXwL7dyO0Vafy/9sfEY07EavHRqJa9tiEg5Ln3S9GZFckg
         LTqo5YZwdlibl0oXAxVui4dYV02PnXN+zKL51SlusQy2s3hokIpBYr5CMgsIjIrRRcZq
         jUs4wtbXUQageTuqZEoFx17MRdoA93QCdmfrrGwwXeZNM821cAFQV1LUondKeqcPfA/l
         PFg1duRRHAZ3s1+yEC0udc+PpgUw9UIMEdiRlBTGL4JUTRLKVNbIUnLpvy0ThWAYA/n/
         uWEhw7DGcrLs4YvwdLNk6llffPI/S5qSofyyo6wcQI6hcJOs3wycwrngfti+ylVyeXwQ
         4C+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727900174; x=1728504974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jX211dAZAvJkuP8OIZ+el1p2Mcg021bO+6I10YA2EY=;
        b=hcXbDeSoEDL/b0PAmCzzbtIluht6Lv7Yzj2PgnNO3pFXRs5GRkCa6pzmzmKDR1brdw
         F/AG7F9twPWICmYyfe8qh5pndYFJsRy9oobuu8SccmBiDQkKa5NPZ39qT0stPr3p3uuB
         MUVvmC8IlTbvE75m6D5TNgY8gzS3//YgQNNgxLZ72wjQFYNKBMcJWIPI+CaOYxXQvpLU
         ESlFAmclPeh8SytvUrAR2Do8dZAe5WOD97guCUrOKHpvpaV1mfscQCX8P46ZU22SdrjW
         xniFz6t6Kkq7qjzQKwWHLgK6PQPix2aUtmxlyWVwnKxCZ1NuiNHChyozSr0pO+TBkl2S
         fh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDn3T179UFkeHgMMjD+sAPNLJQThfU8TCu8M6dvmPh2EDg5rvh2Sx32yCqdME3RCM72HqkIFmAOnjeihChWcl/VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU7+J+QlK9SpTtRB/v9kXgcEE0/GDyxW3JyVnnPkqwn1RQ+iiT
	vHK3lnOsai716fOElVlzTA8NJRRPK4tSKeS8wBPeAXtHNmYPFvm0iQqoqI3ysdY=
X-Google-Smtp-Source: AGHT+IHWRZVOeFFozi3DIiPiL+943vH2vaAy8MMudke5kiB5y6RE2CXPLw9EOtOlNRxTNhpGiUSfiA==
X-Received: by 2002:a05:600c:3b05:b0:42c:b750:19ce with SMTP id 5b1f17b1804b1-42f777b628fmr32913575e9.1.1727900174107;
        Wed, 02 Oct 2024 13:16:14 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.66.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d2e8sm14850600f8f.18.2024.10.02.13.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 13:16:13 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: vkoul@kernel.org,
	kishon@kernel.org,
	krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 1/3] phy: Add UFS phy hibernate modes
Date: Wed,  2 Oct 2024 21:15:53 +0100
Message-ID: <20241002201555.3332138-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241002201555.3332138-1-peter.griffin@linaro.org>
References: <20241002201555.3332138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some UFS phys need to write hibernation specific values
when entering and exiting hibernate state.

Add two new UFS phy modes to the phy framework so that this
is possible. One such platform that requires this is Pixel 6
which uses the gs101 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 include/linux/phy/phy.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 03cd5bae92d3..1874e55e2bb9 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -42,7 +42,9 @@ enum phy_mode {
 	PHY_MODE_MIPI_DPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
-	PHY_MODE_DP
+	PHY_MODE_DP,
+	PHY_MODE_UFS_HIBERN8_ENTER,
+	PHY_MODE_UFS_HIBERN8_EXIT,
 };
 
 enum phy_media {
-- 
2.46.1.824.gd892dcdcdd-goog


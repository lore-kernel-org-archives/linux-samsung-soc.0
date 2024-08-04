Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CC413A87C;
	Sun,  4 Aug 2024 21:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808515; cv=none; b=DPNCvGTrMpc1vYbnQF8sqYMGDu4Q7PvclB1tdy95EBWaHRRVr9E2XpqrrcTghH7SAg5PCXMGVROk+uZnebUM1rMWIqiw3YMJJNY+sGy2bvtGyXPWeGruS+nA/XrfhKS+mLTp1L2b4eGfw0z2zQnlZj+SA7zc/8ytr3680NLnCTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808515; c=relaxed/simple;
	bh=Fyt9dr9fRY9eNM7k6FcruT0K5N4TjeBkONEGv0G4ZxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UgikxGM2ojAeUywYauEvlIuNnjVZ/Xk/9r49NcPpdFL7U+HY4c9rjk0bbdasQrlrENBEIeAc01o73FCy2O/2wRu5oa/uTfBkXMN04Bbc1BuRWBDA2MiQjIm2LKDCKbjYRogIf0hyNz9dpeJ2qVTe6RJcHsTdwgR6Px9iWG/ALtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYDLQb1R; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYDLQb1R"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so1208956366b.1;
        Sun, 04 Aug 2024 14:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808512; x=1723413312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5rhR3+v2dU7aRSLZ6OU5clgVv9vaFNsSw8Xkl+ANI8=;
        b=lYDLQb1RgZUZRPNkHEkZeiuROD/f9KEl9xbU6Adpvsn6KWfIy0nVPT3MjgGwqM9wV4
         yheKpZJPlzUU6aDhV/MrnDEKCROnN1uRYE6MoxB0C4kkns00qCh7BQ0QmaJE9UdO6MIE
         ewcpsk+3K+RcVjqGSokyPMo7cA8hD0syJPtWKJts115tZs9x1KRo56D0+8b1X7jtUUs2
         u9YTrBtjPtPXNJ6c65tbZEqFlSi+1JJ+JUWQKuJLWqBtXKT5zECJq9wdoAyCL5rINnXx
         XFQ5E4OE/G5+VZK9esaqh/hty1QKvbDyEQftoyG//BBecuGNSrWtMXH6alDyXyg5SFXb
         gvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808512; x=1723413312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5rhR3+v2dU7aRSLZ6OU5clgVv9vaFNsSw8Xkl+ANI8=;
        b=LcJIZXmkH1Zdz9M+nc3C7aDG23bWl1RO0rQhnzHp7qxme03IdYv5FQcoVvhndp4++H
         Znm20QrZnBRl4Qv3IoOcWd7gfjqU1QW66B2fy+k3opHV+ChFVeXTLx5sak2mmWBu0ruS
         b/XQb4EuPeBs4qt0cLIPsYdoGlM+FEMpWMfipO78Ynu4LRZhoKFp4EYtmr3czlrooCO3
         wk4754rc5x2ZzzrXmrBHcDf8SOvXj/w2EwdlXccXev02MIWTkmfAiJhGtrZliFVEq7VL
         5seOuJ2m9sX7o8E8nVED133M6KT81s/gMehBBqUYov2zATDkwwKZeHevXnlKgSki+YZE
         sgdA==
X-Forwarded-Encrypted: i=1; AJvYcCUKhAB0PTsQ1zFrnDCB3WzMkQtIWy+v/6YXhQd3Ss9cgxDH5/ViK6OyForAYqeyJRybStjqLSxtpA0D/4Hmcme0UlMC+9PadHJ8wBb2eFpzZXXTbn2LDU72jEnxz1qjmheepxwt70MJ+JHC6H+rP/uS1xosPz0vvy97GwZ0BsLbxrgW+x8f4yRUj7CiHldVrvuHW00G2SR/ycreWUSjoeDyjbdjhTnuN7tPzO2pD/l00arYF2QhNeUcHfQSjJChPyv5
X-Gm-Message-State: AOJu0Yxh4ynv2Yc1RWxTtDQ4UaRco6//kP8Bt4xdkMiUf+HLEFUHJu8x
	9pK+4ldoduNqSdg6qp68jduvaPAL97q78c2NeEib/WMU2vwxkVBc
X-Google-Smtp-Source: AGHT+IGzaq4YPYNj2lalwb5MlAOxdlQf/QYs24OQsJ6f2k6Wa9MSyqE9gN6Oy/V21lb4i0xGRTiEbA==
X-Received: by 2002:a17:907:3f8b:b0:a7a:a6e1:2c60 with SMTP id a640c23a62f3a-a7dc5148422mr690105766b.61.1722808512146;
        Sun, 04 Aug 2024 14:55:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:11 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	David Virag <virag.david003@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 02/13] dt-bindings: clock: exynos7885: Add CMU_TOP PLL MUX indices
Date: Sun,  4 Aug 2024 23:53:47 +0200
Message-ID: <20240804215458.404085-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240804215458.404085-1-virag.david003@gmail.com>
References: <20240804215458.404085-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add indices for missing MUX clocks from PLLs in CMU_TOP.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 include/dt-bindings/clock/exynos7885.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/exynos7885.h b/include/dt-bindings/clock/exynos7885.h
index 54cfccff8508..4ce86810b10d 100644
--- a/include/dt-bindings/clock/exynos7885.h
+++ b/include/dt-bindings/clock/exynos7885.h
@@ -69,6 +69,8 @@
 #define CLK_GOUT_FSYS_MMC_EMBD		58
 #define CLK_GOUT_FSYS_MMC_SDIO		59
 #define CLK_GOUT_FSYS_USB30DRD		60
+#define CLK_MOUT_SHARED0_PLL		61
+#define CLK_MOUT_SHARED1_PLL		62
 
 /* CMU_CORE */
 #define CLK_MOUT_CORE_BUS_USER			1
-- 
2.46.0


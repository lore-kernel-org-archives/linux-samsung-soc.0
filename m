Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616882222AC
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Apr 2026 06:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775631066; cv=none; b=B4V8EQ+OfsG5M88VmiAVyZypzSyo6d9mWDu3gvXKT1m4FrTIXWnltkkxFu5Sv3/AMHvrYwQWLk00EFI2G28ISGPAUAr4KSczxDs8tWIQ/fRZoA2DlxcDYPSvz3E6WpI4IaM0TwckeVC245Mn1+nF1VLg+0PEJHJwxG4VMBuUU7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775631066; c=relaxed/simple;
	bh=SKfYF4aqu5zBsr5QhhshOMiLLo0FZeM6Ebxr8e1rzZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vm3VGJyWsu3P8tLq8xPg2Vwviz9ba9F0IZ5LntcuEkndQss/UdYGHk8nACT2h8xDkVF09ARV5sFYKJQKfjtMJMVvY1/6BtTtko6bAGKmE4pgHRPG0m1rgDF5ZHllsdU6zcZE0Fu7OCWTdWDyvJa//IfmNkINt4WCYnIvzvHIXck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bSjb7Lzh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bSjb7Lzh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so5242282a91.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Apr 2026 23:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775631065; x=1776235865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U521sUYf25ASEfCtOQX+Ill+lllnFxxt3OJbaB5Iblc=;
        b=bSjb7LzhIdcIRclhV71tDmSiK623AXI/7LrfKBt8/8RaCv0IIBwq2Gq9VmOxY0C8ak
         kDghsBbzQZwHoCarXHlad7wJsePwH6CyYz/zgN1gIzJRVf+ch7beEsA8pEzpMG9N9ms/
         lnykzoEoiFviV0tdiohOisYtUzd5w8n05qgwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775631065; x=1776235865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U521sUYf25ASEfCtOQX+Ill+lllnFxxt3OJbaB5Iblc=;
        b=skLtpmdQg3EzeNJQ2+Ml/VUAYK0hyQxoZ5F9GcljxteZVgremG3jsK8ipCC4YUDKzt
         Fi/Sew4imJ1u3rw/qSemPyqxf+rm5gtolhp9litc8aqqgmwplVOESCuFV/I7qe1ZQSSl
         si2Z372oNOmj592JZ8994GKQkouBqrgBIrhO4e0ONPDeIjQXW5/z6ZJWfN+R00ilFUNr
         KbeifbvoNTF7Ncn7efROln4RE/OVi1Tb1DOwysY6ax1UKffS7ORP6y00ea4miVUbwZwr
         RW1yOCGRJ0Wr+SWQ3JRB0VaQ6a7NY5jTwor6OvGobzfrd+ZBpA0VjSLGQgZuv3PQonMk
         ePew==
X-Forwarded-Encrypted: i=1; AJvYcCWiyg/FNBFi3EzUcnO5exIKguLvkxdtED74LyHKZpaiQSN3/zvHDVrfy0I0ll4sF0G7uMevDVwq7Bu9/+UvBEbm+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPy16TijZP9gKKDaAhwpJta1fu1ia7mZu0wihmr1SUWcJAUhnb
	w5HjNvZ2qxi/4fzQjxzW7/t/SCwqvWVv6CWOJxm1vwdv5Ymn+cefNYh9Ke07Kmd3ng==
X-Gm-Gg: AeBDieukl1Gf4W5pyv1aFqyuDR6wxR4p0SxEsEt9BtElxR85LGAumKPmoukPLLKgD0x
	AKlpDV58tOFWuVEbXbyRNa1pgFExU+0TkJGIkpdY8yUx+pCkeW2G4hXVTNqCmVJzt1xSUPg6hIG
	BvzbeB5wc4tTw6scNODF101w1UMKH0hz2Bwq6mV+oXKflDSNg4DqrbezBd3rxKX+R3fQuLLiT/t
	jSaDLO74GyCPDyC61s+clHtHHsTeRuKr+FeuAK1eCwp/uYxO1Zf0EdmVJlzq8gEwBUywxlvwnxd
	6G5VybZrkP510pIe+17kwpRStdm68tWG4b0HFzI42tcnXlDbhPiTEU32RLiY2zAMnC3EUJUwn7/
	9iSMt5/OyPP2OJl++2k+9xI1I72+LagdK3LwCuxSm8g8ktITDDcgTOdgs5P8125xV8cfqEXZqrj
	0qq/wKM4UuiNNVPKa+aiO3nclY4eMmgCMkhE1Ux6EqMae5ZXBUvs0IKeHTyI+YjJ4NN0kU5lCRJ
	p8PiunKB3dSw64WztI=
X-Received: by 2002:a17:90b:4f43:b0:359:f3b1:6811 with SMTP id 98e67ed59e1d1-35de67db862mr18680927a91.1.1775631064757;
        Tue, 07 Apr 2026 23:51:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f0e3:c8b2:74ff:70d1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe959886sm24889460a91.14.2026.04.07.23.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:51:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos/fimd: fix register offset type in fimd_trigger()
Date: Wed,  8 Apr 2026 14:50:54 +0800
Message-ID: <20260408065055.1353444-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse reports:

    exynos_drm_fimd.c:992:39: warning: incorrect type in initializer (different address spaces)
    exynos_drm_fimd.c:992:39:    expected void *timing_base
    exynos_drm_fimd.c:992:39:    got void [noderef] __iomem *
    exynos_drm_fimd.c:1005:33: warning: incorrect type in argument 1 (different address spaces)
    exynos_drm_fimd.c:1005:33:    expected void const volatile [noderef] __iomem *addr
    exynos_drm_fimd.c:1005:33:    got void *
    exynos_drm_fimd.c:1007:33: warning: incorrect type in argument 2 (different address spaces)
    exynos_drm_fimd.c:1007:33:    expected void volatile [noderef] __iomem *addr
    exynos_drm_fimd.c:1007:33:    got void *

Add "__iomem" to *timing_base to fix its type.

Fixes: 3854fab24e89 ("drm/exynos: fimd: support LCD I80 interface")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
random warning I found while checking for the size_t warning.
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index b6abdc4f2b0a..695d3515d421 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -989,7 +989,7 @@ static void fimd_trigger(struct device *dev)
 {
 	struct fimd_context *ctx = dev_get_drvdata(dev);
 	const struct fimd_driver_data *driver_data = ctx->driver_data;
-	void *timing_base = ctx->regs + driver_data->timing_base;
+	void __iomem *timing_base = ctx->regs + driver_data->timing_base;
 	u32 reg;
 
 	 /*
-- 
2.53.0.1213.gd9a14994de-goog


Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E455E144D2E
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Jun 2024 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717506697; cv=none; b=Fmqe9kM64Rhl3mJRixtejtUzkNsm2R9Tcs8sF/1ZfcPeWSMKclIQx3wfgZoX14daMZLLnnfd30VtmeNR2/aAyWORdparlWxdOsRX2SvoUpvRaD+DlW+hePlqhQbdbCIJ/iOLXijeGPFe708V54azPBfCH4G0+5cHZMMgVeWgTNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717506697; c=relaxed/simple;
	bh=D8+B4VmmUKjGstm5zExU8LIljI0ZjbY6sHA78vNJcW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1069S5MnH+zDVS63YXhjHgAQFUy068wU9Ef2BHG3iXULk6TVjSpJCpm85gHwKQ7S5gUDml31L5SffUah7f+w2uujjX6B5aM9gUPsu9Ouu+oXeU09cJ3dLF339DKOnZc+hWaZY1norkSflP9F5rxa3RD7KTprxXAVIypQYYlIyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LVBaTXJG; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LVBaTXJG"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-354f14bd80cso807574f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jun 2024 06:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717506693; x=1718111493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jPJonIEuGmGlQs1GGHFwUCHmwPCfTUCdx095z5ehb0s=;
        b=LVBaTXJGjivlnzpiEUs4N1FwvWnQHgMZ8JDiJQrFFkgWGFDtgd0qAoTJyeIB3xa9Ni
         PCH07Y0mJ1PVXgbOZ2z9x/sXgJqGzr/xLHhbPeTpfg7AHZXdk4QeCvVwGcK6+b5ltjeO
         YhlriAJnMENVvRYfp64ohDKDSIO8VP6+BvcTr9Q1OkGngwutb7ug/qSKrZpksovOpMgl
         mJW+Ku70+K+0QM+sKGtoP0teLH3eulX3JtoWuOpzTFtBBdVLubnTVNyOJlHxN8Fgov00
         DjaVCq55KEBtOa2w9z/ln5tSH7V5Pek96QgUOcsfDMJsS/vi20Og8RWcZyIjRIjeTpy9
         pXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717506693; x=1718111493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPJonIEuGmGlQs1GGHFwUCHmwPCfTUCdx095z5ehb0s=;
        b=CCgQqMgD8unu8eEiQj3XDtJCrUhQdCAkncPdlmB9UbFPqzr3XIy36zWPogHRigIMsm
         YN0Cau9sfHN3SdtEm4rmTWmKGIM+EeAIiZnjbT0xc0dIu7h2Sl9CNdG/2UH1RbTm04oH
         xSLJ4Tit+Hm3/OBF5nmL21B0Fh+gcOih9iU/johqylrtbA78/hGLc2u8zZfkaBlMO1dM
         0KE/fzl3FR6pOIihqDAhD2+bFDL+o+CM9JMDpkNuE2bIavuiq89xKgOVSoPPalQkYC+P
         nKjucI4MSU88eT9NfvLQ+n/VdHF9A/Ldk/mpoSMIi+DRQHyUaBMOq8wno3Q+RPgH0pLc
         yz0g==
X-Forwarded-Encrypted: i=1; AJvYcCXR1hyD0sdxmZcnRqQhrz3s5MfcpzjW+RsjuK0G/hRvfmUBK3KcFlb4EA6P35usAd70ey2ebruj7mrJwZqbId/eVhMG2s2ZhHxgDqNPiALE/Rs=
X-Gm-Message-State: AOJu0Ywof5M+ot+Ci4f2vCasEsq+z7IEByMCbar+9YqqqqC2t8jVo8v3
	6pGCOQuvNk49/Zh0bmRvC3B5+WWr4IFeYfR/+BPbbmtjio5fcz+QH/BAU6BfMt4=
X-Google-Smtp-Source: AGHT+IH+/usVFBeoh+wIT79xCMgURUIgCCMPyCo4UNbGGkw4O8nLArXyKvbDCf5Fohur20sHLnXY9g==
X-Received: by 2002:a5d:6a92:0:b0:351:d9a1:503 with SMTP id ffacd0b85a97d-35e0f271624mr8835715f8f.20.1717506693247;
        Tue, 04 Jun 2024 06:11:33 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd062fe96sm11495387f8f.67.2024.06.04.06.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 06:11:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] drm/exynos: dp: drop driver owner initialization
Date: Tue,  4 Jun 2024 15:11:29 +0200
Message-ID: <20240604131129.193972-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index f48c4343f469..3e6d4c6aa877 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -285,7 +285,6 @@ struct platform_driver dp_driver = {
 	.remove_new	= exynos_dp_remove,
 	.driver		= {
 		.name	= "exynos-dp",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&exynos_dp_pm_ops),
 		.of_match_table = exynos_dp_match,
 	},
-- 
2.43.0


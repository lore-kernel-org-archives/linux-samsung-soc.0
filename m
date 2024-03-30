Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29A756B8B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 20:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711830816; cv=none; b=Y/uaHoSioQ+H9tu6TPLhRCCzrOzej1RPK59s1dGjibWf8nSmfK9kIF2NpxZR5vrVW2ln5x5MVIM4FlV69NHDMD9FrczlPUI1PX15/qtscLg5xTj25IKMmPQfdch7xc/jp3u7y4QAOWyVa9zxXj+oxjrzGatc19X0jkZA2Cryv00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711830816; c=relaxed/simple;
	bh=kCyb2/5lgQ7u+UoU351athV0HM/cfffQPiYFhVagfsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HEMjQmG/Cutx/4kjRLYVbSXJNK8d76VcMkPhWp27ObhSzteAfNVlb9JvhBvgFQfTDRK1ePvIydxJ/8Ak/MZ3POwTi9Pd7QnhEEYsPHy3VphooAG6kGAFmeNgGI6TFpHqV6sV83Ro7tfC5SaejvHk19aKV2eAf9axFr1F45KzaMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rO9ckS+g; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rO9ckS+g"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33ecb04e018so2218756f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 13:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711830813; x=1712435613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/ItlhUR6jqnWFgbd5yxm7hVl8DoM4r1gHAqPNu+ncU=;
        b=rO9ckS+g4iC/xBZkc+V0aAj+VMuwEtIpQSovVX393kCDjHlqms4BSou6TJyJsqQX9d
         sCMxGFHlVkEyUf0+mwJFtukiPQs7cPBGeSIrEvQ/IcdNnHZTBhX1ezCvI8Y0Kczq9NOs
         L8G704zRlJVBXHEwety32dx6t2gWVxPgwptlGFAfkbcgd0ckF33jy/jXELhZQ+f8pqyk
         EW4DRMidFf4ncEYscDCJeRJOrQ8GgBBKwZ4iIT4iEybtphwN8Pz5+bCa6oUPhzhONf1S
         yZcPUh3sBvl1TtvQz5Q2P34UCliv/WF4nnUqX4Fp3ZEXQ01VM9yHU7WZfdgJDonkK6eJ
         XHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711830813; x=1712435613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/ItlhUR6jqnWFgbd5yxm7hVl8DoM4r1gHAqPNu+ncU=;
        b=ddZRuCBDY5jR+Dt880tlZcw2JYIQKmB/4lUaXRiT06yQOi9nheb0BTmPUpv7WbvYXr
         0Nx/j6Qi5DHDBppmTyTRSvKHOKYnld+5s9j2wRj3RWP4W8NA9NwDog89y8m+gcrdxf/N
         Hcqz4VH4DXBll3JG4duNzupQgdcTFhaV36rmryQjKGnNE+7mBz7pyS8Uk8Kx88/fINj5
         Cb2QpeK3xdyF6MHIH2TyLnTLym35V2sy6spVAKgbTh6XPSnZ8gXunWLFyxdxcpX+J46C
         x8noIn4Dxp6P/QTBL004yBcUHCIE1TxTNNRCKiINo8MTv5mJwqQykU8PINQ1XcuNP2UV
         g49Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/jNDUKRA6pviO+rLG/FhPa5vW/2W/uAi9w+faWOjLQyjl+Wo0pHdr3oO8xG/4YWLn0WWqnRKRqIwAHNZKbNOfZjhH4b2Z6p3+YoH+kTcfn3g=
X-Gm-Message-State: AOJu0Yz/1qG4e4qqu+pOwOjiXkkKzpB2YX1/o2XKilJuZiXYhopcfMYT
	6xwtjJmuCqDEGB5vqTUkEx8ooqkz45DvTZdOntzmwh70NTIgnnuQpA4+63oC968=
X-Google-Smtp-Source: AGHT+IHJ6Uc+SxizZqKRJbUIgtj1cEsA67ojpQsBe7EuZyWLS0AH1SOG5LrKQA0o/ciVQimEwo8NLQ==
X-Received: by 2002:adf:f6c4:0:b0:341:7fce:4f80 with SMTP id y4-20020adff6c4000000b003417fce4f80mr3243150wrp.25.1711830813363;
        Sat, 30 Mar 2024 13:33:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:33:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:13 +0100
Subject: [PATCH 09/11] drm/exynos: vidi: drop driver owner initialization
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-9-3fa30e2c7e5a@linaro.org>
References: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=805;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kCyb2/5lgQ7u+UoU351athV0HM/cfffQPiYFhVagfsg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcLHKtqQjf4/WiHSYUsGWsKyIwFPTmHHqGL4
 jxGp4ajBxCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3CwAKCRDBN2bmhouD
 17NyD/4l+dx1iazbcMQ/sTMRO1Kbni/i64ZZ74Ym15MB4Gjkh4aVVE9CWpP4bbnN5Mm8fAPI0af
 R+gFtyngt/nlWc3wZwc05Y/4Tr0/kiiphchcYQWUjXpk5PeUKpHO1PSEhoRivovov/X/jLuMvHV
 1vdoxEoB5RPbNtbHElMeXUZSE7zezwsO0kL3wcJrIGyIzNZQ5qngO66jd4qwHqRNAWhao5O2AYb
 YNeB8TRE/I5/IWu/4m/QQZod61x8h93aJpOWi/tnb4YLc8qeJxejg7ydEzYPXK0rZK8FTvGqwax
 qE9EeyAdhMeWB7Tfyv0Mn8O/+fezL/ZzEodyslzjLmGyPUW0eyowXxhkxhFDiswoz2O7OPLeMud
 mKY9e1gjleFm8bdOhVvJeFgfRTXRYr+QUdsI375Ixn6pGwQq78dlZpF+Y1rfzMiBjcsF0Q8pcc6
 xJlbz0FMaDuTvyhFx3tSCKEtF7+VNDhRstdmY0w/G8oSiM+m2pfAZ07Bgjj1Yxk6PfdgDpDT71X
 hd8Q3ZSiZpCbhKVDeO418FOI9xmDj1knCTRQHGDlo/btCyVtHYoQ8Vp4Lb8uTohqQInhwRNcMlp
 Oh8T+oGlxiSvw71yBl2Vbv8IQjcvX/RqgyCDCfzGFYFSxKzEAIgsFxJV0a8HZrA0U0bm1qDpCx2
 kQc6ZjcRZwJvfXA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index f5bbba9ad225..fab135308b70 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -479,7 +479,6 @@ struct platform_driver vidi_driver = {
 	.remove_new	= vidi_remove,
 	.driver		= {
 		.name	= "exynos-drm-vidi",
-		.owner	= THIS_MODULE,
 		.dev_groups = vidi_groups,
 	},
 };

-- 
2.34.1


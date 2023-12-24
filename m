Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EC453BA
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oW8qvqqx"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-554c6ed660dso221391a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 03:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703418564; x=1704023364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVApuuT/XfmeqHfcxDHhSC3DLyKiRm/PdGLsLnce34I=;
        b=oW8qvqqxKIMzSfA78RPM0ykCcl3Fdq24pYtowV4bnzfUaaTbSN73FxywbF0mHhmVLM
         UFiErkOAtUrjdalmg38/G+veVpzMr4WHxvG/GY4UimQ3QbAMiDwTum8V4FPpePoS/KD/
         nIgX+P9lcZv993dM08qWM4HnkwhqMY5+8pPaBaGL+xorc5fLWxg6pbFAQ04wcVUYBXwT
         lRmHK8tpqUh+RuBzJO9SOXiCRlrUWy7jjDRxJLM4xyCbvCo7bvuvGl7FSHVAMVKOVKp3
         SMDzuLpNDBGpLP6CHnOn5HCnL3FSHDJBf8sPDyCoXO0XrfG6dxtw7Gb6UTUq44rEScuI
         1EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703418564; x=1704023364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVApuuT/XfmeqHfcxDHhSC3DLyKiRm/PdGLsLnce34I=;
        b=Sn4n1pDf72FuOObIo66Mq50jvAsW9cS42UCa/EA/QH1uh7k3pI8EM4E/ERcSB1ZCYT
         zRr60y2Dmqs7JAdAyefaSSt5KWllveLs1/1a75clvFDiHU7NBZh7SBs+PBc100c/bWrp
         1I3svi8sqXtduj35kKPGA7mE8O/k7V2TqNOj5yEHWupbpGPJ+x0xVll0LCkZnjoQ24XH
         FfmWYxdOR36kdiBrTgkrwDn8/labqXsn2sjtzkU4IquvP3sa5LC4MdLPOKX6ZRhPHaUK
         vvfLcfmvfbTIcZyKl4mWo+tHXcTqRQsoipNQSbadlWOMvNayFrBz1TO+6eZg14ta4tkh
         j15A==
X-Gm-Message-State: AOJu0YwZWmB0iPy7t96LWakaqFCPG1EwMyepDzIpELIBb0nrbscAQ3fn
	XJsLOO958wcUg4zAwQzfCzFsMMNLghw1nw==
X-Google-Smtp-Source: AGHT+IFSp5WyLmasZDiWea/xPGiIp+8dCBhTbyMOmSq0YAT4xIZLu3+JOiUJwERsp97A77f1qjQThg==
X-Received: by 2002:aa7:d40c:0:b0:554:af5e:d4ce with SMTP id z12-20020aa7d40c000000b00554af5ed4cemr1137829edq.70.1703418564133;
        Sun, 24 Dec 2023 03:49:24 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id z23-20020aa7c657000000b0054ccac03945sm4999771edr.12.2023.12.24.03.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 03:49:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] media: fimc-is: drop unused fimc_vidioc_enum_fmt_mplane()
Date: Sun, 24 Dec 2023 12:49:08 +0100
Message-Id: <20231224114916.111433-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231224114916.111433-1-krzysztof.kozlowski@linaro.org>
References: <20231224114916.111433-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function fimc_vidioc_enum_fmt_mplane() is not defined, so drop its
declaration from the header.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.h b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
index 2b0760add092..cc840e6e07a9 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
@@ -610,8 +610,6 @@ static inline struct fimc_frame *ctx_get_frame(struct fimc_ctx *ctx,
 
 /* -----------------------------------------------------*/
 /* fimc-core.c */
-int fimc_vidioc_enum_fmt_mplane(struct file *file, void *priv,
-				struct v4l2_fmtdesc *f);
 int fimc_ctrls_create(struct fimc_ctx *ctx);
 void fimc_ctrls_delete(struct fimc_ctx *ctx);
 void fimc_ctrls_activate(struct fimc_ctx *ctx, bool active);
-- 
2.34.1


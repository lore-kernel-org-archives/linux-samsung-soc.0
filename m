Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA643FED
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f0xhWpr9"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-554d8b24996so57934a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 03:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703418563; x=1704023363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+A2sLdMYd9jrOu4aUtIFiY1f/32swGwSuhGRSvbimyg=;
        b=f0xhWpr9yAuT8pn3ZBNfas90r1lbC3N5IR7Gr0buY5B3uORUkmoPij2PA9MtJ2gGR4
         r6c2w2uhg3KCEJTADH9QJ6ynr+J13UB+KBnI9j6b0+I5UI8iUC8otz43UhzNH4RIHP8q
         gWX/5lSTNt0jihNQeVNvBgkKHQki1dMxjHra7LgqkHhjogWx9ZN7tzDZE4sVtZdubICR
         xWzpZIfm5nkLE2yLTBkfBz8Lwgw7zlwNH86pYrl6w6LBu9pDVnLr94W+qmOYea49H31K
         uh3hJIUzc1u1oeSHfTezjVIk4/E8jeDj1RLIyL5QRJnLpQVv/QnZhB9bq+FbLm6k7Rcv
         nSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703418563; x=1704023363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+A2sLdMYd9jrOu4aUtIFiY1f/32swGwSuhGRSvbimyg=;
        b=ay57OEeQOHyL/fb4bChiuSsx+67jqbCUecAn3WZskeIILPhs35rd64P3ZXg4oM58DQ
         A0NZPMEZRfzzCMs/CRqL4SFqD1aH3aqBM4gxGEmS5RT35hNnfgsb8oZMC+kHW/D39aTr
         SJcLf0/2PzeoKw9vM1QMLpE395RGT56WvBsR9yTkcdjDwdUIOBGB1hGIcKu1bE4Ik+24
         3ZsxEisjLIgsPC3sksBKlBzWcyMtGMTBZYrh7RwTM3ciG+fgEkj3TVvV4hBwNIYMIGIN
         1xvCzmr6PTxhbisHLKH2qr0KJ+MTCE0O82PWzAPAtXxKhfVXOa82THRvDgGBNHqLJt/j
         crcA==
X-Gm-Message-State: AOJu0Yw81pY9y7ydDy3WwTbXEiyC6jo0LCVuNWI4GtwYWpeRkXBoTDQy
	K3vKvKjJWx2E94vRSZ/i7bYcrot7dog/uw==
X-Google-Smtp-Source: AGHT+IFiO4BeiGCukyoTdsjS7Uq7esREyuxI/9413ugA/P7Cwu/jb+Dq6hBnXpvSUiCHMkV3mLBjXQ==
X-Received: by 2002:aa7:cb50:0:b0:551:4f67:18df with SMTP id w16-20020aa7cb50000000b005514f6718dfmr2757054edt.59.1703418562841;
        Sun, 24 Dec 2023 03:49:22 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id z23-20020aa7c657000000b0054ccac03945sm4999771edr.12.2023.12.24.03.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 03:49:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] media: fimc-lite: constify pointers to v4l2_pix_format_mplane
Date: Sun, 24 Dec 2023 12:49:07 +0100
Message-Id: <20231224114916.111433-3-krzysztof.kozlowski@linaro.org>
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

In few places functions do not modify pointed "struct
v4l2_pix_format_mplane", thus the pointer can point to const data for
additional safety and self-documenting intention of the function.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index 7898c9bebb04..d1d860fa3454 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -738,7 +738,7 @@ static int fimc_lite_try_fmt_mplane(struct file *file, void *fh,
 static int fimc_lite_s_fmt_mplane(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct v4l2_pix_format_mplane *pixm = &f->fmt.pix_mp;
+	const struct v4l2_pix_format_mplane *pixm = &f->fmt.pix_mp;
 	struct fimc_lite *fimc = video_drvdata(file);
 	struct flite_frame *frame = &fimc->out_frame;
 	const struct fimc_fmt *fmt = NULL;
-- 
2.34.1


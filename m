Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1CF23A8
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 11:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aYixHiYJ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a26ea1e88b7so29272266b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 03:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703418560; x=1704023360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mzCr6s+sUXGJX1TCqlhYC9rStKOi8VqlAp3Rk3HIOR0=;
        b=aYixHiYJQ4MJKLPry86OaWhN8UifopydlOUmHLtWUrO7gEt0qfhNaOZaGhTqRxtyd4
         jhEg9fdcEx57VGMg6YGMpO0tJEseNgjA9jCKXc5B8V9zPIfEthIdN3yY5oAeeww/8sTJ
         011JU3WB2V00wWCevTQeqIt11D5/SntmO4dqB5u8ZIhZhEUnNH1g//LAohD3nhWRuCF8
         AfcKM7p/Z+/+p/p3oQaAin6XB26xf7YPuSpc/Sj8Lz7Ef13n10naOZXyT5g8JL3RCSac
         ne0DhpFYEtQlUR9NDPg6u44NG+Qi2Ui6beg7jfOQ/oOG4COURdO6kquTF/74TxQTnGOt
         5JIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703418560; x=1704023360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzCr6s+sUXGJX1TCqlhYC9rStKOi8VqlAp3Rk3HIOR0=;
        b=Tg8I35TdQyCB82Uy1mCBHSo7qOFkPYK20LM9S+7LML2M6PnTfcphsQ0Bhy7Mx+Mvzz
         BfJZq7mp525g6UuzPSEh7/k9UpMvU11og3F7UcdbCQKg/x+vo7U5O5Wy5M9TFq4fqy5T
         0MruoObcnUuhKJDkUs7uwUx5zf6FRGMl1rq+1CH9LCm9DxC4yMuChtA0fqrTlmAnJyFq
         jOUiBrJ9NvPoaUIDp+HiczU8phAjbxNpINUo6QSBKnA9FdK9MofX4b5QP8vYJBoM+uUu
         mOSVts6gjUu2sFGa1+Ajh8dtwJeSJVw+cdDzyAb2Ub4EOQT2siNoFFA87oOg9Z2X5pTc
         NQHQ==
X-Gm-Message-State: AOJu0YxadEKJ7SKZQlnUQovomCPG/oSzS0FRxURcOuJFdbOvQ+8S5KfD
	EyRuFhdcBUsd93W47CJIyGj9ZNikONO6Kw==
X-Google-Smtp-Source: AGHT+IGM0Y5645Zu1dPEnmVTVdZQEYcTnX/kb5UWJ1OjgBXkx1ByEUy4wQqaFm7kp+mEJGJUiKU+5Q==
X-Received: by 2002:a50:d49b:0:b0:552:85f4:ed39 with SMTP id s27-20020a50d49b000000b0055285f4ed39mr2643458edi.38.1703418559839;
        Sun, 24 Dec 2023 03:49:19 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id z23-20020aa7c657000000b0054ccac03945sm4999771edr.12.2023.12.24.03.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 03:49:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] media: fimc-lite: drop unused flite_hw_set_camera_polarity()
Date: Sun, 24 Dec 2023 12:49:05 +0100
Message-Id: <20231224114916.111433-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function flite_hw_set_camera_polarity() is not defined, so drop its
declaration from the header.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.h b/drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.h
index c5656e902750..3b8af3ce1838 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.h
@@ -134,8 +134,6 @@ void flite_hw_capture_start(struct fimc_lite *dev);
 void flite_hw_capture_stop(struct fimc_lite *dev);
 void flite_hw_set_camera_bus(struct fimc_lite *dev,
 			     struct fimc_source_info *s_info);
-void flite_hw_set_camera_polarity(struct fimc_lite *dev,
-				  struct fimc_source_info *cam);
 void flite_hw_set_window_offset(struct fimc_lite *dev, struct flite_frame *f);
 void flite_hw_set_source_format(struct fimc_lite *dev, struct flite_frame *f);
 
-- 
2.34.1


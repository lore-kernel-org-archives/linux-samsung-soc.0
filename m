Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3C610A27
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hx4/6cTm"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-554c6ed660dso221476a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 03:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703418572; x=1704023372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CrVT5u4n/IC0zfDww/SiIGFgrbay7ubnhd7vT2k8No=;
        b=hx4/6cTmyZe28lsSxcGeRVDo28RRvxBkiIMKTesJFb9KqgBQd16ericwRXpTPPTRQZ
         R1kGcRhUbAine9rQ5GvSWPhMUPFupt8yRUhcD48WScVTnq21tQmMte8TQenXkgnabE/e
         4EUMZbPXL79Gv4KqB7PmnWhUKnoMjYqynURA3Ahf0mW3BRGUpBUgwTUMC1vVUXYSm5gl
         w7fjnfmgBVdCY588/v7nKR9zZRFJk9C98nNOVsBQMobWA6ADj+j3buqTEWUSoHatFSgL
         BpZMCGo7cdNXBoY4Nu+YXOug8XwVOVuqPIfFlGZwllMRg3RwJ1UzXmIGoLvPIA6aRjmP
         9ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703418572; x=1704023372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CrVT5u4n/IC0zfDww/SiIGFgrbay7ubnhd7vT2k8No=;
        b=WuuOOOoa//mq/2ryytY4Dgzwcmu1CdH8O4ozDPzwKIejHaqDewGBNrxnsItGLugcdt
         YJSc4p33UgeeSfG8mInH04qMrMNRzX7edlUAUf+HjbJ5LkW9rpm8XIpOa4S1Duog8z5t
         zn99erMwn91WXxmH+BQG1WYF6a/V0w8Pk5VHspXtqOfM1FVLO9W4g6ZmLhZppOuGRlq7
         sQsqCsHEK3W+OoRxk32FbU5wpcxMg36JKjUgQ5fcimfD8tVxIVVHxj4BYIVrjLK88QM/
         8dkoOTVAOtpByHZIzMnoVib60lnaALPEFI6npkX4mkFJXX6TNuYmri4OpH+p2qfgi7/w
         8zIA==
X-Gm-Message-State: AOJu0YwHy+hwWjHj4v1jGljGW7t+5jjFkcRnnP7lXKVcuvTrgB0g84HJ
	cLDTc35wmo5114AecztZAUFpCbjNVdsCkw==
X-Google-Smtp-Source: AGHT+IHDghY2YF04IGnVIvlWdChgrgXx922/zpgzFWBd6w3LhebOaWYsGls08rqqyjHx6kRIsMASFA==
X-Received: by 2002:a50:d00a:0:b0:554:7b04:f889 with SMTP id j10-20020a50d00a000000b005547b04f889mr1861601edf.18.1703418572580;
        Sun, 24 Dec 2023 03:49:32 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id z23-20020aa7c657000000b0054ccac03945sm4999771edr.12.2023.12.24.03.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 03:49:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] media: fimc-is: constify local pointers to fimc_vid_cap
Date: Sun, 24 Dec 2023 12:49:15 +0100
Message-Id: <20231224114916.111433-11-krzysztof.kozlowski@linaro.org>
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

Constify the local variables pointing to "struct fimc_vid_cap" to
annotate the function is not modifying pointed data.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-reg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-reg.c b/drivers/media/platform/samsung/exynos4-is/fimc-reg.c
index 0ed6e22e6c47..edff6e5179cf 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-reg.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-reg.c
@@ -598,7 +598,7 @@ static const struct mbus_pixfmt_desc pix_desc[] = {
 int fimc_hw_set_camera_source(struct fimc_dev *fimc,
 			      struct fimc_source_info *source)
 {
-	struct fimc_vid_cap *vc = &fimc->vid_cap;
+	const struct fimc_vid_cap *vc = &fimc->vid_cap;
 	struct fimc_frame *f = &vc->ctx->s_frame;
 	u32 bus_width, cfg = 0;
 	int i;
@@ -670,7 +670,7 @@ void fimc_hw_set_camera_offset(struct fimc_dev *fimc, const struct fimc_frame *f
 int fimc_hw_set_camera_type(struct fimc_dev *fimc,
 			    const struct fimc_source_info *source)
 {
-	struct fimc_vid_cap *vid_cap = &fimc->vid_cap;
+	const struct fimc_vid_cap *vid_cap = &fimc->vid_cap;
 	u32 csis_data_alignment = 32;
 	u32 cfg, tmp;
 
-- 
2.34.1


Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D91AC423
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Nov 2024 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733010938; cv=none; b=nHBc0oGIsnr8cv3U0q1hm8Ytd65fIkdEQb6zlCroTrIHc09+rP0i+ZRLN4NzVpiFraG6wGsR4fvnuPVRot9OYVe0kcky2cyEGGFS7+jq+vuwWY3zLfvIv2kMT6kWLA6M/YHx59+1neOIjGN03SuQ0QV1NJNiHEvyFnNoPKGCr+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733010938; c=relaxed/simple;
	bh=jvlD3JuIycYlsUfGVML+3UeoaevWmHaaQytOdr+mxNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t8PGLINt2hTyCYtAAYYnVxe+yyz95yHbAtmllKcYxw/iQHF/12VegfMPKHGPys4s4aDOANcoF4ooxgRRqZszXcNxHe54lXCOE89nTFRghDlBuajOsn0pmvS9Fsk4Sah8ZRfIaPLiXj2NsTQeIp5hEGDQ0xBwrymjllECXvAwPME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NXMmW3Lm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXMmW3Lm"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53de101525eso3909040e87.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Nov 2024 15:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010934; x=1733615734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgyD7a8KnGJ66sjxEdDPFFI8o7yH9d7qAC7Fc+pHT8w=;
        b=NXMmW3Lm5rI9n1uKJZj9DBRsEUGKjg4gtCUkMwFy7J737VJakYJdX2LzrYF7TwKMdQ
         QGOXYDHP7E0wGVPyHNW/+dbDSFCgXR+RQBCRuNnmolmxwRHJR91SRghn6goKiMmPzDdu
         +KxrOhilGhGpCJQMFbeNSk371aqrG9ESldhN9/2lplBsvHPBr1dloCLYuymUbcff3Ylv
         mGJJKQNlH8PqJTjTYwUD4C1pCv1HQZLoXPoewITZk6ecis0onE/NfRDWqeNfZYY7OMvx
         IGNGICwH+s68TyhpCIHF5oktWsPCx57RbALjFeM+jkV/QgmlUIQTLlZVCCR08EfciZH/
         DToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010934; x=1733615734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgyD7a8KnGJ66sjxEdDPFFI8o7yH9d7qAC7Fc+pHT8w=;
        b=mdRu9Q7oYKOzL5rdI59smb42bfWhnq/qxMQV+dvriy25Cy9OyTrtOByh5hYLOsAQlJ
         vIEKB9vQ1FDud/f67PUFH32l05EXgnHDG7pwlNd3/CcUZrfrmtKHvLtK1n5r4FkCrBp0
         h6naG7lZhJ5epsjwHri3pUKGAf+7JZ3yUwNmKb9mmu316KSOdgzZWSDDNIM2W/The2W0
         fbiwlsvjI4Z7kHT+/dzkxle8CDXoc1TWeXGEt/igMJTvYvoLmWLeNp4leuEAbYTVH1vu
         Lfzeas5f2evJIdZxFsCe7v+m/cdLvjSKqTEfuRtVA0D0NKh9n8FccfLN2VPoyYjGE3Wf
         2RFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlXuTCPeBgLcMkB1vDjS4xfvittDTuXUGGyNhWlDUViO6qtPpT2rPn6zyDMGQFmG5PDNmOeB4mgx6CG7QWsM14Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaTmk3ArxzxxREKl3GhhG3v7ObOXNe015DRQT3AZcSZoQoEjIf
	L1CuB2/9wm1ue3X/YybBnyEB7Yzkoam4UJKgzv/6IREBezaKfttjd0esy5RR0fw=
X-Gm-Gg: ASbGncsTPfjnPcWYLIIQoQNWvuSr8gBQoDXlOIIgyY5lAJxvsQSsg/iWKhnziaKN0KD
	M2vWLzq2iKvmrVmBs+59+sfU8oHisjSd5xKKdgBfi6h3CGqgFoUwl6eSXJ/a8kNj6cwpn93duph
	rTqtWnvIw/KBdMCXrXVzI2XVkzyMKUluBKyD5O+xksuqLajMQC874CpMM+8NHfDwlNy+93ZNvBH
	o1Zs/98qbGhGr8G5OTCoXCOHGo8TkA77yzBpyri18NC1ky+pm5wrldFMw==
X-Google-Smtp-Source: AGHT+IFfhVER9h/x9rK2y02O8ScgxqBwF/5PNitw9Xk11JpSQfAwSB2naROC3kIrCP+2Ei8nyJ5Kkg==
X-Received: by 2002:a05:6512:3f7:b0:53d:f583:81df with SMTP id 2adb3069b0e04-53df5838209mr3265430e87.28.1733010934296;
        Sat, 30 Nov 2024 15:55:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:19 +0200
Subject: [PATCH 02/10] drm/bridge: anx7625: use eld_mutex to protect access
 to connector->eld
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-2-ba56a6545c03@linaro.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jvlD3JuIycYlsUfGVML+3UeoaevWmHaaQytOdr+mxNU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xt/7pykgJj245vtdzYWdYBTAMnwoeiEVz0V
 cHOwIg5ZZOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1Uh9CACs2EKgY3agKG4T+t0CkgNiBGM+05Aomb7V037y3ZsVMyGBgsnshcMdjjksyQHwWAR9UO4
 phcMcAP56G/wnh2roZkGyvmlMsXgcYwC/JcmmAmqRpZ3BOU41lxrAgavIrurye9kHFCYMSeIXMC
 ZL/VeuwljGdXtKvbiNuFpq85TOh36Cs5evtJpDjaTBBuRCU3eJzaHjovDNB31z0KSlAG44ZpfKW
 /bdsJLcjoLwHRdTtVG4mRghPrGrLzz35ix7Igay76WHZuOI3nL19Gs+e3V6XTkA8m2kprqqo7x9
 ff5KN4kX/nqX3Z+YcrmBBsD2/q8MSlB3PQI3Q2xKw0EPGz1c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe44b96945f34215fd900f35bfde43a..c036bbc92ba96ec4663c55cca091cd5da9f6d271 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2002,8 +2002,10 @@ static int anx7625_audio_get_eld(struct device *dev, void *data,
 		memset(buf, 0, len);
 	} else {
 		dev_dbg(dev, "audio copy eld\n");
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 
 	return 0;

-- 
2.39.5


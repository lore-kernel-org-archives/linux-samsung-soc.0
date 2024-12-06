Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4501FCFC3
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478212; cv=none; b=ORzOrc0+JRVQur7ACeBLA4pSgCXlHivHxU5xtT9Fag3HLA5USv1H+f90ydRVJeA4+kysQHyYgYh022ypci4/3RECv+z39scj+J2p8ctewNq7YJ63XVGfqS+xvUgTIv+zWd9v53Iq1VMBdvBxi+uNFnL8SUaNmTXXzBwWwylgHJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478212; c=relaxed/simple;
	bh=g8XDt4tMHXpR+O+C6P49zaXUZ1QAJx0+8PEn0RE7Eo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I4lazFwuHEZD7F2Vkpx5uD0xEwKZ7Fx5IVccCt/VVh9HXzjAbMLgZ+YpXoSjeSZFVixZEt7iW+V1nuFctEG4GquJZ+ITAQJR5Ktbq33qTuS/eKbE2jEKRu1/uCvwW9NojKTGgdmQA6IUOZ8VCU16t5x3ed40xs/VqVGW9JZ9zd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aIQtlsmF; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aIQtlsmF"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so17821431fa.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 01:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478208; x=1734083008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGq6aED53P5HelbsA7MK6wW8IBVofd/BuTMfX8bnHpY=;
        b=aIQtlsmF0EIv8fgE/9/WRbNLkzOcLHQGrH6Cv3kgecoQs5vqQfb0Cmp23Z1SufwMGL
         LdaHNVhYVD+edfnJU2hfnsAzt+6DVYUJzf5Uzlqyao5EUxrB9BrOaCSLzp79TEZIVyjV
         XMkZ3MGHI0THIS+xru43J1m++ZSRh/pmtPoia8rzKEEbJFzV1EDMGChxtBD5+rBeBcnb
         ITsNj8b61tUwxuIk1t3MZNjhWPuB6Lwm7elPhiEvX57ZFFVhnXCQ1E3up1c8Mm/fiZ9i
         pUai6jCd4HPx/jv0gE7jIVM+pCWFu6PmZ1GZzrVLJbqzxndBjzQbvDpwJbIUEZNUf4UU
         FJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478208; x=1734083008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGq6aED53P5HelbsA7MK6wW8IBVofd/BuTMfX8bnHpY=;
        b=iAl48D3d8cx+iyKJ8RIJHeB/azEmzDKrKovP885Jz1MShfkHoThP0K/mDCKzFVRmCT
         f4AJbrnZiPMS2ZjkFIde1Cr1h9Eti1wgNNwqjz0DmttucW61/ziez0g28J2NLQjyFbpN
         c5itIGvCaNO8wHy6yOAh+AfPNHnMwIOGczpoJZt1st4AvVVlTilAU0viZGI9AlW4tS3G
         6bkWV4Q6coc+LdzFxXXDjpR7jFVd63AZbEZod9QRjoHdJXPdr4dBHWpXJH+3Uf+mwYlY
         MgkCbS35ecm8tjil/lObDeI0VjdA0whzx1NjMTXTCjmXifDG1v+XMmT3iBHQITYmdQU3
         UqPw==
X-Forwarded-Encrypted: i=1; AJvYcCVXz5yAS5ETmnJgijUaVIEY7SDOE5Zbhjlk4Kcp8LBVnbmMN0HxXnDgclSbZFBXwG4svJlQKvpCPVbA8gYAHSc1aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ6V3cglZK2HRAaMvftqS85H+4UuhtnIEO9g7BTKNltilRckEj
	LT7G/lFv8Jw5MCEkHkQPesuboLXQz09XvgGnBrfH5AWRNa5iHCd88RJ+2/Z3OA8=
X-Gm-Gg: ASbGnctqnmGWMoF6v3ziGcc3JFyhqu+4EW7MEyfJA4cYG5L05Q+t+9w3gnxkC3Yjo6N
	HxBuKLJtRsQESFWm/hQLw/Ibi6nsp+oTa1qRGijnmloQXGn306CjFT6Q7luCBILngyd2Vhm0ydn
	yAVkoqGCXUjZehuNEen1lgfvoOZqRFRa8igRz0B3xEBgZTL9b8uDjd9zg6fUmNHWEfitl/GbXAE
	Z4oMNhIpYEEtdiQVWgbs1/p/KfwcM7PfQiI25MjiUTvpJYKWyGCz1JG+w==
X-Google-Smtp-Source: AGHT+IE/NYxmjluRmONb1EoU7KbKKPH87buJ0IjBEcYtxmwcZQlKK0G0iiNZoTWvmIko49pJuOa6eQ==
X-Received: by 2002:a05:651c:b29:b0:2fb:5f9d:c284 with SMTP id 38308e7fff4ca-3002f8e7df4mr10594341fa.16.1733478208528;
        Fri, 06 Dec 2024 01:43:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:10 +0200
Subject: [PATCH v2 07/10] drm/msm/dp: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-7-c9bce1ee8bea@linaro.org>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=g8XDt4tMHXpR+O+C6P49zaXUZ1QAJx0+8PEn0RE7Eo4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscuHK4m+of5M0K58J1Ue7FnC+JgeJ7oM6NSu
 bFPedJdqXmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1bfrCACW5hMSxLBb5or6qGH5D5AVPGJIvY9BGjNY1WTyi2PUHO7TE/oo3Ggc7rv7l860G7eGzQ8
 uVT1bon1fazOdXW+lYbtHJWim9TYibboTYhb22pQ3YrpWEiuV1UbYdHBB8vzbzO9jXkq/bJmQ1m
 +E4FMSQ4cvduHdnEWi/8FNjp7zOIShlJYI1KIxungwjDjpEKEtea0kLBR1PRGwCG8/yZZUFfQxI
 QckeAW77aJDzAZbPOuHWb2f1rJKPg5flOLCaaqtxskOhiUml7r060zILPXNfrxMo4DMSMj+jYwz
 1HVsVa0f3CLU5a7ZBeGqVsa/7rnSuUMsfCkuJrb6r9MQM91w
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 74e01a5dd4195d5e0e04250663886f1116f25711..0fd5e0abaf07828157085bd680bfd3c7d32deb61 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -414,8 +414,10 @@ static int msm_dp_audio_get_eld(struct device *dev,
 		return -ENODEV;
 	}
 
+	mutex_lock(&msm_dp_display->connector->eld_mutex);
 	memcpy(buf, msm_dp_display->connector->eld,
 		min(sizeof(msm_dp_display->connector->eld), len));
+	mutex_unlock(&msm_dp_display->connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


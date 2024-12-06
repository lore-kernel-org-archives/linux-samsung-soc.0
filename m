Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F93E1FF7CD
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478219; cv=none; b=qg+GDMYAMFdLKu41B3lXhRt1gWAAsWgTq1Ag60uRqzURbvOoPvYiYm8OGlSIgQ44lVcTzGvL9Iuz2vQEJGkCpjF7Ilvl6ZKz+NXYVBkDAJfehhxGxXPcKZJQc61YeRyykCG1Ph5bV3KA/JbGc3edqoBOejRSJDcAJGS9FRD1THs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478219; c=relaxed/simple;
	bh=MWBHkdOEPsNn+qx18lkyYR76WN4/LOkeB2bs8gaz3L8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1P2UIm3puF+WzltXdcrWfVcZaTpcpJzvImAh62d1aGu3q0Z1ARjMmu/pLjElHmquuQzWdZdm6Bhx0MN3jyQ5O8Q2waDsdE8CE6y/6u7QbS2xpTbgpy9C7bqNULa1VY4amekEOUxzQWPOIgn2SjfhVyxUZgI8OxYAsAhaHAG1ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gPtXq5ar; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gPtXq5ar"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-300392cc4caso1124851fa.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 01:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478215; x=1734083015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IK1o74pdns8MHUCAUXuevFOWZGOyLWsbPpjGiW0nUAA=;
        b=gPtXq5ar0qpPdnJUGscli3UI9uaPnKiu04suBW0uHlTvnxJAz3tWNYF+XLXnan6F40
         h0Xd6SE244ZzOfv2OVRJ3aNm3sSxIBfNigDvpmPNyydxVUcDBnSe6qWIuI9ln6dOCL7+
         QvDDK/k21g4mKkl3qxnKtknCllMkHvF3XziJ1J6Cd+Hi0NAKSgM/aSqVCipZXCcBlFDI
         DkHEBbzQWAdi92S0C+beFEmBD75NzyRt4yVw/BoIkdAtZCQPArf4tVPeLUbIVhBQyx7F
         39cl4M+tMgnwod97BhSBt3aq9vb7KM0AH/Qq44EZScre9O998K+Wzw6euv+5YbxDLsnK
         XhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478215; x=1734083015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IK1o74pdns8MHUCAUXuevFOWZGOyLWsbPpjGiW0nUAA=;
        b=tkyC01zZP6msOe5BXeBnVHPiehIG1EPGutO1qExAi5bM/509ofp6tw+Bw6fGlAh4qG
         s9vDIzo+7fX/im1POqS+ZK4K4Ng866l35IRyNAqmdKyfA7EDl/dfpUtOGc0pN/oVkBYB
         63AXoEvPs7FV75WaffPCqIpnvI7zA8UO6LMINIUY1hayTXZTM0GVoIwlZnHeGpeq2yMy
         qAm1NAwbZTXnLSVQCkX2ufjhgL/9TwjBUySrlcZelhvi/Jvkci4qv1xBZLpWIXxi6XXE
         FMNrblO5jP3ydcdS3sI6BHH+AUPCI8K528FzTlIEyuC4CMt1czkbQDKm9xmsg5zMHM+c
         I7NA==
X-Forwarded-Encrypted: i=1; AJvYcCXGfkSRC47oAvKmwvnYmAI3g1roNsvYZFdBQGge5IiZFQJdW4pAY9ly7+/t4QYw+zP1eegNRmzGPY2fNrvNGQfqnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+jrodgs63FR/QLhHr+uEOaOfqYnu+UWo0RKdpZxx4nKsscB4
	nYUwUjJxsr082dVEyP5TiZP/bL8fA1BjI4ic1V9n92fVAQVE9brYf4ihfUV1RjU=
X-Gm-Gg: ASbGncuB98ZJqpxwhlTf7e1uhGohHhw8ndjpRvNoP0j3AtWh0powZ8IaROD+jXj8B6k
	Hrl8IuwjFvCTyxV4q4dQY1Fj1Bqbkp/PQjL6kt9dfk1pG5kazSqxK7RkHgU8GjgTMNa4suSXIYP
	ugbfQN6X9IOzZkJwdkOTm85mzf9P6TEPsy9gAok9BrrKVObR8mNGUxV+1Nyn4K2QlxyWWuo9/mh
	7tqY7buyj1w5lg7/q9w31ltgdWPgsV3+ieDQ5uHvQzzAClYgNgf785rzg==
X-Google-Smtp-Source: AGHT+IE1jgPInMsiwRYU6/dysOt31sV51cEwkXMndrxO+i86Jp4v1LOQAej8bchTiqXotmvpJS013A==
X-Received: by 2002:a2e:9a0e:0:b0:300:1dbd:b252 with SMTP id 38308e7fff4ca-3002f688872mr6560751fa.7.1733478215436;
        Fri, 06 Dec 2024 01:43:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:13 +0200
Subject: [PATCH v2 10/10] drm/vc4: hdmi: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-10-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MWBHkdOEPsNn+qx18lkyYR76WN4/LOkeB2bs8gaz3L8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscvPX017OK5vH3lmiCwL7kaJ0UcI+IYa3uXe
 18ffiiI2Q6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLwAKCRCLPIo+Aiko
 1TqVB/4m/VFWpZc/Kltqn587dwO8poPOaD02T82hJ5yhbMgXNJJ4xBgopTLH+t6y1qLkjWvPRa3
 +noOhRXSMbmizw9O0yVwv6gxNAM+4g7LDPk06MwmatH6VGTF1E94wSnAXNKaI8qC1bl2SrnJ/BM
 KYHiVVScK35O/os2/qE4pWE0LXnnmku3xyIW8Ls6WMe1qmZtWPFHDfeYDOFCvmSz25/s1Mwwfwd
 KFZzI9qf+sRjDaObOOZkPq6Ckv7STP7qIOBBfScm5e7oF+CtiP6mBXMg9HuQFUocZsKI9nsQmsq
 6UTE1LwnESZWvUAQ4ZC1j4eA/WqUA5QdWk1RE6h3yZLXYzYt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 297afd89036ba8fba571379f5b6d63227eadb66e..f98617b8bf6cf9d92a806e35584e8f8ab0ac9f96 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2220,9 +2220,9 @@ static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_connector *connector = &vc4_hdmi->connector;
 
-	mutex_lock(&vc4_hdmi->mutex);
+	mutex_lock(&connector->eld_mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
-	mutex_unlock(&vc4_hdmi->mutex);
+	mutex_unlock(&connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


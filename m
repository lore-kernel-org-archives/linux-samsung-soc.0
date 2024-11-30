Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E461885B0
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Nov 2024 23:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733010945; cv=none; b=p5RSTo+54ir34/VdJ1bSWi2PMfyPVtIh8mgZ3HB3LIQUXRzX7xnVCMEBcoO6ZkM9Ei3o9i+8HcySzSN8bsmHPLmMZjyin7i6wgDGOQvInDpnjjgQNYbFl5k74HO1pWeMQ4tAsNjaXGx0aa/4oZAjzjNICYOE5JGXu+WRBRqGljE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733010945; c=relaxed/simple;
	bh=IlBBKvhDiY+cvMucjbk73vB6IzNnRZ3+VuxCS/o7lvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLkrW7XKnAstVL/ycBgwj12D+foaqt6kSoKdIpsIHTAweromX8+b8ayGuI2icle8TEo+65T4BNkTakCDcFEXdOYd4OHx559q3Ly9eErz0lK8BqtSpxgjWX6j7YwAoaL/hXlfy3CUZ6M2cJRP8qVgrqILdNnTh5jiw0USVOVXMn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hAWVdCRy; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hAWVdCRy"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53df6322ea7so5143207e87.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Nov 2024 15:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010942; x=1733615742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xien0N58sB4iffC9+suYdwxKcgrPQSZoNIx9TfZkSKE=;
        b=hAWVdCRyjjbK+tmx2kI+d4SnwGeUwn2Xj/9MmE5yhYqBFLKdvq4qeRXbr1fg8QR5ls
         a+sMH8AJ/hC98Ohk3Ik4KZZHdAgkHOA2D7d9QWWlPTmDElTHYawriZzS1/ooS3dDnKx1
         HdXOQJmNOv012qe2JvLV/hICxqGdxxIA4EYpv2vqFCNCmkBJwEwhatUM9Wl6fa4qaPN/
         Eog2Y/Jhzd9KXMFAHBPjfVXOggN0g8Cq8NWcYVZOyv7wl2sm1DV50KfAKOZpwGPuW8El
         qTYMnr0S0a93awU2jh/7WuF4Gvs8J5FcxwEAog9EddzBoCVT1xXg773dc8gcvdkZ29Np
         pPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010942; x=1733615742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xien0N58sB4iffC9+suYdwxKcgrPQSZoNIx9TfZkSKE=;
        b=oLSS/HzEe72ofjaO5Wl1r6NzhOvWQkK9R8aY/PYcSOEAJygJE+2Xt7nGpIzaYbA+rP
         TafDdN88qOSflpP65owOdtmTVVuhWzBBWcaHr48WKrdc6YG1Y2HRzkjP3otHeM9Nupa+
         OlLf1rQ/ZhbHCO/0l/eV48rfBkQVhTsbN9tTqjhXpcdNVhsHofg9cpxz9z5++O4HPu38
         2gJqLCTLt3B2+soF7Pj6UAbZU0buro+Dt0AIZOcCBCOQOgA1QkRzFyEN0hFI1X9BCwKW
         up7/9K0scsBbXXCH4lzWn3h6GmDHR5JSMGWsQwZnXBgeP4DUK1b/GE7U2jCpml7d6vHe
         hhYg==
X-Forwarded-Encrypted: i=1; AJvYcCVTg+aI/Kr7m0FxMDpsyCF7mo6+45u+AmiKB4vcstp8Bd6lhVuuKYeDhvHmp+wHCgZSQAioe70KbIlsoxwG5XXW5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGmqGnOAR+nFljgTTbJ1FDPISGc8bycnw02/cnDJO1Pm+O3S3H
	Xl7WKSBo0W4o95XCPK16Zz9+xRWP0hl7vYluMryJIek197FLGZD3Ir4LlIIxoe0=
X-Gm-Gg: ASbGncs1JBRypCyj1Xs1Op0jJdK6puiy9WZUDUDttWH+cekfbBOLTjC4ey4HGzUnyY3
	9z5BHGOYE/SbCFIavnctgsgSAPbJVvkfU8Aeeu0cLkAUxbV1lfte6c8YmWmB3HB6UR9hPzG/0U1
	wIziCV14O5No48KJyoB5SLq8j7X608+sbcaomhOYa5jPMlHOQNefkAqERHQpB6bpJYQ877ah7cU
	kz0xNfNVXqRAUQSsdIzi6O1d5ITJoIRnsIx7d/xuquQVBfitWz7/ELq0w==
X-Google-Smtp-Source: AGHT+IEoIeugoET5BqjT6NRzZzzy0ZjjP0TBRwdTQ5WPutajVCKBkgCZ3DW7I0WGOJti6hbbaxziUA==
X-Received: by 2002:a05:6512:3d86:b0:53d:a3a7:fe84 with SMTP id 2adb3069b0e04-53df00a96e8mr14561366e87.8.1733010941990;
        Sat, 30 Nov 2024 15:55:41 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:22 +0200
Subject: [PATCH 05/10] drm/exynos: hdmi: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-5-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IlBBKvhDiY+cvMucjbk73vB6IzNnRZ3+VuxCS/o7lvk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6XtFcmUlMe9gPJdYbealc8FI/qrUiornp5Sz
 cmdQjBUbCqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1ZUyB/467hRM5fIPQYymRfBPSsYEC5gNFcEsRNSKClp6yBUjqbuT5K54U8veccTLagqpg6mrQHB
 sJYGNPnkUEjnK/JULDL886lHb/pd7SixyezCY9k1Mvf+/vpb3UQCr09dSOMw30NiV6NkWvyKje3
 BIlrF/FZ/tS1DHxqV582BXI4mw5v2jinlQQFFXaTrs/2hLdXOEQ4QHa+nzNK2KyOa5RBmbNeNVm
 uQ+khov3pAbgUTXsoLh/W7vnwwJOU8GBcFGjx4o9CWpP8W8q76JzryVKmf3dp+2WCcFdRfvArJ2
 8NknAwK5Hx6FXILV/EdSpHepfGGp/Zv/ytvXybjv5g6YrJ17
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index c9d4b9146df95bb46cb6bea4849c331616c2b463..6fc537c9048f5c8e57e30f083121c9aea6b99a5f 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1648,7 +1648,9 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	struct hdmi_context *hdata = dev_get_drvdata(dev);
 	struct drm_connector *connector = &hdata->connector;
 
+	mutex_lock(&connector->eld_mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	mutex_unlock(&connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


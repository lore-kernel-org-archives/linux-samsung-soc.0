Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF961F6662
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478202; cv=none; b=TLZlAw4ywwgEz6TwKlOXDAj5dGYzU9Q0u7q4fv2wI4ch3JxA7zdlYRVZIQ/TLt1PYTJQk/BRuiEbPB+NwPY7r5lz/CY7cn8kYRJRGyUBrC3g6HYk4zHZIllc3/ay/ahNQj2x1j06drZ33v0mGHQSz9R5mPJsdG+EjgNwGvnbGw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478202; c=relaxed/simple;
	bh=zYvAEMAKJI/pMjPuMCGmB4bmJnIIZvQ3OxFQhHsqYJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXzjpz03CyCTL95LrHqj2nzTSPiMEmURsTOcJLOA8BcTFCLBzEsc+W2koJSP317+kh9J9reSHFYMut7bU3bIseMdC4kTUul9Rm7uUD8N0ZLq9V8GlfmZtzJrOtahiEJ5ekCZTmSuSO+YWxRIg6NtblhIBDQsrcf8LX1vJJ77UCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4CIDWrh; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4CIDWrh"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so16744151fa.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 01:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478197; x=1734082997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXd2OzHxXLbpmSJUeio7TPXwyPaZHSalM8FhliMGDmw=;
        b=I4CIDWrhvKO5AWKXxQ7OxMFlE2m208pgGQOgIjc2Y6oMvBhkSnarTVKWkDtf+23kMe
         nbV73FlBjZ9N89JW+elnxYc3Tvo0S4CKKgwadS4QLgG2o97ld5Wya0vmOxZuZdisap/k
         oOKlBPnajOYDJJUYoWie0OcPo1D10B/TQGQNXBwnAX4yfj4t7NMpyvjAfs44YN8oGCso
         C9qbAdNtXjd1MP5U8Dic99KYdMrllRL+v2Oyx1aPjkpUf97FMbwGwwXOEAbyT8VT9pY+
         i8k1/HU7aBXNEh/9drXAAYI3hSUfXB4+R004UYEehJmuvSSHsUqStzPvRQTbwakPBMQV
         7Egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478197; x=1734082997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXd2OzHxXLbpmSJUeio7TPXwyPaZHSalM8FhliMGDmw=;
        b=HnX7zMo/pn1toU62VgGSGHnUCE6828eZAXcKGfvISFUu5Tfdie7m7rsmrhZjJDCpq0
         qLkN2njDXmlK43Xy/oh6tBudX3kJxlZfmqlVmdAM1XPMRTIewQwBY5axgpqyFuPl2WHM
         ZXfXmBk6lsk30uvJmaUeZVgqS03UWZRxlIDwT5wFYEqcaZrVBjoVuJPy8jl5+BX9KmrG
         JDq8ExATK/zZUHNHUi0A3LqjSRoyuevNIpoaEX4uDkh4IeK4z1Ft3tzoHMRH1Da9LhP7
         UfwV9ZqFAOFzy+KsPHIitYEaztDrEcs5zVkPpCQ2fTMtYwjUIykqigljq4K91RwrFCaj
         s0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOeVUy+EuCcEd/1WFqncGA0y7ipRNWuxztkfTGbYeCTejeShlZUSmKmbuSxxAPJQl62EwA0Pdo2WCK+q4lFQuSPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqm6WVdyOAdb/nZ+vtEg6L7i/8uyRKS9P23wPexAnvF1nH/oKR
	Ftds6A0mJany6bKFT2Y0TWI4rDw/rxrru+xRMPkpn8m2i4uxsljmj8GOQ+Ug8U4=
X-Gm-Gg: ASbGncvo9RSd9xvDbLo6ypTpnH5cYGyoorFR88yATlxE5GdhThc5AKkkN9M+R0PEvFM
	NvtDIsIRkpO5RCTsNz0ADmYY3r2N8llzFzF0/yfC9NLPiGcBkYH3Eqed7S0z3SrWhru+uktLtBW
	l2l1Cjc54M6ArLD0lCJZ14oTceyajzu9JEcu/LUzvVDaYzxKnHOms+ND+fXyyTSw2bUjUkJMhhI
	elThe1nvFTgGs8pE9VsLBKK2jIdH8czTdjSbViTZJNuF8K1v9NxITV15A==
X-Google-Smtp-Source: AGHT+IHOzYvZJj8Vkykxd2x0JSD+NBvzpXfm6jlvPobPhv2vFXWDLmCYeuoQOdT69cvmzqWGVgvY9Q==
X-Received: by 2002:a2e:a9ab:0:b0:2ff:d0aa:11b with SMTP id 38308e7fff4ca-3002f79b514mr6682241fa.16.1733478197396;
        Fri, 06 Dec 2024 01:43:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:05 +0200
Subject: [PATCH v2 02/10] drm/bridge: anx7625: use eld_mutex to protect
 access to connector->eld
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-2-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zYvAEMAKJI/pMjPuMCGmB4bmJnIIZvQ3OxFQhHsqYJE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscuOWsnWIy+09WL6ZmIga61MhuoPN14wFRyc
 CTUUhM7PIGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1QuCB/9GVQCw++i7vtbIm18C0qWy2CcrBgiveGKyYFt0iSpolRcgaG6RbcwjW5qst9mjy3Q6fyT
 wfoOatec5nsxe7H0nq3z0RdLACzVly4qvlxnotelWRdH/BQ6ujFXyFerWcmtX3JM/VBGIQ2IBAc
 cy6kBFVrFFfY0hrjJEvNHpO8Jw7wJ8KQT4IzkIw7DCzBnKyhq7QShr5O2I++bdw+2PCmYR+Ig4l
 AKpe8UolsbHTV1DesMVMTPNQMXDw/veYJp5B5GOVzXYZoSXeg0/Wp4HONWYO6yhjuqBKn4BL1Kz
 Qv9O5BOb777DITYj54ixLYloqlzSi9P0cRUdPa0UewnOGLrp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
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


Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13D1FCFEC
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478214; cv=none; b=td0Ci5RxRNqFgoHjVFNYHqh6tOo/l3Ys/3ojFblO0lJDYFwRMYYTUSJiwGYTB83/vt7+bmb9JJCfYK5HdeD7zoVin07JnbQa0ohaV9ZAMDDG/qihiqtfQep65owZOeBKqMpmKJj595qYPrzv7kEpI8XaSN4xX0GkmmGr0oU99fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478214; c=relaxed/simple;
	bh=AjWhuCZJu09L0XJl9lmri3iZkU99jRBF7lQVFbOa47M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bxp0+CokghPedL3VPkT7eAOreJCQIjAMDL8oJMDDiT8gRlEEcx7A6uzsViN+vWvSGQS5hyrBVYs52oK8OGgNck5JsH1NiyaXUB3TP3Vc8UDQJcWmPo4L6GzCD+S/1O6Pf/S5VpygXg6gwa4XReSrN12wXBF1bf+k1Bv/GbTRGcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CCAJvUX5; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CCAJvUX5"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffe4569fbeso28673361fa.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 01:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478210; x=1734083010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjfS6UDkVSnKuZTI4p5OY7qDfSEHNtP2btpHCtUSsMw=;
        b=CCAJvUX56CFYhOlbMhPZ+4P8UkO2TLATNbO9w+T4d6GP6Zq/ZCcqv6yEbtOX1qo717
         p628w7u/4Ew00961aC9Jsdz5em0S3P0+KB9N/+An6CGSWfJPO+BMCKMDbt+Fhuviwi0P
         aOp2pIwx6NPYDpAW5f2SqY+fC4M6oKszKHCikKz64jys7jkA5jxxADOQYkwlPag3giDx
         CcjjtL5Z9SntcKqzg1h5uy1gtyyQa8uoM6Z7HDgzMaBfwlvs0LX12BBsmlFeMuKQkMuy
         gw8PbK12/WY9hIT1HuuOIhX55KWhRMUNDCUUerGUim8L2VfbhvEVz2dVBAmbS0XSeeLm
         /eGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478210; x=1734083010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjfS6UDkVSnKuZTI4p5OY7qDfSEHNtP2btpHCtUSsMw=;
        b=v+PJ3KFkFmSIzaKNk65RKnLHYN0IDqjiNkdf3hM0cpt9vmBw9fsjlXoi1LbDWYfkuQ
         TxYIHu4r7gzEu0yXNiSeg0AJb7RM8r27N9ntLTIfvGGqeAw3Ou6AU09mFtdQoeGv4FuJ
         WuhXgNJTZpr6JcmXLC2ZT0s2Revc5hOBWAfLqx75lUee24vVu06y34ps+0GKlYRhx/2Q
         CJcLW5dyOT1z7oq7ZFQ9L39bgtBOT6fDmlc4dXytZOnGKEaU8KZIIbr32G0bbTXv85qD
         Bfc1Zt7mFxtoVMEIzlNS1A9GftyKnW/ne2T2cBeBEetQCur3elIXbe6NBsoCb3KBI1wM
         tItA==
X-Forwarded-Encrypted: i=1; AJvYcCXTNce3jq42WDVhtRfSQPL3dtTI7Cbz7esqHRjP0N3G+/MwccdJf7LcOW6xknj7TxsLxXDjUfaNjP+EV+DCX0Zbig==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywprnc8gU9Y5KlmcjyHZbCnQNqJvrd46FzO1ER7ECsLRAr/kIbo
	SnK9ZKbHA5yNUlk9ZmCV+T+GENTf7wDhhpGtIakBr0TQsULp3ROAVvY8Wf2kCYE=
X-Gm-Gg: ASbGncvWdORqD5Zpbma5PufKBNnWuHA11f4Kx/mAhhRVx3nnKMpuVPmmh2JXuqVswzX
	BBQw1yVtsx9mVmqErLhg35rIYJZ3bFdN27XO2CnXan2xXJjCYUDwDqEwgZruUX/m2Ymh4Sov3QP
	maEagxooTBsVxsEE69ltGLxRtSPWQ+LVpHhnis2lSqTarnp7GVKZ04ESCC5NOy0uP0iC5EmjDt0
	DrM/nACboDxxSOEtJY+uppBqduTsXsQiON86Xvdiwc24Bt/i9XiLhEnHw==
X-Google-Smtp-Source: AGHT+IGlcn6F3j2D0eEiigVRHmv//hcsZLDTDwaSW1v+B5KM/LuoTROXlD1yn9Re0AjNw0cch3o94w==
X-Received: by 2002:a2e:bc20:0:b0:300:ea4:4e24 with SMTP id 38308e7fff4ca-3001eac5caemr19445861fa.7.1733478210244;
        Fri, 06 Dec 2024 01:43:30 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:11 +0200
Subject: [PATCH v2 08/10] drm/radeon: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-8-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AjWhuCZJu09L0XJl9lmri3iZkU99jRBF7lQVFbOa47M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscv8mrxYpdnQrN5t7MGxWbI8gUEf4HV9oqdH
 /GygnY/E/+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLwAKCRCLPIo+Aiko
 1eNuCACvtbdy2xfHWggRb/DI8ZumCyXC4iUXD9iziSzFcEDO8vqI/2fCDKjMpxlhsveDfytOBQZ
 oRdOPeOkoLL3uO62vDV5V2VYiUsdsxy4In6Ro6X3P/aCKb6E/3bVJBjfF1e+BpO4HzEDq5bshin
 Q8sislvKTDt/zFBM9TzroMIyWvYqMXzAusI5WH25he5flEL1wFwcBCMNr+2XOZ0+scdlLKi33FI
 Oi2na5oqsLdlqihifCjf1U3GXLKvDL4fvq79UN3+5aL4Wj6ChZbQ3Kt5ArimSGb7uZURbdsOMGp
 mVjDJQsRZ9XvpdnrqBt0x2sTm0oevUE5ykOyS/V7haBZ9PQf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/radeon/radeon_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 5b69cc8011b42b4686c02f97a2b451a63d6c346d..8d64ba18572ec4bb6f6985be3a5edf581c47d7a3 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -775,8 +775,10 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
 		if (!dig->pin || dig->pin->id != port)
 			continue;
 		*enabled = true;
+		mutex_lock(&connector->eld_mutex);
 		ret = drm_eld_size(connector->eld);
 		memcpy(buf, connector->eld, min(max_bytes, ret));
+		mutex_unlock(&connector->eld_mutex);
 		break;
 	}
 

-- 
2.39.5


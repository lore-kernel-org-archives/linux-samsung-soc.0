Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023D31FCD11
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478209; cv=none; b=SAHT9t1BcAfJpCg1ZAYCb9rdhSSqQFGcVtUu1W/lyYv+wPj6LMEQezMmi3YMJOsPzmI5jdqPSISEXzPUb+2mKHqQ578c//NIPFnL2ljon714p2sEmEAWqHAaXsmDs0hDtLzwCmgFPEGXfQ+p3U4FnEqRgE/iQ92HbcTLofIE1+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478209; c=relaxed/simple;
	bh=tgOWbzXmlfNkUNlgKabtbqj34BDfcm3kqO9iU9YutCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThzBva3upn2hbr+ZDOHwHYIKUrV4H5I7quUTUIaOuo2BQlU2s6t679FIy0BtgfLKCCfjuQHBl1CRWJoj+dRnFViemRELJy/AZzWaOMgTsM07iZeV1e13EBHWm9iGwHGTYE/ZW/b44qRf53JqF0TEn116U2+wCiueobFySpxstHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eM2Y5oD8; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eM2Y5oD8"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3001d009633so17070471fa.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 01:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478206; x=1734083006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gezQjvgIcYxaejQ8BDd64CZD9/Ck9vNVcEKNgvbZ4wE=;
        b=eM2Y5oD8FlK36+aM0ekPBXwYUzbNAZIYfrmLPaHp/glmF8CzoJpXwoFppi+vP5Okjp
         gUd9Tf97pVGnc4sXScOZ7z0K5AwgCCkNvVqdgMuvO1XIM7wHshe0+rE3rzcftByEL1Vo
         YjQdhEdZCTlQZ0Tx37Bo6tUMyX9b0XXrQeN+oRmI1Ul30Mp30q2n/tqDvddwmkNPwvxO
         pBmduRGm9zlvk6XAq+q53TM/LD9FUyzhRc7lJUw7Ynu4SezM4ESU873GFXmEkl8nIuNF
         opA9EFK7Id4NJKG2/wA8GD+yMMq/zfM+myGOB6EZO8YNBVffT/dCpxcKivLIvqneqskW
         sPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478206; x=1734083006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gezQjvgIcYxaejQ8BDd64CZD9/Ck9vNVcEKNgvbZ4wE=;
        b=EkykQFxMtXqZSTvWn+bfGOCseIxs+f/urdgoeOadTTDlSW1PbxV3fqSG2ud/gSCCQS
         SwdKJraIksPZlhUG3KmSMp2XH4BgzDIf6Z4gItr5yvtg9klcPce8p3vtnWmujrWJTFyg
         G1bEk77MFY5XyyaQ8Zi6rHFBbTENLjLvRB00FhFJp8pFRw8vqm0VDn7HltB2A7FMIw9O
         edeJSfjYhM0eqKnaE8d0gcsBzK/xBmId0MecW9sNJtvsDPIK3SV1rl7b4OWR7lGN7lok
         dHPNv/FC6Q/e9Oknf25ESx6g4D9e/KGfDZsjKfjQmJ1whNXdygPK8+KaRTjoskvSLz4v
         rlPg==
X-Forwarded-Encrypted: i=1; AJvYcCVdWAQu8yAmGg5sOGNMeqhKF3xTnD8j09UdLnV4tAgg25QdzlIcu74OlMsyzfPVrYNTuYaceSQFEC/x5zXRv+WnwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT422nEGDxXM6PLr63WF2bj/QXB7/y7SYJGcj2y21mmCAvhWSb
	dC0Ey6ETgG4BglmTD/v0Sm2JmK2KwV13v6RGealyWhc9zA3iWnchA2VtsywVu9E=
X-Gm-Gg: ASbGnct8aKpgkS8eCuC6LDFta5dkuXMEBHNIXjY6JnJ20PFuARot9Qf2YwMZZK7bxaO
	m3Z3zKNZafCsBp0f9YEhmrNinP5vdyhc5SSx9FesLoZyJgnpoMkH3kWArVrPahW1YsUmrFo56wr
	HjOto+m2+ZYgVRysTX5ge2rLEuLVRLlZjjKmqsPiWW/MoHYWc0o+85vNlNLIYeqHopLkyr4j6ZB
	ozMbwYjhk6qJCThWTgvsfHbu+dfiZRfVa1fnZ+nacvHuzk+pFTDo2hz8g==
X-Google-Smtp-Source: AGHT+IFIxMP3XivqZCXghDCnZTnDDHCeTBksUkUbx72OhyJC9NMw97gxwKXoTkYomD8vLYGmPlA77w==
X-Received: by 2002:a05:651c:150b:b0:2ff:c69c:db0f with SMTP id 38308e7fff4ca-3002fd14d81mr7610671fa.34.1733478206004;
        Fri, 06 Dec 2024 01:43:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:09 +0200
Subject: [PATCH v2 06/10] drm/i915/audio: use eld_mutex to protect access
 to connector->eld
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-6-c9bce1ee8bea@linaro.org>
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
 freedreno@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tgOWbzXmlfNkUNlgKabtbqj34BDfcm3kqO9iU9YutCA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscuyv5W8v1YTELbuHmMKcJNbiEngJDs2MHEM
 hFooEYTmIOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1axkB/99cecYxR+X5C1zAyfkKFkvE75Us55r2gVNp2BPRSD08mYQThqr5+QEsx38SPihPleo366
 eaLD1hT6L2kyK6wdMq+Lkkj0kbXEPPTe9pj1Aad/UleIfoTG7Ps/uhFSFLdKRs0DnQaSZQME+VQ
 M2v8AFXHFAYJgM+8WPJgC0HTtuPSWfqBz+0JZQvtJgjoKRndMOmhlxr4vbN5xbJVZBgEPSDBujk
 kmWs3fgGh1o3Yx1/EyUv6Zz4X6sBrwrTlNvZNOSrOmgizBJLo+cBQyXqidSxYnZIp1DqJdxMFo4
 Qq7ORf/cwV/dZd0e+mmP5jB0ifPb0a3lavlzcLRDNPRaca3O
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 32aa9ec1a204d2ecde46cad36598aa768a3af671..3902ab8431139c3ff4dc17b841d94b6d3241dec3 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -699,10 +699,12 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
+	mutex_lock(&connector->eld_mutex);
 	if (!connector->eld[0]) {
 		drm_dbg_kms(&i915->drm,
 			    "Bogus ELD on [CONNECTOR:%d:%s]\n",
 			    connector->base.id, connector->name);
+		mutex_unlock(&connector->eld_mutex);
 		return false;
 	}
 
@@ -710,6 +712,7 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
 	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
 
 	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
+	mutex_unlock(&connector->eld_mutex);
 
 	return true;
 }

-- 
2.39.5


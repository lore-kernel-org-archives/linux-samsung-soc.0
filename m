Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5273B176AB9
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Nov 2024 23:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733010944; cv=none; b=MlfwSwYw0xhbAXjGdZLSkxQ1XBaEzCQNN3z6Jng9rwgVokOIt5sp9jdkvh+6Xqsnu155R+2E/JspUI7IKEPcmIgJjIV6AvzQlp4f0mUEq8fmhDbFzDCbphA1Q/NZAW1BZSUC8qdWKPKNwThM6nhnt2mSCZiIYYanwCqEgK9JzaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733010944; c=relaxed/simple;
	bh=tW4andf3hq3R7WEIVc+7/mi1YkJBAZuwRdePwQe7SPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P6SPt4lPlXgtLTM7SQk6/khIhgOe94Zsb3zwEryr7BV7GJCqj17PP8kQxlog8QD6q2w9V+8QEM/477lKvQH+o0zIgS49Xb0z273hauCtL0/xYmZLfqywW24RSMrTcuXiQ8q9/VS1rLR6unSC/+B1hOX1FkCLJqEcUWHTtBVHe4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0bRe/dc; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0bRe/dc"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53dd2fdcebcso3429115e87.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Nov 2024 15:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010939; x=1733615739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cxY+K4yZx53tAspmDt/c32sXFm2om2yzHiockIbOqk=;
        b=w0bRe/dckUa15PVW4A7JFk3k1MLklX7jJLUIQMNaoXajh885W6XYIyt3JX/qqAWASk
         ljaUFcXL72U0NI6n+sRUb/Vw9SjQap2wDR5nZqQfhqtuQoVPqIvh7GDi1crEp+wNPwCx
         zFQNAangiaWo6SOs1M7B9CAZW3tIzsp9V/jOv0D+KT8qttvIn+acP12i3t+ftbOWgPpY
         I6xG6egcrW0OvTGbck+7xMxuuhdT5JSpQhyVXH56AYa5UHgD86Xvc0MgH7M55IuLp2Mu
         71WlQpt1CfypEEJToE6T0nuBl6uEa6ECkA8lgkqgLt9w7yYBlqa7CAa+dRyjJWNuEce6
         aBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010939; x=1733615739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cxY+K4yZx53tAspmDt/c32sXFm2om2yzHiockIbOqk=;
        b=GYWiQnuiTizPFQpYu6JCDP1/SeWDBqtFQNGjYDn+VtgVsEzFhGX1nxLAJCqjyQk79Q
         L4+goGbd/BnvlbbYMAZ2jC1fRC7fsibpOWyEHDPB7Dbc9q9OYnLj5xjeyfD3ZTyq4bIc
         VmCsrdrt3ahxIGsVpYEL41MihIN3cTMx374jKuArai1DGqzd+fH0MJvDQJ3HGzQY5wwY
         w0iG4TkRC51T7gtW+kPE6Zpq4Wex+t4unZA1yil1u38Xn2mlPVeJTvh1CWCpJQFMCIc0
         blnkgrzHXDoHio8w4Bq7iRbuObpXp5gAPHMwoS4BWcFluhApkVzu4pzI+iQ0wCkg/1TR
         AzzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0MDWF35uz7tbgSLN/jg4KimXcTb7K46trm1P5/ukKwlXJDJ0RVEG9+fZFCncF4P3B0SSAsD8+GUEl2DbzhVp6lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz18h4P7d2pRBsuiKwTkkcr8Nt9KB8xrYBs/5d9VYRsFJNP9Zs
	q3YVaBhdl3IisW2uf8otced2ujfi5Y5w7fU5vPr3ySPtUCqr03BTFcYGgthIayA=
X-Gm-Gg: ASbGncuTnPECStk1tIsaIeRYHoeEEop4dAijcUqwHxDRJYKaupalXdmPnbtg+JZXErH
	wi/KlktTTHqbOdhuPX9lRaPi4qwMZdPCrs9oXsBzlpArgRjmxUiTx/GISxR769B1JNJ7Y1YcubX
	L85Y0O7yuYhrF9nqz1VjF+iao6CFL7Uk5cVFEw1n8syweOMU9Fq0v6UdY3tD/DM2jIOrTLXkZFb
	FYeHcxpt9ZD7flhHbYrgiMRIVLmB/hru2ojmUVznvQGwprFWvFF3Gr90A==
X-Google-Smtp-Source: AGHT+IEqhH9kCuwXPt69aMI3EvWDASBu5c9Vx1nORTc0e8euAsFhVw9NvHYYoIvx2navJeV6UfeSbQ==
X-Received: by 2002:a05:6512:3d89:b0:539:f9b9:e6d2 with SMTP id 2adb3069b0e04-53df00ff7c6mr10203616e87.35.1733010939471;
        Sat, 30 Nov 2024 15:55:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:21 +0200
Subject: [PATCH 04/10] drm/amd/display: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-4-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tW4andf3hq3R7WEIVc+7/mi1YkJBAZuwRdePwQe7SPw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6XtKnM5W7YbjO8PfgAgXIKJMU347EHoG7pN6
 bC7slgMtUeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1UpAB/98T+k5U79sPWHDEfdVoK/uxOqdWekFRUGXmaXz8lVAUaoc1w3Ob2vgVsHEmXEpRZcEqWq
 bqDqWhVxSkMp+nC/KP4LYMkzeAhQdwu6z7o3M+cI/LhyEPck5mRwoKlsIKia5ENA0q+YRaJX8R8
 D/MbaqjEkVX7h5ODRsXt0b8del0LoST99BcdJPq6yynl2AInKf1mwGTeXOm09nkJ7B6JX9D3N0r
 XnUieG4H8ZtcZAOSBh2bHBQePXm7XUKBlvFoHDklRqI/YU7jyKDWow4es6KEqLKgoa9z5zUayj2
 4MDN8Hi3OJ8XFsnfXmBTUuMae75l5OufjL1fj5yqKjhqazvg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a0bcc62f280f8e80f5d174cd2f567a8ec616e54f..2843283375551b0b85f5f897acdb2aeab652892c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(struct device *kdev, int port,
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


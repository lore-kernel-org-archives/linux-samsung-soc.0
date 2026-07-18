Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732513803DE
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417813; cv=none; b=rN29pHcAKujQYSYqGs/BDo29CJeIgQ17ZhW418LKGeXpZIQbfqH+U5/RSUlLzeb2Xs0P0LdK8mmmAcLYfIJwuCvXsM+2AB6tHx529jBC+iHaj2j7vz7hAbsjMhh/lTZUVXr3P/ktxpgE+9fRI0EEeNKQ3BKmAXQ4XmAyBSV6XBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417813; c=relaxed/simple;
	bh=EhmF3j+M4AduWGCg7EqLVWPIxAwmTTCxT2Gz0yXqaxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zse90nhvlfAMYXB3BnCewbegGIXzpWLETFP1sBEMvw+PyuSKl4jiO7Y9//pgY64/iGDMrq6JDB1CUSFB4TFhtoZDLBNIaqxdWehJUmgZLL19tB4kSeBS9kWafp4aByXWndNDVIO205uKHwFulE+J9mKN051h9J/VQKoCSCsLSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSRNm0Un; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSRNm0Un"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954df200ddso7183105e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417810; x=1785022610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=DSRNm0UnpdKO1pbpdDw4uOVfg/zYafz0PCJCpAnsnhVZITB8v6XSABQodNL+sehwWy
         YLnDiSclQhajkd7cGIEz41d8cmCMOu1+XPZhPADxLvCewJWh6NRGgpSn967iPOlAbulh
         dJMpzyjwGN897E34nWoHX/cTyXRaYfWkj76tCsOCZpi5R3FhX5L7+eLgDW+R7ZgMgI8G
         B/efzJOhW0C81oH4Fl/FognDifTF6peZQKNbCyC8lEXl2mOCBQKTZQREnwjlyUDehHka
         QzJMGfdCePgjfR6ihNZVZMqbu0LYoT7IVTvOSvGrN4NVZCuQjRYCTU0VtNuAJtzGMUJf
         3rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417810; x=1785022610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=DaVsV3JtQXqom3djVfDG8LVSor/Jjg5Z3bUVkkRfCvqrLqi8HBiuqFg8DVVkTruT/U
         KJj63PwuvIJATPfVfITDd3TGCczR3QEwMtWr5jlrEM5wKbs2aC4R4stxvjfW748lCY2x
         793mwW5zmTZTxN5GeU0tNoAcWeY3h7DT7l55E9ET9a20sJOhsruhdMMuxajrSEovfGxF
         2JnPRAVsm2lNLOtLFfAEwbrlTQiKdoR/CDABDRqPSGw+BW/hUHB2b7mf9WrTw49J3g/d
         3C0yJxvPjROm3bUnsWorH6iw0TR+gxm/+11aojdS0gGzxGiQnmuwiYZQ7QSCuFezOAws
         uJyA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3Bd4c4MFWWruP2wHqO0n932cqIVqofL6GxG4mgBXXnQoDuYo3reVuXd4JsEiKP3LuWzNmLtOGyCXMkFZV+9wEFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhiI813pIK8CNufZ28r9LIfKTMacvNslWCnapWHRaXuKxWamyB
	8iQQrZfmogNSV9Y54lM6wDBdhj84Em60UhzR+z7XGlPTjDbGoNVoptO+
X-Gm-Gg: AfdE7cnmA6jrrMRA+irkx0c7tYSqmAI/LAGohrPXzFOgUAkguQwZ2HCbEdPk9dP59XO
	mkIF5Y6XtO8arWmphoP9L+waBTgB2WkM4obiEFr1Dn3ejnagkfDeUOSxeyw8WC8+fhPGd1q9NvC
	jlgZ9ecgQZhK3nCfDk+Bly9Qk4n7LGqE4Nqn5Gif57b+N3YFxlZgzDmsUCG4U4wgBY8uEvYDh1I
	CxxO1PDJuDaqt6M/fVOCmwxagnR43Mb4FEpiFMJdqyw5v/ipGAYXz0+NaZmPg2HTeEYmzAUC/9e
	i3sMfoIstF76uq8klttFp96mEM+ghKPb9/ZxFybLm4hYSen4bLfDwsgNOA4ipNoyub039YQRusq
	qL2YR2e4Gw+yGIK3qscK2o4uzjBRobTbDvKl4jZE1HBqj9TaWhergfHKIw/EARgh3HSDhPSP2m8
	fzmcwb4I289A==
X-Received: by 2002:a05:600c:3b28:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-4954a3f36b6mr89247115e9.10.1784417809642;
        Sat, 18 Jul 2026 16:36:49 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:49 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:46 +0200
Subject: [PATCH 15/15] Documentation/gpu: remove completed
 drm_simple_encoder_init() todo
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-15-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2

All drm_simple_encoder_init() users have been removed, so drop the
completed todo item.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 Documentation/gpu/todo.rst | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 14cf37590fc7..b7351467dc74 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -29,21 +29,6 @@ refactorings already and are an expert in the specific area
 Subsystem-wide refactorings
 ===========================
 
-Open-code drm_simple_encoder_init()
------------------------------------
-
-The helper drm_simple_encoder_init() was supposed to simplify encoder
-initialization. Instead it only added an intermediate layer between atomic
-modesetting and the DRM driver.
-
-The task here is to remove drm_simple_encoder_init(). Search for a driver
-that calls drm_simple_encoder_init() and inline the helper. The driver will
-also need its own instance of drm_encoder_funcs.
-
-Contact: Thomas Zimmermann, respective driver maintainer
-
-Level: Easy
-
 Replace struct drm_simple_display_pipe with regular atomic helpers
 ------------------------------------------------------------------
 

-- 
2.54.0


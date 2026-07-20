Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6AF2D661C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560530; cv=pass; b=fOkuRAYnx8Clo1G/T9NcTuXvUmdq8UoisswvQN5NY7Pjrf/NjVuKBS92IjA/ztclQLjlvl2/7f9LzWL0/Q9GLugPhZbAZkCeBGhIxuTTIM52GVd3cvkiAtaRgsa5LgQ7CXZoMXOpHlA4qBlC1FW/MrZBdEbMXQxSZ/TI2HoH2nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560530; c=relaxed/simple;
	bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+cF+Pxux/mzlrTu3EDEws1M8dopwGd8bR58Cy4VphtVTEDp/N2udVgJ3y/KNqJO24RSwylH/BAb7qdWXWTy8ywZ7W5jB/7HunwozD/ryjBfweqczJemmFdHxmay4D2pXqLzgFqwHdTv2qxgBwU9ujcEStD5bvUDx6f9KFEreY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa0titk7; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa0titk7"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-456f7012050so803003fac.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 08:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784560527; cv=none;
        d=google.com; s=arc-20260327;
        b=ONaOyZ8zX6EGkkYY86TnpCxNEqMTzVuuQkM/584B8pFyen6tW0gp83LpHUnxvQsRUX
         dIsnHkcXbWHnDz6AI+GALcNSx8AwGlUu6WJHFhd28ZZwJ+0yb3lEHK0woEWuVD8LRQyo
         Zjx6+8d2nb8LScmEkTAacyTdf2nnFplTNiE2TfQX6jycTqAGU4oAIOQ1vuc7olLiwgPQ
         7V2eKCTf4Dn53Pv0YEMKuDbB3acCsFXet+5QXpEO6H+4j0zLqeOrO/Nvxre9q1nBI4hF
         rZstK+4DOE4+s/T8gQQOFHBVOU00x1YsIVnEMwUalLwQJIzctVDZT4uTHCu3E8aQ1LlY
         cBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        fh=c6kpMsxhtR1FUJWQxBkYtbdVLeMBbwHM1RWAoBDGZDs=;
        b=U/YaegxL4FwIpXOIHwyfB2tgycouOng4Tqxt+CuRuwfrR2lfsYHSnwu9FidTNI3dch
         jUkRQwZf3Db5YFTjE7VJ4WTdy8whMULCIllWitJ3JK8Wf2PjNkBmZLGrFepHqR6S1BLi
         o/24nm552/q5TRvbwxbWLVJoM7sVPfiZiz/aEyYReeYPjgRlbWaRJmz9Z78sQmX6mWYg
         Z0so/dhbEPNqvySOSr2iXyhsOVxU4ptlUyT7Sz1Zm48kj1E2S1MeOnEYKlBhxMveSJjb
         DTPkHtL9WX5TPAbcOORfL9NvNNfSIGdvKN5V86CmgxrI17txCJhOL9BaodbaE8ES0w/d
         y1AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784560527; x=1785165327; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=Qa0titk7cfg9viilFM7aeV6rGktWqe7x27okTN8DPh4jDXARUYMWgxFqxEmt8YHFW+
         +Dy3mi/GxA2kDbvpK4sXRTXDMIx5qZMoh1bmYVVQnnXM7jzGCCq237bpKk0kli6zUIwC
         RgrZZlqITt9lVBKOzUieGKvb1HV/BfWBY/b/Rd9Rz1cAQ7x8FjzLslZp0N2vNpZmfJ4M
         kEbCbg6fooOpLtFBl7cVMWXd6yY/4Hm7nVfgRd7zX22de0JrbPTmGMj/gm0BRTPniOZP
         xv/19X3ArFMOQLOzuBwpydTPmof4NiCVAQjsRUDqg9jUJNUcr08+k2jKVpsfpLEJpR35
         selA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560527; x=1785165327;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=RLsDtCNbbVVwxRrB63buATNuhaLUochS/oynU6OlHHNSYw8N7Ptu8YYi3qLxshuSK6
         Ra4eyzhfgLxm+MJXzRgzfZLAoBUlmtFeS5iqawvIghK2M+i/i8VdT9qrYa3lFG2xa3er
         YHTkhOtNcxbMnmuaW/LCSzFXavqOaOl+mcPRK1wMUJU05VmLfnHX19ryajPZW9LKbYZw
         PhLLWGq4QsEN6lkdgD3G0Ve3rATZWFAJ1gfpNvhekxfE02XZygQNqHd0STWEVoDwJ1Ys
         YHSuM/8LrpguoAk4JUE3OFB3TbLqC4ssnMZIOEQ+RJE+ZdHApCFEw58DfviielsCvfC0
         aBdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMFtCrGWjWm2+c+7kvYSulIL+FT3ykZ/NBtO5OrVXPTSHrPv/lJX3p1Gjmykc9fb8rJms0wDgfDG67Y2xKvT81ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJhHgjT3OfwaW2N0M3PsSuzorD/s5kRQAj/U9lZvBnyOjb3RKC
	IQmP5sjupVoMlEimaB7s0IqTB2Z1O0iu1CFJXG0ojWuyqd5HqCOIHK5BoW6L3hlHH/fBCM49EZa
	hq9qzEP0hgui2Zut8NzeRjxY2TA1okhQ=
X-Gm-Gg: AfdE7cmG4RB75G6sraq5mVUb/Gun0QtbqDO2qJFjjoIYCFO0lGXk48eSe2/SvUtw4ey
	WImm8iCPpNfKTYJlvxKHO4jzTUgMUgjuW3mbHFPx2eGTkVAEla6pIA/alj30bVyF+tXNOxrx772
	r2QwwXHhS/erPp7ZLLA0JRcV6rClUBtpWfojt9VbAAfBMCFRWmjIrOlQ+7kAuUx7oDJDmOL5iLS
	Nvp0sx/pa3YeuFoRqZVmh0oHFFASH2ASe828hVo3dxJiESObLin12zuJpki3MvozrWn4DeY0zOX
	l1SyEE20oJYtQ4J4StHxa9bVcOE=
X-Received: by 2002:a05:687c:260d:b0:435:bfb7:695d with SMTP id
 586e51a60fabf-45661144d55mr7411947fac.27.1784560527422; Mon, 20 Jul 2026
 08:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-1-a78c509e3062@gmail.com> <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
In-Reply-To: <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:15:13 +0200
X-Gm-Features: AUfX_mw73hUQoweWxVmRQ0kaDeRwypjcxis2alI1xmtq6INWQD6CfuNjqz3kn5o
Message-ID: <CAJpoHp73S2_cavgV3aVwC5PS8H1GRqTdDV-Xu8n6nXavBnV2=g@mail.gmail.com>
Subject: Re: [PATCH 01/15] drm/exynos: remove dependency on DRM simple helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey,

> Again, you rather want drm_err() with drm_dev here.
>
> I've briefly looked over the series and many patches seem affected.
> Please prefer drm_ logging functions and DRM devices over the plain
> device equivalents.

Thanks. I will submit a v2 with consistent usage of drm_err().

Also, is there any ongoing task or would it be useful to submit patches
changing the usage of DRM_DEV_* functions with drm_* equivalents?
Or from dev_* to drm_* when possible ?

BR,
Diogo

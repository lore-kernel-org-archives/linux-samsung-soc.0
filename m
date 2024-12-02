Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2EA1FBC9E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Dec 2024 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733137397; cv=none; b=RndD4A74Z8jvd8L1vdXqgvf5k/cCKjxZhK6Iypa4Vg6GhTfixTBa1w1ngThquYUVTVb90eJKXvbgA+9YTelklZMVeD1K7495/obdx6KXZ6tz8/tDXKtnDp2ge/yPlI4VvDywiT5AQfhtbsyexck1GHEET1YcIrfTNAbHx+hoGHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733137397; c=relaxed/simple;
	bh=mM8Ty9zubi84Tu0ptmDRpums5gqswtEyzEignt+0538=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5hhRWwaqMykUMEsshsWCoBWi5dvAltPtTo718/qMPSQXZMYs0W45KOgiOZWvhTe81SKwY7153+jf/QGxoUAzB25O4BLmwSmytdxLqIMolsQ5eV8SZR5qD3nzTKdYe0tGg8TqIkTQsF1et/Z8QSbmCTg3Cmt+MByONtRLsdpo04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VsPxeusn; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VsPxeusn"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de6b7da14so4081687e87.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Dec 2024 03:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733137392; x=1733742192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6X4f5B7p/4ISxO7icMRqa8h5IT36sTqoFNtM1b1oYjE=;
        b=VsPxeusnuWB48OSd/L36BqGx1xaXjkIIiTr7sH3/5+V1NLm7rZBA/XDanvAsiunz9E
         YlQ1lGdkKj9UplqzcWI5G/rSB7+F0IrqYv/EkDKuXin/WgmNE5c3DqXykMrDza7y3VzV
         KlU0oF+0l/eF/WzRPzNBygOws1F2/TV6kbZhmwVwLfwZvJ48btA6ZpHwd3Kb9cp/NQ9x
         tLx8M3SDS8lyUy0VV9hlt+KKQaVqCs/faKDFYQWxaig6FCFPdNAtPYg6JlApVn8UqIL4
         75RtLo7q39EvbE2rQIiT4uqnQcMwFFDCDcZq0GfUlEze6LFzlfnfhKieM8SURhaQqGEA
         lhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733137392; x=1733742192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6X4f5B7p/4ISxO7icMRqa8h5IT36sTqoFNtM1b1oYjE=;
        b=bPQkI16J5HQmwo/ENVkExpPKWS9OaOhtC6L3ET/hRHyB+UmEza4LIEkfOAlm7NuHYH
         /TLvCRo/crQdiyM+ViclDEpJekXIjAh+ZCd6wFuCQHCcXvYsyIad+Y2KCjn/LdSszRtM
         zG2nxMXuMbUtn5Q+zJyZ71Nkio/Z6d6HP7wDeQXS7TETHN7e7VdgTaHKyOKNTM5osCqw
         IUvocQ9rfuEfAx7xg6rPsXln0l7atQxc8XLEuafuJB6Aou64ACznxHX3RxptKa9nJcDV
         kMOIPpyA8FR/ry4z8lDFRKbBkyZ3D+uXXkbrHiBxVyapwMEatxLXJQLnHzyQZiaCkeH9
         nWeg==
X-Forwarded-Encrypted: i=1; AJvYcCWD8RLfcg3eLOO2rvTmDOkQ49TeYruRbh4zxxW7J2cmwhlo/Auq35Gx8RrfobsEAL4yfBTnNmgdar6Rj7z7+dF5hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1pQjZyLh3Uv9SCY+4rbgI5vzaGJ5WAY0V6FVAyhfqVGDefiJ/
	3D5YG7lltmYvlAKIMczxpbKHuQ2uiUE27ZeigXaTEfxS8uTa8WNyFHFf42AXvIs=
X-Gm-Gg: ASbGncsN5oTdd3yVPIRyYd8VnLkiQkJO98xIRMowYrCx5UnE3y/KLAjTzN4krOD6+FE
	DWtuhYzUzEaNC7ZPyu4tJG/lcIoKE63m3U6dSf1clnME3g8QlowRCVSya/yeG419HurBlcYVgZm
	/Xrhd87yu8/AcP/KwuPoqADasTdBg2YO0kTIcr+ad/a7kr1f1qZnRNVWgD3LU6KjWrAkr5Q1YUM
	StCLW/u1Tr9tefCuKUuaPY8EnlS4iCmYgsxSEOoUBGj1Pmy84rPzW/R3T9zYPqTASYNXQguZkeO
	fi8ZdGahLeEQArS0Q8pnjIGSZ81jLQ==
X-Google-Smtp-Source: AGHT+IFGDFefBhtw1PCqTOI5KhQIlj3rWjRnFP/b36RPBBTJEaQRx6orQjZk5ZBCQurK/QAedMSg2Q==
X-Received: by 2002:a05:6512:2385:b0:53d:ed25:fb75 with SMTP id 2adb3069b0e04-53df00d3e65mr7699888e87.15.1733137392309;
        Mon, 02 Dec 2024 03:03:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646efd9sm1443877e87.143.2024.12.02.03.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:03:10 -0800 (PST)
Date: Mon, 2 Dec 2024 13:03:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	David Airlie <airlied@gmail.com>, Harry Wentland <harry.wentland@amd.com>, 
	Inki Dae <inki.dae@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Leo Li <sunpeng.li@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Phong LE <ple@baylibre.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Xinhui Pan <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Message-ID: <ohbtatnn33jj6y3q4milf4txi4n7yirnny2eefdjddlkn2dnhp@eqjedetct4q3>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <77545786331df8bfaf5fdcb309437358@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77545786331df8bfaf5fdcb309437358@kernel.org>

On Mon, Dec 02, 2024 at 10:19:41AM +0000, Maxime Ripard wrote:
> On Sun, 1 Dec 2024 01:55:17 +0200, Dmitry Baryshkov wrote:
> > The connector->eld is accessed by the .get_eld() callback. This access
> > can collide with the drm_edid_to_eld() updating the data at the same
> > time. Add drm_connector.eld_mutex to protect the data from concurrenct
> > access.
> > 
> > 
> > [ ... ]
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!

I'm going to post v2 to fix Jani's comment, but what should be the merge
strategy? Merge patches 1-3, 5, 9-10 through drm-misc and the rest (AMD,
i915, MSM, radeon) through the driver trees?

-- 
With best wishes
Dmitry

Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBCA2040BF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734348277; cv=none; b=Aw61iIB6c3RkwDogA7tJWqqY5s0NZXGNEj9SDhK0ZlEewRrDs7DlnmG3TEAHfodvUpTRFF5ur9VRIQHNVdxbK1onoDM3vcsTvx8Pf/YyBjir6K3pSJxFENZ8BcKzemQY1P60YvwUz0MZ3fPiW4hJ69ZwRi4xixeCZs0CFA7beb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734348277; c=relaxed/simple;
	bh=jq98laTSDdK6EMsgM/2lFfGtgYg99v5inkJlY/nCBlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKHVWRSUNt11FpZYzB6u9PtfH/QR/t5xhySOsLGlPIepX70YiemCZ3hP0pTUkphvgyt+qVqQjL+v1rd4r8fdO+JhY9OKgy4divUNwwnnnKfaGCwRrVpPT4XeiWtV4fhdz8k+D8ax/qTQitSzIlAExrs4vJBAkqNPf3XCkgzYI7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrK+pQAe; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrK+pQAe"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401c52000fso4022315e87.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734348273; x=1734953073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gty21mjzYgvbYsbhfcrs7XMj7b14Ja6LtCdRiQMw9IQ=;
        b=qrK+pQAe+c9kkL/vzhkIxhIDevT08waFBhNaaRGLHHsIvL7XqZ/A6Fh+LR/xnlPZBU
         wF7vjOYg5m3pfspDIyfIa9KxTLs4/NBK+utvxAsyTr9pkMqbJSQlpAstnkesIIYiBQbt
         lewRwjDJyG8pdBCFX+YqFd9fKvlPCeCUlPKG+bFLP5l79yQ7jaowwgWQ+ENe+9LGJWSL
         PnfbrPep7+m5c4Wiit+eTcit75X4O6hWi4cVmsYTdaZPJrih1rSyYixANlEoPEuCVRtz
         i2ZRGy0xsd3SCo4+6eU/tDARDWp7dDAwYFc6pEUC6Pykh7mMJ6ibBKkUHI27US2SvURN
         CzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734348273; x=1734953073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gty21mjzYgvbYsbhfcrs7XMj7b14Ja6LtCdRiQMw9IQ=;
        b=w4PQCrxXuDzp9BSg1ZZhJ+Te/EMXGp/+sXO/16J/TwgNoajq3svjcUMMVPaTpVEEPy
         UaqmtOKxBs5484jGWTEQ/SvrOF3WiU88jSk9D4twhslbLnwmAFii4l4Uv4hYq6Vhq1v2
         8mvapNcKBbCayCFwt/C2vQz4HFrUvImBbWrMMWIeoay+876jk3nNMKOlArFa+YnjjvRU
         l5NQAH2FHN+kGTzgBUoJUmnTisldlyAgF6xCNKRsFdfe20JK+uWY0hCINl5G94cBMpK/
         jey9N4Py96fLtY6sUL1O0N081J43QJX4Ure6qAGTnWctAYMBGHFj7UNVuQG26FmatD1d
         wPNA==
X-Forwarded-Encrypted: i=1; AJvYcCX7dqVvewmYc5bzIaH39UmDQyduYzbM/Cq2HF9Ye6OGj3LYSZB5eF8D/w97rlf0anj2Asd3oe8jMFykp35cpBZ46w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuYtShQgAiuT84j+FqbzgxfhervvnI1SXb/+IBaK+/7HAauNaz
	zvci+8qBgXOBJf3LCwEH81++ln1LPxV9nUvhZvZ99Fw7yTxRdw4bARexYW1Aj/I=
X-Gm-Gg: ASbGncsWkIlFVRz0AXpSABDpuc1sOPk6SoqMwZuWT/BBsrtWENE5ZaZhpXIDM8FGzk9
	680PoCMTGbS02X5hTjvZnVfM17KHRQ8GjMEPgIC7SFrJnlptZ30QWBu3XHFhjoStCqK5t7wbqG2
	3SKMq9ymz5es/A4FgV2tGm/hEUVI4Tf7fuWxunl/r2OD/cLZh0y3ZevQMNIVpPzntMSPNQbqZN4
	3X4lxJLGE7u2NCv92jZLj/2pt2fwQD5se0VxvKYghcQ+d+MVFM5QrqTr8TCyZAe5J2NYHTYDlgT
	wrIw/3HyHX3EjuDEpylv0wZjKl34u8Y7vk0z
X-Google-Smtp-Source: AGHT+IHzioRjGIPfaVwEFSX3By+G0bPm5p1y4IolLwPf7YBpM4LUQ/QUZx/r1EiqpYtLRC9+8oUd8Q==
X-Received: by 2002:a05:6512:2212:b0:540:1a3f:e848 with SMTP id 2adb3069b0e04-5409054bce1mr3948864e87.15.1734348273018;
        Mon, 16 Dec 2024 03:24:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c1612asm817266e87.222.2024.12.16.03.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 03:24:31 -0800 (PST)
Date: Mon, 16 Dec 2024 13:24:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Message-ID: <xchjpeykkqwlpniaspbzitaozuoltoq7aturtu7jq6z4lcxh77@y7t5ge2sa4er>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>

On Fri, Dec 06, 2024 at 11:43:03AM +0200, Dmitry Baryshkov wrote:
> The connector->eld is accessed by the .get_eld() callback. This access
> can collide with the drm_edid_to_eld() updating the data at the same
> time. Add drm_connector.eld_mutex to protect the data from concurrenct
> access.
> 
> The individual drivers were just compile tested. I propose to merge the
> drm_connector and bridge drivers through drm-misc, allowing other
> maintainers either to ack merging through drm-misc or merging the
> drm-misc into their tree and then picking up correcponding patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Also take the mutex in clear_eld() (Jani)
> - Rebased on top of linux-next + drm-misc-next to solve build error
> - Link to v1: https://lore.kernel.org/r/20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org
> 
> ---
> Dmitry Baryshkov (10):
>       drm/connector: add mutex to protect ELD from concurrent access
>       drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
>       drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
>       drm/amd/display: use eld_mutex to protect access to connector->eld
>       drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
>       drm/i915/audio: use eld_mutex to protect access to connector->eld
>       drm/msm/dp: use eld_mutex to protect access to connector->eld
>       drm/radeon: use eld_mutex to protect access to connector->eld
>       drm/sti: hdmi: use eld_mutex to protect access to connector->eld
>       drm/vc4: hdmi: use eld_mutex to protect access to connector->eld

Granted the lack of reviews from AMD maintainers and granted that the
rest of the series was reviewed and acked, is it suitable to leave those
two patches out and merge the rest through drm-misc-next?

-- 
With best wishes
Dmitry

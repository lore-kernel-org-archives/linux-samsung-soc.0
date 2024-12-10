Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00BD23024D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Dec 2024 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733865633; cv=none; b=tD///RLXsaxqX9hneiwKW/6zeCjnGrCocqF2Cuhv+abQBXk9qWIMePhrSJgnPWBOifmV2H1CXP3UJR7Tyjb2SoQKq2Lv1OE+QHKW+ixuqZ3lH6TYzuZ+BOL6tMhYBw2vikGW1W9EeKVxOVkzaasePibw4W2qcmPv2o7r2c7fBh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733865633; c=relaxed/simple;
	bh=LV357DiRMd/D1axwAIAqWggD9i3wgG9VYZQtR6NIW8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t02/8LQ3db0Z8H9qIFPV/YpeQXZAz8LpqaDOcR8QksCKZUvNxUPRYQK3j+bg5sjf6VgHbS3ugfaTJlc32Ggr7DZbxH1Gd5wyO05r2aT1Hb/VsARRV/0LkJVBlj8Hh3cUQ4a9OkpSQRb+jjFlKl4h8ImpLmiDBY8IDWdKufDevXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cAZPPXkL; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cAZPPXkL"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so28971171fa.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Dec 2024 13:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733865630; x=1734470430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yF3vBmNZS9MU6AYhmkZOCnnb/mhvQHCH0jIPUUHFQrU=;
        b=cAZPPXkLE8AeyMHkIKnZx5r5lUA03pLx3rgzuoNVrTpgYRDY9s37+ftQtPc6Mih6Iu
         8iNtCyfQWTSadjxGQdpliJAGoRGs8wD3qhLREfBJtq5T5ue7a/87RghQpneDpnu3LZHh
         0NonQmxpjkB9fUD1xA4Uwc8IpytJXcWdcEAuOIMz6+1zXDkemNMzRu37JMDHVqSUQnWk
         k1vr15DkhhdMFzARVHqImQwDmrZHkCq51mgDMSiq+0pXAEKBzeuSS1TfEdAzG4Ia+iNR
         M6vZ+ECwMnxf2RnC8ZvLI/r9OglgVz9AXBjpb71TJKtYIjtIJTl0ZGSHi2JwhaMa5zoL
         JuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733865630; x=1734470430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF3vBmNZS9MU6AYhmkZOCnnb/mhvQHCH0jIPUUHFQrU=;
        b=h2B08o7s9x/Svo+wUYx+9J/vth78uQhREwqYrjg9GTa5SNPZp3S6hGjvNLDZM4kwLZ
         TR589Jql9aiQVjrTPi4acQKVJXSZXBUeWxc9sovcGT35ejd/YFXEB7J/XCUo6hQFyOdS
         R/hIuIGcDPCvfB2t+AbrM0Jk1Xy3zL7gMbVHFHoXmkCt/J8cVG63SNkQDcGpy4YTwHSm
         2gmstUeqGlR4vYaO2VhSKem7eD2WkoVZ/qtodObbh0mjgEGe96H/8eUS6FINCypPFKf3
         mKVVlT2+nWCM5UDf/2XRALu2SH0d/0v8eq0EPluRD4nYewh8jjkvijOo37unod4wWvT2
         930g==
X-Forwarded-Encrypted: i=1; AJvYcCXqfkqyQF1CTrnV2oZRwLyfHCFGk8XZZpDloFNtp/Z501ugLe21IT1QpOiW1+Y915og99ymv3ot2kUpnlaaQd8pVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCEQ8gJ8UZwxnUyGdeebluk0y9rEFWtVk9cQO3YjGmSLQQPy58
	BUsOozjb0C0weNGnbV/9d24/hJMb58rPN7B/Z/GaJV1NvHwGe7jfxuocyuWoXL8=
X-Gm-Gg: ASbGnctaeCrQGkmomE7Jmh3jVsuy4SL7EOB5hUN3bvCsjXpcuk8zkBJHUYNkq+mmav9
	vRfhnd1ny4epISfpJCF1HPDRvrhNL74qJMWdyo7TqbUe4637OUnw/QGbDFUtT44U4yCcemxSUBd
	vJG9swpphyBplX9kCuUvgPSqYN8L7dg4TpI8IT6/98GOn9cbKNsenA2LuJajuYQAoylUzz1Auk7
	X1INl6EdLmCej9CZewGSchWtxdha/3dfbX3KeVHzCxmV3kYCmfig5dkQ39JKZ1qDX/7k3jTU7YJ
	sEQACWxZQHY/Rn1ImSW7z+pFEKCpBIU7lQ==
X-Google-Smtp-Source: AGHT+IHCODZIQ0z4mmWtV1wEX8j8zg9S/BNFluONyQd2XvnZpEGUwS4bPVxg3YoPJtWqjVmMgWar/A==
X-Received: by 2002:a05:6512:3990:b0:53e:368c:ac4f with SMTP id 2adb3069b0e04-5402a5d3d6cmr107076e87.9.1733865629981;
        Tue, 10 Dec 2024 13:20:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e34569209sm1395827e87.128.2024.12.10.13.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:20:28 -0800 (PST)
Date: Tue, 10 Dec 2024 23:20:26 +0200
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
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect
 access to connector->eld
Message-ID: <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>

On Fri, Dec 06, 2024 at 11:43:07AM +0200, Dmitry Baryshkov wrote:
> Reading access to connector->eld can happen at the same time the
> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
> order to protect connector->eld from concurrent access.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
>  1 file changed, 2 insertions(+)

Harry, Leo, Rodrigo, Alex, Christian, Xinhui, any response to this one
and to the radeon patches? I'd like to be able to pick the series for
drm-misc and these two are not reviewed by you.

> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce9647f0606fb86fe57f347639 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(struct device *kdev, int port,
>  			continue;
>  
>  		*enabled = true;
> +		mutex_lock(&connector->eld_mutex);
>  		ret = drm_eld_size(connector->eld);
>  		memcpy(buf, connector->eld, min(max_bytes, ret));
> +		mutex_unlock(&connector->eld_mutex);
>  
>  		break;
>  	}
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

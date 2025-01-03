Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BB91CA8D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jan 2025 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907831; cv=none; b=m7VI3gKZo6E6KjHyz0Qw2TJQ/V/5nrKgIbz65ciq6Y7zI8F5lzk/GGE8n855lbgcnYm2VKik5vZCiV5Fl7a0748wQBNPPbH9NbZhR/D4uykIAwd2X9VxL7W/WWii9tZ9c+nA3qa17X/1qPQlCv1s2xpFdfUBrTqohUCdooH9X50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907831; c=relaxed/simple;
	bh=0sbr3ikGQgKI5ZtY/+Z+rTTloWLDyPG2tgRbvKz/LV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3KAy6ONBN0dhgvo9jl/EEMA3ftCRifPyWa/qHKcjzSKuQXbqGvba024KY4bHyh3lMDHzwtvl/YC6Q5WREHZvFcOv/C9PckDCO2ijdozQb2VVPl+ER48piq3JGjKvSgUGO3bKWqe+r9THqWwvHWD0Ge4WadbRAS5/UG0uJX3imo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yGmXoqCA; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yGmXoqCA"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-303548a9361so115915471fa.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jan 2025 04:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735907827; x=1736512627; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lAuQK+/F0O4L5JCDNjDjHjZFUYnk5eRkhwBS+4Hmv8o=;
        b=yGmXoqCAZTrWsHD2zWTn0q1BYbgC74pjXuuuYl/YjsM3cQGJkLi8rA/pczt3AZCEh7
         IrV+xlJBYVaEYEi7WCAkBjOWl7NZtl64B0XSWf952FVvMPLdDClVR4A1Fs9DQfJUxggp
         AXRUz75I/JXJ0+EKtyiwYTgmTh015lfFjQGJg+rBXjPVBKCHdhTmydIjHKrZNVvMlE9k
         4BwzaHd9BkOsN6O/kDfxA1+mqY7MmSjAzrUqvkIDQoFnGKsSlNbPstS0p6LNWRS6qJHx
         vp2rREpLv5L6y1sveiTZvJeCMrclXd75pHiJik1x13Ojrgptadl/qGNwtBYIJjD5YwCc
         4rRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907827; x=1736512627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAuQK+/F0O4L5JCDNjDjHjZFUYnk5eRkhwBS+4Hmv8o=;
        b=wr9v7eZTfU15l6TLEIHemyGmaBgmV1caLYgjH14xYsLKZLmKegNiXAsCxWA3hwSmz7
         NXjQALEhzLlMEFT8ZWcKdJHlII/OfA+qpNuwDdHlsew3+z9oSP90qOkcPWLwUYjp/6AV
         qUnlxVqelaHfWRwNnq5DY9vMbh2vomu7wPGrh1KPA/3QLD3naz2Xbwe5fMLghf/BoFMl
         hTtdo3uP7zy0m597WXkRpmv4DDzs4r/0qjO4mbSQVlRuPuLs3sOz479x4YJXywU3uc4O
         2CZ2JUL5lznAt1Ec3ncVN0SJj7JWpFJPjJRmpxYpal/zPBYpz0WoM4oXyO2YwTiM4LoL
         Gnlw==
X-Forwarded-Encrypted: i=1; AJvYcCWPl06rWnMF5yvQFVqAgX8cQOek8CsAM644HWBnCWfLbRCwRsgLd8ip2WwpkiTZuUwORa76TePUqj+T5DPp0IVqRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr2xHiYvmejKsV836g43WARmQMsZsXUmHF2BvISVL1YEFjkHUc
	QpzWjsgCuQZ5aAzHlwxMv2F1NwbinafUEQYxFODa4VIErh62rMAsG9l3fItKwB8=
X-Gm-Gg: ASbGncv1D+pRsCD6cZ6K/YG2GmdqPSTAJgoLKmi2XKcTexmDzEU1CG1z48lK/MVisRZ
	O+jpBVBjG02JVrC39MiiTinRC4syBx5bdWpEMLQphteJHNEMonCODV7bkU4yM1/MITbgyYmvVnQ
	Nhz9lYo/prtqqWKeJPMZwog/UM8z5giC9a/GTtxBcbRTrSNfzEjXLFbHA65KtRB+F0xvNqva1/c
	pdfis7PvS69efTj+cGLS7IbGenzyLg6AUecdGt+ooISd0D1AS30iUD+tnPteYbEStEv98EIhflH
	gwVckH7ZMNfMC1/qvocvplYIG2UN3rxXNBVv
X-Google-Smtp-Source: AGHT+IHkmAApyLZ21XYWu+WDHiH0q3Z12bKU9S9jrrq+R629xN6ISaSia7sHBryhTxvay+8ug/2ilQ==
X-Received: by 2002:a2e:743:0:b0:300:4107:6294 with SMTP id 38308e7fff4ca-30468627b2fmr117244791fa.35.1735907827089;
        Fri, 03 Jan 2025 04:37:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082e47sm45659141fa.111.2025.01.03.04.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 04:37:05 -0800 (PST)
Date: Fri, 3 Jan 2025 14:37:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
	alain.volmat@foss.st.com, alim.akhtar@samsung.com, andrzej.hajda@intel.com, 
	andy.yan@rock-chips.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org, 
	heiko@sntech.de, hjc@rock-chips.com, inki.dae@samsung.com, 
	jani.nikula@linux.intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
	kernel-list@raspberrypi.com, krzk@kernel.org, kyungmin.park@samsung.com, lgirdwood@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, 
	mcanal@igalia.com, mripard@kernel.org, neil.armstrong@linaro.org, 
	p.zabel@pengutronix.de, perex@perex.cz, ple@baylibre.com, rfoss@kernel.org, 
	rgallaispou@gmail.com, simona@ffwll.ch, sw0312.kim@samsung.com, tiwai@suse.com, 
	tzimmermann@suse.de
Subject: Re: [PATCH v10 03/10] drm/connector: implement generic HDMI audio
 helpers
Message-ID: <x73a2utr5sp4iffk5626zqfth4ayu3x4jkxd7xwjti7ehrgnzi@ploxx4i5db5h>
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
 <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
 <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
 <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com>

On Tue, Dec 31, 2024 at 07:49:40PM +0100, Martin Blumenstingl wrote:
> On Tue, Dec 31, 2024 at 3:34 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> [...]
> > > I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and it
> > > seems that there is only a single driver which uses the .prepare
> > > callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem to
> > > implement .hw_params instead.
> >
> > Yes. However .hw_params don't have access to the infoframe contents, so
> > I had to settle on implementing .prepare.
> While debugging I noticed something unrelated to my problem:
> hdmi_codec_spdif_dai_ops does not implement .prepare().
> FYI just in case someone wants to use your patches and feed the
> hdmi-codec with SPDIF instead of I2S.

Could you please send submit a patch to the hdmi-codec driver?

-- 
With best wishes
Dmitry

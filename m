Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08938B64A;
	Tue, 31 Dec 2024 00:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735605819; cv=none; b=o+D3WyqZ6LhfpS4PvRNzf+SMlIULLVtUuOTg69LeXZ5vD++EiFixjagKrqOlQu/J/6mXBXnJGcyi1WT1kYwzV2vvR4kIe1Fr6Gt4QT0sIQ/S36vHdDFdntU3ftoRCBACV4Yzi7gP1z4Zsmk4xRI5wOW2V2okwt3IUqtmGmU8qbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735605819; c=relaxed/simple;
	bh=r6+biX3jXceAy0hCSQGgPyauPDcFwer7kid+cFilUcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MK+jQaZZwkhtCub6XPKw5kVuY71dqk2VBoAJg7X1LZQOx4pjTbLrmq5qM1NBas0o2udGWLrOhGiq3/E6AGd82Q5ZaAXF6CumI1ReS5hdPmkLtVwQSRrSPWJsx7DmoNqBWYIVu9EV6OLmkd5PkcdfFZAHqwn/vWwSa/2TplikBpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=MmlkCgkG; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MmlkCgkG"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa69107179cso1586459566b.0;
        Mon, 30 Dec 2024 16:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735605816; x=1736210616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMEB8NCZ8QveU/RhcsTwV/DZjVBc049BfdXpRNTavFw=;
        b=MmlkCgkG9UmHrF0Xcg6eWneOwogwo5d1M4M7gciAyXy7XlvhVMsVDS9rhu88f0CP/3
         B4hr4WSIi/pMsMyNQBIE4/x/iX8DjsVWI10XI907KWBDtSAYtfZ6i5NVBHsdnRj7x7Up
         8PSgJoiwva9gl+n5y/nMtFA38jrNZlByxayXUtjDYfQwgqEm2vR5R9R/bSBZ//JG2UNh
         Yrlj7vs1JjmjaRdudKGPedXSu1JfmuyK9+ww6Es7nc27mRcsSU9mXDB6O5AC/kCrBZNm
         5x2YYhaMpiY8j+4VmQMUDcHOxJv4DS2guVBvxuIfwubUbh6cJ19GJoCirvh9DWre4tA5
         Xlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735605816; x=1736210616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMEB8NCZ8QveU/RhcsTwV/DZjVBc049BfdXpRNTavFw=;
        b=AWDajGlU7ljSuPaEbwvHYSWpkU+eF9+R2Zfk0q1WKckEuxGi8kAZw0o4/QUrtibbTl
         6r/x+HhlR0WgiIrBCDlLeOAUgjZF+kSpvQH2VzZfNvUl9CL7wgJ0F1eusX/WJDi7Vy6+
         pltYRZP/INFBeWioA8Kw4IidpUIHixI0rXUhjbgBN6WrjYmbY09vdFEEdHd4t+RugXkj
         XRsezIiqVG3TvMEHpO6XYH5awn/VQ0N6C8CnpiivspeOFdSUMK4mpoYbD/03qF0kJBPF
         hPVoDSulwzFukhtDw/LhgLJydDwfedqVtwF/rLDIkhqdalsk+FfUO6FgcA7vWb6Hnn7K
         t8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUSoK2nqH5RGovXd0k+Kai6rPzbOg44TQj16tipg3d0Kgiu+SFSHKdbfgiYmFXMORwwZZOxV0cm/eHlhe4=@vger.kernel.org, AJvYcCWuiS4suPBrRReEsMjc5pZlEYIBV7DFzyh56HT6ecjgp46ljZFO1cyYQ70nqLKkXIFw3zyJD3cFXhdPPLbPpHZYSi0=@vger.kernel.org, AJvYcCXuoEYPWVTJpzAh4zmWo5fC44KFX8gdoRInpbM4h+q2U5nCcyONfZDvFvhw0itCQN2G6YecYAGlxmTUkuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCOpx/WqGilfGf1wtAat8hMDW5XvKu+cCpVuiRWEU+Wavg+w65
	aAb8H/ZtbCmieNM5v84sovkGA86hvJLowb0yE5W9IPo/nhS1fle/
X-Gm-Gg: ASbGncs5Dgy8WXWNDiJ/rMo4a77ecsiYo4/Ti0smR9yiyG+5MQMW8iMaz1ogxzVJgCb
	m7XB6DaWeWAKYULdPag+4p4Bcomq6hlxorc51OtGMGZ7rw0+V0kPSgi9b/9/RpwSob0ld/7AWC4
	0hpsF9qMaT+vyeDMgKLM/Qhib8hMmrw3at3t2vlKg1AkkyoMAjf0U42OB6d8ykVHDcRJhkOJS4e
	os5v6AIhO8lYY43G9syhGETXVJyVgysuXPjmQx44+96Gl/rDN6c+V5ixnxtCsMy2gGUZZdGHKQm
	6DbDYZXtUsvXVGcuOJDZ3/3E3OkYQpGxpc8M1/06lPvz+svkwETd1ete2SmXgkIpO6bgT4qe1zg
	D9JOYSGib2YSVa1PVbH2g6emhfw==
X-Google-Smtp-Source: AGHT+IHEGIcJK+SSB1VqPTnorkRP+VtiC6uvv9JG0CKDkLO9JdbaG0jU5yoLZ0jcvFezMTEsCCv8Bg==
X-Received: by 2002:a17:906:99cc:b0:aae:85a9:5b66 with SMTP id a640c23a62f3a-aae85a95d37mr2281685866b.60.1735605815987;
        Mon, 30 Dec 2024 16:43:35 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a465-b000-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a465:b000:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0f06dc7esm1523425066b.193.2024.12.30.16.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 16:43:33 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dmitry.baryshkov@linaro.org
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	alain.volmat@foss.st.com,
	alim.akhtar@samsung.com,
	andrzej.hajda@intel.com,
	andy.yan@rock-chips.com,
	angelogioacchino.delregno@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	dave.stevenson@raspberrypi.com,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	hjc@rock-chips.com,
	inki.dae@samsung.com,
	jani.nikula@linux.intel.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kernel-list@raspberrypi.com,
	krzk@kernel.org,
	kyungmin.park@samsung.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux@armlinux.org.uk,
	maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com,
	mcanal@igalia.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	perex@perex.cz,
	ple@baylibre.com,
	rfoss@kernel.org,
	rgallaispou@gmail.com,
	simona@ffwll.ch,
	sw0312.kim@samsung.com,
	tiwai@suse.com,
	tzimmermann@suse.de
Subject: RE: [PATCH v10 03/10] drm/connector: implement generic HDMI audio helpers
Date: Tue, 31 Dec 2024 01:43:11 +0100
Message-ID: <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Dmitry,

this is great work - thanks for your efforts!

To give some context:
I am working on a HDMI controller driver for the Amlogic Meson8/8b/8m2
SoCs. Unfortunately the driver is not mature enough for upstream
submission (all I have is the vendor driver which serves as reference).
That said, my goal is to upstream the driver at some point. I have
already switched my driver to use hdmi_{clear,write}_infoframe. Now
I'm trying this series to simplify my code even further - by using
your audio helper work!

> --- /dev/null
> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> @@ -0,0 +1,190 @@
> [...]
> +static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
> +	.audio_startup = drm_connector_hdmi_audio_startup,
> +	.prepare = drm_connector_hdmi_audio_prepare,
> +	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
> +	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> +	.get_eld = drm_connector_hdmi_audio_get_eld,
> +	.get_dai_id = drm_connector_hdmi_audio_get_dai_id,
> +	.hook_plugged_cb = drm_connector_hdmi_audio_hook_plugged_cb,
> +};
On my platform drm_connector_hdmi_audio_prepare() is never called. As
a result of that the audio infoframe is never written to my HDMI
controller hardware (hdmi_write_infoframe() is never called with type
HDMI_INFOFRAME_TYPE_AUDIO). My hack to make it work is to add the
following line to drm_connector_hdmi_audio_ops:
  .hw_params = drm_connector_hdmi_audio_prepare,

I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and it
seems that there is only a single driver which uses the .prepare
callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem to
implement .hw_params instead.

The audio controller code for my platform is already upstream:
- sound/soc/meson/aiu-codec-ctrl.c
- sound/soc/meson/aiu-encoder-i2s.c
- sound/soc/meson/aiu-fifo-i2s.c

My understanding is that you have a platform with a lontium-lt9611
HDMI controller available for testing. Can you please help me
investigate and find out which piece of code is calling
hdmi_codec_prepare() and therefore lt9611_hdmi_audio_prepare() on
your board?


Thank you and best regards,
Martin

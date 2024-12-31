Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626017BA9;
	Tue, 31 Dec 2024 18:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735670993; cv=none; b=ABe6sljgx1wTE4/Dbu3/RrRpUT2PTa5luk2sCJdxzeF4T7LgkeL/QL/4s8e+zbUFlydtPFLcwOI2c2hjc9tjHDvRY8yfjPecZ6avFrEc4Uy5Mh3ZegKV8z13iU7WBBa4ncOdbu+sEtDpdOx/dHKmwB6H7EqiFqceOWS/1EhHJRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735670993; c=relaxed/simple;
	bh=kltap3Pv1hlN9UPAmHZET72hjTYvMQFRlhAGev33Mns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6fwMuhApAG7RspjwDes0Fb/0UWrOyI+1XZNfc5MUwKZRL3Zz92ndXHuQrPH8/WsXwOLkNN0Nk4jjw2yk4w5bNzi0zmnohlnml2rQpb9/jkZ6A53nx3sZviyFPm3nuN9rbQkl+6QX30zMhFz+RSe6DnAtKX6VWXbLvLyJ7lq9dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=ShzrJUXV; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ShzrJUXV"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso11002077a91.1;
        Tue, 31 Dec 2024 10:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735670992; x=1736275792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kltap3Pv1hlN9UPAmHZET72hjTYvMQFRlhAGev33Mns=;
        b=ShzrJUXVQ53THeA7DGrDyk65OIdoa+hdRV1n2egw5/bTLvoeOYpsxIyg1JE7HP7CX9
         lEwYWRNE4LRcQui/wcqhGIsLPDlqBAPtEt55jkhc0rxBExPf5KlBFDrCDPL6YrDMpcud
         3mFIo5O1uPUnc5YfnsE4ACho/iwmghDtUsQTTieuY3xD9Pex8qMjjYjf8awY+lBjOBLG
         xs3WK9JFm3TvvzB0gRcuhGdVGmh1yBlXm1EvTdYqlFCe/gToWr7OvPC9vfgkYwR7BHxi
         epW4hmBfinFB6yJ1G+JdgQBMKjMNDB5Xp8f16OCybxdf4yORgsOZlrdyzbglw4cADAF2
         Om6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735670992; x=1736275792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kltap3Pv1hlN9UPAmHZET72hjTYvMQFRlhAGev33Mns=;
        b=EVX/cFC/KVkHXDysX/RUWvT7IDW35vk2Y8pkEwx8A/ku6k35bFj+tqamffCiedcJrJ
         J2IKwxkKCYRWafR7GFP6glEGiOIxhoIlPrLCW8c5Lx3HJ/bkZYa/7gBlgEUZhRBHaIL2
         O2FEWupobWlAYG7BLmHO0Q22Tj1ZoZaBfysEET6QX6/GeV5z8fnQ2rhZyAJosO4Y+0YF
         eRHEJ7GmoxrSN1TB65uNuXDboEV6gvjO/MOP0w23pPWgH/hQ8KjHqA4Fq6cSd1j56c55
         /t4nd5BHQMaBHCwpCuCy++SXAO7oKVZtxA3du/lU0kdCDqmp1gY3ePO7+bGN+9NHweNn
         NIFg==
X-Forwarded-Encrypted: i=1; AJvYcCV0Cpf35XoXSvQ9eZFi5PCwRC6+cmE78kIswm0iRAzDTPNRQkUBxZ0ap2Rhdm+Sn1f5QPVU/rGtPwezPfnDFsTPEkw=@vger.kernel.org, AJvYcCX2OlDk7GZIQfgLFaGvOypGDVdzooERnYamIdL4iGmuou9gM3hBdnGRxqOsJx01VJnCq/ywE7LvX8sOHSo=@vger.kernel.org, AJvYcCXf8De8YPzOJoF6SJ5wJzHCeVOwqwOw7ILXs9RyNy9CNkfwnJzlmEDnWirtYYFWZKMIdHz1bFKkw9CmLEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk40MX3Rg6HKosiyhiUx17gNNJmXg9D94t+Vfpp8jtlThgcBq3
	Nu/HqtisHZeWporklLSDuEhmwWfdxKmHezvhByVVmLrKvy+NB59qmcuvPHxy7qEsJScLqeC4gpZ
	kk7H0MyHBnRY7DMsghg8T4H2w9jE=
X-Gm-Gg: ASbGncsyLMIqPdx/799Ub+0k0tMQm5UDXNf70qwEC4QdrwK2ZUQaEXg7zqA+OEInba3
	uEtileAup+I4478WqF84w4CZQzNTKF/wfQbmx36C3vP1zcpp+YA914urh1qvdMsK0WxoNmy8=
X-Google-Smtp-Source: AGHT+IG5FmkROQoSQHWr4cIegxX2It9OOsT8OUh7KWPdH7VQgx2qIDviezjcsQv6GTMSR51Q0h0ZJEqmX+Qz4Kpzuw4=
X-Received: by 2002:a17:90a:d645:b0:2ef:30ec:14c9 with SMTP id
 98e67ed59e1d1-2f452e4ad37mr57281196a91.18.1735670991720; Tue, 31 Dec 2024
 10:49:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
 <20241231004311.2574720-1-martin.blumenstingl@googlemail.com> <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
In-Reply-To: <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 Dec 2024 19:49:40 +0100
Message-ID: <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com>
Subject: Re: [PATCH v10 03/10] drm/connector: implement generic HDMI audio helpers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
	alain.volmat@foss.st.com, alim.akhtar@samsung.com, andrzej.hajda@intel.com, 
	andy.yan@rock-chips.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, dave.stevenson@raspberrypi.com, 
	dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com, 
	inki.dae@samsung.com, jani.nikula@linux.intel.com, jernej.skrabec@gmail.com, 
	jonas@kwiboo.se, kernel-list@raspberrypi.com, krzk@kernel.org, 
	kyungmin.park@samsung.com, lgirdwood@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mcanal@igalia.com, mripard@kernel.org, 
	neil.armstrong@linaro.org, p.zabel@pengutronix.de, perex@perex.cz, 
	ple@baylibre.com, rfoss@kernel.org, rgallaispou@gmail.com, simona@ffwll.ch, 
	sw0312.kim@samsung.com, tiwai@suse.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2024 at 3:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
[...]
> > I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and it
> > seems that there is only a single driver which uses the .prepare
> > callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem to
> > implement .hw_params instead.
>
> Yes. However .hw_params don't have access to the infoframe contents, so
> I had to settle on implementing .prepare.
While debugging I noticed something unrelated to my problem:
hdmi_codec_spdif_dai_ops does not implement .prepare().
FYI just in case someone wants to use your patches and feed the
hdmi-codec with SPDIF instead of I2S.

> >
> > The audio controller code for my platform is already upstream:
> > - sound/soc/meson/aiu-codec-ctrl.c
> > - sound/soc/meson/aiu-encoder-i2s.c
> > - sound/soc/meson/aiu-fifo-i2s.c
> >
> > My understanding is that you have a platform with a lontium-lt9611
> > HDMI controller available for testing. Can you please help me
> > investigate and find out which piece of code is calling
> > hdmi_codec_prepare() and therefore lt9611_hdmi_audio_prepare() on
> > your board?
>
> Sure, this is the call trace on my platform (Qualcomm SDM845,
> sdm845-db845c.dts):
>
> lt9611_hdmi_audio_prepare+0x1c/0xc0 (P)
> drm_bridge_connector_audio_prepare+0x2c/0x40 (L)
> drm_bridge_connector_audio_prepare+0x2c/0x40
> drm_connector_hdmi_audio_prepare+0x24/0x30
> hdmi_codec_prepare+0xec/0x144
> snd_soc_pcm_dai_prepare+0x78/0x10c
Thank you, this helps! snd_soc_pcm_dai_prepare() is where it breaks for me.
I suspect that it's an sound card issue on our platform, so I'm hoping
that Jerome (author of the Amlogic ASoC drivers) will help me debug
it: [0]


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/CAFBinCDdiJ3UNVUcShjq=3D7U2=3DoUw=
T3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com/

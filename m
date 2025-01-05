Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4E514883C;
	Sun,  5 Jan 2025 16:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736094356; cv=none; b=nv7otHarItkln1ghJ/AqPzjDMj0GJyjOiH7HXHATmSERqdvx/GhpO8QyShzgpRxWYsopfdL7r5knv3IEAiA8aBk++2mStVQwK9vdj0Fi597oqCBUkfJbf2HpuYXImI9q3PLnOB4xr/nQQqBYYlb1pDP4JNgdMz60uzC9pg2fefw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736094356; c=relaxed/simple;
	bh=Hbu7641CeG8xNiROLSccwQDpo4bojGzR/nTssY8hmOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hiUB6bLf8E7SGYdSzqDTxwcNP3t8LPwBKM5VW9bqF8xLYGYt5X7naEFFmCwx1wDJlqc4w+WXfCvRSq2rD0ZY3zUa5/NTPNmq7Jwa1oG9pMfkH/YWcdm3R91oFUevamwvJEj3/xf0mbb5VkSy7fmefPwx8IuMz1bSSOeqQxxMdUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=hwP6lRtr; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hwP6lRtr"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so16584168a91.0;
        Sun, 05 Jan 2025 08:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736094354; x=1736699154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hbu7641CeG8xNiROLSccwQDpo4bojGzR/nTssY8hmOI=;
        b=hwP6lRtrIKggOU9hnTu3WnhOEHky5m9JjNacnFTuu1Ii0StTLxASOygw4jzKGpCHjE
         gBJEkH0wfBnQgofzQUMsgLKyuoiBFUZt581jzUW3+KFuLnW5/kK7GZsBNDL1qyDHIgTr
         16GbjkJKyKn1lm/nn4QmSF80ulD9G1TVuTEsiZy863aXrens5yfm18BXnHztTX4Lu7D+
         +HV6xq7Estk6/Tqmb2PxCnmvj24G8I1Wa+xXiSXKECuJ9hQkneWnkbV0u2ZnBuBDnCud
         93C/YzacM72eAKypbrciU2XeJ+P98S5Jk49BA0wtQ2rC7Lok+upnG0SD0dflV1B9Vkvb
         U2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736094354; x=1736699154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hbu7641CeG8xNiROLSccwQDpo4bojGzR/nTssY8hmOI=;
        b=Gp8LX7PT8om/IDP+Q0wuw7gC3qLD5+hJA3pwQppw/BqSdDR7k1wxwo2UACxNJ5JhmA
         JCkPg7tI2y+z2h8IVI2MxA8J7k7SgXzbsEHIRRMN0YRJtJ3+4XGyvejT/TFaTtZ7IK0o
         k4p4c8qYjIz/HTDIe8klhl0R7e7dUfExwLDsmaEf+i8YcsGq/8d5H+6nkJ8t1bhO5Ciq
         QLcEErKhOcQRGI+YfbItqUcz6NxA6VZSe2E7o5x/y1/v+567Xfo+6BMFX0mv+qOQ7v1T
         JWxsSArpkt/IoXlb7uYOlZxZ/UlmtT07Lz84PhJFlr9lC/vL3/meOtH+MQ/gSwA5zc5D
         OWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3Y9l+E2+UM3E20ovzidSUFTdiJJa1XQDtTki1dU5ZK8EO/Jeo7ZDfRnTVZTm7FsjuN7CyeetzBRxREGE=@vger.kernel.org, AJvYcCVJv7fMKRQ7E8+MuS1l/+Xq8ABO3/zH8bIQEX/MxsrxAam5RPrBR5HFEtPyYz6l7hJ2P1pafwiRmw7SZF16br+4cR0=@vger.kernel.org, AJvYcCW2/XUV37uEHex9xrlf9wVOPMkrusgUcj89mIF3gpVnFBrmsbcCUTGsZklJ9X6U3x2qmFgttvAxMwtV1m0=@vger.kernel.org
X-Gm-Message-State: AOJu0YypChskDoXv0vGVHuzv/syU7ExGtJZaU/EN2+Jw715jrxTp9J5W
	zjAtRuv2LnAh9eI05w7Prjnqz2rysS9OxiLQduhQkstE4ZyhljGt9hhTkeYEF7UGBdHTuoQn8eC
	kyNy4npLLjdPDqxvo0as9CSOwpFw=
X-Gm-Gg: ASbGncuQCQVYQ4Kq1fSZJDt1kUqhpl6eBqLFBCFEfiIPTcDHVrtUsoRdkXWcpUF9OHG
	PJUZAceIUpz5HP/CSf2WohIgYr1j0eNPOrN9bu+esG0wEm3AEpwyi
X-Google-Smtp-Source: AGHT+IFvM6SBJtTLap+Q+DAFUbWc5zkuC4KMXDzaQJdqhN7s7+4kdqDXZd2/wUV9q/FU9iZ8tCHqn6eI4aaM7ptY90Q=
X-Received: by 2002:a17:90b:2545:b0:2e2:c2b0:d03e with SMTP id
 98e67ed59e1d1-2f453633e61mr74488893a91.5.1736094354238; Sun, 05 Jan 2025
 08:25:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
 <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
 <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
 <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com> <x73a2utr5sp4iffk5626zqfth4ayu3x4jkxd7xwjti7ehrgnzi@ploxx4i5db5h>
In-Reply-To: <x73a2utr5sp4iffk5626zqfth4ayu3x4jkxd7xwjti7ehrgnzi@ploxx4i5db5h>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Jan 2025 17:25:43 +0100
Message-ID: <CAFBinCBstfDa966+5wKLFdQNhnjW+d5Mpj=x3BDY+R5nHNnKLQ@mail.gmail.com>
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

On Fri, Jan 3, 2025 at 1:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Dec 31, 2024 at 07:49:40PM +0100, Martin Blumenstingl wrote:
> > On Tue, Dec 31, 2024 at 3:34=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > [...]
> > > > I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and i=
t
> > > > seems that there is only a single driver which uses the .prepare
> > > > callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem t=
o
> > > > implement .hw_params instead.
> > >
> > > Yes. However .hw_params don't have access to the infoframe contents, =
so
> > > I had to settle on implementing .prepare.
> > While debugging I noticed something unrelated to my problem:
> > hdmi_codec_spdif_dai_ops does not implement .prepare().
> > FYI just in case someone wants to use your patches and feed the
> > hdmi-codec with SPDIF instead of I2S.
>
> Could you please send submit a patch to the hdmi-codec driver?
Sure, see [0]


[0] https://lore.kernel.org/linux-sound/20250105162407.30870-1-martin.blume=
nstingl@googlemail.com/T/#u

Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CE54A2608
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Oct 2026 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820364; cv=none; b=U2W78HwHKinCEoFkkL+FOs3GaMGaxvV4DmWVFrqNEJhhowLowTjsSl5SlXC6199HZkxIAmYBnJV6UsX3yvx7nUDYfh1Hj1kEfJJlSQXemDO/E5yxl94nGqndYXgChDcEs15JdzvnsfXX9ML1Ecmu/TONFC7CYXl3zBt0HBQccmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820364; c=relaxed/simple;
	bh=xE2JB362It+KmbkVX14MVsk515VD8Prc1e4ZQqkz2jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVV//B3zsO0pUh84KPPcXg4tcWjJs35zDpTQ3NaFKVWkSL/kXaAYjdX6BP86eizzmWRdUciyFhPW2d1mYz18Cpn6A3ctXcg+VMu9+0fFjpkYKC8XEp6uAiMTUjjvOApQMGpE4aywEsC949oiFTai4C+ianUZ14/jZ8AhmjjHeGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jyQKaQT/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jyQKaQT/"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2055573c8cso242744066b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Oct 2026 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791820360; x=1792425160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMm76zmK3ArrseSrDrnVi5kZ0suPc21HeqCjahf5xGU=;
        b=jyQKaQT/iRjtqU393m5pa9pPT3cSrSm4aQ6230UuuRNzMr1LoS0NHtCHNfV+3pGd2O
         Px4olBw/9TvRrOt3RXYnvxBPvEToqkbKONN5+JDiVZMmKNQiUMB5DQqZdEAyqeoA56CU
         q81MlfN6gSA01avZFTDtJqsfdK3r2XRPWX7GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820360; x=1792425160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMm76zmK3ArrseSrDrnVi5kZ0suPc21HeqCjahf5xGU=;
        b=nAqFQXdzmRfbh+V4wKzcsmh6EpL54K6ecwkkUxIUNH27YZDkRb6w4gpStp4UWBpgOf
         UHE/Yy6ocvPNuwIJHDSPUUrjrke5Qx0pz9zNVfMp7tHolNX8nrW7bOJ25Kx8M/jjP3YP
         Vn9PZOcAwoXmpJeGkAg26Nv+qOZQ8SsG0+Z0nSrPlTCc7AVKQLOkzavq96i03iEHB8Qq
         xOyO8JkQhdE9GKdewg1AGGQQuP4YgUp1FfUbCXLFiAoaGAAoVQsq2RmVDUwVqCr51hY4
         1Zp1aSY7c8ANqrMv5vuTQiiuFfk2BuOQN3qsYv1mAt4XJHBQs9BqCwtBMXMQURRUxUlK
         H3qA==
X-Forwarded-Encrypted: i=1; AKwUvBw1b0ZtXVW7Itw+OjUu7gvnHGkN35iMjJLI9c4gtGKQpPsHyTVTWp9oQtSwnNTXcOmDtgV5IgroF9X+nFR0UGjdgw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/wirvSqGJJFJGgXmE9t/6DaYhd0CUxDK5LxRdg7NubxN5uutW
	Oi1ybMsgTzED3TlSLEz8M82CeXuo2oM4l5ed9uGqGUdYJP8M6bSajVtfSYZTlPiOT4O9Sm9GKjf
	cZV7hpg==
X-Gm-Gg: AYBFou1fWf8LCui626fpFoh5562a0ftP+GyCN2vNwordWHEaM7eAdYGjPmJl9AqXF/0
	SgQE5b7Qt/qxLvcMZa1gxcv/fD2HyrM+CtHxPvbzdN8MYs9VOJb3U5ENjYE+tr79wNGdTm9WVoz
	3Dx8YEwCMRnpnKJ/gExwsz5W25MVYZgniXS2W3NjK3nffiSwP0Id+1G4fvauo1hs0IYpuiFM10u
	zZ2IOYGqgXXNaiSVPjs1vdi/MrNy4o1Z9Rltlxmv0u3xO+wPjlYL7rfkFh1O1EYi7dGGhoDiFB2
	zFnBqVVdliVLXaMzbvLUFVdikkvXi35Ib+NbsPYAGQ7oiKHYYiUQRHgkrv9SEbD7x9gXi6iya01
	cL8AcOaszoBjEpNjZLJIkBpJIWkidpxwYOOZHLHcpuIrdCtuIP6IRLqj2Wqq8EFBzzDa1+I8/93
	JkQwJ3CUZJBdJiRiMxDp/stbzzQzhjetC5/TfnfiB1+nlUbQL6S1zfNXeSYMHfGpMkbyqHKZPvY
	TT+MU5kjJf1WsPTf3dNReuS9VA3V8u95twuKA==
X-Received: by 2002:a17:907:3d4d:b0:c26:1649:47b2 with SMTP id a640c23a62f3a-c31a9fd82bcmr885109666b.40.1791820360481;
        Mon, 12 Oct 2026 08:52:40 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac774esm473225666b.68.2026.10.12.08.52.37
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:52:37 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4207ac26so1985145f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Oct 2026 08:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzu8/A6FrEQVHfzhPkzm8lw4ILxNFx2dlqhbXGUiDNK6t7tJtupvEBp6GjZ4GzsYNW6uBQ2eJkZ+2504RlyVmBCYw==@vger.kernel.org
X-Received: by 2002:a05:6000:60c:b0:48d:df08:307c with SMTP id
 ffacd0b85a97d-48ddf083082mr1731696f8f.44.1791820356342; Mon, 12 Oct 2026
 08:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <9099b92c-d456-4dbf-95c7-dcb3f1004066@web.de>
In-Reply-To: <9099b92c-d456-4dbf-95c7-dcb3f1004066@web.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Oct 2026 08:52:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=kLK=p2xmcjP8mENApKNvtyU2L8OvTW1-EZM5+TMk4w@mail.gmail.com>
X-Gm-Features: AclHuK8lwjKGleC0Qe7nH4WggNgPyU5z0A6glLw0RKkKSL75lGBBduv0_ttODd8
Message-ID: <CAD=FV=U=kLK=p2xmcjP8mENApKNvtyU2L8OvTW1-EZM5+TMk4w@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Brian Norris <briannorris@chromium.org>, Joonwon Kang <joonwonkang@google.com>, 
	Lucas Wei <lucaswei@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 10, 2026 at 3:15=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/drivers/mailbox/goog-mba.c
> > @@ -0,0 +1,567 @@
> =E2=80=A6
> > +static int goog_mba_send_data(struct mbox_chan *chan, void *msg)
> > +{
> =E2=80=A6
> > +             spin_lock_irqsave(&goog_mbox->lock, flags);
> > +             out_of_space =3D payload_words &&
> > +                            (goog_mbox->outstanding_msgs >=3D
> > +                             goog_mbox->msg_buffer_words / payload_wor=
ds);
> > +             spin_unlock_irqrestore(&goog_mbox->lock, flags);
> =E2=80=A6
>
> Under which circumstances would you become interested to apply a statemen=
t
> like =E2=80=9Cguard(spinlock_irqsave)(&goog_mbox->lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v7.3-rc6/source/include/linux/spinlock.h=
#L642-L645

Sure. Once everything is resolved and I'm ready to send out a v2, I'll
make sure to include that change.

-Doug

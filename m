Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46442EC0A2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777325843; cv=pass; b=fiG9moLOEKKxHWgLKglyHggI06BnOc5eXVvzQy+2xbmRxeDgdmjPmUEiivdKnxIrO5dyjo8zz2YfViADfE1Yut6sc0mZNKGwxF397rBMlnkn5Bav3sHvMoOngIGDT/OZ2/Ek3p4Er22CoQtBCZzUT09VKU2xk5BTkqlBkNyzsZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777325843; c=relaxed/simple;
	bh=DVn7qGJDskykuut/lDgdFaU+iueGBbHQdrdh0qB2AVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqriTuw1Hqmeg3C0i9S1++zPF0DDfLKIzYJZfJWNejsH8x2LrFVZMfuQCYplTL5tKx/jeU42Z1EQZMdYFoNA/AgAltLQPMtj5LBsYnSIcCWCCs6cV/3NAh/YqMxQuCk9T1KmCIZz/wv+rXa5qfoTDsgSxVMG6gGZVcT2OX9XCOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV+Yp6bO; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV+Yp6bO"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so10179465eec.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 14:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777325841; cv=none;
        d=google.com; s=arc-20240605;
        b=Bm41RfC/Zp8LGDAWJT8Q9vMoYFor40yDKqXqEZOQ51hb0z9MXs2Yv1hQB6gLTlyw96
         zBXNePDBAVnUYnf1H+LR4AK6cP64HAWKUsheUo8hPQ8CduyTNKePaeuAo5cg/VaGg5R2
         jyQlgDSH0xGjw2ZXkJJ/1+z1FORwFT0Gv7ZvVgfH58wkDlJsfbUiRbPVCKqWd+Zkr3iF
         TFeUmj7PHOZqppYDXhm4X6QfLpjnZrbmrZAmKfDT/OfAgOGhzy5YKXDfLomzP7/9sS7P
         QUktqnJPYIpuFPLMnPmZpcn4su9X+iP0GuCtl+hIwuOtakBKxJlVWVc7sU4uL5DGGDDg
         XvpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8XKtJc4DO9XTE2eYRlXe/gcxi3hvK1ItEFqJbW+SysQ=;
        fh=l4RWBlqyisqSAxQuN5mkUX0ywfWIZ7vdLvZJpZWgSbo=;
        b=Vwh/r1rfn4esJLH9mrb25abVbqUm3t4gGseh3g9PCEdZ0XIZG9TW9raUyzGvIRR8z7
         93vgKdx0IYepmJAgjmt33fRREH0EW/17DSZvSDRSpwj9NM4IKAb5JbXv3ejCr6WXyf8d
         df28uJkO2Wvl2/6CK+b9ApLPWAV+U95fcCUIEi1Aoq9tZeEBFRY12TZ0xCdMX6gPy/X2
         nvzdsgtals3WeVOw5V8U11e1ltIrI5bP+EjKOm6kCFKP6x2xTqRgssvpN28DMQl0K/G4
         RM/GB/TPXO8Z/u+EXOvPGM2SkQ/af+2UI9ggogKyiTLblZQm3XWTUa4k1fC3yR68Tqbd
         vcMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777325841; x=1777930641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XKtJc4DO9XTE2eYRlXe/gcxi3hvK1ItEFqJbW+SysQ=;
        b=nV+Yp6bODtpL7e0ijEPHvnvsfhqPv3nv3cNohwKUh69w//l6MjK4WUVicndl19nE08
         9qoVQyy14Nhe3dmc7XkPmsIm7TBNSaYpoCakBmHvytNJSu+nRwJOYUd9ZAHhSqaf9bYE
         /+Qapw9D3r+Zua/w3l5Y/zA9tNZxyPpfeK0toGaZypN7QZAJHtGaXnRj0NZEfA4za84f
         J4feokGbBvP2fdhOZ2YANiRPZAeoThidSP2lQ5pm52IlCN93lWH4hw0D4XRVqWUL+j6b
         BqtQWbiUQt5S16bv6dOem1fGSlPnI5ID+tfoTb7Xy5knPX5KBmHyWFCDxCySPBSTG/Vl
         NF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325841; x=1777930641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8XKtJc4DO9XTE2eYRlXe/gcxi3hvK1ItEFqJbW+SysQ=;
        b=L5/b56YX23jz9/ryZp68m9tnxkB7Jj2HIwO7LIjLNdzpdL5nAQIAMC2pY9/gdjqMR7
         nieVH/2zg+gdDJRQOQuVn5cVT0ZNU5taSEWYi/2kJOzQA5ARjIDmyq48QoULgqOwEH4a
         RPSYHUZwt1C5pY0/oiicbScTqEDNxS8XfNs/7F3r/e2v6b8NbXYMU3v58ekh17obJUXh
         npb7zjj4kkrMx+uIXWvmKesg3c6+V6EKVTt6yBMijhsYmvcgrBFDZeqxs5RJNm+5DJXw
         HyG0dMYkuLyaSzQ9OD6rZgIPn4BjvOnSCkqwyeWBEbj4BwlEdXTBkGuKYIv2OcLGYFSh
         zfow==
X-Forwarded-Encrypted: i=1; AFNElJ8AooaVc1K+NY/5FFtYtpV2UA/Bzyc1AvR145TNbV2TaFli60tzdAdfL+otJAtbNttRNr6I4f3D+dLNndaYjIuuuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHS8yahdqQZR82Zr9XRLdEDeSGVSH5Mc000WAqdRxmb/NpivnP
	8D1aLqsi4GRRRj/qhsAI+YHUBxzK9AUYCjensda5yBifLqAstU2/IDyfVu5IkHsRxyE/yh44v87
	wkx5s08/dotNJSSxYYpCzJ3cIzV/x4o8=
X-Gm-Gg: AeBDietlfXqV4Yd6v/IkvHo7MXt8VceWcGeP4Qah9I49LOzE4RzQZrgXNVbFSaBLkWK
	fiz4ExRampiMy18WTIU7eIxorWMi7wiu/WZIE5O4gozmrWX6uGeOq9WUJ4J9WLRq9QXwQBt1F19
	J/S+110vnUXw4j6oDrUBrXTkeBk77uVyEmsW2OK6bSX16CYJYjDtetcDq5jzANXOmqto36BmXEw
	zevHFWwCwHkZbr6lZ4gSsoLe1IRR8j8YT27o8rFxuDGRgDR2Rjm0KINNn0YI2M/lxDvF8zqxYdF
	+PC4dQu2CiAFDQ==
X-Received: by 2002:a05:7300:d513:b0:2e2:4979:eb5 with SMTP id
 5a478bee46e88-2ed09fcc180mr311495eec.10.1777325840960; Mon, 27 Apr 2026
 14:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426210255.73674-1-titouan.ameline@gmail.com> <84c292d8-d2a0-4c29-bd28-cc00f66c2f43@linaro.org>
In-Reply-To: <84c292d8-d2a0-4c29-bd28-cc00f66c2f43@linaro.org>
From: Titouan Ameline <titouan.ameline@gmail.com>
Date: Mon, 27 Apr 2026 23:37:09 +0200
X-Gm-Features: AVHnY4JpWy4zf4LeRSNZh6T-aSXl5OGcXxX7HkXcB9Hcxkw79B-CQPA74hur6GM
Message-ID: <CABvHBc71N5NvYZ29W8hn9-gjOo40eh-hgcTAP3Nn1jrAfrgr2A@mail.gmail.com>
Subject: Re: [PATCH] firmware: samsung: fix stale response flag in acpm_prepare_xfer()
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was reading through the driver code and noticed that
acpm_prepare_xfer() only enters the

if (xfer->rxd) branch to set response =3D true
with no corresponding else to reset it to false.

Since seqnum slots are recycled, I traced what happens when a slot
previously used by a response-expecting transfer gets reused by a
fire-and-forget one

-> the stale true remains and the wrong branch is taken in acpm_get_rx().

Le lun. 27 avr. 2026 =C3=A0 10:48, Tudor Ambarus <tudor.ambarus@linaro.org>=
 a =C3=A9crit :
>
> Hi,
>
> Thanks for the patch!
>
> On 4/27/26 12:02 AM, Titouan Ameline de Cadeville wrote:
> > acpm_prepare_xfer() only ever set rx_data->response to true, never
> > false. A reused sequence number slot could therefore inherit a stale
> > true from a previous transfer that expected a response, causing
> > acpm_get_rx() to enter the response-copy path for a fire-and-forget
> > transfer whose rxd is NULL.
> >
> > Unconditionally assign the correct boolean value so the slot is fully
> > reset on every reuse.
> >
>
> How did you find this?
>
> Sashiko identified this too when reviewing the ACPM thermal patches.
> I sent some fixes last week, where this bug is squashed as well:
>
> https://lore.kernel.org/linux-samsung-soc/20260423-acpm-fixes-sashiko-rep=
orts-v1-0-2217b790925e@linaro.org/T/#m1c32aa4c84ea7e3909bc8fe7599585b71e95d=
8b5
>
>
> Thanks!
> ta
>
> > Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> > Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
> > ---
> >  drivers/firmware/samsung/exynos-acpm.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/=
samsung/exynos-acpm.c
> > index 16c46ed60837..2fee6bb60efc 100644
> > --- a/drivers/firmware/samsung/exynos-acpm.c
> > +++ b/drivers/firmware/samsung/exynos-acpm.c
> > @@ -380,8 +380,7 @@ static void acpm_prepare_xfer(struct acpm_chan *ach=
an,
> >       /* Clear data for upcoming responses */
> >       rx_data =3D &achan->rx_data[achan->seqnum - 1];
> >       memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
> > -     if (xfer->rxd)
> > -             rx_data->response =3D true;
> > +     rx_data->response =3D !!xfer->rxd;
> >
> >       /* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) *=
/
> >       set_bit(achan->seqnum - 1, achan->bitmap_seqnum);
>

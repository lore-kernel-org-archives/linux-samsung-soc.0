Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B3E76C61
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Nov 2024 05:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730784284; cv=none; b=TY+U9tt7sHwMDs3NtrmPZPr0HsfH3YLfO3wkMLCLulkUbS3kTL0iqxL5BXH6rOEwmjFIfye5AKnrGTOsWR86rH8lTkxXbF0zo/DuJgw83H5RvNkWt4nj+Xhk5iOYSzhIMaVC+/ttoC7IM2llHHHcNSAOZkcQKUYGB7CQ698jIL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730784284; c=relaxed/simple;
	bh=4DtPGViv9kF+P0NsXbIJNdJPAbr4vfBtMnxLHNMuoR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nj9J767GnNK1zV7wC4sCDXhz4J+vLHPG2CIqp+K9PBWKHZaVrTOrai2oXNr2E6qW1RGluV32RU29DB64Lef78D5DnCp4k4GrH3MrKyHNcrOGH1gneXBOYJjjvd1OF4TLx3YB7hVtKAAdAuUFnCNHU7qMemV5bCGW2mS2SaZuvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bu8gAC16; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bu8gAC16"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2ed59a35eso4009701a91.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Nov 2024 21:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730784282; x=1731389082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFhu+Ehh9YM596pjmb7Dh2hs5sKhuAIb9PMq8+bdxxU=;
        b=bu8gAC16GTMqt/MxjDZ7bGgOOeCjPGJ6Vm5c1Gc8lndQbntpwmz/KL4OZ6JHWtgpUg
         oeBwK3q+DMlixjayJaMiyWScLQvJjcA2puUzl2g3hP0lYBWc8Ph4wkG895accIO4aHFX
         2tWTe4QuTS/20qGGpKftm68qL4LAGWJrvQu/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730784282; x=1731389082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFhu+Ehh9YM596pjmb7Dh2hs5sKhuAIb9PMq8+bdxxU=;
        b=qlmFwSmn619FMfxLxZj+87dFBW+Cduc0sy+0Z/pztiIvBX+xEAlx+wWPhC3j80/rzi
         PtQw+HPDkvUPHxECcqxjRJFL66yA0uOnaEGpBDC4OIyF6itAsAFIvP8LTLr+P4MAF2Qi
         KkVM+dpJgbp73TRGn0JAmmo4GThkqk9HnvfBPU25+K5l4+0WUGCMh0/KzJ58j4ptYlIW
         JVaE4M3Ss/ABXen9m2InKyLeQA0sQBD+fEingzydUW+7tIej/+Qh0FsqHkSdMh7d+PQ0
         QFmTohgxQdE2oBtDd8yQ3K/UMPNHqrc2pQzn2b96SOd0t24U1uuCo803X+nn1epdVH/c
         vPag==
X-Forwarded-Encrypted: i=1; AJvYcCVKY6zuQDtADiLK7TXl8TCdNiU+MEwhsg0BR+Cev2eaKhvYzK6aEJ23acUJPvUwwYfSf6irJuIxVlAFNEKDicbQ0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Fcbb7sfH1VpvipdXMnywz9yV2cLWXRx27J3IDSiF+UhLtn3R
	l9nPZvzppJiuP5CbqY0pvs2ZVV6QWN2zrjmoPODFJ/yW++9YQh/p3P0YRxYvYBk3LMt3u7olL3+
	YGw==
X-Google-Smtp-Source: AGHT+IF3vErbugWpD0Sivg9bDJO0p9cR0VMDQ6d92cJfFdRb+/0zfDTehuNnzZBeefcaifoeK1VRQg==
X-Received: by 2002:a17:90a:2c0e:b0:2e2:8472:c350 with SMTP id 98e67ed59e1d1-2e8f1072989mr35194287a91.17.1730784281862;
        Mon, 04 Nov 2024 21:24:41 -0800 (PST)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93db18717sm8662485a91.35.2024.11.04.21.24.40
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 21:24:41 -0800 (PST)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20ca4877690so108865ad.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Nov 2024 21:24:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYt9MIOGT9TakDKRRSXgkO6yV3aNrZ/MrX8MLR5tebzmmzq+kB6aEg9QiGXhCnnu9aW4EHZwaLgNim7oGjE6q/JA==@vger.kernel.org
X-Received: by 2002:a17:903:120a:b0:20c:79d7:d8c9 with SMTP id
 d9443c01a7336-2115e2c51f2mr1318095ad.26.1730784280209; Mon, 04 Nov 2024
 21:24:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814020643.2229637-1-yunkec@chromium.org> <20240814020643.2229637-3-yunkec@chromium.org>
 <ee2f1ece-30fc-44e7-bf36-1c6c8f04301d@linaro.org>
In-Reply-To: <ee2f1ece-30fc-44e7-bf36-1c6c8f04301d@linaro.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 5 Nov 2024 14:24:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dpd-TdGwTRSmoqHd4xCsSQuPuL_V11nGXrZvS9x2G=2Q@mail.gmail.com>
Message-ID: <CAAFQd5Dpd-TdGwTRSmoqHd4xCsSQuPuL_V11nGXrZvS9x2G=2Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] media: videobuf2-core: release all planes first in __prepare_dmabuf()
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Yunke Cao <yunkec@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	kernel-team@android.com, William McVicker <willmcvicker@google.com>, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tudor,

On Tue, Nov 5, 2024 at 2:40=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> +linux-samsung-soc@vger.kernel.org
>
> Hi, Yunke, Tomasz, Hans,
>
> On 8/14/24 3:06 AM, Yunke Cao wrote:
> > In the existing implementation, validating planes, checking if the plan=
es
> > changed, releasing previous planes and reaquiring new planes all happen=
s in
> > the same for loop.
> >
> > Split the for loop into 3 parts
> > 1. In the first for loop, validate planes and check if planes changed.
> > 2. Call __vb2_buf_dmabuf_put() to release all planes.
> > 3. In the second for loop, reaquire new planes.
> >
> > Signed-off-by: Yunke Cao <yunkec@chromium.org>
> > Acked-by: Tomasz Figa <tfiga@chromium.org>
> > ---
> > v3:
> > - Applied Tomasz's review comment:
> > - Rename err_put_dbuf as err_put_planes.
> > - Move code that only executed once into if (reacquired) to simply it.
> > - In error handling, only call dma_buf_put() for valid pointers.
> > ---
> >  .../media/common/videobuf2/videobuf2-core.c   | 115 +++++++++---------
> >  1 file changed, 59 insertions(+), 56 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/=
media/common/videobuf2/videobuf2-core.c
> > index 4d232b08f950..b53d94659e30 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -1387,11 +1387,13 @@ static int __prepare_dmabuf(struct vb2_buffer *=
vb)
>
> cut
> > +
> > +     if (reacquired) {
>
> cut
>
> > -     /*
> > -      * Now that everything is in order, copy relevant information
> > -      * provided by userspace.
> > -      */
> > -     for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > -             vb->planes[plane].bytesused =3D planes[plane].bytesused;
> > -             vb->planes[plane].length =3D planes[plane].length;
> > -             vb->planes[plane].m.fd =3D planes[plane].m.fd;
> > -             vb->planes[plane].data_offset =3D planes[plane].data_offs=
et;
> > -     }
> > +             /*
> > +              * Now that everything is in order, copy relevant informa=
tion
> > +              * provided by userspace.
> > +              */
> > +             for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > +                     vb->planes[plane].bytesused =3D planes[plane].byt=
esused;
> > +                     vb->planes[plane].length =3D planes[plane].length=
;
> > +                     vb->planes[plane].m.fd =3D planes[plane].m.fd;
> > +                     vb->planes[plane].data_offset =3D planes[plane].d=
ata_offset;
> > +             }
>
> I'm running into an issue on my Pixel 6 device with this change.
>
> I see that this chunk of code was moved only for the `reacquired` case.

Thanks for the report!

If I remember correctly the idea was that if the buffer was validated
to be the same as given previously, there is no need to update the
fields, because they should already be the same. However, I can see
that this may not be true for bytesused, m.fd and data_offset in some
scenarios.

>
> > -     if (reacquired) {
> >               /*
> >                * Call driver-specific initialization on the newly acqui=
red buffer,
> >                * if provided.
> > @@ -1479,19 +1473,28 @@ static int __prepare_dmabuf(struct vb2_buffer *=
vb)
> >               ret =3D call_vb_qop(vb, buf_init, vb);
> >               if (ret) {
> >                       dprintk(q, 1, "buffer initialization failed\n");
> > -                     goto err;
> > +                     goto err_put_vb2_buf;
> >               }
> > +     } else {
> > +             for (plane =3D 0; plane < vb->num_planes; ++plane)
> > +                     dma_buf_put(planes[plane].dbuf);
> >       }
> >
> >       ret =3D call_vb_qop(vb, buf_prepare, vb);
>
> But then the above method is called, were the pixel downstream driver
> [1] tries to:
>         bufcon_dmabuf[i] =3D dma_buf_get(vb->planes[i].m.fd);
>
> This fails with -EBADF as the core driver did not set
> vb->planes[plane].m.fd for `!reacquired`.
>
> The following diff makes the Pixel 6 downstream driver work as before
> this change. Shall we set the relevant data copied from userspace to
> vb->planes in the `!reacquired` case again?
>
> Thanks,
> ta
>
> [1]
> https://android.googlesource.com/kernel/gs/+/refs/tags/android-15.0.0_r0.=
14/drivers/media/platform/exynos/mfc/mfc_enc_vb2.c#215
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c
> b/drivers/media/common/videobuf2/videobuf2-core.c
> index 02fe81b9be28..0acaf8deaf78 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1365,6 +1365,18 @@ static int __prepare_userptr(struct vb2_buffer *vb=
)
>         return ret;
>  }
>
> +static void __v2buf_set_planes(struct vb2_buffer *vb, struct vb2_plane
> *planes)
> +{
> +       unsigned int plane;
> +
> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> +               vb->planes[plane].bytesused =3D planes[plane].bytesused;
> +               vb->planes[plane].length =3D planes[plane].length;
> +               vb->planes[plane].m.fd =3D planes[plane].m.fd;
> +               vb->planes[plane].data_offset =3D planes[plane].data_offs=
et;
> +       }
> +}
> +
>  /*
>   * __prepare_dmabuf() - prepare a DMABUF buffer
>   */
> @@ -1459,12 +1471,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>                  * Now that everything is in order, copy relevant
> information
>                  * provided by userspace.
>                  */
> -               for (plane =3D 0; plane < vb->num_planes; ++plane) {
> -                       vb->planes[plane].bytesused =3D
> planes[plane].bytesused;
> -                       vb->planes[plane].length =3D planes[plane].length=
;
> -                       vb->planes[plane].m.fd =3D planes[plane].m.fd;
> -                       vb->planes[plane].data_offset =3D
> planes[plane].data_offset;
> -               }

I think it should be fine to just move the following parts outside of
this if block and then call the buf_init op conditionally if
(reacquired), like it was in the old code.

Would you mind sending a fix patch (with a Fixes: tag)?

Best regards,
Tomasz

> +               __v2buf_set_planes(vb, planes);
>
>                 /*
>                  * Call driver-specific initialization on the newly
> acquired buffer,
> @@ -1476,6 +1483,8 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>                         goto err_put_vb2_buf;
>                 }
>         } else {
> +               __v2buf_set_planes(vb, planes);

I

> +
>                 for (plane =3D 0; plane < vb->num_planes; ++plane)
>                         dma_buf_put(planes[plane].dbuf);
>         }

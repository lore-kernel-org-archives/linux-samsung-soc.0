Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C2383
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Nov 2024 23:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730936510; cv=none; b=pfAwh0SrCzKpxkGzET8k4HsqymwUahWOF1OQRbf30DZE8+yiGBpo1tlzCrqDGVKu4KjLncejmpnYHot5Fg3IxtC3Jd0/chwDooxZVdxu3KaIIot56Xd3h956mmkWXO9o5rj18m+9h45XMoRgaXbKfbmoRNZO14ucrtlofdM/6gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730936510; c=relaxed/simple;
	bh=Jb8BAyvd4oz2mGslbPXUUxqw+BIR393RplBHuFXMRjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUATxtYbaIka5wi7Ktwjv/MBb84nP4/5DIG/ZyhTuEfCa9kprXT54xejfnKMQwNnruEN9ta7Ad3WYH7fb2Ho7hkSlHUkV8Klc/nzK+pJbN33mT7LuESl64qMZ9OFozIr4YJ7n+owHDWxuX0r+gvMaoZxq0SIvD/+K9LNVy95v1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g5g3hkmU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g5g3hkmU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-207115e3056so3817255ad.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Nov 2024 15:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730936507; x=1731541307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUIxV8/idxeTiaY7TjZoSjaAKD90iyIZAKQ4e5QblXw=;
        b=g5g3hkmUrJtx14uEAFrLExE0aOWCiBupK6JY1sRg5BYFAwinFBrEIKHYd74TJIN6nj
         FbKiZD8kwQ6AnnMOijnrhXzVmzxVm4AHACfGSeCIrWq8ke5wCn8ICb+wzdIddEzab0vn
         FgDcY5JN+BZ6BS6Bx92bfDsKYGq9A+cns0GVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730936507; x=1731541307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUIxV8/idxeTiaY7TjZoSjaAKD90iyIZAKQ4e5QblXw=;
        b=WpbQS6dFr/oelbehrn5ZWVLSPeeSl56X5D8Z5yDZREGNztGwpK8v3ssR5FIScPDiqm
         eOUI5w8WmesD3d+MAgPwBAaj9gNny+nNYvvbjocl8SUA4pgn3xirUDuVx/5fRVDC/1aX
         jA0zCzSp9VO6TuKCSYbMihC/0N79kmezvHaOifNjHQ1dVIhxNjWk6a4chFwR96qPrVdr
         VlycqHGPqmEzHSR6dUx+p+ANgh4rz2K9nxj0tPsH07lpIoutzYbOGAZkDxwFsKTNVO5l
         fRcaUgX3EhYOsPmCqUvjNAI7Ri7wbkA22IQDOKs3wrbEZyg1DBbbn2Vy9sc8lFcYgQ0T
         O55w==
X-Forwarded-Encrypted: i=1; AJvYcCVISj8xKJRaXJ4nHBQK9Ovh7M34T914zoF3uKYF1Ly0/Px/N+sGcHVyEjt0oUqNY2bcrZYW5RDbjh4keClYM1FyxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jF8W1FiyJxUXKgKU95XTiqzy+TFHAYO1D3BS6riA4FHstUnE
	k/V2pprqMzpL28hyA08o8Cnmk3nWFl4Ztvlvs1wkQmec0e0Xby6ldn51M6fO/1KbNFZH65Y8ru7
	kKQ==
X-Google-Smtp-Source: AGHT+IFAIO54WIDG4I4tp0HztdUfn3WT9dNHRAnffePQkhmFYlADzY5P8F6XT+21wIgaBuSmqy8/Pw==
X-Received: by 2002:a17:902:f547:b0:20d:2848:2bee with SMTP id d9443c01a7336-210c6892da8mr591295165ad.16.1730936507484;
        Wed, 06 Nov 2024 15:41:47 -0800 (PST)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e79cf4sm197145ad.262.2024.11.06.15.41.46
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 15:41:46 -0800 (PST)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c8ac50b79so53925ad.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Nov 2024 15:41:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXo3GGZ4EjosU+jJrAnNfwiKIxeGLHYeo9OHVjgObi9JDM9OxB2p2pgId3byfC1YxuqcbqXgBqxEsRKfAiOLfx+dA==@vger.kernel.org
X-Received: by 2002:a17:903:2285:b0:1f7:34e4:ebc1 with SMTP id
 d9443c01a7336-211748fa9f8mr1764415ad.5.1730936505431; Wed, 06 Nov 2024
 15:41:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106121802.2939237-1-tudor.ambarus@linaro.org>
In-Reply-To: <20241106121802.2939237-1-tudor.ambarus@linaro.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 7 Nov 2024 08:41:24 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B51wa1dD3FzHKxsg4VaA_bHzUrFGmA19q8jUybsMuS0Q@mail.gmail.com>
Message-ID: <CAAFQd5B51wa1dD3FzHKxsg4VaA_bHzUrFGmA19q8jUybsMuS0Q@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2-core: copy vb planes unconditionally
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: m.szyprowski@samsung.com, mchehab@kernel.org, yunkec@chromium.org, 
	hverkuil@xs4all.nl, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 9:18=E2=80=AFPM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> Copy the relevant data from userspace to the vb->planes unconditionally
> as it's possible some of the fields may have changed after the buffer
> has been validated.
>
> Keep the dma_buf_put(planes[plane].dbuf) calls in the first
> `if (!reacquired)` case, in order to be close to the plane validation cod=
e
> where the buffers were got in the first place.
>
> Cc: stable@vger.kernel.org
> Fixes: 95af7c00f35b ("media: videobuf2-core: release all planes first in =
__prepare_dmabuf()")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 28 ++++++++++---------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>

Thanks for the fix.

Acked-by: Tomasz Figa <tfiga@chromium.org>

(We probably need some tests to verify this behavior... It seems like
the way v4l2-compliance is implemented [1] would only trigger the
!reacquired case on most drivers.)

[1] https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-t=
est-buffers.cpp#n2071
(just queuing all imported buffers in order and re-queuing them
exactly as they are dequeued [2])
[2] https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-t=
est-buffers.cpp#n1299

Best regards,
Tomasz

> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index f07dc53a9d06..c0cc441b5164 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1482,18 +1482,23 @@ static int __prepare_dmabuf(struct vb2_buffer *vb=
)
>                         }
>                         vb->planes[plane].dbuf_mapped =3D 1;
>                 }
> +       } else {
> +               for (plane =3D 0; plane < vb->num_planes; ++plane)
> +                       dma_buf_put(planes[plane].dbuf);
> +       }
>
> -               /*
> -                * Now that everything is in order, copy relevant informa=
tion
> -                * provided by userspace.
> -                */
> -               for (plane =3D 0; plane < vb->num_planes; ++plane) {
> -                       vb->planes[plane].bytesused =3D planes[plane].byt=
esused;
> -                       vb->planes[plane].length =3D planes[plane].length=
;
> -                       vb->planes[plane].m.fd =3D planes[plane].m.fd;
> -                       vb->planes[plane].data_offset =3D planes[plane].d=
ata_offset;
> -               }
> +       /*
> +        * Now that everything is in order, copy relevant information
> +        * provided by userspace.
> +        */
> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> +               vb->planes[plane].bytesused =3D planes[plane].bytesused;
> +               vb->planes[plane].length =3D planes[plane].length;
> +               vb->planes[plane].m.fd =3D planes[plane].m.fd;
> +               vb->planes[plane].data_offset =3D planes[plane].data_offs=
et;
> +       }
>
> +       if (reacquired) {
>                 /*
>                  * Call driver-specific initialization on the newly acqui=
red buffer,
>                  * if provided.
> @@ -1503,9 +1508,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>                         dprintk(q, 1, "buffer initialization failed\n");
>                         goto err_put_vb2_buf;
>                 }
> -       } else {
> -               for (plane =3D 0; plane < vb->num_planes; ++plane)
> -                       dma_buf_put(planes[plane].dbuf);
>         }
>
>         ret =3D call_vb_qop(vb, buf_prepare, vb);
> --
> 2.47.0.199.ga7371fff76-goog
>

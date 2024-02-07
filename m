Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B157FBCA
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707320555; cv=none; b=WAmghrkvQ9JIOk9NsVtdISjuhX/smj02OCNkTGNKZnCx/RFy4KBf8uXlCr6yAaLk9ZkINVSjShLWCHgaq7D5LdQW0CsUqs3bY5mmmNd2rR7+W20Ti6WCfzaw3Mwk3lz/ianRXlAUX/qc7Lvzu4r0MYLKAwlPskntxGUTe4hLomk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707320555; c=relaxed/simple;
	bh=6SHPMjNP8YDT15Iij7ixZFtooCnxVqeUcWFZiDatm2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhTo+vUIurbgaiVqvmfn5lsMDFN5cJqPvdDCcSgoXUZmFBseD9shlffQSEF5ulh+jF+jWuf6HsuZY2IenAeDww3pZBY/fJG7L5xFNKLR/aFo1rZX28jeDc9fVy/exCdzCkWZlKXt4njw/iFSdL4CXxvaZ+Av2otD+j9H5q0BRYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f72ZL+19; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f72ZL+19"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-290fb65531eso555563a91.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 07:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707320551; x=1707925351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1k6l9VsJqCh+RqlLUdVe9MZtp+zPDCT1Q+6Pwca5BQ=;
        b=f72ZL+19RKp/8pv1MeD3DGZTuv3EIHZ20hZ3sV4chavUcxoC34N5W6gE2E981dOuLE
         2WfXE/z+dFoKxA2Vf9NOrBMQIJCv/Ild5c4Go31tnXsWt7GRdZMgc3ZIRFkwq4ty1vcX
         L/b+sZBuGk8ixkBuhw8tXoMp1ROAZrhDg5x7tI6YduoZ6uKTwRws+lhTbbj8ljGhnkv1
         4eCJAmydXrDc26POIxSPgY54xjM4UpvsgPQJpGdOcOMTasoDoEf7ouYu8D0LzV6SKpjl
         BVq5Ts+idnVRAvypfKeMEgBO3b+MXKUqwcJ3MMAY1j6rn5gGt7RdvStLtaWCsrfBoF9A
         d7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707320551; x=1707925351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1k6l9VsJqCh+RqlLUdVe9MZtp+zPDCT1Q+6Pwca5BQ=;
        b=b0dyeQ6Joca1rTsMvo0XhzKVMTqbFHl67zyGs5auskT53weRJZIrNUYxYVhOolVSBI
         rzDc4dSq7LIV842XJiWhG9ZnJkX/UzeTYrOCPvjfiKyCmA44yTUsv2x/bczA7jIZsq+W
         I0BxiM6aigtwynUQT8RrQhYqKyoWrQII97JwFrNyOQNZGu1zlNO2XaUpmF6sFq3j1kif
         GXu5Kv4W8TEFYbPabQz6Ic0oULKcxYFa/E1Rc+6lzR6cxA1cfrZ+6ZTlICqao8XCGiNv
         JRu2MqmYCMjM0CUObhZJVXVEb7mHWCWn3j6NHsHpnWNTZ6JrJMt758mxWAfYqeR92sfi
         t22g==
X-Forwarded-Encrypted: i=1; AJvYcCV820cglUWrpFyXBljT0IN3kVSdILNAUx5P+Ce+BbwgWT8rz8BLiG5oGs/dPmr+mApmqKSshJWbWRi8u3pO6CsslR1yiLuiQ5tSF+9NvIdnPPI=
X-Gm-Message-State: AOJu0YzIJ+t2O9SY1CldvFhXssLTU2LXDx1dDul8KPjiYqeNLXveOnx7
	zsYRoiAsXXeRVaEoYX7Iv10EFKXrDoxEkgZP/MQY3DbiVeecCuywFdSP9g/nZ3QTCD1DVkKL+K9
	NoA1fSQPi2wpqiC/RRqvI4q07NYSV0P2EijcnBg==
X-Google-Smtp-Source: AGHT+IHoo4XR4AOXdM1Xi2DWyc3VAXdtc9F/OIyCgMe01EYezQtt37cphv12SPLoNwfrzSk+idTwfQsKhr3rHYJ1sig=
X-Received: by 2002:a17:90a:d48f:b0:296:c695:4962 with SMTP id
 s15-20020a17090ad48f00b00296c6954962mr2669545pju.41.1707320551601; Wed, 07
 Feb 2024 07:42:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206085238.1208256-1-tudor.ambarus@linaro.org>
 <20240206085238.1208256-2-tudor.ambarus@linaro.org> <CAPLW+4=Xd+B=ZncqPgU4qaJ8zY8JJvJZApdUW_v0w6yr2cy9Sg@mail.gmail.com>
 <16a5e423-1111-49ff-ad6c-b0bb89a4879a@linaro.org>
In-Reply-To: <16a5e423-1111-49ff-ad6c-b0bb89a4879a@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 7 Feb 2024 09:42:20 -0600
Message-ID: <CAPLW+4n_1yBOuzW3Ke2DKh_0EBZMUrd3nyGd=U0TeOML_2dXuw@mail.gmail.com>
Subject: Re: [PATCH 1/4] spi: s3c64xx: explicitly include <linux/types.h>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, broonie@kernel.org, andi.shyti@kernel.org, 
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, robh+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 12:21=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
>
>
> On 2/6/24 18:02, Sam Protsenko wrote:
> > On Tue, Feb 6, 2024 at 2:52=E2=80=AFAM Tudor Ambarus <tudor.ambarus@lin=
aro.org> wrote:
> >>
> >> The driver uses u32 and relies on an implicit inclusion of
> >> <linux/types.h>.
> >>
> >> It is good practice to directly include all headers used, it avoids
> >> implicit dependencies and spurious breakage if someone rearranges
> >> headers and causes the implicit include to vanish.
> >>
> >> Include the missing header.
> >>
> >> Fixes: 230d42d422e7 ("spi: Add s3c64xx SPI Controller driver")
> >
> > Not sure if Fixes tag is needed here.
>
> We have already talked about this. If a patch that causes the implicit
> include to vanish is backported to stable, it will reveal the missing
> header here and will result in backporting this patch as well. So, as a
> good practice let's allow this patch to be queued to stable, it will
> avoid possible compilation errors.
>
> I guess Mark has to break the tie again. Or Greg if he cares, I added
> him in To:.
>
> >
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> ---
> >>  drivers/spi/spi-s3c64xx.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> >> index 72c35dbe53b2..c15ca6a910dc 100644
> >> --- a/drivers/spi/spi-s3c64xx.c
> >> +++ b/drivers/spi/spi-s3c64xx.c
> >> @@ -17,6 +17,7 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/pm_runtime.h>
> >>  #include <linux/spi/spi.h>
> >> +#include <linux/types.h>
> >
> > Is this really needed for the further patches in this series?
> >
>
> Yes, because in patch 3/4 I use u8 and u16 and I don't want to use those
> without having the header included. Do you find this wrong?
>

I'd say if this header is really needed for your patch 3/4 to have a
successful build, just merge this patch into the patch 3/4 then.

> >>
> >>  #define MAX_SPI_PORTS          12
> >>  #define S3C64XX_SPI_QUIRK_CS_AUTO      (1 << 1)
> >> --
> >> 2.43.0.594.gd9cf4e227d-goog
> >>

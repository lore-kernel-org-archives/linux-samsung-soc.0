Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5A111B5
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 03:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706326725; cv=none; b=oLSerNFr24uBsxLKbfgO68SMVimnzMT7XHYTvrRCWg3vdBDaXNAio5Tu9mfToTm61uCfhzIsYCDerMuKycl0HX7e0/fgATUmgI8Dn/DaPGCrBSo+d0/vzZwSoZC+NG+VOxiomcdz9NtgU0mFZhqtfY0qxsiTAq9Gd06tJnDsV6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706326725; c=relaxed/simple;
	bh=ptRvofd1XSyL64ByZHUaDprHNiV0o1rEa53gEIm7ko8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJTp6hlFyYZpg6Bq203E23EZYrz28FcJHUKx8uA54RPJ4VAD5C7f0/NbW5DccM4R/CX0wdBP1t+DDWN3iRUBQ1N+MIIdutque32Enbg8BoFvmxr58YKuhhoh4joWFp5Vlz6vYzqC2oXdxZrlJebOFrbs31SQvM6rVPdL9UFWOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HWvBCTQW; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HWvBCTQW"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-783cd245ec0so88923785a.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 19:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706326722; x=1706931522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3+lSaV5k4Dfkc53Op2tvfbF0vHcLdK/yHeAoCK2Liw=;
        b=HWvBCTQWShdP0MzEScLNIYWez2JgxH2X2iflY9i0ZC4PF5usnuzS2Ww+YMMqsDlNnO
         pjf3s7meCi/g1JnW4PiovqVRQgQu4zzxHaxe3SuWHslBO/0DSbKnF2t+PDCSiKcEjt8z
         9f0/PxElx2aMRQr5zCuEbQ/Os6gcaNFMW2HV9MbmJB7PrAeX9MJhTXmUEJTvB1dA0JPv
         sYcYTIQ1QtCGRACu2FBxfaORUtVDgWZEHdjgG8z6uncPijGZHXksVK1T/so3ClxCsqsn
         Gc9m/wajC0n6NvCYML50wxmSHxmTfQLaVNFFU/SgGJFWNKDmLFfo8s1X0fe3nVverzVI
         xBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706326722; x=1706931522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3+lSaV5k4Dfkc53Op2tvfbF0vHcLdK/yHeAoCK2Liw=;
        b=v/BMlLbNFhxmTzTHQp/yBcvh/lCMaS5bMb5Fk5IW++HzW8pqqpPCSLak2hp02vPqc+
         Ak/To5mKWYGRdCEHEYY/6LIC0uZ8mc4C+0pX+qANJDPchcLF7eSiwxBuUiU+lndTxZ8u
         2/264sEHzMKkUdTmBGdtwpGJ1GfGpafwNabDjPI1lwDIbq5T555k2/Aj/uGqH61txIns
         NuQNiBKjnkj6LgBDxyu7YjiMDl6RIBOALbeYMkwhdH9RyAhvp+jC7Ml7uPtA+sZ6hUby
         DUKDQilGWyWwDDMz2dBsHm37vtGkmNcG4UlSpHg20S/c49T/64VJ2ux0houvl8qj168X
         DHGg==
X-Gm-Message-State: AOJu0Yyrvamqodhk1ZSfLT9H0NZUuu0B0C2LD7bGx3rvLe09J9kq9Ky1
	cS7pTc6vVwNo3vRrJZqBV0jwwE/kgVks2BM9i2tRUxLR81IhjwDSeRBB8NigKGDd2ONpHf1l5kt
	eTB+M338izeoNAEXku9ZQRQhAT72gFtNMgmapNw==
X-Google-Smtp-Source: AGHT+IGMqouLo1o+ccPzY5vjpHB4grmiMzGREKYTDFUgW1x4VF9zcneNjf49KACEqgsJZVxW7u7GEfa/a763D0Awua8=
X-Received: by 2002:a05:620a:4441:b0:783:b9e4:8b4f with SMTP id
 w1-20020a05620a444100b00783b9e48b4fmr1081283qkp.31.1706326722307; Fri, 26 Jan
 2024 19:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126171546.1233172-1-tudor.ambarus@linaro.org>
 <20240126171546.1233172-18-tudor.ambarus@linaro.org> <CAPLW+4nL6D7R88Q_kJjAT-bWTFBk8a=FT0vL+fyRgxaDeSyhNw@mail.gmail.com>
 <b5ecacaa-8ccc-4588-b3be-4b5f85813909@linaro.org>
In-Reply-To: <b5ecacaa-8ccc-4588-b3be-4b5f85813909@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 21:38:31 -0600
Message-ID: <CAPLW+4nN--gG9XsOu6a-mo5vcM-GycRrhPQFOtNidfVTM=KonQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/17] spi: s3c64xx: use bitfield access macros
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, krzysztof.kozlowski@linaro.org, 
	alim.akhtar@samsung.com, jassi.brar@samsung.com, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 9:23=E2=80=AFPM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Hi, Sam,
>
> Thanks for the review feedback!
>
> On 1/26/24 20:12, Sam Protsenko wrote:
> >> -               val |=3D S3C64XX_SPI_MODE_BUS_TSZ_HALFWORD;
> >> -               val |=3D S3C64XX_SPI_MODE_CH_TSZ_HALFWORD;
> >> +               val |=3D FIELD_PREP(S3C64XX_SPI_MODE_BUS_TSZ_MASK,
> >> +                                 S3C64XX_SPI_MODE_BUS_TSZ_HALFWORD) |
> >> +                      FIELD_PREP(S3C64XX_SPI_MODE_CH_TSZ_MASK,
> >> +                                 S3C64XX_SPI_MODE_CH_TSZ_HALFWORD);
> > Two people complained it makes the code harder to read. Yet it's not
> > addressed in v3. Please see my comments for your previous submission
> > explaining what can be done, and also Andi's comment on that matter.
>
> I kept these intentionally. Please read my reply on that matter or the
> cover letter to this patch set.
>

I read it. But still don't like it :) I'm sure it's possible to do
this modification, but at the same time keep the code clean an easy to
read. The code above -- I don't like at all, sorry. It was much better
before this patch, IMHO.

> > Also I think new patch series are being submitted a bit too fast,
> > people might not have enough time to provide the review.
>
> This patch set contains patches that are already reviewed or too simple
> to being lagged.
>

Ok, agreed.

> Cheers,
> ta

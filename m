Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1137713D28D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jul 2024 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720894927; cv=none; b=JK91qEmllRri8Sfh8yL9VfSdS59RqwfT6F7tt5jzo7fVDKrONH0FCJ+cFIgj8U6Ha2XbHgjf3y+ESHhQO8LSWjwAgAk5L30TG9SbSAiRoJ2aSKnuMzvyvt7TDEH8L5yLyZ7vsAA4zM4M0VVxTgr8AVCvUec0o1Mi3i//0emZq/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720894927; c=relaxed/simple;
	bh=wK225UtK9kULJZqIO8UH+sthg1ntv0kXHyAI+XYzS04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nn7G/kbTckyEK1sshFLOtlKZn6GcLs72ecgoMfQruRqrMrB7E4KHnUxJCDkrpxe9+VNZaAaFSmCofiIUs6VfkIyv+FDbk1neX0Nah4gOgpsd0XzdF+gFaaHhMQo2K6lX9ZoINUlWxaCNckyVTTkxF9D0/lMR9JByM+j0bNS319E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PbP6E3Vy; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbP6E3Vy"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-643f3130ed1so28165607b3.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jul 2024 11:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720894925; x=1721499725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Akd7PvYX49ssVnM7IV++4JO2xnx3E7OhyZAKQW51cYQ=;
        b=PbP6E3Vy1paO7eXsMLM517BNtjLJKcXW42q0Pt4RuwD8L5DWWm+bakcYNSfxhIY2WL
         UU1phzs+kZCBhpzi3Hof9BJl2cF27hK8d8vhCL+NUMvJJJPgPKLK7440bvC1pwzHUszo
         zz0jVbzpa15gNG1/ljbhlHX22UPUhB+X4RzvfJo+V2RT/YJ13sBcu1vzoBRYHlskWdek
         VO7xek+wLf9zQaOoB74lIRr7mJUuFBM9wTphava6TF+MCE5+nU0JB61ipWB4xmuKCRmV
         w2yCmIvRsKi0OYQAE7iZUFQiuEbjw+dLV66XzVUb03ZJxgi+UgBlpjHz1y3jEHguEI7f
         Du4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720894925; x=1721499725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Akd7PvYX49ssVnM7IV++4JO2xnx3E7OhyZAKQW51cYQ=;
        b=DWgDE6FS3GTJHyWJemTzHbBml+aIyJi2C+pj0b+nuw2BOdgPJYi8TJ4TJEyU97cQ4x
         q62sJ3ZFixhlIKxsTjhhW2TZTwJ84GTEqo2XtLs6zVd8WlkyiMTE+3F321+OyB+hPk/j
         rqbWGf3+SX/LvcD2t9L7MfE5m85mMy4sEK14PkEtyqGGGIL8QtMQRV+X1PDHNKZQSQJ6
         TP5CpJdZ6ZoJjgdzU2V0r2WWiVIGUBE5NFigXw3e7Z3ZDIkPXASDpH/twXR9AOHrdENk
         8HmXzR1I4PxaANE0CTiD6lQ6cMXRg9CGbVRlrlmgB+bPir+SOlSg74r35+r6sAMCDrvL
         +G/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDjdThcK8AWBgqLAsmrlzPk+59xo81lmd8IXcZ/dLVYYOISuVSKS2290P+6DzM0exDAZSMhwHoxkWWQYfin7MPNy3qEjfP6jMkk/ddfJmy1v4=
X-Gm-Message-State: AOJu0YwgE+aFDWYOzBgRclUNlXkvQMk5bkmx6CCjMKRJ2I7/SP096me+
	5uE5wPZ567ecRBukSNTljTh0+T0SbdRD5My5h7por/KmNJfiOqN+JhlJ21CXZzpn+j/+SVGak6n
	lwwg2ilwtSBM8XrZ8NZnJPDS+PZwcvptaFEheWQ==
X-Google-Smtp-Source: AGHT+IF7EMeFiP/0SrTpXb2U5NKFBozXUrANl7EuTHc+/YdpAaGakABMFnFuzd0mAN5AT73VZN70QaHdsJw+9r4Kllo=
X-Received: by 2002:a81:a552:0:b0:65f:dfd9:b672 with SMTP id
 00721157ae682-65fdfd9b925mr17814317b3.11.1720894924969; Sat, 13 Jul 2024
 11:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240713180607.147942-3-virag.david003@gmail.com>
In-Reply-To: <20240713180607.147942-3-virag.david003@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 13 Jul 2024 13:21:54 -0500
Message-ID: <CAPLW+4=G=U24jw+KNCibqPQUVFkOp4Rk8AtM3mnJ89+ShW+G0w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: exynos7885-jackpotlte: Correct RAM
 amount to 4GB
To: David Virag <virag.david003@gmail.com>
Cc: phone-devel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 13, 2024 at 1:08=E2=80=AFPM David Virag <virag.david003@gmail.c=
om> wrote:
>
> All known jackpotlte variants have 4GB of RAM, let's use it all.
> RAM was set to 3GB from a mistake in the vendor provided DTS file.
>
> Fixes: 06874015327b ("arm64: dts: exynos: Add initial device tree support=
 for Exynos7885 SoC")
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/=
arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> index ed2925b4715f..0d5c26a197d8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> @@ -57,7 +57,7 @@ memory@80000000 {
>                 device_type =3D "memory";
>                 reg =3D <0x0 0x80000000 0x3da00000>,
>                       <0x0 0xc0000000 0x40000000>,
> -                     <0x8 0x80000000 0x40000000>;
> +                     <0x8 0x80000000 0x80000000>;
>         };
>
>         gpio-keys {
> --
> 2.45.2
>

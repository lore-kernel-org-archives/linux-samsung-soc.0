Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8565202994
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 15:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741967988; cv=none; b=VXOLtZONUoijjTlto3izlW0mbuOQmFAm5L/AtiCsZA4qA1tnHA2xbToQQDNb9rXaMFhM2qXQDokv7qudGr7vGw6aU7WxnEwMhbWvEG4NMDotkdHHOiLBePz4I1XRPSxQAIcm9Lya2pRloY7Js4w3LEA2o+yCekzLs7fGwY5pXvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741967988; c=relaxed/simple;
	bh=qbAf7RLJv6RsTwMHx91Z6PJ5PYNVMVgiR3uOKlVTE8s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gbGN1KJSq+H5Qj2vpl7fjBd5CeIGJtkvBjYLU4OHtVUE1hpdCDlRqN9BjnPhRcxsF4n0c/NVzxIokZlFMlM7tmHTERAjzGf9AQAY3IEkin6T3KqmchXvgFAtqg/q/MjH08Ow3JorIoXqrEZ5uvxhbtFkFD0LMrVgXUBQ2XJJ4Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pbdD17BP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pbdD17BP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0618746bso15818325e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741967985; x=1742572785; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qbAf7RLJv6RsTwMHx91Z6PJ5PYNVMVgiR3uOKlVTE8s=;
        b=pbdD17BPKnXsMKsBtrq1RoP+o6fqRqO8bb5yu7ddTufgEuzYwiuIDowaw7504uNHPb
         Wfd4KSKMBcZjA7vr/GwlLg3vyrgB3DDzphXemPHz6+1Hgah13e7Eoa24wka11cjXGp2g
         f1J861OMCg/JyjPY0RSm4tWuKsS0JcSCygPtLFJ+E+FJXhV8OkgpTkeWPNyvWUnSpZk5
         2mh+CitzJ3vUXhyhaSkLtIyDlXRe073Kuug7k8HwPyQrhS0+3DnGqkI1QXtap1VlAmnz
         V7B4aM6HX6hVGIIbROJuMM1pIUQGmGEirmEQJS8vG/bQI2XEbK799RoDOi+vxKmjP1VE
         CbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741967985; x=1742572785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbAf7RLJv6RsTwMHx91Z6PJ5PYNVMVgiR3uOKlVTE8s=;
        b=nwHZcgRbIWsMhtdliA6Uj6SLzxXYvIjegO9ES0GlcCEQA+6dKwnmoX+U46fMmkQd5z
         257Wfnsvx5IWG4DgYMrdTpMlYqyDo8zVD5cr5C1TaIJP/H5AU5eo0CxLuVt/7wWY7bvz
         Y4WPZ1OWUmeERhptRCvcDEyunZy44FvRaRHQ4vanMTHryH28CPqFmgbj4whnrvDzVxDP
         2b+ga3/IZ80vZqyJggf5l1b0Mx5FdSaELdDGCIgb14QyxPZkSrI8CgguMljwbpUT9HV4
         6oKVspIlkbpLlWMfqBzWKJSjDWXn5XpTXTDrsajcwmfVI0nHiUsr1xTG2DtChl1BxF31
         GaNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoW64wjQjijD5/EeFc/7o2rUnmCrUqONyTaPuqIT1XUuIYy3h3Zid3aYZ1Ahz+xRDCX7hwRsoaTcPtUW6q7Ez/ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM8LFuP2mLbuQbaDS8tYJ54JDpkuUntuWeaYARZMlsjp1KkEtR
	mGtF+HfrWKK8eK2zRjXQGwPNOTYW0kQoV39sACF1b/cEEJ6/JRsGj9tPU4hYgKE=
X-Gm-Gg: ASbGncu13te1X6fDt11MWKogixaSu0I0oDM618bM1ozE7mWyaV+R8EOuAKfEb1vc4/g
	MPvdfNhTB2wGdl3FWl2VlshLDmGLSeH/ZMyHdQ5Q1WOGiDb2Qt/P/NLgc2/jw+7l4g+HSorkOIg
	NnTgHksQEz/vEV8Yu22ICY6HyFuAtSCiWCvRdaxXJw5u9Z8pCT3r6JYLYpi43ZejiFs020Fs7xn
	RLIDHHCI40ZNmQXBZlnhyKEj57NaqaR4NdTqGQLJXuUAdnvMDwZOZ0QZwzJO42ZNiKOOETkwSwB
	+pd0tDAFRDyUcortVdjK+BVbozGSsyG5m2y3qimqrM6g3V/Q
X-Google-Smtp-Source: AGHT+IHxwHHx6Fb/u1dWZbQ1qTy60BcLwUz4P4SvmS/UEUbzjpP8/AFJeuPq9qAxmx2U4YpAhe3Dbw==
X-Received: by 2002:a05:600c:41d3:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43d20e467c7mr27073105e9.19.1741967985037;
        Fri, 14 Mar 2025 08:59:45 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fac7asm21846905e9.28.2025.03.14.08.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:59:44 -0700 (PDT)
Message-ID: <931e5e0b07d598912712b091d99a636b796fe19f.camel@linaro.org>
Subject: Re: [PATCH 2/2] scsi: ufs: dt-bindings: exynos: add dma-coherent
 property for gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Bart
 Van Assche	 <bvanassche@acm.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, 	stable@vger.kernel.org
Date: Fri, 14 Mar 2025 15:59:43 +0000
In-Reply-To: <20250314-ufs-dma-coherent-v1-2-bdf9f9be2919@linaro.org>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
	 <20250314-ufs-dma-coherent-v1-2-bdf9f9be2919@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Pete,

On Fri, 2025-03-14 at 15:38 +0000, Peter Griffin wrote:
> dma-coherent property is required for gs101 as ufs-exynos enables
> sharability.
>=20
> Fixes: 438e23b61cd4 ("scsi: ufs: dt-bindings: exynos: Add gs101 compatibl=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 2 +=
+
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yam=
l b/Documentation/devicetree/bindings/ufs/samsung,exynos-
> ufs.yaml
> index 720879820f6616a30cae2db3d4d2d22e847666c4..5dbb7f6a8c354b82685c521e7=
0655e106f702a8d 100644
> --- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> @@ -96,6 +96,8 @@ allOf:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 6
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma-coherent: true
> +

This is allowed globally already in this file. Did you meant to make it 're=
quired'?

Cheers,
Andre'

> =C2=A0=C2=A0=C2=A0=C2=A0 else:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
>=20


Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AA83A9636
	for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240238; cv=pass; b=A1q1k8mzkJP7Wi8xP7otk6eXNKSWyCeFOJrp77Rol/6Mehm1wmxQHnMPMR3JvH8MpCtAz5UM4PEGHp1Y8kcmIwkn/loXfRMoe3BYLvqqw9sTaRJinr14THhKatI0EU6ocbVOzlugVkCBGE5PGZWXv+FehBWQWTg02Ha5iWX1Cbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240238; c=relaxed/simple;
	bh=nC1HlSANXwPCu0TdcZsZ/ITYqsAJked312qQsvhydMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wsmq5drOvW8pMYo2USSCDSViJl8EQzM3g6hf6iE2oIJE7yIthSn9TLniNpNvT8HDMoJ7uCL77H6q3ciyb6wobOwhmkfvK1vRveInJxAJB2LsFqsLJ0vi2QH73l0vdHp4CtNegZT9YOFGzyXMh9as2GEoe7X3GV2RLpQtYEEVdPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UM3eExt7; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UM3eExt7"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99easo9279797b3.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 12:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240234; cv=none;
        d=google.com; s=arc-20260327;
        b=nmySS4P9a0KbJ52GPICpoKL3LQkuZvh2/tojGztljWn272nwgyU25oFwXoZuXZ+QXW
         DDa9U6zPZ4nIv3FxN1qYVSwBLpc6+01Cy6Bw6h5e3pgnhM6ehE6KNGyl08s+somKV5Iw
         YeOUhVtkKrIHvy60EcO1+0xUX+OLHxYRFtCyiTYtGys5kJ2l1mc04saDWHvb/FO2jj2A
         sTFd/nbDrS5RjKZ/Zoc3RQLpFehhg5aYMrIgNqc7FVNez35YJFixs8DZT/4jiobI8STP
         FRP6DPSR8IC6CHvHiAv4pyK4Ka2wnMM3Dpt/aD8C08Y0bFAfC7iCcguCZ613OoZzRDJY
         XRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        fh=GNXq2bphdeeL7glwtBsGdBJ4WZDsEUFehYTy11IasQc=;
        b=JidWK9bvy0dKJGiJn1kPtS+mCGRV3Y7APzP4g+bpBhyi7+ajr4Njn7DoeqaA055ti3
         G+NLMwhDSrU22RTP++pRrX3nfVuOMkW8SGG15cfXsLS2OrH7aI34syKlegELykpjqxDd
         HTy9Md5VP8kjSZWqFtkNk+dTyCUXoaZKBixu2odlG0nihIGMVPWbZKc4J5AZsgk9F8UU
         D8ljTfYLi7YCp9UqFSOdHSd3kOw/4m9xAyzlKjdjPqYT7ve3kPh8e3WLTSd6VXfL/fB3
         L/w3CzafULEuRuzE2HwVgJ9yM83QmPl58+Yty/Gf0dcUpAtn0DXMz7g+VVzMZxrilYQo
         BeFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240234; x=1789845034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=UM3eExt7dIEMPJGPVysCGiZoJvVhl544RBXMSKbBfawBd4i4ZIIrytcZCFRMvLVM3d
         5eiLXNBDNhGUMAKnG6+WP65Yk3S5t/+rAwzH/7NjWzps65qzaYK5evMfM2Ot0BwfJKKV
         Ur9kMpPKFdo6S1W2rH2aAcvBKX0zTWg5fXJq+vpV0d9RLgrOa+S+PC9HyUoFTSQCjtFd
         JD4zSgPlW2NuoroUQpoOJwihbV7zD0Cg/GWE0WN2p7DYdnNKSzI3g+aNV8qr42Zoe0Gk
         JFif1loFi4gJt8pMKaQWUrcfxAo0tHc55cAf0+3XSSY9XfGaK7lJQrhx3Hx1KnuPFD73
         RZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240234; x=1789845034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=alxEGAc1klQFbEaaGOgPZBvcN2AaID+bLBzZQGjh61HJU+7D6BdzGQ+HJQz4N9sEdV
         pafZWWi4W2gKqcgIa3gRx5Zpi//u0Q/26rId9CDl01ejiecoKDUXY/4A0XZac+PJOsWW
         IWPVPAv7L7Uu7naw1/WyW3VyLinXAOVHQXz3DnWKGolTLn0fCZC1E/Kzsjs9X3BBZHsW
         HkBFylBndWHV2v/vLiyjMs61J1M50VUKZmZmCkUh84C7pSAQGlLRJ4lk90f6UAEIj8Q1
         FBTHyJ7MMbovEtfNtLsd2+1CaYNWQSpcQk6f+UtUQ3yWdvZyzlhV5TYE6+7rl7OdoIeM
         +V0A==
X-Forwarded-Encrypted: i=1; AKwUvBzKU75w3xvpel2tjfvk2dMJQ9+OIFxHxCkXFET4QWVzK3s876E9zz4uXD7bZ0dc+tuX3i0fkzkMpwyqavHOITpZsA==@vger.kernel.org
X-Gm-Message-State: AFuF++nysjUPBYmotN2velzHZar4ffzEozFGIMbiSuYZrIesAna/Z662
	jkfS545/hVqAnXVI8fjbeX4R7/4LZO62apOIW/4xoRPCtnqCGTaUXdVUIplnYRqFX0/CtIAcm8M
	S6u14k2oCQxLC8TIKd1AYqDH0f0OVekk=
X-Gm-Gg: AYBFou2nbfxeqyAwfBa8ZIDKhH6KraoMURdsQmcgo0KJZuBinPOnqozriEvTj1UPjMQ
	gMsjIhcM4E24UtmOuTulEczhdbNdIv5vuyMyVAZ8OkvfxzVH0BGbppyVOrdpbqUv8uQ1yCLs3we
	zufWz+c55rAJI5kaUYHGpmS5fdKi1JVyqikcJ1ibMIch350rZSN9YWaD8Vz6yY0XSAL3vWq6oz9
	gxXTqvUdupq3CazHlNWdz1LCnY3MM9QggCkCWTP3adQMY2OwHef9kwh7suo4iLFZGhgfY0+NHyE
	HTrxEk38FKD9YQaaeDi83vECoZdZzhTep28S2A3gUxJGHEjfKDW+
X-Received: by 2002:a05:690c:9a91:b0:873:5bd1:98b5 with SMTP id
 00721157ae682-884b200e9d9mr29464677b3.39.1789240234520; Sat, 12 Sep 2026
 12:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-6-sumeet4linux@gmail.com>
 <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
In-Reply-To: <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:40:23 +0530
X-Gm-Features: AcwNN1WFgZ6qmRCXqz0Ywv_tzPCCXsJ0jqSiA_xFTFPzs4rsV6HyVJPe6GfuozM
Message-ID: <CAJ9orWRgatqn5gLx5+eDu7-T4s2PWcoVQPvuyMBgEp-KwDwkfQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] power: Use %pe to print error pointers symbolically
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org, 
	thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org, 
	sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com, 
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/09/2026 08:17, Sumeet Pawnikar wrote:
> >       }
> > diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supp=
ly/cw2015_battery.c
> > index 1bcb60cf763d..48643f7bf503 100644
> > --- a/drivers/power/supply/cw2015_battery.c
> > +++ b/drivers/power/supply/cw2015_battery.c
> > @@ -658,8 +658,8 @@ static int cw_bat_probe(struct i2c_client *client)
> >
> >       cw_bat->regmap =3D devm_regmap_init_i2c(client, &cw2015_regmap_co=
nfig);
> >       if (IS_ERR(cw_bat->regmap)) {
> > -             dev_err(cw_bat->dev, "Failed to allocate regmap: %ld\n",
> > -                     PTR_ERR(cw_bat->regmap));
> > +             dev_err(cw_bat->dev, "Failed to allocate regmap: %pe\n",
> > +                     cw_bat->regmap);
> >               return PTR_ERR(cw_bat->regmap);
>
> return dev_err_probe
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

As of now reverting the change for dev_err under *_porbe() function
and planning to post V2 for this original series to use %pe for review.

Thanks,
Sumeet.

> Best regards,
> Krzysztof

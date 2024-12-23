Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D5932C85
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734967924; cv=none; b=k0NVuGB97EbT+ZErtivBLppY+NJJUqM5FU5fdPqBTOhinw1UnTGfXBKjAdJFaU89UjUbWwT79jG+qA9BBZe/i018MMvvRyltKKvB5B1SsQibfYAxJOTf7ANgA1s6xyGpBcQ4FsPht3o/g5kXlIAVm2AjRAt39bQqmMaHveAyVeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734967924; c=relaxed/simple;
	bh=Fpb65OEeZ6TamvLcRuiv694nWon/qJBWUIsG3/yJUzQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QCtH/ob4fSEUrXjIBperhggHopdgl00qNWQYCZkMOulIf+kbM4hWZECTeAxNt6KBBcs8FTyjJIhvx0gfMpoaB5SwsI/NJx+hOR66690jlpYbdXukKEEO4FJfANNj6qwA2pjCOEUtErsZANxFkKNZsb+KV9HgnHrJdEkZ1jGHFI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zN3DJmJX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zN3DJmJX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436341f575fso46252225e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 07:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734967921; x=1735572721; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+MUwOgRUnhXT5bm369Orj5PQynMd7SVyypJ/rGIX8VU=;
        b=zN3DJmJXnpr9Qxquj/zcV/awlF+rvmb3gd5x7aJRFKd84bjt7Bkorj11Y1+x3ZxHcn
         XHdHohADToH9ut8DHs56n6/wV1OETPtPtB52N+jJMo0twXGNI41ZIB2Cc5iXRdOUu2Zg
         XlMiFHlsMisUOGejCiljoxp1r508zLgqGv6ezlsdh0zoeaAEE0mQKT5l6VqJpVfTXzb7
         ausSaRlkGDrw1EQY+pcLxDdK/iSo/76/ycc/vZQdnrBkDYsplFO3mtyqojolV6AFLMCO
         sLBZcv09ZI7UkcEAz2SdqgHAzs2kjjjokjqNTsLQImap7sNo7dedctgbdMCqQy26tUV1
         qeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734967921; x=1735572721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+MUwOgRUnhXT5bm369Orj5PQynMd7SVyypJ/rGIX8VU=;
        b=tvQGsCDhssy3lNG50LwnlU4TK5PFB0OOEwJoPR4GWHplmDQ0UNgb2/OkocG63La83p
         aNc4OMj+gmC6vBSVkA5mUee0iANJKuZUeC3W27hFuyspM8uXTKczSwSWQzrYJCk3bHPH
         cNwjGjg0Rrb/wXMnPZ8/Cx6ZGIUwqdCvtYP983waA/VuVttm18GiFuyqpS42/ChGCjKt
         asg0fL4jBiZHiFiEIUx0Gr+UOL6Uhy231mGBiPs4j3IadYd1X8+GANOVZYRYXQM4fwds
         M83KpbQ5rT0BnbBk9+Cu7tzVMjhKPUrLPuPKjmRn27D5laDvNRGnaeLZXf4mjhodb0xX
         V2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCX1RuNNAtgs1x8FqLT4hnU68c2W+hQKmlJteYOFgJf0gg9RZmMZEUhbxCPgvDbrsB4rrrOAwSa7iaVR/+TkO65eow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw837yTwKxsNlVfT9zoruKYJ0XKWZUNRdtxxV7sVAZXjCStMBXz
	hXPF11g6t15xGLyFMakDZvGa8oHHohF6dVoG5Equ5xqyxRDlW34Lg9XY+C5mL9M=
X-Gm-Gg: ASbGnctQ/TlWbV6aRjvIwlpYRXXdqwjeuQgWm+DmQWHwmExWeTue3qrQs3oDR7g9XeG
	o0rfFpFhvMef9EfhFNPE3jsULKM9jyLhr8PkynOlcyB1b7jPMqz8SBeWE8meHf6vtWV+yY9zyzC
	8jXKcixk8uSkZYGc8DmFA1yAonYCgR0lC5qJGi7lUFnF0yXHoNranOCkb/xBJu4a6HYg7GM0XCQ
	QSvr59k4Ib33S3IDQHGQtiUzoQ0QSzmkywmnfpoyfVkbKzn4fDNXJJ4OSX52Q==
X-Google-Smtp-Source: AGHT+IE2PUKcy1CT4BX1kJYJ+FDVyKDT8Nzp8yzBmGcj8sTdsMxOqequomdtYBNo7dbt4pR218lSTQ==
X-Received: by 2002:a05:600c:5246:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-4366854c073mr112846465e9.11.1734967921077;
        Mon, 23 Dec 2024 07:32:01 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612008b1sm138466205e9.15.2024.12.23.07.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 07:32:00 -0800 (PST)
Message-ID: <9507951f9ce4ee9d8c553d8964f00ef217f8ed1d.camel@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: google: add gs101-raven and
 generic gs101-pixel
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Mon, 23 Dec 2024 15:31:59 +0000
In-Reply-To: <d960e22e-01ad-406d-9616-d45edbef0232@kernel.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
	 <20241220-gs101-simplefb-v2-1-c10a8f9e490b@linaro.org>
	 <d0c1511f-b052-4690-aefb-3fb41e1e5875@kernel.org>
	 <cfdc5b1b03140e3d2ce3fb58e8b342dc2ac06d04.camel@linaro.org>
	 <d960e22e-01ad-406d-9616-d45edbef0232@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-12-23 at 15:14 +0100, Krzysztof Kozlowski wrote:
> On 23/12/2024 08:45, Andr=C3=A9 Draszik wrote:
> > Hi Krzysztof,
> >=20
> > On Sun, 2024-12-22 at 12:38 +0100, Krzysztof Kozlowski wrote:
> > > On 20/12/2024 12:27, Andr=C3=A9 Draszik wrote:
> > > > Raven is Google's code name for Pixel 6 Pro. Since there are
> > > > differences compared to Pixel 6 (Oriole), we need to add a separate
> > > > compatible for it.
> > > >=20
> > > > We also want to support a generic DT, which can work on any type of
> > >=20
> > > There are no such generic DT devices upstream, so we cannot add bindi=
ngs
> > > for them.
> >=20
> > Do you have a better suggestion for the wording?
> > How about 'gs101-based Pixel base board'?
>=20
> It's not exactly about the wording but the concept. We don't have
> generic devices, thus no generic DT (DTS). Period. Thus you cannot have
> such schema.

There is a Pixel base board, with different additions to it, e.g.
different displays. The boot loader can pick the right one.

Let's discuss that in the other thread to have things in one place :-)
>=20

> > > > gs101-based Pixel device, e.g. Pixel 6, or Pixel 6 Pro, or Pixel 6a=
 (as
> > > > a future addition). Such a DT will have certain nodes disabled / no=
t
> > > > added. To facilitate such a generic gs101-based Pixel device, also =
add
> > > > a more generic gs101-pixel compatible. We can not just use the exis=
ting
> > > > google,gs101 for that, as it refers to the SoC, not a board.
> > > >=20
> > > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > > ---
> > > > =C2=A0Documentation/devicetree/bindings/arm/google.yaml | 18 ++++++=
++++++++----
> > > > =C2=A01 file changed, 14 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Do=
cumentation/devicetree/bindings/arm/google.yaml
> > > > index e20b5c9b16bc..a8faf2256242 100644
> > > > --- a/Documentation/devicetree/bindings/arm/google.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/google.yaml
> > > > @@ -34,11 +34,21 @@ properties:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 const: '/'
> > > > =C2=A0=C2=A0 compatible:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google Pixel 6 / Ori=
ole
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google GS101 Pixel d=
evices, as generic Pixel, or Pixel 6
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Oriole), o=
r 6 Pro (Raven)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 2
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 3
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - google,gs101-oriole
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: go=
ogle,gs101
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - google,gs101-oriole
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - google,gs101-raven
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - google,gs101-pixel
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - google,gs101
> > >=20
> > > SoC cannot be a board in the same time.
> >=20
> > Can you please expand? google,gs101 is the SoC, the other ones are boar=
ds.
> > Is the commit message unclear?
>=20
> You now say that these are valid boards:
>=20
> compatible =3D "google,gs101", "google,gs101";

Sorry, I don't see how (apart from the fact that dtbs_check flags
non-unique elements anyway). The result of the patch is:

        minItems: 2
        maxItems: 3
        items:
          enum:
            - google,gs101-oriole
            - google,gs101-raven
            - google,gs101-pixel
            - google,gs101
        allOf:
          - contains:
              const: google,gs101-pixel
          - contains:
              const: google,gs101

So one can not have 'google,gs101' twice. And if I only add
    compatible =3D "google,gs101", "google,gs101";
to the .dts, then dtbs_check complains indeed.

> (although compatibles
>=20
> compatible =3D "google,gs101", "google,gs101-pixel";

OK, the schema doesn't flag incorrect ordering indeed.

> Both are wrong. SoC should not be before the board and SoC cannot be
> used alone. Your schema allows that and that's not good.
>=20
> I did not get what you want to achieve here, so tricky to advice.

The intention is to enforce either of the following three:

    compatible =3D "google,gs101-raven", "google,gs101-pixel", "google,gs10=
1";
    compatible =3D "google,gs101-oriole", "google,gs101-pixel", "google,gs1=
01";
    compatible =3D "google,gs101-pixel", "google,gs101";

I think this works (but I was aiming for something shorter,
possibly involving minItems):

  compatible:
    oneOf:
      - description: Google GS101 Pixel base board
        items:
          - const: google,gs101-pixel
          - const: google,gs101

      - description: Google GS101 Pixel 6 (Oriole), or 6 Pro (Raven)
        items:
          - enum:
              - google,gs101-oriole
              - google,gs101-raven
          - const: google,gs101-pixel
          - const: google,gs101


Cheers,
Andre'


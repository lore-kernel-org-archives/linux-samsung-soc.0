Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225371624E5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jun 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632903; cv=none; b=YA7Q8OXyW3l2H3/lkc0qsuu8zgwCjr88cE4UasMQ4IjfWn9FgdBFj8OGHBjmkr9LGXnD6fz/hBNmOxw6rITtUgY06MfsJ5uEiZInD44GVqxn96oK9FNnHOQZHv9hCVGewJFJJGffCbYHQV3VTjQSO9FotpY2H4hSI4hRqudVQPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632903; c=relaxed/simple;
	bh=XI9MRgqXRnhIDDskprAJ7Lp7MjrJKOdvMtsvO4mRxYc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bqxWe+5J1hNDxJ0/trBphJaMPBKVsVQqkHBq7yw+0kY7UT29tNQhpg0JqZOCjcmiSMvDV+jvQ9akiogHpJnOZxkXQR0RactALmast8RMmKOldO72qAodReEFi1B8KU5jkWbcIUpylTpyV6/O6oqDo0BXyO0z2FsOFeQkU0z2v3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=volHhDyH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="volHhDyH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442ea341570so42250355e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jun 2025 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749632899; x=1750237699; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XI9MRgqXRnhIDDskprAJ7Lp7MjrJKOdvMtsvO4mRxYc=;
        b=volHhDyH09v3nDkjEPsHoS4m7mTkTHd8/bUsINK0T0c5j5qXLpe4xTZanBXhOBaINA
         JWg/megBqwymRpHiUmDyrdxbiEJFk3DlhZY711SPmcZPq1LXTim+IHquIzB7OZy/NI2Q
         K88Bn0OUTKPi0oMl2Vuj2/iN3ZCQX3NQJjJfDpleWKRKS3Yk7DpzjQX1xQ/FtNlgqhSk
         qQCo24+CfG/rdWdLG+b/3hqmmYlFx1DN86onnyXmH/JjTDsaSXMkVrdhPpefUG8hP8Xb
         eRl+SYrv2zJOqFX4ns8VGxip2+iu81jLlQIo13qFt4uT/R+ECASuObjup48vD0FJ6nrW
         IhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632899; x=1750237699;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XI9MRgqXRnhIDDskprAJ7Lp7MjrJKOdvMtsvO4mRxYc=;
        b=xVEbeiy17UVa7ClvT2FstjaN64p3MkpHlL+7NFbYoQzAfwLccHOsBmPV7ecI1SCjRp
         OtU5/aXMP0waeq2gR7TMossMJeSx3Bc1GrO49dlLHLORsV+ayOnt/k+YnZTFwkRwNHyU
         8i5c2uOBVA0ixYH43OKbtEuNkZpmw3vV5Gw3i3CoieJmw+xYjJHD7KHGoiYSQCRvdRAZ
         1Kck+wch5jVbTo5mdl4v0J1Ad9fHG2pMuKB0mQVeTae7vWW+2ENdvTZlFQON+2olezqv
         IwOCfdbXqyBhqnZ9PFZ7bEwd2Aft0ceFLu0R0JXFLHqMemvwGUFPizRCIqPN9QYtbXKu
         SJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEC8WR6MuHWtGS+HDEfTT33haf9nkOKCyZqX+aCj5iP/aXSF5vyys3sb4ZPD06REtCkVvmv86hPRIvenw20MAd2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGjtTN0tK5YWzlgzBZY9u6h3wFGDtObt2rYfZdSiLeel1fEuTJ
	ihWwEUD2J3g+Yi34IVVkvH+vzeMP8g1BUCZ7lfs06+sqKC4O91ip24GaPt+UXe/oYrc=
X-Gm-Gg: ASbGnctYjU282rBz8PlTUc2+HtDL8pEfLFY8RJTsFA4GQz9pDrb4+XXJPmhO+0t634c
	DYOqISxwGi9FrJj9NOwb45Ka2zi6QouSvgSfnYqH+fjOAbD3t8AlXLTb/4kQZf/A0vm2zzJwq/P
	y6RUVZZ3nesCELHS1TULMu0IlJZdaXISdllA/EerFykeUYr+qiXgfoa0RRm3BK6YxxLAOaYbOfY
	v21xBWht1Ic8gh9S63WhRfqaqkLpkEarteKU+La7vlmELngM4KNzz11GpaSDvEy+cSv1qDnmO/w
	FN04Cy8QucrktkvDcF0E8vbKLoYr/5qIr3ffjuzlbImuZLzDCCHqNJWWDgge6n5Qxw==
X-Google-Smtp-Source: AGHT+IEMk6D24rAbr4EjAYiW9bu//xAst28BwxOZGS7RIT+PIp1VlXvEeVos4jHxD+q9aHTVPlGzRA==
X-Received: by 2002:a05:600c:4e4f:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-45324f421c8mr17677035e9.24.1749632899307;
        Wed, 11 Jun 2025 02:08:19 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244e0e3sm14903832f8f.68.2025.06.11.02.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:08:16 -0700 (PDT)
Message-ID: <013f55a0adf0b23e0836e33ee4ea0e1e7864a467.camel@linaro.org>
Subject: Re: [PATCH v2 01/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Peter
 Griffin <peter.griffin@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 11 Jun 2025 10:08:14 +0100
In-Reply-To: <20250611-robust-vehement-dog-2bf6ac@kuoka>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
	 <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>
	 <20250611-robust-vehement-dog-2bf6ac@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Wed, 2025-06-11 at 11:04 +0200, Krzysztof Kozlowski wrote:
> On Fri, Jun 06, 2025 at 04:02:57PM GMT, Andr=C3=A9 Draszik wrote:
> > Using lowercase for the buck and ldo nodenames is preferred, as
> > evidenced e.g. in [1].
> >=20
> > Convert the example here to lowercase before we add any bindings
> > describing the s2mpg1x regulators that will enforce the spelling.
> >=20
> > Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5=
bcbf@krzk-bin/=C2=A0[1]
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.=
yaml | 4 ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> So this is also a dependency for the rest of the patches?

My thinking was that it makes sense to have it in context with
the other patches, but it indeed could go stand-alone if that's the
preference.

Cheers,
Andre'

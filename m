Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BE335BDB7
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791620; cv=none; b=eEsdzwEnqHgP7pUTu9IeKneaSX4SejzsTIvq+QAFrcUY59jw1kswKWNQZKBnkUbmSyu5O+zLexGaVAW3d+1wGQ9YCUIfJsvGFxraw3Qvlo/birCAHamBHoC6VVwNU7PCaAKiGq8XLL7DFn5AhIim/xWAXxPMltit9nGMzRfSF1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791620; c=relaxed/simple;
	bh=gEDlrhwnbLHEqntSSkEsQEo7gWXaJKYcg2RkMc37BfE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t6GBLZQmbcIRNlYAv9udjfcpzNBlUWAlEROpmMHByEB1IQKDOQw+UAQ7iraEt/W3q354JivOihIfbWu7IsYUc0vAoO2/bqY1BJdIV8FZZyi017j1w++7bTgw2kl582Ey6aNGmeDMlXxKJrWHLKnZQ568AZv9OVnRH/O6+D3OHiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HL4FI8Jf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HL4FI8Jf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483bd7354efso118492425e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772791617; x=1773396417; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gEDlrhwnbLHEqntSSkEsQEo7gWXaJKYcg2RkMc37BfE=;
        b=HL4FI8Jfk7jr5aKtIyJG4muLLEqLp8oio8ZHdAYDQORAEkQGfmWBK0sk/oj06dlDyD
         FFi3ZVi+cTQu8n+32z72pgC5FqI30npYQvefJ9eyKpIMaXQR0dgizZDtw2uWmvTcwStO
         +hm0QmsHHFFGvjpKGEDl0K8dmU7SlzMIkJoP0r0/DmQr7MrJ/Ysd8xwAjGxGvZJcKLiT
         oI9TXtphw+eLeFKb30H5p/jp0f9tevtLEizCwQZbGVV5YQBRTaP04WdPnWe3K3JbBbFO
         xbFmNfetjRIuJj2IPZIl7S0LosHru3i0gwnFYJAs8rMUV3ZZUFrRHCYVzVNatWc9FjUC
         RsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791617; x=1773396417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gEDlrhwnbLHEqntSSkEsQEo7gWXaJKYcg2RkMc37BfE=;
        b=XMi07Cl5KYKM89Iy1TbftneLIGOJDKEySYO6jKWbccIrk9TYL+/2cfy/feMPunMc3T
         7EyzGFC5bTyE3cRakgKU5FVBWrk7Zun81IAkxkxfUzFDVEWTBcDyOsBwu7iFOhDsknQu
         JvS75HZMhHfNQz7Dy/2qSkhV23zfCp3qu0yoelB+s5Dg4HZjqiMm7nhhF/vqfm9Ose8G
         7AM95bVFUrG0aD+5/pejJOHnI1U77YuH7Y2s35qLCz1KPJL0StGWZog+tIHIii+YpRtq
         zGDiqX039HXEkH2Zuv8G9GCIRBigKvSsgLFbpH0xKXIXY5/vdF6IWmWDe1GMjl/erZhH
         ujrA==
X-Forwarded-Encrypted: i=1; AJvYcCVNjgnK6cYs3EanjL43rsxPx9iN298Oqz07onHv/Xl/hyVZSHWLWjCZXBYBfrybMnZZ/23+pNjrGOdHbXqnFkHQMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhp6QobsMHXAkrKnj9/EOnlmQFRmFOPWQYrlnjh2+Tin+/MEAs
	Y7XF1cggkc3duztv5ignk4Uo6c22DYTJ83lIENiTpMDn6JAUyiOT8lIrQCh/9f+QTPo=
X-Gm-Gg: ATEYQzy+VvY5yCSNU0TeD5Q0hbwAp8VAOPbZ7QCIWP4h0d7Ml2IHBK0Khcyi65LzeyP
	gCjdY4FqTC5DizJms/ArQALxQWzn13Sc9drnmK8Wglp/9xptbWFUa6QLsx9gm4NIKIxRiDKfcU2
	wXL+129AGsIlJG0EXLsjjA9vJ1h9KYruMenvelXtDkQJAebH9RXXu/ZKrqJq6POGZAqcNYwy06V
	Rn+d/FKAcbBMmqdYF/V9gFzT5Zja/DSuCP3Z0AsIEosmUgPhc5/y8OG6ca60g/+QTNNKUMzn8N9
	dkoeosyWROZcfTokWisM04GKY+yH1dLOXodwO2VMgrwgaIYJbrUbKA18A5sTie/jVPnhTgQswCk
	626ak5W54I1FH/GicXPayyfjkoPmpH4/tqVglDOXSSKI3I93u7qAA35hYdOEbBxUHXubRA6aKyK
	IMoae/1ErHqTlcHDUkF7LcO4nOenlR
X-Received: by 2002:a05:600c:1986:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-4852695b649mr24350965e9.17.1772791617341;
        Fri, 06 Mar 2026 02:06:57 -0800 (PST)
Received: from draszik.lan ([212.129.78.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852378ea07sm15919135e9.0.2026.03.06.02.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:06:56 -0800 (PST)
Message-ID: <a03bd4a3c457cd3ade735b087fadedd1920c842b.camel@linaro.org>
Subject: Re: [PATCH v6 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, Will McVicker	 <willmcvicker@google.com>,
 kernel-team@android.com, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org, Marek Szyprowski
 <m.szyprowski@samsung.com>
Date: Fri, 06 Mar 2026 10:08:18 +0000
In-Reply-To: <20260306-hopeful-amusing-sawfly-e60c6d@quoll>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
	 <20260305-gs101-pd-v6-4-8cb953c1a723@linaro.org>
	 <20260306-hopeful-amusing-sawfly-e60c6d@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-03-06 at 08:36 +0100, Krzysztof Kozlowski wrote:
> On Thu, Mar 05, 2026 at 06:11:53AM +0000, Andr=C3=A9 Draszik wrote:
> > The power domains are a property of / implemented in the PMU. As such,
> > they should be modelled as child nodes of the PMU.
> >=20
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>=20
> It is impossible to test a binding in a meaning of "tests", thus you
> should not add Marek's tags to bindings patches.

Apologies, I think it was due to b4 applying to the series and this one
slipped by me. Will remove.

>=20
> > +patternProperties:
> > +=C2=A0 "^power-domain@[0-9a-f]+$":
> > +=C2=A0=C2=A0=C2=A0 type: object
> > +=C2=A0=C2=A0=C2=A0 description: Child node describing one power domain=
 within the PMU
> > +
> > +=C2=A0=C2=A0=C2=A0 additionalProperties: true
> > +
> > +=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: google,gs101-pd
> > +
> > =C2=A0required:
> > =C2=A0=C2=A0 - compatible
> > =C2=A0=C2=A0 - reg
> > +=C2=A0 - '#address-cells'
> > +=C2=A0 - '#size-cells'
>=20
> I don't see improvements about quotes.

Odd, I'm sure I fixed them at some point. Let me respin this.

Thanks,
Andre'

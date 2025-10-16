Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B0239E7E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 05:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760593485; cv=none; b=jrZSS/4CidR7wSNwfR0r/Q4LuOxPsjsx1QwBiD3CZRZgRiaDVS5VjyJE0pFVhGnKMNG810gV6asQs37j4CnuHkmNVJXWB7MzX5hn9IbSNNlWUfGCg63JTcf/g6rWJGl17M/aclnbg2ImsaigzT6m/DtW214bHZx9emwF644rEaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760593485; c=relaxed/simple;
	bh=p9TBkTZ5r+V3Vqzg3Erf9DxM3Aqb0ebyWyF6uv/8DBk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MeSLz6I2xe3TU4KexdxapcPjEsTK21InA+qac1y2zCmKueaxNON3s9orv4KjpN2oMFBPwSvThBQMxGe1ooQMaIWOCen9tBogFW4cHujUGMpc96b20WgbXSkQqlgAuy5K2JDPT3HIooHvm1lLfn9/xdLhyHJPDUAj372NCPd6/2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lZrCmrZv; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZrCmrZv"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so616236a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Oct 2025 22:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760593482; x=1761198282; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p9TBkTZ5r+V3Vqzg3Erf9DxM3Aqb0ebyWyF6uv/8DBk=;
        b=lZrCmrZvNfSUQPPoKBfDSDSm6QKmirBXZlL0AmcrljEtiLekyKw7MB0fhCclDrkobV
         /HgV4JM4VFTKiDq2mC2AqT6MiRxk1C8npSBVUE3DHxpRX/5g5quqPPxxWSUMU2KmL/Lm
         dPO0m0R4s946uOZog5gTUCeKS2KdIYh+JzJhhdS5lXd1vnKM0fVanRlDGBWMrKoXSjd2
         kX4c829jhQX0IXoGNWD4sugQS5BtJbgDhJYXVC2/NYA52vTUo+lN3HShwHXi75fj3Fu3
         ZFMlaNKd3uquDsKX5VHU2jGrZyX4h1b2Kg+cz3snwdLz+0qkzZIEQtjzJjcShTZWG+QB
         K6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760593482; x=1761198282;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9TBkTZ5r+V3Vqzg3Erf9DxM3Aqb0ebyWyF6uv/8DBk=;
        b=IcpOa9Gc7SHnAuCuYBa0G09GYjOXsAdEPmBD1zN8twX7imnOEHXnlvIWTd52jq7gKc
         upJnfhXGDgMC6/DDad3MmMGnkgF2aEKbAtPqjcOdqn9pdjT2hiyhcYQZSlHMGO52C8cl
         rNcAQ4TrvccpJCvLCjQIXyfFMvK6VcY0vlY/G+WcT91tPuaPnlHTVT/gjlO/QYLqhSYW
         0KDNd3Em1IPUxXVK0MggCV3wGGQAL99zFF363Umr2bouq4MZhNy2LVRLKK2/8er03NVL
         n4aOchh6IO9+9qKdwSFr1A5vakOIkZNLFMnGD78N2PhQz/0wQ8cmg8JejvEUINmgKpq/
         v7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPu7MeOqMa9z2abhML/yxC796Y5+S2YmPlw685sS1Aa8cevWlpES0VJFNxkXzfDMGsJowMoXxQLZcSNRzjbF3cXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu0v+AvvSVIK5DvFzowQDjYfMNERyvB6PkRS9vofEKi6d9cckm
	KBccWMbhDZ9k9m9QXD7EC2cFXwaI+X7o+J2D2NMAXOGRAvZ3eWBWStiMFA1uhGeBdJM=
X-Gm-Gg: ASbGncsB6kfrTLjQeuOKOJzeAvUv9ydSX2XcqFygt556JGnGWvP59rNOxF0O8Gm7fE8
	tCQVCbvXGQZKsOdqXkalX7m0L5VVfcRxo/MqSsbiDTa+PTjDO88sE9RPQBFbRpcVrcEhLP2w4KI
	UaNCGXOpCDFHAwEPZ3s+ChAqIpqRMZN6+SL0yincwDrDSHWFQpeC9YusrQ5QcwvTprJ/nw/HSMc
	Q3bnOV5seiQdCtdllasRcxuzuxXadOQm4otKmjaKGa49zfvokzcQbq0wLQ2YXkN6w3bmWNN2sSc
	4e//FtirFrXQnRiTfF6u5hOxt+11baikUQd3k3r7VYCtrRnzkbqN85dqQHKsy2yRwYldiVcP82n
	SzBle31bZP+p4Bo2BS4uPjfRcoVORWWeihswMXvHCW8jDxhdInftD+kPBbWpqEgl3mKONt5QrNR
	m5oNnDlIFLUYAvxlG1MA==
X-Google-Smtp-Source: AGHT+IGTAzXneDlTJJthrwyFh1A2mpMs+brYmC8fjkaobeSG7qIGMGjBpTwlt/OHwTYQt+NY+Zh2QA==
X-Received: by 2002:a05:6402:d0e:b0:634:5381:530b with SMTP id 4fb4d7f45d1cf-639d5b8956cmr28820056a12.13.1760593481782;
        Wed, 15 Oct 2025 22:44:41 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c133412sm15055961a12.32.2025.10.15.22.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:44:41 -0700 (PDT)
Message-ID: <a8dc26e96c6ea0bbb2b9f02ddf3360cf0fad8331.camel@linaro.org>
Subject: Re: [PATCH 1/9] dt-bindings: soc: samsung: exynos-sysreg: add gs101
 hsi0 and misc compatibles
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 06:44:39 +0100
In-Reply-To: <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-10-13 at 21:51 +0100, Peter Griffin wrote:
> Add dedicated compatibles for gs101 hsi0 and misc sysreg controllers to t=
he
> documentation.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0.../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++++
> =C2=A01 file changed, 4 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

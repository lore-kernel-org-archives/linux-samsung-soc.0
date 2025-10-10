Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7302F7465
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 14:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105820; cv=none; b=EXXU50cZOL20Tu+i1idSQB63mjKah7IB4zTMHabnpgE58EhRoxa1icK532r1uqKMRUtM/lOncQmRgOgfRl3plGBSEk94Nyi6NuqshffBRhU5jeGoBQ+uVvTRQCk63VIX4x+lQwRTM3+X4fGbA7N39K43S2XTbismGmC2Bmp8UIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105820; c=relaxed/simple;
	bh=qAfkS0FALkninDpobPdDXMtt67Z25RcuAR5Qg6PQot4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ALH6oTW15MBHACNNHvjmnpiUQAcQPEpL9DdYlR3HRMaDxRkD+tN18a8hFEB0OdXGCMB1zBR7QK1BHx02us6EEgYqlj/2Xr16dMBulHZOUpPbvpSe07IdG8TheRLPeHZPqZ4cvACMNQSD2o49/VnshagtwgVSvFyHpth+rjz+C1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AD9QMaiM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AD9QMaiM"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso347213466b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760105816; x=1760710616; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9ETTSmzMEMLXYvaO7iiXW2H9dZ8Hr5VPzXraeMoXOYA=;
        b=AD9QMaiMR2R8edJNlxM5EiPgUp01Z+D755TSj9KpQxVuD9640FQX9bsaLo7sqobeuu
         vuJRu+11YdJVJhXfI99dYwyKq0KFQa+uavwKfARP79LiyRO4aroQMWT9XrLTSPIg9+Ev
         FN8jZZhyfZkDJWOogq2lpLsKlgGGwcVQsQyjVyfXYK0u0hd/bIFKN5ixzLWWLboU5/PY
         WRd3Lx9mbKLPdMpkNKlWH2Gl7cC2nIJelAffmIktbTQfB0I7IEGmT+v3v6x7VCnNiS9s
         nbQXgrvD96F3TQqi5HY5z2scs2EI4lzVNRzi26rOZAGC2cDfZy02KaIOxWGN6sq9H1Z2
         chVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760105816; x=1760710616;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ETTSmzMEMLXYvaO7iiXW2H9dZ8Hr5VPzXraeMoXOYA=;
        b=ILEJT3jMOmLk+CRm+O9YfHdnQihyqOVWPCAZNLfqkoPjeDwYoq5gNDubk584tiMfR7
         M8q+hoMResIZvGrSasIdLKDYgoq/wVm87AEIkdXouMg+8O1XZ1MDI3ZdJhrpFMFpVyKQ
         Mvft7t+GCUn8xuNwTqH9EfK3FQeyZt/eJDscu8B1TgUiTCGIRiQxMqs++uv5WCzolMy/
         FyXuae9X+U1CjrLY/M9NFai22fcN8Zu4ZBjCssOiRjmtzXSlJvs5qNbCZQ+CnRfVuJRI
         QpmQaPRbSEo7Oz/4G7X+IN/r/WCoO5a64qyLvL5w6WJQoUx9D7+/ndvNmp+aYawnWsw0
         hRyg==
X-Forwarded-Encrypted: i=1; AJvYcCUwN17mufU2Gy3iHZNmBcn0Vv5J8P9RKHZeKxRpMIql6nibdC0sb8on22gC72AYJo7mzY5WFghARJnjm1YPefOZ0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yweb2Q47UKEoYzxjrzPnGNC23WASRveUcHWOgxTuomuM8hYRfED
	Le3SM0Dpc0gQSABv5upWpLXVe+UstitJcZVGeVcA4nBDPqYmP1vg4BB2Y2Gr3JJZXxI=
X-Gm-Gg: ASbGnctPXKBqWX79IZWTc179w9j/WAz8k9pSd+bYKdQbpc8wK6rj+lUWTWnLXKDYsBq
	MJmxlgt4LLYH6wgbnbPumn/y8SghWujqBmeIbgMkDornk8TCPRqG2kkAU4u1pwARBACsn59J0nU
	ktkcJABvP8Lzr2+EULZJanNSJryBr2VmJ/HMb6P+XTEy3qr7/SLN6eCuofMbG6u3qy8Tn5ow2km
	9R0GYA2FiASpkX3PqLQddd8MufnCjyOISfxF8N4ROz6vE9rWUoLM67t6i4uGHhcZa+2fyoLcv/g
	QqlbbLomEJTzZ4jJQj/g4dutotwr3BUATYwdQrGCoj9Smvhxvu9waho9Akfyr4Z7Z0kx3RF3nfp
	6B3p2YNRj9X3CqcPCoqWRPwe5nmrd+mKg6gkU0+mNAItrXYZm
X-Google-Smtp-Source: AGHT+IHEAsH6ZcFu+OEyw3ew5Qe/YQEPpYcPrHdEy87KxK9nyj76/ZCLGpnuNV/60Jx9Jzca5xe2iQ==
X-Received: by 2002:a17:906:4795:b0:b41:1657:2b1d with SMTP id a640c23a62f3a-b50abfcc8dbmr1274289566b.50.1760105815884;
        Fri, 10 Oct 2025 07:16:55 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d66cc4b8sm247352066b.30.2025.10.10.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:16:55 -0700 (PDT)
Message-ID: <ccd3c985a202f3fdbead41fcb3f0ba45950f74f6.camel@linaro.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Ulf Hansson	
 <ulf.hansson@linaro.org>, kernel-team@android.com, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek
 Szyprowski	 <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, Conor
 Dooley	 <conor+dt@kernel.org>, linux-pm@vger.kernel.org, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Date: Fri, 10 Oct 2025 15:16:54 +0100
In-Reply-To: <176009895995.7689.883182155048414797.robh@kernel.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
	 <20251009-gs101-pd-v2-2-3f4a6db2af39@linaro.org>
	 <176009895995.7689.883182155048414797.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-10 at 07:23 -0500, Rob Herring (Arm) wrote:
>=20
> On Thu, 09 Oct 2025 16:25:04 +0100, Andr=C3=A9 Draszik wrote:
> > The gs101-pmu binding is going to acquire various additional (pattern)
> > properties that don't apply to other PMUs supported by this binding.
> >=20
> > To enable this, move google,gs101-pmu into a separate binding.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../bindings/soc/google/google,gs101-pmu.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 67 ++++++++++++++++++++++
> > =C2=A0.../bindings/soc/samsung/exynos-pmu.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 -------
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A03 files changed, 68 insertions(+), 20 deletions(-)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
oc/google/google,gs101-pmu.yaml: $id: Cannot determine base
> path from $id, relative path/filename doesn't match actual path or filena=
me
> =C2=A0	 $id: http://devicetree.org/schemas/soc/samsung/google,gs101-pmu.y=
aml
> =C2=A0	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetr=
ee/bindings/soc/google/google,gs101-pmu.yaml

I moved the file ultimately but had restricted to samsung using DT_SCHEMA_F=
ILES=3D
during my binding check run :-(

A.

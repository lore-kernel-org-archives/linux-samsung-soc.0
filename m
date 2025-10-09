Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A43A2E092E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760013927; cv=none; b=bn1uEXBaXx5dKoD/c4Q4rj0Rt3B4MjB6ghMVRGqePlhPs4OVijeCdSvBdEbUm2WbKTtx1+owTfRH4vaQhsMoZL/krYliJ8p4XEz66JWbZxTgfycwArSlMccYMoDEGkneoOBEmYjtudJpW9wsVE/khVRyigB3N4a/H93VwygODgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760013927; c=relaxed/simple;
	bh=+qIn+RPmmwPv3OjgMXBX77cROFYyBV3LwSb/xEzaOA0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I5jBYMe3ouel2mfIH2GlOUsXu78XrcZKg4uqCzenKdcYDzwCJ/DyznCJVXPBKMvnaVKKpV7LWd70I9zPHsniBpU0PcvTitgcYxQPjYtN5l/SiMaIJduYcYeVJNQdLAP2trZKsnULAYL9pYXGgJjUMcU9OQO8eQG4C03QMH4dfIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVjMyp9y; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVjMyp9y"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63994113841so1464704a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 05:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760013923; x=1760618723; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+qIn+RPmmwPv3OjgMXBX77cROFYyBV3LwSb/xEzaOA0=;
        b=XVjMyp9ybbgsoaIoC6phHf0gwxtiqkvDTBltEZRWMXSk6fiOglqgNCBGLdih1aeLXi
         wXwSmbwg+ykKhcO7s2ekQZiqcb6+L6GbxwAyGMJrF4w9/Du7pbucRWUN8zDwRam5Ui+z
         I5fKc7qcG3dSzvD2cG4TzOCc61dyPqqBIKKtSMYmAPOgGYSrimg8vOIhlUZY3ClIbQWd
         0kIbhYFBP9RCKAg3ZKqthtPQPcMOSL6vSG0TvkRh0XsXDjrjKTKGTqcSfb52Xp4A+qX6
         4XHPyTEZ4uokAguOhB8yFBvn0wb8AIVgtofX57M5I1jVzH5WJWAqr1fR5A9XD/XihoSl
         4RZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760013923; x=1760618723;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qIn+RPmmwPv3OjgMXBX77cROFYyBV3LwSb/xEzaOA0=;
        b=xIYvnqOFPMl25y0YYiImRrp6jXbR+0swuMex+y10nKRjYgTUjEgggcIPsfptNWEuew
         TQRxVLdziQEuzTWTla0UqtjPp+P2Qjgynoc51WgNqga5XF9LlFrnVio4fJqOoXUECLHi
         1yxDfkz2j/Jtdmpa1+AAjOD10oSFIDR6tei10DVaf4Ms2PRHV6tsVXjIZNWrWPW+08my
         utvRDkn4Dsi+wfZRFscdnPmr2dMkPnuwsKoLQ5KpD9MsDluJAkVCbcQumk4vmasiFJ7R
         bVtW9baf1/1AxxhiyNaXwmNyPexLj9fUNPpRbuxXKmR7nVxUZgWVIc9OYJMXjze0KKcW
         vFLg==
X-Forwarded-Encrypted: i=1; AJvYcCXm/hO562lAY42cHqEzPa1tDHzLvIxN08UIW/BvKXvshLoFYdIrcZ2ijpfNMFK402Mu6t5TdZVIVutkUQ5bLg6kQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwngDkRHscvQ99nxmA7VdFC2BmtyEg74Mh8HIB7ImUCWQkGa/6n
	BEc2n+TGBRdjN9M46hj0c3S4Z2bNS0Pyxfo89WvblCfke315LcharJlJZ6w1aJfg1Ik=
X-Gm-Gg: ASbGncvl6MKu17pJDFc6ZfSGTDxBUrlMBuHSUO7PNVPVkDgpYVK3z0kmIqwGeScPQEC
	pTakZOGijIGRo0owhmEzUiusWs1++cIPoqGhf5tyLdcslAxgFq/Xp+KCnb5bjlp11J6zd508+Dk
	tk8sJSfjWJX3AyvziL8JLGYgV1bO1qmyptWr5UQP57ORL2q1UBAMY9q1vQFyBz+W0UNRTY/RO2f
	l3IRrjIG2n8G0pBZoNzncGW5qCgOpnA1jy3whQo/iLDrCWhTjg4/Rle4JQsDOxOFfp59O9mgb9/
	hMarkIieQvIoRi4wsGcCucH9a3i3oSnNosfPECuYQ+5Lgpk3r482w2/X4kQ/YIF8gTE3/dZ+MVG
	4zIT5Yve4/FvELuLLdxqts9aTjr3AzDZrau6E6+vKMf6+i5B/uWDSTA==
X-Google-Smtp-Source: AGHT+IF1kryN6ovbJfIQc/Fy4MJIAskuq3zQgUsbduVZ1K8QdtBLyuZQWhuT43c/0DSCHjf+2b58hA==
X-Received: by 2002:a17:907:3daa:b0:b45:60ad:daf9 with SMTP id a640c23a62f3a-b50a9a6cb4fmr894498966b.3.1760013923400;
        Thu, 09 Oct 2025 05:45:23 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f7420asm1880196166b.43.2025.10.09.05.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 05:45:23 -0700 (PDT)
Message-ID: <8e95e30e0ca9a85ee40f93e01c23edbfb4e1b3ff.camel@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: samsung: exynos-sysreg: add
 power-domains
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	 <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 09 Oct 2025 13:45:21 +0100
In-Reply-To: <13426fe2-d4cc-4d87-bc4a-4a6dca955456@kernel.org>
References: 
	<20251008-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v1-1-ab41c517dec6@linaro.org>
	 <13426fe2-d4cc-4d87-bc4a-4a6dca955456@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-10-09 at 08:42 +0900, Krzysztof Kozlowski wrote:
> On 08/10/2025 23:17, Andr=C3=A9 Draszik wrote:
> > Sysreg can be part of a power domain, so we need to allow the relevant
> > property 'power-domains'.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
>=20
> It is not part of power domain for any existing SoCs, at least nothing
> indicates that so this should be restricted as in example-schema to GS
> sysregs only.

Thanks Krzysztof, will do.

Cheers,
Andre'

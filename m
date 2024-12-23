Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B5376E0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734950535; cv=none; b=uR55pZ5rB3Txaqda9yUIqFE1TUSV+v0nPhtNs5M9qSAK6ufwrcBldJZLnZxO06iRGle6+jIEE9j3a0KeB5Eak9TTs94N8MUsGtLQ63IHE4cSJl/pdxSRCH9AntoKTuyt3JlJqOfdnuQeDVO73O5XpmkC/2WO1DHF3k9BHFRO52M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734950535; c=relaxed/simple;
	bh=aQrK1HPme1KX8MRXKGRDKhR4HEct1R158EqjW1hnA3I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i8taekbH3iKGSec/pqtubmSBXH8X6PUC+fZOmecO7ocTFYsEWLIMSD85/Lwv5Pkp90+brzS8gQWW7ATLp7vI6Axl4YcbcAKVC8Kjre77CpMS3WpfyVQR5QpBuX7LQgN81tX9Rh2ySqQ3DpO/IF1xgK4OU07r1eqOsKaiHqbBk+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dgTFHQxu; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dgTFHQxu"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa543c4db92so476262966b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 02:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734950531; x=1735555331; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aQrK1HPme1KX8MRXKGRDKhR4HEct1R158EqjW1hnA3I=;
        b=dgTFHQxutuHc+D2sPGOcvtbVyPluFlWWCbFwqGrnJRL2yueIM4LBB2xKdiLIDW3TYK
         VLRlY7k9XAKcJbwIZgYr7KFnSVFhwlZTJQqH2AtN6J1qUtxzac/scT9Yn8Ig5HZ712bE
         33aAXydCjKw7UVKQmkII5Ile7seexfxwTmjJGkZULUwWiLJolcYnp/a4jGucRkmH1E7X
         4uG1PrLVq3nifXNA5jVr8IJz8LjAMFxeW1zt38RqxozP/APkI3gov8VpDwryK9fOoswb
         f2q53rHb1hD4wcXsBadJdfN26ENlFBb53EECBUc2a7X9syjX+o/Lj5dnROzsfYBSBRlT
         xYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734950531; x=1735555331;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQrK1HPme1KX8MRXKGRDKhR4HEct1R158EqjW1hnA3I=;
        b=RtZaSfSHLy6O7ue2tn7TWqlcY/gFURqRFecUElzpVkjPsVBdMcyq/Z6kbzzi9UD4BE
         3AN07Uivw/J0iMdoHTzTy+fw0te+f8mRSiytHoNtJqyXvWB/DUWdsK94kBd4oAxlgDME
         ERKY7M0wAbDr0HGYgLUII7jTDtwKVVeF3e0c4GfEMNsZK+QihIVsSM8k846F1WOjmi5t
         BFs2lh0DlUtBAXfHly4/pEgE3a8mlxSPgecxWOl7/qDnGVwN15lxI+ucZEIZ4FBpIM1s
         Hyggpv6ideBIDfz05KMmGShnU1QeDdlaJ2eMIQQg9+riSi75LhAXVS7BkLIG1CbuwcQT
         WNTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLCw4CgiD2vRwkEJtYV4hnK6Ab2WFL5Yi/69lvIi6sI3zR4Vw3C+agWm0q1a84cGw6u7fLrLwNpzqa3eNbpBtXeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylfkSww+ga4pYMxeAcn7jVGF6xWnOTaf2/m75QVUi87g9MoSee
	3nlzohBvSKy7qa7b8+lZt7jLzrjQTUGe2PCnGX1Z8Hhj2ECWUFv48njXR2+siQk=
X-Gm-Gg: ASbGncuAwPZ/aUrLfRDL00V9zxQmrKCVTONkMYEDvGgRn18hfzqG43QToMQBbsYIHh6
	N8d+4gJk6Ro4wdb5zsFxjqyZila9B1M52Fw5aJc9iAmSz2LCM0WsgBhikAD+M8gS0tCYvvYDa9B
	oeDIx/t1lTfAWKjODLDI20oi7DrjVdY+HHj5MvNSZFBjssQLsi1/3trFVPbcDHyV0gHPlGzR9x2
	ROsSW50Qbs3cm9CDtOkdRHTYcbMrDE+VC5oNV/7aiZn8NnDEn/74f2d1TZFNA==
X-Google-Smtp-Source: AGHT+IHgWrhh+2AxSpUDrI7JHbusEzDDQ2ltYsz69a2vCjN8/HtQhE7ErhArGzKx/MO5IH9aoL+HgQ==
X-Received: by 2002:a17:906:c14f:b0:aa6:8e9e:1b5 with SMTP id a640c23a62f3a-aac27026ce8mr1182784666b.3.1734950531082;
        Mon, 23 Dec 2024 02:42:11 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f56csm504416166b.24.2024.12.23.02.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:42:10 -0800 (PST)
Message-ID: <d7dd7286c90ecf43594fd1d44975254479270539.camel@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: gs101-raven: add new board
 file
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Mon, 23 Dec 2024 10:42:09 +0000
In-Reply-To: <dbeb28be-1aac-400b-87c1-9764aca3a799@kernel.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
	 <20241220-gs101-simplefb-v2-3-c10a8f9e490b@linaro.org>
	 <dbeb28be-1aac-400b-87c1-9764aca3a799@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2024-12-22 at 12:43 +0100, Krzysztof Kozlowski wrote:
> On 20/12/2024 12:27, Andr=C3=A9 Draszik wrote:
> > Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
> > (Oriole), this is also based around its Tensor gs101 SoC.
> >=20
> > For now, the relevant difference here is the display resolution:
> > 1440 x 3120 instead of 1080 x 2400.
> >=20
> > Create a new board file to reflect this difference.
>=20
> There is no board file here, I see only overlay.
>=20
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > Note: MAINTAINERS doesn't need updating, it covers this whole directory
> > ---
> > =C2=A0arch/arm64/boot/dts/exynos/google/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> > =C2=A0arch/arm64/boot/dts/exynos/google/gs101-raven.dtso | 33 +++++++++=
+++++++++++++
>=20
> Nope, boards are not overlays. Boards are DTB.

Several other boards are using this approach, e.g. in
arch/arm64/boot/dts/freescale/ and arch/arm64/boot/dts/xilinx/ and
arch/arm/boot/dts/ti/omap/

Can you please explain why this here can not use this approach?


Cheers,
Andre'


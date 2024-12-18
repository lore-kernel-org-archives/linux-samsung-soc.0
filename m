Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878501A239D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734524094; cv=none; b=btqTVojiuZN3PPr2kPYL5mxBaB4fH5wMuKjmw1Q3PGZMqNq85IEEePe4pRsJve1LItLgB93q8KAjfImMgvi+KzzDzq43E1m8WHpvFN6U291fNO6Fn9tpNQ36CFx/L/ciBHYSv6S/ZvZl/kbdfbdFhVSD1Co88qctVtLZUy/WMAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734524094; c=relaxed/simple;
	bh=qWC8TK/CZLbEW+1tkvwXLeCJBYK6BKk4PiQCgLFscV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkjTV1azs4iWQDZYDJvntXk/KZ/FQ6otN9+Uddcq7+I1UkpuwOPCOGUFQv2k091cy3BylnQzD0ENhZowqPkwpg9X/BZf07BfDpl2w/xC8PlidpahMf0ThWFOmf5Y5ayyb/XbbUGATNyfGo+G0OY8hyuQJQl3XNC2ZlmTHBGfOC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rOTmYd6q; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rOTmYd6q"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eba583fbe8so1817835b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 04:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734524090; x=1735128890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWC8TK/CZLbEW+1tkvwXLeCJBYK6BKk4PiQCgLFscV8=;
        b=rOTmYd6q5kgQeyY6ClrjdXp0SepMlqGwphB9HigdF7ZcbCJCEE9TD6W2n+96axfNJo
         9bUjKrWNwWMbfd/W8k6+TrYDFLSOpEirtK4GtjixuOSAOD+4/coH+ZTeEv17T7uYaUgD
         S9FfeV5dfGbmznR4LcdsahyRBBvNk4hiyB4bZfs6oqvo2m6iIUPuMUcY0sw72cMHGGmB
         vnu5FpJb+3sklJw/EzCfbsQVcjJ0CyII62ZcZ05RDNZeKQi0LudRcjAYPRRPxXEL/AA+
         EDul0BxjuI491L8w9naYl65P7OrPThZGZYvjNElXyCaa917/B3GNFwhqoyqsIEAOzvgs
         0mSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734524090; x=1735128890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWC8TK/CZLbEW+1tkvwXLeCJBYK6BKk4PiQCgLFscV8=;
        b=lrHB6Mk/jboPPndx98UXrhVzwDxXorr8QsnK+/kRtIhR/VeGLtgyjWpem5TlC1FHC2
         8lRjOXRHSY/jI+ZeggC+i1k7t/8aaoez9p8YxXD3abG3/zFClW6yBEQFpRGSHY4mgIu8
         onowDsGy4Z7tY1A0kN7N9mxNKbwznmhAHVXYzpPWfkjfhuoEvS2T8rCOf+aRSKCqbcrh
         ZCTaWCaxycudxbTpywo9PPw4fKvOrfLcsHEBen1BCuTTX9SlQJOdDUYB+sUHYhlZAoiN
         WeBE0VMy/5YjHUP3SdlEfekyCAM2B0MxXXcendgkldEHUO+uH3GZxUKJld5LSBkwHBi/
         qwbg==
X-Forwarded-Encrypted: i=1; AJvYcCXGCXQx3au/zTP6IUlQQiLy5SJ6HxAXS2vDipQ0IApjHxUMOXZ0lTOkL+Ee6FMSQ/JWMDRxBbiKIA6MLMHLIAn7jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Sk23hYR6+m/S4IsljM6aum1crb3iqJbKF9uKfzHeNRQ/p1C4
	lMC+PAG+27ERb1L2LXewf2JTP0REeJX73TBC7WCgIubyw4JRfZEebKBhM7VyXtT7uC/2lqhGVuV
	hJBQZUVtabns337q3u2da2Ia6B1JSoNMsWM0ECQ==
X-Gm-Gg: ASbGncsA4UQYAHNHvmEQuMWwBTUwKgiEoyaSPf9JCzxEwnLIMwDDZXgSfYt7YVlTg5B
	12quFTvxPxJ0cpB49mU8Zowq9r0o0JScjIRHFHKs=
X-Google-Smtp-Source: AGHT+IFdw7iYmOiyk30Vm81g/2qKdB3Em6Po0+spT5pDn8MU1wacuialp5Zo32J1hgw5gReqkX3215F81udAl9ELCSg=
X-Received: by 2002:a05:6808:4443:b0:3eb:8855:eff7 with SMTP id
 5614622812f47-3eccc093e98mr1458028b6e.27.1734524090549; Wed, 18 Dec 2024
 04:14:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org> <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 12:14:39 +0000
Message-ID: <CADrjBPqUcsiX5u80ASfWOe17Cwnr6EA0g2bxfgc-e8YpmWkUYg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: exynos: gs101-oriole: move common Pixel6
 & 6Pro parts into a .dtsi
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, 16 Dec 2024 at 13:06, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> In order to support Pixel 6 (Oriole) and Pixel 6 Pro (Raven) properly,
> we have to be able to distinguish them properly as we add support for
> more features.
>
> For example, Raven has a larger display. There are other differences,
> like battery design capacity, etc.
>
> Move all the parts that are common for now into a gs101-raviole.dtsi,
> and just leave the display related things in gs101-oriole.dts.
>
> Raviole was chosen as the name because Google uses that when referring
> to the combination of Oriole & Raven, keeping the familiar terminology.

As discussed off list lets not use the "raviole" terminology (as it
precludes Pixel 6a / Bluejay which is also based on gs101). I think
something like gs101-board-common.dtsi would be better.

Additionally I tested this series on a Pixel 6 Oriole device (with the
latest Yocto initramfs) and the frame-buffer was functional.

With the above comments addressed

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

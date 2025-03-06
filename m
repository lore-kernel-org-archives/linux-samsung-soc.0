Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740BB20765F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 21:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741295725; cv=none; b=pihGCxA+skICrnXzlX7NUAUljbdTIBVLygQzsZJ0zZ7s6ijUdMPpZbxUrJwHVtGO67RBprrFuhFo2suSJo27ptZUWa5ztD1djs4yE5wS6mHebHk7aQPvqt6+DiYaonaTWA1X1yPrP8ZkFmHkxc3PkoCXvdQNkplyN1EPV0sEvj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741295725; c=relaxed/simple;
	bh=vEXvflwEV04efj6bnvhXaeOA0qHCeEgvrAzgI3xl7wA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XMdEe5gsrRfwMclF5Sh2T8dA4kkziMM2KcxqaACE35u3NSO/6ujCRZLmuPox6vaumpMt7qT/BBzxggx3ZWSMrP1Za+yWbLD2Fj+pTQEXd0ymoYDPdJv5j3Ye/8BiprPGID90P6ktChE2ovGw3AXgZCKt1KEe/e7mnq3YAH4rVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DsIj3VKe; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DsIj3VKe"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abf538f7be0so217001166b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 13:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741295722; x=1741900522; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vEXvflwEV04efj6bnvhXaeOA0qHCeEgvrAzgI3xl7wA=;
        b=DsIj3VKeLHdEyUqNenk75PVHmr8R3bDFxHIWKbBzLV/+0mAd0/srz+KYSKWiz2/Umr
         8aP90On4uip1RVIyis5A7XDTvaQvSkbzaEsFTUcQIQiE+0wgi7zrAxcjbtOn+PDpwmYD
         1isxmiCG8AYjQBHJJBIfU4RTk4NnkTmz8bCK3tljJsgPH84CH1mTFV2ISaQpXFap0+QO
         5/RnMIg6CXAXtzsr2Perikh4yO9hvO3xyLEsOWR4AvnvoLThDXGaazwefn440UyiZhep
         +SRm5p59fyIZ5GLedeoTbF8R54phMghDPDnT/LDfVq6z6t56E2BjqzgpNmjyg+tijrfI
         M5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741295722; x=1741900522;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEXvflwEV04efj6bnvhXaeOA0qHCeEgvrAzgI3xl7wA=;
        b=rCCTlvoNmC9liAgCPy4qrWez/AdMCl1XPyiixTxva7pHQ+ppCQ+qrw29l8NxY98lih
         NaVXv3FrJkxJqZbn1KN/T249l2PfBnqZ0YV7U7uHtPTGxqiFND5Cusxj8luVvYS4Odem
         3f5OA4Pyv9R/lu3vGhfkvmWfIe27Wf/susLhkQWd2ZHT68ST4ni9sp4rFk6/56o96c0o
         H1HXHmmdEYRp4FaASKzmVUBC7Ouh3TrUt4D8jq0gdGcNduOxhg5oyRbgbTLfJ5oW5f6L
         bwCXwOyBk/zrXP4VsjvpmOTCBE1Oit/QywiHnMl+9Qa6xngkBEyTRRYzthpaWGRiry4f
         XF6A==
X-Forwarded-Encrypted: i=1; AJvYcCW3jPNJ6K0G9Qs3mRtsnezrN43z5fH/FFT7l3xc4sd+p6broZyqDmLCzVImhjAZJecvdbdadKo58/nBSzGxi5t8iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZOGY/3Evjz7/0oDtn8oN0j/pu3BNrWAKHlBOss2c5lRQKzPj3
	KPGboaqRkAYJWcEAZTqbRgSPx5xAmAVUderJ1xXtpy9kiZrDWhgT6ZVkTp0d9VM=
X-Gm-Gg: ASbGncslOgXS6QKeuAVgZbXaUzcKqNeRTFC1bLuMqtZDE334JtssTqm3A4jYGZgAmNl
	A2KpeNv9qe8yQNz3X+dFjyqZvqoV4Ex6OGKU4ylHgKgaHF+fzMi3PH8+IM4OHmT1CDXjUORf/ZO
	Trnrp5FvJm5WicwXCSfh37N+IHypgrDLVQ7JNlbawH8jY15qi1BAyrScYezsxvDwI4Mfi4SOf10
	rO9uQC8YpWi5n4XxO+DXMO5peoBj21I31CWTTjdsZSljNagbSAKl2I5F2/6PvGo13GEckriUU8w
	svZTZ+r49NdjIk2bEFVs3k2lfvzwC3KJqzyzaoUUZozdUKo=
X-Google-Smtp-Source: AGHT+IE+LHNfvlp8dFOhg8/hGQEzMaTOw9w3ZnSxV/FqKSm/TD4PkI2UTRYu6TY3+BOkP+WRqnVYGg==
X-Received: by 2002:a17:907:9490:b0:ac1:ebfe:fd90 with SMTP id a640c23a62f3a-ac2525980femr71342066b.1.1741295721652;
        Thu, 06 Mar 2025 13:15:21 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239887693sm152427066b.126.2025.03.06.13.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:15:21 -0800 (PST)
Message-ID: <1418fde488646160a1be14b2153e409488f3d861.camel@linaro.org>
Subject: Re: [PATCH v3 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Thu, 06 Mar 2025 21:15:19 +0000
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-2-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
	 <20250306-pinctrl-fltcon-suspend-v3-2-f9ab4ff6a24e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-06 at 20:42 +0000, Peter Griffin wrote:
> gs101 needs it's own suspend/resume callbacks to use the newly
> added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> registers. It also differs to previous SoCs in that fltcon1
> register doesn't always exist for each bank.
>=20
> exynosautov920 also has dedicated logic for using eint_con_offset
> and eint_mask_offset for saving & restoring it's registers.
>=20
> Refactor the existing platform specific suspend/resume callback
> so that each SoC variant has their own callback containing the
> SoC specific logic.
>=20
> Additionally we now call drvdata->suspend() & drvdata->resume()
> from within the loop that iterates the banks in
> samsung_pinctrl_suspend() and samsung_pinctrl_resume().
>=20
> This simplifies the logic, and allows us to remove the
> clk_enable() and clk_disable() from the callbacks.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes since v2:
> * Remove useless init (Andre)
> * make it clear set_wakeup is conditional on bank->eint_type (Andre)
>=20
> Changes since v1:
> * Split code refactor & gs101 parts into separate patches (Andre)
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |=C2=A0 28 ++--
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 201 ++++++++++---------------
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 11 +-
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A05 files changed, 109 insertions(+), 145 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>



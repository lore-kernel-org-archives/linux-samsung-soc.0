Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221191AF0B7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365400; cv=none; b=eHVNB7gHDw7nJZeiA3F/EuJ/rlJpEM2QTQvdFbpqPIfE/kzL7VRvCQKWGh6nzsAwaXDSVrUFLnKDv3leEHwkIWqeoh0Rq4Qa44liyRNjJDqyRkEq74niZAIMdN0Hcdcuatira3aumeH+UrqkiHC21OzkqgbuMiUYJ0eHBQPglm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365400; c=relaxed/simple;
	bh=bWYLLAv9+QSl6NuL+dXUwkLvPnzxxR6x37Sw+FNFkRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2qkkAQ9sgnU+bpblaM/CL0ATqfvQzxnn3DgSa6zOiiZcQmC32ElVe1O0o6LrVIMMxG28IYZyhaBN39gJRAAgjmPGTA2bBcvak5gtoQYIjq21BfSczl7SU8CT8ZXZSaaKVq7oVjMTRYjk8yt9+03eRllgFXc6vN4MpXU76IR23E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bU6Fk+p9; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bU6Fk+p9"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5f4ce54feb8so2163932eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jan 2025 01:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737365397; x=1737970197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWYLLAv9+QSl6NuL+dXUwkLvPnzxxR6x37Sw+FNFkRE=;
        b=bU6Fk+p9pNZqbpayWdJNZIS4jsMsFzYZY8RGAd+NCtJ9GuAlWOqMx4+Js1mxkjvsEP
         HZEZnPaToWLZla2ho9urslqaJymeqMB0zdOKuFGk/Mg8TmB8QujXQ+GUXFv34QBjM7mY
         M2IuJs4bm7k3mpPGwqtCdtZP8ttd06BRdAc8UaiMnT0AwxXrxc+urj5/2zAScoRdTyV2
         KLvELEr5+2WoEnPiEnMcSVYzFNEc4yOlJHh/duTe8RLITeAXl+AAz8U2hqKME7fwzgSW
         IkbdpYhETIfePqFAGFLdXO4aRzrYcRW/1PSet0RLsIG4q3GRqVqdleGlbMMaWddogyEM
         Ulxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737365397; x=1737970197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWYLLAv9+QSl6NuL+dXUwkLvPnzxxR6x37Sw+FNFkRE=;
        b=Gp1mo9c55X/Mcs5xHdfmsbEPTXrAvjdguDqHx+NnNMOansLps3NMjGlEeQk4uYVpA/
         baKLkVVnDtoiA5yf/VdxD/Y1vmzXk0DJh7UmWLxNa0YEuLScjs2s+v7KXFwnZ+as9k4i
         nibJcK/ke1ErvDp+1U7XTTVPvn+TKURuzR+drEa1YBqppjjUXIXNKSRP5uuhOADMvULo
         bxv0SWVMWMLr+MnMiDN4KyoXcLyWuzI4CvF1S8CoctjFDwZZ2jFgIXS4wbdM3G+dJG/X
         0EuNPL0ppyj3gXUG8pCW8AqNFFUFAc5Uj8R8KkdmfKJ4wfHdA2FABNp6YIt5NJWRKJNZ
         cNBw==
X-Forwarded-Encrypted: i=1; AJvYcCUxNgVMBh9jL5qyw3p6G3Qa2ESHAv13s/LpIPXN0hJnfR1BjONZb5Wpj1D9WRRCM4cqbfAsP2crmw1GnpyQsfhmQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YziSAY8PY5pz0tdL75sw2lqjgnkSHodH3TXDtNGRZhry5vj1TYd
	V2odxT3PuRDK3L9EHh3TcArPxyCycs5JWRTKIeyF+4dy7emF18B9KeT+phBIAPXPnNiqAmg0U6e
	OCVhWnCH9S9/P+Ldw18pKmMSPbKerThocn1jMiA==
X-Gm-Gg: ASbGncs3BqObdnNuue3meU6ZQI27F3tw0yisdri9A3TtS+0XNGL8T7hcEESaB7Uen3d
	7YZwC1nQ+6NXYVZYz47HjYijb/D0JScUMHzOgtON6OvqJ3JeHXfI=
X-Google-Smtp-Source: AGHT+IEh5ekB+In8kM4Kzz+JbIUW1L+SJB7JNRP1EJgfAXgE427tlnK9kpmUaBC4bYJQvBbjLwfn1zxxPfPvqK+oy6k=
X-Received: by 2002:a05:6820:2207:b0:5fa:2edd:8e65 with SMTP id
 006d021491bc7-5fa388d0974mr6833389eaf.8.1737365397006; Mon, 20 Jan 2025
 01:29:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org> <20250117-gs101-simplefb-v4-3-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-3-a5b90ca2f917@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 20 Jan 2025 09:29:46 +0000
X-Gm-Features: AbW1kvZszduHDYU3xxvIKBV97BoVaqY66zb0MrVDW0JhuNR8cdHWOmCpQEtzMwA
Message-ID: <CADrjBPoSHGqbC=8_-eWLO+E-ySMW+XNPKx3ypde=SS8-hrXqTQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: exynos: gs101-oriole: move common
 Pixel6 & 6Pro parts into a .dtsi
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

On Fri, 17 Jan 2025 at 17:10, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> In order to support Pixel 6 (Oriole), Pixel 6 Pro (Raven), Pixel 6a
> (Bluejay), and all other versions correctly, we have to be able to
> distinguish them properly as we add support for more features.
>
> For example, Raven has a larger display. There are other differences,
> like battery design capacity, etc.
>
> Move all the parts that are common for now into a
> gs101-pixel-common.dtsi, and just leave the display related things in
> gs101-oriole.dts.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

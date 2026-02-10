Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D32931A542
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723486; cv=none; b=uH5JPzTKy8mgf2CspnIaUtK0EOzA+Hms7fC43dO1JvulQ6zVX4q2ztdHmbUzEgHIv9KlBVFW3mzbrZ4iBI++yZ4h/btvXCObhgLWxE2YxAHESsojmQJXmV96SZdpltYGlCh3qwr4Dgzb9myQkAFAYYRKmEeDke7GsDmViKuMFqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723486; c=relaxed/simple;
	bh=yOsY5RhKxrMXDB96hjVUQrxZWPvwUKm+B3xs2xyK+ao=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qXB6i2MOih5r3XaSHy6xqOn4DEyB8nR7NGe8vQDkO2fV/uYXtvKUVlYTzNrOA/KPwoG5MEdzccG2pLFqkN6KNVO1BU4d5nqN0cqGPXEZF96QvEFj+5XREPFkFhdBEqIpRiOFY4wW4hme8TioYEHRx3d3dbYU0VEyyFr9NODnoxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E/Oojgho; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E/Oojgho"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4359a302794so2591940f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 03:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770723484; x=1771328284; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iJ/WctdqigD32PqEqv3ebe0jqlT5BVVf/tJqU8VMdkg=;
        b=E/Oojgho7GgZHJHFQI7kE462dD7lqqBvWZNuRWutlLNIB3UaCOY+Fxt0EWTwhQN2vd
         vpPRH0vc12gpGMegMZyCtHMby6j/MhuwDIB5PcXqJ6higOxA4af2+mZDye8QU18Q8WNx
         k8w263EowS8FLJqVWR8JlGdSR2aotpB5rHHiJXuBncTBAwKatmWbYUGkAmEHILhQFIIW
         dicCJbqJ329nTAOaS1DmeNF7wfpHr3NhlWVvPYTBbFy0MFul/Y5h9NYlhJv40PYzbRP8
         WApazNRVB2QzqrE61+AoolGBMhSxCul/8OyeqU8cvjz4GAFh9mzhNPCybxIPeubmkWO+
         Fnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723484; x=1771328284;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ/WctdqigD32PqEqv3ebe0jqlT5BVVf/tJqU8VMdkg=;
        b=v5pqm35prpJeKWC0thwHYneU+6T5zLEaRXWzstTdGacXPIr0xwxSnl8IPdzZuE3b+Z
         r4ohVJ0k392wG4cOB6U/55OMnBG6DRHuZYoYkTEgANTqtdGzWXCRWFIz5gU4swEz76YM
         OSI9vgBewrtZN+YFJPuqdxigHbznIXEs8ao3UtBSjyeMot1dU6p90GL4bSoGE1T9y+/y
         lB4u1IBZfKV4c2VUT+AUzJqakYtDjK2uTCWrS4Owi96AVmmrosn0CJUaNFDPGWFcmiSn
         WZURrmnmW3xxjM15JXHjjP5ROp2JlcacxiA/fSYSH1uueKyw9xdyj4EYFrqkjzB4vwjv
         I8oA==
X-Forwarded-Encrypted: i=1; AJvYcCVh9Na1ZfaYuROE582XpsoAhAqwmPhPG2qrOqTZ/ko+/91hbDOYBYeqU95PpmyURqNtUjWOnkbHLBOF6TQsBlGrhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzVfVlBmDrq6OUjBUvM1dhfoXEBkK0fbChVfaSTRNW5hQtYICo
	0L89uXMqnOYyG9O2BmzUwtbqcJo6o5niPjMC/zhTUppoPPwrdIqI0kq7emFKb+kvxG8VI3GqNyo
	g409NdaoNSw==
X-Gm-Gg: AZuq6aJAWbGSH/WHZiDcn+bM2Pz9PLgximeG2S/ivmF4zu0zOVKqGUqH/8API4azyIb
	7nGv1+kN5FiYdC7zUTSYXyqV3mxaMnt0E96XiR+7sUZsq3vHOnqqgwq0iXYUi6bWkkd3tI3gbKX
	SO1Ycu9zgra357atCqyXjv0TUYghDtBdeATtF2P9uGPoFViIglkU2TyN4n9p2Wcsvoigy/X9EtT
	m25byQhu22alZMI7tKyEdycI1NGTBqLxpLf3DHafisHwughOPJtD51S2bb99mQQIm7azVBuM/vq
	hSsfpccmUPrmJiDg5WIDPUPREenYLE6aZ9DxOtLLADRVoodlHBBm5lWtP423JpMxmBLiCTXypBR
	dW9GSILeGxeTaWH/yOc5U3nInTJ1HMIr/NDaETR44k56L1S4QzPqXRY4IirYiudVT/N5r/TLhZt
	ev2M/ten2bkibvw3w27BRQj2Rw+hKa3zgI9RpIHIOa
X-Received: by 2002:a05:6000:2601:b0:435:d859:5cf with SMTP id ffacd0b85a97d-4362938a761mr23774127f8f.54.1770723483638;
        Tue, 10 Feb 2026 03:38:03 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43631c8d378sm27426330f8f.21.2026.02.10.03.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 03:38:03 -0800 (PST)
Message-ID: <cf4073c76c2db84fd8fac3e1c2a63918bf9d45da.camel@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-pixel: add all S2MPG1x
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Feb 2026 11:38:30 +0000
In-Reply-To: <20260210-s2mpg1x-regulators-dts-v2-1-68783c9e0a32@linaro.org>
References: <20260210-s2mpg1x-regulators-dts-v2-1-68783c9e0a32@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-02-10 at 11:30 +0000, Andr=C3=A9 Draszik wrote:
> Most rails are the same between Pixel 6 and Pro, with the following
> differences:
> =C2=A0=C2=A0=C2=A0 * only Pro has UWB
> =C2=A0=C2=A0=C2=A0 * Pro uses l2m, not l14m, for TCXO
> =C2=A0=C2=A0=C2=A0 * Pro uses bucka, not l31m, for NFC
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Changes in v2:
> - add comments for board-specific and unused rails (Krzysztof)
> - link simple-framebuffer to display regulators
> - Link to v1: https://lore.kernel.org/r/20251113-s2mpg1x-regulators-dts-v=
1-1-80a70ef42be1@linaro.org
> ---
> Please note that this patch depends on the bindings updates for S2MPG1x
> from
> https://lore.kernel.org/all/20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd=
@linaro.org/
> for validation to succeed. Almost all of them are in linux-next, but
> patch 1 from that series is still to be applied.

  ^^^^^^^
patch 7

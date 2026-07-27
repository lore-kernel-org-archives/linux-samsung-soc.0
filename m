Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E173DD51E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150594; cv=none; b=Z20lcjL3jRjrTlc0DGCphSeBD/sQ4qQkD9nsIIQqyA8jyr3Gq66adhj89yryLmYTpJGLDVIFcAhjYjteORej0lEy8HK/q068nCntEfVXWMIEYKUEnx7qIPqfMazkmoVk5a9zli6HWQSSNVEuQpcgJa3DiHIkwCCtJ3jGUsw+MHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150594; c=relaxed/simple;
	bh=oBr4OXPE9jnKq3p9VVCVdfxPt9HRQdoPfee5RHcoIn8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iDfjT9wkj9RQI0HGwzLwGBeggqS31bOl4FTDQ+FcXXFcoTB4qMS7u+zm8e8kIib+rWUGb26UqRbJcTbDngwI3vARMk/tIWe9fRZJELqY/nbj0FdndJkimy0uVj88XqtOksJ5R4O+9l9Ka1KvYAUZyt5qaN+GrXBFtcNkRLUZj98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWF67Zv0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWF67Zv0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954aff6088so21739995e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 04:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150591; x=1785755391; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oBr4OXPE9jnKq3p9VVCVdfxPt9HRQdoPfee5RHcoIn8=;
        b=PWF67Zv0OHQJoi24J4wZ7PCKVdQKlXNuKS3bw9gXsOLVy6CY2cToIVYFY3+8B7y+fX
         GHaF5jhERNK+2FGGEBC/zL6OpAXQHD7+h61Z5onXgCCNhnJauhjHX77ZPIXJAmpaVsNG
         GRzUV2QmyksYRiVlXSb7bJefFl18STcYhrV1AUwdrP2g99uiHbTYReaWo4z66Qb4Btgk
         48UwXQci4pkebMkqOMZUbxgdDAIuiMwCkF7QYXPHpQJkih8VM58sH+fPRuAQNzcGhIDk
         sNBhu4/ZVGbBb3IRuAJmTA8ZEqxWqT+YLysyou1m2aq0jXGoCXoTRLBMpg2d/7QiWfhw
         RgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150591; x=1785755391;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBr4OXPE9jnKq3p9VVCVdfxPt9HRQdoPfee5RHcoIn8=;
        b=NyXVPRTgZvglhlYeJDBq1hrtf1XFbRHNppD016ePVGsIVf/CYi1SUMpAyNvd12qCc5
         ZWIyokouNjQIvVob1pNabJQOC4a9MR58Qj81V8lI8dxDGZmUSOBW2n6hCAg6Bnf7lsiI
         scFfoAXvE0KU7VYTtubSL1oPM/5r68HgDkn6WsHGh5zrDSMmutK8hwQ9DfTcd8RNkLzK
         HLC3MG7sDSzSOclxTkFXCwB8U0o6taSlEl8Rucq3f2HwIiLgWnTEwmTyCRQNqmVzL8b3
         d/bS6SrbS26eRJCu247C43s5Y37yCcH9uZp91k9a8avxUCJympY56AyYhjOROSMv0/gW
         M3gQ==
X-Forwarded-Encrypted: i=1; AHgh+RohR64H4eW/4RB0dhOdmt6GyWCLQ97NhtajNa/NXquyHXIO/RVn2nPh2V/KonvDIMwkAvtpzU5zb4bfRFe/WwERuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVIFj+X/Jpj1Xfo2K+F+dgj6sorxR6RDFKhSGHcdOx+m/C28si
	oxITnIRrBbIRPglwmTh+QyfRqTtQtzfpbyjVMzAgcur8cahGdqsk5TAnI4UC67S+7KI=
X-Gm-Gg: AR+sD12qLEJJ5w8Msw8vtQ0VJsyt0bHfczgH0P0aDWu8vdGXbkd1vnCCiR+27Gr2OBA
	BPck0CmD8dXn627cQEt28FViSb5DdhzteD8qN6czetaYFdM+rZ/ksZfU2q13c6VDJFZxuZUnkza
	iTXaPfFRIKZKZHBa+DbCBY9wREo+Pv8Bv+xWVjLTyWG1mCVnapFmUnnfRTLnj8mu2Z0N8rddTsL
	WRlfD4yRaJ1RNPHs0lySYvFqi8hYlJTY1gAzxcKStcNEdr6HQaWLo3Tn9TIocT5pop7fHJ52tC0
	eLjBJHQcoL5FzmWMv/wniErGXfOtH5zXrOotb0Tbe4uPHZDW9ydM7EbFi37ucQ4A9eqe6CMzcQ1
	FouhLcuJQnwk3O+6DTY6yG0nQsVi4NPqZNxOq++j2+wX2bp7xk5lcOXOlfYbY74J041gFULcEBM
	TyfcKfBw==
X-Received: by 2002:a05:600c:a4a:b0:495:69bd:17f7 with SMTP id 5b1f17b1804b1-496b571c52fmr99418175e9.32.1785150591301;
        Mon, 27 Jul 2026 04:09:51 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4d8d6efsm243575875e9.0.2026.07.27.04.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:09:50 -0700 (PDT)
Message-ID: <0bb8cc072598421ab67c463322da429152d4f652.camel@linaro.org>
Subject: Re: [PATCH 6/8] arm64: dts: google: Align continued properties and
 add missing blank lines
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:10:09 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-6-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-6-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>=20
> =C2=A0 [required-blank-lines] child node must be preceded by a blank line
> =C2=A0 [continuation-alignment] continuation should align to column 39 (u=
nder < or ")
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 ++++++++---
> =C2=A01 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>,

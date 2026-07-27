Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2803F4DF8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 11:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151133; cv=none; b=YP0zAiB+ycUBINHYKwjNa39KVa2bonO7PnyxoGPeV97/yHhYVEn4OHUDq1HrLYSGHNff3BU+L2HbTKTDxO8JvqpkL5JOkQn3qY8yRTALkzIqSyRmlRaOvlspMWO3+fFfRNCk+2t6rTH0Ml/DQrrxaHqneogV+a22jn49LKfV1u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151133; c=relaxed/simple;
	bh=saI9rGv/S+Bdjv2TjtWTjnBCwib5vXrRGmSG6mtkl/c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WitRh5xhpUjyP+KECFqWE+jjVv9d+V1W5a4mJum0I/QrbHo9KeW2/3E1xAup4V5oM8tuek73d8IGoM9I2oGLyIvFNEZrq7jjjzRtTUI7D0uofHTRc4sig/qxxq1iQULyt3pLccH3q3xsdTFleQfBgpRHEnTudYbgppNGvdY6yCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w2FWVBGU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2FWVBGU"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so1574992f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 04:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785151130; x=1785755930; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=saI9rGv/S+Bdjv2TjtWTjnBCwib5vXrRGmSG6mtkl/c=;
        b=w2FWVBGUQR6hPjmVtPZxPXdqYKpBCsQg55SdXqwgMElPdKU6zSINmpgCLhuekTyEJp
         2YI5OYHFIPBK31CEBsMv6uwAqRCFQY5VxuxMgXv6ugUYn6t9GRwWHyQK8G9duZCG3TG6
         UrI3SWzYu9XWU/NxH47G9bhJLF+250PAF4f6+aICAMqETNeoUWUk6M+CNuo6tCDp3pa/
         Q/ZjHNBh7Lh4oxcSpeooP37u8CfKQxv1i+BcIW9IMXcZwfTOs7QRwX7ou+gl9FIF3JaZ
         LXyUm4x5OhjaaPIn0t4mN7DyBRkDUKeB7fyv8olJk4ajl8ml69jcH1RM59oKVxE4z0/5
         PIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151130; x=1785755930;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saI9rGv/S+Bdjv2TjtWTjnBCwib5vXrRGmSG6mtkl/c=;
        b=BZNwNTM/KzECL62LGEsnmlOtoyqTksXkrRpaiL88pDeTCe3qlE3sek1VpWp1yhs+ww
         xdcvulG4qIB4qixKE+KSpT1lfKXihQWXdDMvUnEF7mpFcY6VMF6I1zxAnbyYqjzRRioO
         66t/l2aV7nZGJs001E7C7KuqUJ4NLssyo066tFhZRSd0xHlIY+qGfOJAuMbhg30hTMeP
         BEqvQ4cx6ZuZJ1DHfACOSdYpZkWqDpBJU56rpXxEHPN4eqxQJhJuArl6ZAUh13TuHsXk
         fCToQPJPfPm1+NgfNu1H3NT60vH1cQ9bNOzCgNPoZ9ZkdXfWHfCNKRpRTzZ7he1sq+rt
         YflQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXibCdhKeNBSvJuX6TQ2ZdZpQylvr/1uIqXCxcyjm3oyLP+K0qlaM4oZ/A/rx50Arryn8m4F9b9RGsQZLU/AHVzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4OUsOI+hq1BQie33e9OPS9lduvRJuWtfXEdBWnJyK9DGuxkjD
	fwVWhkdwAWihiSgr2IKwgxYoFq3nwRkQg7729C6nDCH/L9/049dVFJ3MpJ1akgUTA5w=
X-Gm-Gg: AR+sD10sYZumUU+fmEShdaGvH4DHL+g/lTOUN7zNTF5Kna+mEsMVSC/PZjnrWdSQydc
	1jciKTY1OJolmIgaE3e7bUquMlzKULIyXR7Qne9CO8HskVxoCYuzHt1tWh5h9Zp0cpjhIUS4nQ0
	gyHWm/24mJ3ZsKV914wFYdUxYgTG2A7H2vCcGxdJzcoKIlIckocXR3M/A5F6qc8fVIEjpd2CldI
	bT25MKgLSLWhupFr4DfNJIh3rbTrHnCdyZidoW6+/lLQoh/vZhgN/AYESzDjIczzVhMcWzxrgQo
	iIDFe65136OOIYSmQGjpym1JONNGZrYOjsFhIJn9IKk8oY0u8FdL3MWEEg+g6EqXEMwCz9DHSaQ
	GeyX1yOI0DURjqn+fRKzJmC96H6YwJNLq2+FnaEgYVH77UGEuJRarRYLLQ/5wuWujgtjPeTuU0u
	aVhyNzgw==
X-Received: by 2002:a05:6000:2506:b0:47f:8ff9:c9bc with SMTP id ffacd0b85a97d-47f9fc8f23cmr11076927f8f.14.1785151130010;
        Mon, 27 Jul 2026 04:18:50 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm49134412f8f.11.2026.07.27.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:18:49 -0700 (PDT)
Message-ID: <485cc8cbd03a3a61f7281ac81ba10b866a73f376.camel@linaro.org>
Subject: Re: [PATCH 8/8] arm64: dts: fsd: Align continued properties and add
 missing blank lines
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
Date: Mon, 27 Jul 2026 12:19:08 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-8-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-8-e9e3e9879d05@oss.qualcomm.com>
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
> =C2=A0arch/arm64/boot/dts/tesla/fsd-evb.dts |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/tesla/fsd.dtsi=C2=A0=C2=A0=C2=A0 | 97 +++++++++=
++++++++++----------------
> =C2=A02 files changed, 55 insertions(+), 44 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

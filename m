Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7C42D8DC8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483797; cv=none; b=F8chO52hd+O7Gts2piQsKh0Yc1Wp/dxZP+5FkeikZBM6As5j9oOWBdhXeovWkzKBpziI5X6aZ7aZ8V7p9m3mm1CsH6UwpijMSXW9rnCRzK4arq9nHe/qN2Vu5oNirK3Lu1/hT9AZm6NoWDEgqvTk011BDYiPrxrEoQINr2qVRQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483797; c=relaxed/simple;
	bh=lwVb17SkiONM66zGI7EYc14PR6wYd2ejDZ3F+14M+Ho=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EzKQh4CPNW74VNfD8uYTf+vGNvBTRle0G61RdSLf0wYReTjVkGFHMBXU+ezp5SRx48FvdJYyXtoW2HY4z2mpH1JK+QPfj4iLKefjUdFJbCTiBYVsHAF/kXDvPlxXwdxzPhjkQsEGWkFY5OI8r6ZUuH+Fzb+XHtSZ4++dgFQYc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nC50Df+v; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nC50Df+v"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477563e28a3so30616605e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 01:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766483794; x=1767088594; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lwVb17SkiONM66zGI7EYc14PR6wYd2ejDZ3F+14M+Ho=;
        b=nC50Df+vf5jAcARCwiLsqBxoOojDnkXbKMgpjSgCXuBsx/YCqFqokLpahRLAHfkyg9
         fS+UsoqoYakTPR/IBsYw1W3NX9pRAJPgpl2Cl/nrFeOpeUbregNlT6r6SuuL57FCjx2f
         X+NNqDIDqJfGN8Eagxop6iGwFidfQEqEen9vGpgKI++WBQMCKdWd+ddHEVOAeevyVnTg
         rXHIPV/iAPib2MW3yW+xkdBRVYTWZw3P4YMicM1iEk9EcfM5g8cw51GJXRUe6dFfYSqX
         vFxIzHo6J9+vfsjPr8YhzyVq8Sd1Hpc9zQFX2+/S+E17V1N8t6bHcsDb1VBXKjte/xq6
         ciCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483794; x=1767088594;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwVb17SkiONM66zGI7EYc14PR6wYd2ejDZ3F+14M+Ho=;
        b=CGwdy1s9OaLfFBDjjaL68Nt1ehSKc5gOSbXTN2NPkl82gVrZhP+0CkCIp+6UTTJzh1
         MGHyOSylCBgMlmxgVec84BiLIzLKVVnblKuYYAaj1XH9WbXQIDMB8YmCkzMrZBDsJsMn
         +GmgJo2mlJrLEsiVLUzLgiSVRhnzf9dDkL8dwVYSCb3GKaA8ABdh4AjU4DfFO/gRoe1R
         +wQXUaH870sst1GESkqufe2+QfvonGKjmc0KN0EggR/oYL2NRv2FObkIlfxc3tCbBYYQ
         kixfJI+7duekba6CQiooc/RpncxX6WP4NarpQCyzZUtz6kP9nA2ItLasU3DJaBYezK0p
         Quvg==
X-Forwarded-Encrypted: i=1; AJvYcCUSW8BEO6dDNU4rGXXYCtYIExJWI2qpGp9nmyytmGJJozKMPjBX/7n6HVvkwvWBDun9X0PeVOOGgr3at9PPzHnLIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28aT7BP0Ej1DwUzBq6R813yslPIE7M+aUC9mx0lUracXPl640
	4nn3kZ4P+l4Pbw5VxxkkgYkUm4KGJBu0JlQ081BWq8AoUx9ivo2crFNQ0J1Zs6aLB5M=
X-Gm-Gg: AY/fxX5tg77N4JnIUULw+pN4fp3a+Ws6/2WoMB4mnmu1lF3mhT/amWcdU1DPIpS6KK8
	Cf3zkZcPHumVgD+lewPn3HrEbZ5EGKZnGGNr7DokeYqBVxZ7qnVR9R4fHXSCRbzvL5ZQHpcic0t
	qsp8agqFL6H4Hs0zL5t2RAttryJok4+zgVajIZB5eT/rhMdBPYprYEbkXzFuHkaaqCGMHqTgJpu
	NdK5bab6X1Lrpx4zKwjky4ybtl9IKw56v0AMyMxVjOoeJB+ErLUWH4ix4rmeqM1SbVpzkNgh+H2
	gC78R5xFeyxpqX/AbcgLHW488yN55xeqIG+gfQqNJnaFeX1OWYWR3UQ6jx+gj8iTtZkgabl0vLr
	hdv0J3JPbkMoEs1oexoeNQQ7ySjTAQkfVOwubJAp3UtxitBBdWRvW3nfz5RrTwtAOdua++Bhdu2
	R2fPNpF+B4SqbXuosWKTIrjbxWCXM=
X-Google-Smtp-Source: AGHT+IHOPoabgpxzbwqkJAWzHxPTOtYYAX+lcS7QbhXZKZz5wUnl7nSHBNAH+unsA401WC75ARb6aw==
X-Received: by 2002:a05:600c:8b82:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-47d18b99b99mr130415825e9.7.1766483794521;
        Tue, 23 Dec 2025 01:56:34 -0800 (PST)
Received: from draszik.lan ([212.129.75.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm228918095e9.13.2025.12.23.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:56:34 -0800 (PST)
Message-ID: <2150539a352c802372ffb9dbb3a47cf8b4e8a816.camel@linaro.org>
Subject: Re: [PATCH v4 4/5] soc: samsung: exynos-chipid: add
 google,gs101-otp support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 09:56:45 +0000
In-Reply-To: <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
	 <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-12-22 at 16:30 +0000, Tudor Ambarus wrote:
> GS101 is different (but also e850 and autov9 I assume) from the SoCs
> that are currently handled by the exynos-chipid driver because the
> chip ID info is part of the OTP registers. GS101 OTP has a clock, an
> interrupt line, a register space (that contains product and chip ID,
> TMU data, ASV, etc) and a 32Kbit memory space that can be
> read/program/locked with specific commands. On GS101 the "ChipID block"
> is just an abstraction, it's not a physical device. When the power-on
> sequence progresses, the OTP chipid values are loaded to the OTP
> registers.
>=20
> Add the GS101 chip ID support. The support is intentionally added in the
> exynos-chipid driver, and not in a dedicated Exynos OTP driver, because
> we estimate that there will not be any OTP consumers in the kernel other
> than the chip ID/SoC interface. The downstream GS101 drivers confirm
> this supposition.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 70 ++++++++++++++++++++++++++=
++++++-----
> =C2=A01 file changed, 61 insertions(+), 9 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

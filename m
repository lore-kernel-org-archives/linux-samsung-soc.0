Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A463A3F9A11
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 11:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150641; cv=none; b=qNhPYnnkMQS3BUhWaUMJD55L74ezs3g3qq6SoZPWDi3yMlfDXoHxEkKkImysRyZN3Z38mEZfjZjX6GNK5/sd4OesMyIPT0VaqVU573yIJNbKVOXfPEWTVmwkkPktUGn25WCBgfrh7VLVE5zQ2pok7TaF+K63hyppfOYCSQpgphs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150641; c=relaxed/simple;
	bh=F/kA/Y690WSDQmA6nTaxghCYq6fcNkFzKnP5KGG+KSk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UrIx+3zek0VEc1a7HPtVTNYmTmbKzUn3BTNhr8iyfEOQWH3UuwK87KyyHETMi78GYEaLOmIEuIJbwCVBABfL51wuGxNxZjjtVfF43qhM4UwrfQilMtZ+XjU0LA4NMEZPzMWE5qzqW1NB10C9WlnhVM5K+6hyOGMXOWs9NEOWEUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sKjTY8px; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sKjTY8px"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so3749386a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 04:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150638; x=1785755438; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F/kA/Y690WSDQmA6nTaxghCYq6fcNkFzKnP5KGG+KSk=;
        b=sKjTY8px4gaRY112NGjtSGBHS2mTLsZj2ywUd4CoH1O0//aJ9P+R7l160knWdxr8rW
         s+oHVHJ1OhGnSOTi3fYPwoJsObc5F464tjIco8/UmJZa9FxR4bgqtal5e3HYQCdHNXhn
         82N0xLWtX9IKuc497STnQoXcrViNJfu+oBS9FCTM5AjcfhutGnweLHMtjehg1GtwYJcV
         pdYaLKTKUHUkw5P2u3804mpyoeD+uCljN83LjALYvN6LGYeNYPeKad0Uj4TrbFHmzoi5
         YE17CU79jbGPdIUsYclY65Vtupg+ilBWMgt9W9rBeLgjkUoWFf9JRg/yCci6+RLGMuni
         AF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150638; x=1785755438;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/kA/Y690WSDQmA6nTaxghCYq6fcNkFzKnP5KGG+KSk=;
        b=rtLrKDDBzAgT9ls+p9XbvN3aA1ywJ3B5YmPA9YYUX4iT1WsSUbG5KlAIot0d28N2gZ
         kyw8teuDuvtiaAd5nc1n5NHVlfXa0QgpCCMjQFa/cUx88HIvXvinl8DgYoThriCn9csC
         5LG16/G6wAllp1bq3IoFTVeGIRAhIzErASQi80u8/Jetep5tmIOfC1fNx5Ap5cipgR/i
         KBnCQJhSkidKfqkNZGaJQ2/8lUpwOOxulEou3IOtslnq5MB88M36W3Cbb02NXvxy6+/G
         kQ1/czda5WBWCc4eTCqteVpBHTHiPc9vteSBPO2n0IcE1QHSA+S997a9x/fpC/BQ9EMC
         aayg==
X-Forwarded-Encrypted: i=1; AHgh+RpjpKClnW0C4U/ncT0LIaD7Z3nU3rrRefeAwRHBDbGKPgqF8HFKvoh0b/gwYk/C34e+lD1gmPGRDDRUbaP5xLajiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy98J94wsjsPZjqM1+JFj3e+9fjetyxlyDcBRwNL+Q/1JwWGpod
	HtbyE9KQRMXmQnDb4G44w0jzLgW9NDzDQOhbh0QUEm4UGJIMqOdGWC2d1E9iToXompw=
X-Gm-Gg: AR+sD1037NwAo+AgdA7Va3x/vHtCcyoXdmEN7jURfNV9Seph5/XUasMVfMsQnSm5bdy
	IXkknDEP9XGFT0Crn8n2I1BjXoGSy+8AwqTbklRZpz209OH6k/ZgrLT8RTlxD7JSBvdRBXSrMVt
	lDryrhNFmEGMyUcMqe7slwPF5XTbv5VIb4rJCeSbLyLKeewQ1FosAW3ldJ03ZpEW9yfBwCEmcsJ
	Qf7nfI6kQSWiwml9GxksxRTXk3k7TueGL+EosDKzxukuKvezlKIEdqiWYPWi0JDx5WlPTrTqfuR
	VIILhZmb/yEeCo/CznYfITo8Z5Twy1Zvr8jbiKtODMLM/3yn7Tuzd/1VZ2D9Z51qUyZeR2w7hlW
	3TDEwvfWHwMnxL3tvzG8OSkpC8fwawYUT4vt01uJQMomSa0fjbOz/1PIflVuOBpDXfirLmopiCb
	A4g9uKLA==
X-Received: by 2002:a05:6402:3899:b0:698:c167:91f7 with SMTP id 4fb4d7f45d1cf-69fc1170687mr3269674a12.34.1785150637925;
        Mon, 27 Jul 2026 04:10:37 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543ab7sm2469285a12.17.2026.07.27.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:10:37 -0700 (PDT)
Message-ID: <c2c816236de472856d99d22b5f6a286844ae3dd4.camel@linaro.org>
Subject: Re: [PATCH 7/8] arm64: dts: fsd: Move 'status' to the end to match
 coding style
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
Date: Mon, 27 Jul 2026 12:10:55 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-7-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-7-e9e3e9879d05@oss.qualcomm.com>
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
> 'status' property is special, thus DTS coding style expects it to be
> always the last property preceded with a blank line, as reported by
> dt-check-style:
>=20
> =C2=A0 [required-blank-lines] "status" must be preceded by a blank line
> =C2=A0 [property-order] property 'phy-mode' out of canonical order (shoul=
d sort before 'status')
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/tesla/fsd-evb.dts |=C2=A0 6 ++++--
> =C2=A0arch/arm64/boot/dts/tesla/fsd.dtsi=C2=A0=C2=A0=C2=A0 | 24 +++++++++=
+++++++++++++++
> =C2=A02 files changed, 28 insertions(+), 2 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>,

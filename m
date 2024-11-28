Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5994214A4EB
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2024 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732782521; cv=none; b=LuYLBXHM8CuEVfeAy5e28fuHw89HUoyM4IvL2KHbXVheZO14gy1ymFwckqHAVBhCb6EJwuyzBl61GxMvG2sWfqsPJ7eyacwlVV2qVvat92GGUFSjapAjbTqpk2LC+aqCKwz5ubrlenS7Azv7AVsnQSMjKoKYVtfMPdtJmlJx2CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732782521; c=relaxed/simple;
	bh=iBgmMatgfTncbI6Xxv9fv7699qHKcsEyga04yyzHrVw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ASRY+F2/w4H4Pf3qlSRibYT+VJ1wG83m2w8DK01yaAQfE61XctTvBXPbCvhtjKnEQZAEN/Cd0EGfuqja0jY7wyXLP0uu3Ayahvdg0psUCpKBW7dE+8c6TRZco41f0xTkDckVAIZTJN0F9Njy2A2/duX+Xd3Jnx1CESrM8yiIVnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u0Hlmanu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0Hlmanu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-382433611d0so511044f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2024 00:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732782518; x=1733387318; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8ce1Yw0qnP/hYgtuVuhHQzLquqkZiusD0COEs+h5WKU=;
        b=u0HlmanuNzHOesnJQlDV/gVXgrXAn5OQZ7OcYvIFLKkmRVEd2tmn/zBUruPeKBPkNz
         iJn4FWWx+N9uxFICCdS9azuW5uF8WBv6Kit9dclVvt0IoduESaPh7OJ16LPhvK8UeM8z
         9Mq86MX+emhI4d+HbcoT/MpNw2Q/U+hTJ75SGZf3RB58aGWetDvrAS5wGhu9iF4Rfu4Y
         Jm0Z7sApaUoJjdwhE4LUr2l8y6+fhdHwpldMgEhUqYQfrTpi8QNAwRHSCsDcZD2TeWCL
         MKZhmnov7M1xFh1G0x2dOofK1Kbtd68SUXTPZJy2OAslDFs7xNFP14503MfwsR4jWf7G
         Ch6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732782518; x=1733387318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ce1Yw0qnP/hYgtuVuhHQzLquqkZiusD0COEs+h5WKU=;
        b=FuIXOCvZlK+bMlwSw0HsC8AvA0sO2KbLUDa3jPqlgDTIRlQD9Nnjz8afR3a2Ag3nBH
         bJYF4WkE1GthcpXJVaNBUaYtdJMeNyc0mXECHbcfDzzoiXKmutPmTzYZ3h7JIZFM1Ep1
         zmvVaEEP8riJ/hZATPZXkU00n09vkey5SvdpFubIdXPLa1KVC/12cWnB1bllIgsNSM/a
         lOT01tNNUFS/HzER9q9VzYaJwWNVuA8lahn6vjZaAEGXAzLXgJDwg/gynQwdawg+m7NS
         SGwz82FJTJMIECsrgvKPaEHdo0FqjAa2Uha3F8FJA1lPMstYlGETz39FAGoLX4prthjc
         ZnJw==
X-Forwarded-Encrypted: i=1; AJvYcCV38hjdoPnQyqG1a3tOab1t/gLyeYWxjRVSMMMROnCYbAwyjBDxjWq3M5KHJaRjIfb+fxbT5sasoi67VRDh7ex1/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFlX8euOOwGdVc7XYI/3lIEcpj8uLMd639q/Wady0Vou3NAcj1
	j56Hbi8YQaixC3HJeFbmtpAlVOxlT0fHYsN2k3cuhMRlUfQvQ2AJ8WyJ4dKVTE8=
X-Gm-Gg: ASbGnctnt7Ei8Xm2wstXSMZjC56tODWqcCqUjXBkqNHhK2nYdmYbOwDUW1MKW0KCuik
	DhaYqffwZDW2EEYpm88ipqmG9cCKGjAthq11/GfViiI6qLdi88cWIHm7pjQmYKd87+tXutudoHQ
	hEm1447dMAV5kwOPmNAUhH1CTsZpJD5fWiWguzLLVnmp9CGA0lB04cJmiK4/Rf9P3x64iwPpLsS
	dmlDRTaL9hjxdIIAl0xYqAPWdl7Bx60cD1spIbvHfjDiPXdCRnyxjE=
X-Google-Smtp-Source: AGHT+IGTu0qgLLjoHLlWHxSoBIFSoj8XfsMG9AhcjE3+CF/PWBajZkgTxHHhlbUBKXo2AHNhIEwVew==
X-Received: by 2002:a5d:6dad:0:b0:382:3959:f429 with SMTP id ffacd0b85a97d-385c6ccaeafmr6070314f8f.5.1732782517632;
        Thu, 28 Nov 2024 00:28:37 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3a54asm996072f8f.50.2024.11.28.00.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:28:37 -0800 (PST)
Message-ID: <663f534cd88332ecf64e575ea0cfa1f40e303373.camel@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 TCPCi
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>,  Alim Akhtar
 <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-samsung-soc@vger.kernel.org
Date: Thu, 28 Nov 2024 08:28:35 +0000
In-Reply-To: <b0c5e443-79e2-4e53-8813-57044a627dea@kernel.org>
References: 
	<20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-dts-v1-5-5222d8508b71@linaro.org>
	 <b0c5e443-79e2-4e53-8813-57044a627dea@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Thu, 2024-11-28 at 09:19 +0100, Krzysztof Kozlowski wrote:
> On 27/11/2024 12:01, Andr=C3=A9 Draszik wrote:
> > ---
> > =C2=A0arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 99
> > ++++++++++++++++++++++
> > =C2=A01 file changed, 99 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > index 387fb779bd29..5f7be0cb7418 100644
> > --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > @@ -10,6 +10,7 @@
> > =C2=A0
> > =C2=A0#include <dt-bindings/gpio/gpio.h>
> > =C2=A0#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/usb/pd.h>
> > =C2=A0#include "gs101-pinctrl.h"
> > =C2=A0#include "gs101.dtsi"
> > =C2=A0
> > @@ -90,6 +91,84 @@ eeprom: eeprom@50 {
> > =C2=A0&hsi2c_12 {
> > =C2=A0	status =3D "okay";
> > =C2=A0	/* TODO: add the devices once drivers exist */
>=20
>=20
> Is the TODO still valid?

Yes, there are more devices on that bus.

Cheers,
Andre'


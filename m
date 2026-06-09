Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFA33EBF02
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005493; cv=none; b=JpGd6IrgIzTzV0MkJHnNTSVe3vyvJMqn19r6VmDnl6H1fAgAeHT44Tu4vsziy253zWeKFoYhgYFMzeDV5L+p6cA4LZb718714ZNJlae84wyhlGWedrJurTezGbTBEfYDf6ToC+f3KbQPFkod92hdVZsVKbm+4NYmhqljE9dnDNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005493; c=relaxed/simple;
	bh=YygPCiAmXiWrvewKwYWtyCzbkJfaFZJYqrm32SMOdfc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bDoZWWzMuLZXXd17bGDUiaTWFTlaMBpFx+CZXXtsSOm10m0ge5rTssr67pWBQ0HE87JAivfu3rFH9YuEzjxuy6vFfocOxvkHmoPgj/gIolW8SP5GR8o0yDB24mITfY/J22thctWFUohtUu1914WJFnu8HXmibE4wLhiVf3sJNfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MtG26ii1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MtG26ii1"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68b90fc6a1dso172205a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781005491; x=1781610291; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jVtKsScmZpYoItkBLWZrzYfhywAVGgLQpel9i66ubjc=;
        b=MtG26ii12BO+NUu9y/zgI2ET6cVwpxJJsjdg8MLjQwNSQzb8ec8s3U2O4zcikD/mbz
         VYAvyW5NWnIf500OmAHtNokBj8DT4vSyAV2qlnAHPRDY/VZ4ZiI6Q0qqw/t9BCx+91zR
         1ITZQHkekqPktZufU1PXlje0xF3aYwQ0AbmweRCvgLJBei7S6Q4WpIIpsYcXfn79ajqk
         mWTo4Z8pTAoDAT24ViMaZnDnGwFQhMLc4XR1Uf+x9MQIdeMzyQAtPgpUplTDGBPYE91M
         XrbkOHhhom7sLE8D2i7Fbw4n/PMy3o/08mtIxiNk41ZRkb6Iu9AqZ6UNoWnwsP7fRoau
         yTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005491; x=1781610291;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVtKsScmZpYoItkBLWZrzYfhywAVGgLQpel9i66ubjc=;
        b=AXdtXqkEwZKYyTkp1nOKbzohmNymi5FipRCQnH9agPcS+07OTc5QBFxCHwO5wO20EO
         ykksC6F+cZsiKbqb/QuLxuCQuBpD5irif/v7W8UDlAKNct8owk3Dp1MM6JL71BAQjm7a
         P/ikDAOECywVMUR2uJ5CNJSFyYMlWQLJSZdWqLxt+K+6Ajeo9LBDEQLlQX9THpfMXOVY
         ovEsYa3pttac4T3SuGGyOmc+w7UWyD2Zf4kktN6ptgwJoCDjRZ0b3owskDt/LIWmauG5
         yUouroHOuc4X3DAqps3GSnIVqUP+GuzqRAlMvi7yPM7WrRCARrvGhN2jWJqcQ2bf41Wg
         sWiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jZqa0KBxwVd4P3lZnYzP4/pvBYEj138mrYbQHE0Jxru2+ii57ujhBB1NOSkFgTkjR50qfLPjrSPt7vkLSTx5f0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOFoiMKMkaAqRQSqRrAhzwmJ5VP133rHaCuhiZUhUGB5lkv1pA
	l4YSTxOBUiuOOhsewIgciJ3AiuTbhtHtbIDwBDxGgkts8lXn4j56QhyBs3h3F5QD0ik=
X-Gm-Gg: Acq92OFcUF4gJxRClndHUSORp0W/i/Iy1mRWFbaYyjh1e+ISXVzN11N3l/iGMczJfWS
	h6SZRniz8spuj+q8bH7VebEtdHV++amgo0X3X2JUBaRHJlc6CJN6HS4tXFtWD/UJtDbWlBMN06l
	96lUpYHQqdOPgrJ9qdK90U538lIsE+2IN9eWocu57aVM0lxGY1mrrl34PiTEUiY+IZHw9Ega+wk
	xSk1EQaublyt2nLpb9sy8ecyqYHpbqf8dCUshQe9JHctcesXkyLXcW1KbepmwqvCvkexayxuyTw
	/CuPxa5TB8qZRwKsMgw4pmBEmXPuIJt2hUWBij4GDUoD0PpWPp4sfTiIUDqGiK2C0+SmsbvcX7/
	4/yF01Eu9wurzoBHX9fFfm6zJfeCOgbWrXPlZb913rH8iWkEOKJI2ofrfqEtiFezUR+f7IU+Xu1
	f1VNQ3yCTyFY4mSHvXY7S1ch9TagHZTHTvdR2SWrs1bcG7CvA568fFNr8=
X-Received: by 2002:a05:6402:4250:10b0:68c:3439:945f with SMTP id 4fb4d7f45d1cf-68ff217a53dmr5586490a12.12.1781005490656;
        Tue, 09 Jun 2026 04:44:50 -0700 (PDT)
Received: from [192.168.107.26] ([80.233.69.159])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm4516495a12.29.2026.06.09.04.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:44:49 -0700 (PDT)
Message-ID: <08d7299968e14e5fc07fa4791479abd9a2b11c2d.camel@linaro.org>
Subject: Re: [PATCH v8 4/5] arm64: dts: exynos: gs101: Add thermal
 management unit
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"	
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui	
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski	 <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva"	 <gustavoars@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 09 Jun 2026 12:44:47 +0100
In-Reply-To: <20260603-acpm-tmu-v8-4-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
	 <20260603-acpm-tmu-v8-4-0f1810a356e6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Tudor,

On Wed, 2026-06-03 at 13:00 +0000, Tudor Ambarus wrote:

>=20
> [...]
>=20
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 86933f22647b..b6866ef99fb3 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>=20
> [...]
>=20
> @@ -639,6 +647,15 @@ watchdog_cl1: watchdog@10070000 {
> =C2=A0			status =3D "disabled";
> =C2=A0		};
> =C2=A0
> +		tmu_top: thermal-sensor@100a0000 {
> +			compatible =3D "google,gs101-tmu-top";
> +			reg =3D <0x100a0000 0x800>;
> +			clocks =3D <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
> +			interrupts =3D <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
> +			samsung,acpm-ipc =3D <&acpm_ipc>;
> +			#thermal-sensor-cells =3D <1>;

Vendor-specific properties should always come after generic ones
(samsung,... to move to end here).

Cheers,
Andre'

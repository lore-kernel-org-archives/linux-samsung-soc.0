Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ED13D56D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714389187; cv=none; b=Az7uupq5tT9mpDs9pxV0y/XmXD/dcW/+3cVOH3VdGK6ExCKv/NZaUAn9eOLUkf9BHt4ArH9DffBsV3RWHnGUM+XHNNrBYWvU1aQzrQsBdFvlrq6CPXt4sXe8GpdNbO0zFiHYonS3cd8ABZt7imVuJfj2Vo22fpp+PChbq8EgrBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714389187; c=relaxed/simple;
	bh=9hJh1W5+aL+8Zv6IjFy/ztsTkqQ3RtQvOMpEczUxByc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyFZ1pMDb5dkGAve3Ro6pn8AW28AFjaPTCkZRKUrdJK6VhkJ4os1bE+qFFVFbzLiMg03zwfUyHDla3oLXk4dRchGU8qOeKa9iVt2b2wHChXnwuKX6E9SXgI+JqbBuE6AyRYNVPQkZyXJzQeVCsQ/jihEbCk+NOEtfRdKy7Z6PP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k/SMz2EI; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k/SMz2EI"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-de54cb87998so4621195276.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 04:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714389185; x=1714993985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCUjXKfwMCycYwkG/NBhOCFT+Ttz6DJ9tk5oFOpWHno=;
        b=k/SMz2EIShi/E44xMDf9n4uuzCQjMQr8Ym6xAV410Uc0fj1EjpgYuKIvNtpFHAf/Hb
         b8WEt+dF6rFjaXWCYJXRn7YUlBqj9t/edDng/5GhkFse0KwQ1wNHCH7wmGKgstEgvdD/
         BYkq7dcY80F99bijCdVWB0pl+hC1o55CdLtu3jeZ1V7o/1rBOEhSGPBwHfF3xuAkAJAW
         9EcsOwQwimCxFMyTcBUtuU83q7FngAJwiHKXuktmJxPCAz+3sJvfjTVBAgvuiB0yJOrn
         rtwsd2vQuIyyGGIME3XPnm9n/36qJENmL0TGBK/+VIc2UKKWpBhZhzq4VSUPTbkq1HvE
         1pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714389185; x=1714993985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCUjXKfwMCycYwkG/NBhOCFT+Ttz6DJ9tk5oFOpWHno=;
        b=NFIn+rayJVWgCknwLEl+x4oDfNgsuaajnDYLg54BykqPYq5EQ31Z7wzY/ZGRMeHXkz
         rzd9ooHZnEHUmqe9ZmlK4XCm6s9R3iS3xbIjZmOb41LtpNeUYs8XefDvLh7eq/K65zu0
         6SJ71UdkWc/mT115A14PWZBJC5t1wioR9SMLdTIAXVIIIg4CRSZCevOh8J/vG737aFrn
         lWdiYSzRlmnQLU68es9axQyBx8iHsQJuPUq0XLaAp/vOiurD7BsMaDurL7c4DLHfOQcT
         DQjq1h0sVSZE/XXwacMwAeMsEvk6Au+dPTxJHiSV7lMdfq4saDZ+V+LkDcmE+0IJ8Za/
         frtg==
X-Forwarded-Encrypted: i=1; AJvYcCVpn0XQtmW5gQ1V9U7ksv18ybKaLeA7M4fsFv24HW4MB7VYFH52MTQQYLxllyP3YWH+aovNu5cHNDgyAx6X9v+ZBLocyrT/235WDzQ9dnXmwLM=
X-Gm-Message-State: AOJu0YwpWow/oc0duxkyq/nnladTkP5hWjFOv7vAl1fft+gQrJjn3NYc
	QuekB3xnfej6hJ/PzJFGeUdR8GEe83DzYSqxzzlw3V8Bzevl0W1WDZo+90pss9Za5+fAD6mT7sy
	mzS3WoxenYChKj/a3/BF+aCWpIBB+Pd796EZZwY8iLsDZ8pExkBI=
X-Google-Smtp-Source: AGHT+IGg6vApkQfrk9eGR9HKWZnY9fYf0w8I8PYNS8ArJlLBMftPjQS5XH0WAwsHxfYhQ2ni05RUhCYWcs40TJfq0q8=
X-Received: by 2002:a05:6870:fba5:b0:23c:8959:3bc9 with SMTP id
 kv37-20020a056870fba500b0023c89593bc9mr3665848oab.36.1714389163905; Mon, 29
 Apr 2024 04:12:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426133824.2283144-1-peter.griffin@linaro.org>
 <20240426133824.2283144-4-peter.griffin@linaro.org> <3377917b-556f-4502-888d-a0032b195833@kernel.org>
In-Reply-To: <3377917b-556f-4502-888d-a0032b195833@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Apr 2024 12:12:32 +0100
Message-ID: <CADrjBPrjevFiz=o0fWcFhKQADfO=SmC5ipZ2D6LZHc8b6XGk8w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sun, 28 Apr 2024 at 16:50, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 26/04/2024 15:38, Peter Griffin wrote:
> > Add the ufs controller node and phy node for gs101.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > Acked-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> >  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 36 ++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/=
boot/dts/exynos/google/gs101.dtsi
> > index 09044deede63..4679ca33c6a0 100644
> > --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > @@ -1277,6 +1277,42 @@ pinctrl_hsi2: pinctrl@14440000 {
> >                       interrupts =3D <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0=
>;
> >               };
> >
> > +             ufs_0_phy: phy@17e04000 {
> > +                     compatible =3D "google,gs101-ufs-phy";
> > +                     reg =3D <0x14704000 0x3000>;
> > +                     reg-names =3D "phy-pma";
> > +                     samsung,pmu-syscon =3D <&pmu_system_controller>;
> > +                     #phy-cells =3D <0>;
> > +                     clocks =3D <&ext_24_5m>;
> > +                     clock-names =3D "ref_clk";
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             ufs_0: ufs@14700000 {
>
> Unit-address order got broken here.

Thanks for the review. Will fix

regards,

Peter

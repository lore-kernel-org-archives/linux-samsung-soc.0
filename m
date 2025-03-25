Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931BC19CD1B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742889720; cv=none; b=W0ebw5GSyC/Mz45zSwM/qfjF0gycf9ioG/wkrwjH8sWdcZSriCCwD3fsLTKxzsLa/tMgwaRgxTKl7NYRDuLWHDOcN7hdaHw/yTBRk4+ETAbypIO+Kft2lFy38T6F2cX7hxtZ8y+gTTImjsqizYg5Adu1h5R7Z5ceaWq6Fsrbvfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742889720; c=relaxed/simple;
	bh=D4/deZUrRvEFZ94m8Q9D3QeADW4HDx7z0RXbyw/bQXA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nYG/robCf7K/beRgY6oVCC1swQOESX6QMk6CL/veeRGBSgitY10nrzJ2iU2U/13pmMHIgAbxnXLZb3OT243LpPtJew46J7co18Aqs0RY63gBMTQrPcSEN8mZTBTQutTtn0llzPTw2S/lT9pmc728Yd0eKV8FQSl+O1Z6xQ9JcNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GbxjZ5GH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GbxjZ5GH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso39518515e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742889716; x=1743494516; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pw9b1PNCrvCj4pipFtdGJnivRzpncTcPSw1C2hnQDIE=;
        b=GbxjZ5GHVrGPlrYG271WjOTid+0g9iCvl8JOwJJIbUDkpmIhpPrxsuF2/EdDO/dLJL
         zWhkPNmZG1eAL2Bd/S2lrpGXAXpZrdmirHRs/shLz/X8rUHuXJ1WtzwHNInZHHm0MS7p
         tbuV5nbFpH628EepIEopyZnT5iwUJ4f5kWaI0S1rKYuKRS6jvSndlw/OXdxYTX5viU3z
         mclJilgWwEYdENsc2k4XOv+54mFoVHA/FsXkG30r3D3mCwvZfm0UNuMvlD4jd2B7EcUw
         57SssvJ87Xls+23gP6MrV2GxyZCV/I+JTf+HOfpFLoJblzBv4s2Fmr8iVuZnojlbzVIv
         U1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742889716; x=1743494516;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pw9b1PNCrvCj4pipFtdGJnivRzpncTcPSw1C2hnQDIE=;
        b=QhP+Swgv9vUkRECgumkGFI8O03OWA3nHFcORAJ29TkQYndNSmS2aSPkpdzYqDikxUn
         VmrtIV6ZVQm5KI0j9Jc1K6zPl5Jwf3G90QrB1Y9IE06izOTfGTGG2IxZbs404WrIGgjU
         aWHu/bkkMY+q9CzHhYITGErh+ngTsrDJ4i9FRM5mjFBDiCN0//BNIds26SIOTFLGjgI4
         s5gVFCzHbqHH9v0UK2R9Ni/VbFZvT4ibhfRAi9GOVbfJQks11dtsbhiunCd8llVXHwiI
         WOgLZzReg3/6eNbFTXK7zKSNmsBaAf5XBKacWtT8nBbskQg2skwHCLmKwAmCr3GVnYnE
         pXpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/VhxHMnTdb65JexheQvl46eXU/G4A53OtMulcSTYyVz6V/QmAzKXMhm3417MQ9yG3A27e2mfw9FymdDWhuiO2ig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+JTjD0WRe9murLmqoIv5cgYgx4Ljb6h6yBeuloZsJyf64rRal
	2flM4YAifmFEn5nhvr0EHs3BDN8qyk9k5/d5ze3JjHMVzEjbnbc7Teid0tHPVlY=
X-Gm-Gg: ASbGncu6p+V6MJf/73fCn5anjyNKlMUZzt7ujfsaI6EJPYZii/0qLN+93te6Qidg7gb
	DBT+hwAq+j/mFc4EHhKweTHAc9cs9GUpMFehzzYyyo3VYjGHhDBidKljtSZrp9X+gIrK49OgSuN
	3XT4KJLmNtj19ghcP7epq2p8sUyGwlOm2MaKV8/GAcOK7Y+hOxXpHQg/ayyXvSTALuJmSXJJn1o
	rjeldsk9JKJUH6A4bGfycfZtHhzGioGIaYLyCIcivwYPuoADJLlSwlmaKdGrbtSs/PbXPJT4spG
	NN0hb4j2l5pLicWZQATE119jEciKZWQAd/wHamZEmGhtC6QNRg==
X-Google-Smtp-Source: AGHT+IEdKMh5Vkn8qIQcdV6MaRJha1LCACg2NhchPePa1fLHxwn1+onjPFo7rIPkaF3e2QGOEbXqGQ==
X-Received: by 2002:a5d:6daa:0:b0:399:6af3:7a77 with SMTP id ffacd0b85a97d-3997f8fe892mr15837727f8f.19.1742889715763;
        Tue, 25 Mar 2025 01:01:55 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b5939sm13303207f8f.60.2025.03.25.01.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 01:01:55 -0700 (PDT)
Message-ID: <974ddabee5a2a43b9d32f382ec4b13afab066f1a.camel@linaro.org>
Subject: Re: [PATCH v2 2/2] firmware: exynos-acpm: allow use during system
 shutdown
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 25 Mar 2025 08:01:54 +0000
In-Reply-To: <be580155-372f-445b-b9d1-2dc4fbf1c3a1@kernel.org>
References: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
	 <20250324-acpm-atomic-v2-2-7d87746e1765@linaro.org>
	 <be580155-372f-445b-b9d1-2dc4fbf1c3a1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Tue, 2025-03-25 at 08:57 +0100, Krzysztof Kozlowski wrote:
> On 24/03/2025 16:34, Andr=C3=A9 Draszik wrote:
> > +static bool acpm_may_sleep(void)
> > +{
> > +	return system_state <=3D SYSTEM_RUNNING ||
> > +		(IS_ENABLED(CONFIG_PREEMPT_COUNT) ? preemptible() : !irqs_disabled()=
);
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * acpm_dequeue_by_polling() - RX dequeue by polling.
> > =C2=A0 * @achan:	ACPM channel info.
> > @@ -300,7 +314,10 @@ static int acpm_dequeue_by_polling(struct acpm_cha=
n *achan,
> > =C2=A0			return 0;
> > =C2=A0
> > =C2=A0		/* Determined experimentally. */
> > -		usleep_range(20, 30);
> > +		if (!acpm_may_sleep())
> > +			udelay(10);
> > +		else
>=20
> ... and what do you do if IRQs get disabled exactly in this moment? This
> is just racy. You cannot check for a condition and assume it will be
> valid for whatever time you want it to be valid.
>=20
> What happens if system_state is changed to shutdown in this particular
> moment? How did you prevent this from happening?

Yes, and that's also what the I2C subsystem is doing, AFAICS, see
i2c_in_atomic_xfer_mode() and its use. This is to make a very
specific corner case work, similar to I2C which has to deal with
the same issue during shutdown.

Would you have a better suggestion?


Cheers,
Andre'


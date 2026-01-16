Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20033FFD
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 21:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768597446; cv=none; b=hdFw+EPsj993PpCq/4D4+DmC4CV6CRKjE/gKwzLfifgs6F8uAEp14OjcP1TXbKBScYCoRrwetkPnSM2X8o1ovWdlLT+VmZXc/FILbuGXfFXx/q6AFK5ZIwsuL1+OJM+z/4iKkFy0X5+eqMCCNptnJ5UffnrxNCKWepkQBc44EX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768597446; c=relaxed/simple;
	bh=1FfRnA53OEHHdTrZI7DV6CsIrOl2QHBNcV6m//+UkBM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ma/CVBaMuWoWIqfU/UYBMhGMofdEzslasaV4FhNMgRz1cE1p3k0mVgApIiHVkHRvuRTcELr/RVA6G+gWO1sDnaq86dv60On3h8DWQkdLUhlAoAL75oKK4BYYEw5gYX1WVCvRVIkM/45t+NIDA6rbZKGFBYtFyOTEHGrAzqA0xEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ioVnxQLE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ioVnxQLE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43246af170aso1414046f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 13:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768597443; x=1769202243; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1FfRnA53OEHHdTrZI7DV6CsIrOl2QHBNcV6m//+UkBM=;
        b=ioVnxQLEloR+c9hwhUSsmJ8eSPqNbNDAjPB7hyUJImvAvo3rHqYWXYiCqpVzA0aH0H
         62ZA64muOhO2iWg0sVNe8zJ7ihgY9OoKOt6Tkzk53ToENBGHIbIJdYd90+vNTODAgtqM
         W0tuyyH6twhozH+i7vcWz2qxdJ+AppNm11pUpsM8YQ6hHKst5e1G3tNeLhuM37k+S1A/
         pKdM0RNNq8TUZ/8dnqQrABRpHX31478u1M284N0ABhuGNwVEeA4zvC5UezeJEGgLRnsz
         v1655zH13oZ+Z5W3qyRNg7R7dletKJKdHlkr29Qc4h+2I4xC4DSMlpJsJMw5Vuodf7zW
         1HKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768597443; x=1769202243;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FfRnA53OEHHdTrZI7DV6CsIrOl2QHBNcV6m//+UkBM=;
        b=hEwx7b5TyXVu4kRQ8o5eqO0U+zI5EsxJGphI0Vz5DdZOhgzDrGjtMmaFGOTro5FCyQ
         tMvyDn6lHU7K1jYG5aRu6GOK315q5Oz8Hns+d8wBD/6KLPTBQ4IUfuOuhsk3zdYLsymP
         KvPgsfKxkLAsEi9Yw8UUlelCRB0VNzbOz37hlR3Tw22y7WSLB8h4kZbsQrBbY4byDvV9
         nSdzb1ba0y/TX/C4x4BnJ7FgPK2xnpTRukkyq6m1W86c+uP10MFMNlKs8BeVLhOyiIY3
         oTkOCdMdMMo+goBY/Qbe977RFZj6LuZFSDLWxNhvVOWCcRNo+h7Xl613Jp54tQNCutNA
         wkqw==
X-Gm-Message-State: AOJu0Ywb5wNXAtsSolMYZpKAtpdYb32oL7/lcsClToWXr3JGTELwh428
	E67tay0mihqp6IaFh780vrxYRUAiSDiQ8/6Zvf/J9mrlLLGJqbHF44Tc8x/r+8X072Y=
X-Gm-Gg: AY/fxX5j9Myg3v6OuZ5tl+20deNRMOlrRhi91Okn0SKdLqrY4lChPufD8NDeIFLBHWd
	91fWDuYrESJZdHfTzeynNm7isB4u4V6pgQPa0yvGDUWHc/ZUzjz7k8swpke2+IzFrvWbGzWzp/8
	yAAt866MSM7WBoEwgxKgRyE8v2vKX21o1dCKkVmBfPsfrj9qqhxhB8r9MULNvchCTjD8EAZk5Dj
	M4YXqQsfZ2zDKADydjW7hz92T66ftt3EKlnNh/iq9vm415gPMfPrjps0XIB8ap6i93Ih9Qt2UD4
	p2J0/YA+jrc71fxgIAhn3m+ufHoIuQMI0A4pa/MZE6E4NDDlzq3E1un2tGBed8kU1mDTgosMBK8
	0aYl9LZyrZxVSyNjee5YQ/25WfNaeQp8I7IA8qai+Z/CJBPPJvnZ9fmDSGIfSrRaRxxkIlC6EBA
	bDkjpUeNvEmezydOA6/ZoNHqN2G2I=
X-Received: by 2002:a05:6000:4387:b0:431:2ff:128f with SMTP id ffacd0b85a97d-4356953f817mr5707648f8f.6.1768597443017;
        Fri, 16 Jan 2026 13:04:03 -0800 (PST)
Received: from draszik.lan ([212.129.75.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cefdsm7111605f8f.24.2026.01.16.13.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 13:04:01 -0800 (PST)
Message-ID: <ca7bdc2a0df16b2cf09bda2b4fcce95932eae0bc.camel@linaro.org>
Subject: Re: [PATCH v2] mfd: MAINTAINERS: Remove Krzysztof from Samsung PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Date: Fri, 16 Jan 2026 21:04:02 +0000
In-Reply-To: <20260116175646.104445-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260116175646.104445-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-01-16 at 18:56 +0100, Krzysztof Kozlowski wrote:
> Due to lack of time I did not perform reviews of patches for Samsung
> PMIC drivers last year, at least not in timely manner.=C2=A0 I still can
> perform limited testing of the code on hardware, but that does not
> warrant having "M" here.
>=20
> Maintainer should be responsive, so drop my name and shift these drivers
> maintenance to Andr=C3=A9 Draszik (from previous reviewer role).
>=20
> Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> ---
>=20
> Changes in v2:
> 1. Add CREDITS entry
> ---
> =C2=A0CREDITS=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++++
> =C2=A0MAINTAINERS | 3 +--
> =C2=A02 files changed, 5 insertions(+), 2 deletions(-)

Acked-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


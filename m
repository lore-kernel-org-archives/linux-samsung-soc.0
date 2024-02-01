Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AABD626B0
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Feb 2024 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706801023; cv=none; b=KJS6RnPVM8m7upAT4MfSCoiM4h+DqIm8U4omCUdbPFzXonDRCIBmMRtQcbB9Q+duiohMrO/hFLZ9H6Cxk7GW5lcVYMyD+Kd5C3MAszEpphJL97mGmzkmr0+QZEkKrIRam/96LyqaeSHzi6WpRTkIkGEO46Fj5IpF+J+DCAGKhD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706801023; c=relaxed/simple;
	bh=PMSkrVfo4wCCBmsgQRZ5v3SqCDRO5S+47GIBIeR9PvM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uQoMZOKSfhpTQRLN4Rc6XKMHtG2iPvtAU/pPLKkZRjkDoNtjzgIc3C2aRin047T7+OmFJ9tCkhWhnNPsKHqx65CtvX9bpwxz3DvkdZVuXYZgf6hOF4WsKclsdeYQGyllPMdDBuqzAwfl7q0LmLvzv6L7qihNeQH4bIGdficGte0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cv3YHO2q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cv3YHO2q"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e80046264so9445605e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Feb 2024 07:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706801019; x=1707405819; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PMSkrVfo4wCCBmsgQRZ5v3SqCDRO5S+47GIBIeR9PvM=;
        b=Cv3YHO2qnBmigGCP8Xv/tjBczT4dE29eLL1j+R9uAWt1IyzvNFHI8zf3iePr5n0D/V
         Jikeirzkahkdm9nvdk7Be3Z4VrvcLRCXt0SE3YxY/Xg6QzbycRDW/yP5Et5109lUr9DM
         k6Sr7dLlKHsoaKHD/kqnC99rDiSKLGHB0v8q0y8CWNJ9vFqv6BfQ37sUds6QtRnMyJdf
         X0X+QzA0VOn4qKrOmJ8xuOW7LMjeGczE03/SjQ4K/IP9Bdp2M8VmPmikB26hAaU1CgRp
         z+DKxZcDFd2OFVR/SNywrjuYOEQY0eYKhmMsI4ht1rwNLl6W9qmnm7b44fH+XRVbVN/v
         2KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706801019; x=1707405819;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMSkrVfo4wCCBmsgQRZ5v3SqCDRO5S+47GIBIeR9PvM=;
        b=sf+mRD/Iat23l7QTbQXdvurkAix0LCdfolti1LV3Nd9xxlRtZJl3oK7F+3jBr8QXvl
         P+CBoHl7C6EoEnzNIeEX4QnZN5QpVL3qWsZ/jTZFEt+L77Exeu+by94RnbKo4rPWRL1J
         b3hkGFdxX59SK7HpWTPtFuM2XEizHVrg9yOTHRXLU1NdGa1SPij7prf10jbWOS/UI73v
         nkuaGvxH33lhFXN/eXTvQXnrY178qnMPxGkv2Gn7JQHwu6ulcq0pYRyGJBCKudJfJR4V
         DUG1Fg7gGFJgUFEx9uJCwNqRTE8K73hioT2gsm2VM6oagEPLHfgEaKYYM8mFWubD8Ox+
         TJJA==
X-Gm-Message-State: AOJu0Yw3O8XuSb/K0hRQxnuLNoWvWz5SX0JYlbnfTpf9fjfQR57ukTW+
	mjLnUBpTGT7R72hKCoTcbSnOoqp2jo4tjjFZOd4gFbFnUCTdwFKWUYrG2UJwLJU=
X-Google-Smtp-Source: AGHT+IFodjNDyMaCtYuTqV48vhgStAruvNKrxCZcjt1dAxjJZdOwQCmscUUIOnKz7B5yumA8IslNvg==
X-Received: by 2002:a05:600c:4e8f:b0:40e:f15e:10a8 with SMTP id f15-20020a05600c4e8f00b0040ef15e10a8mr4135288wmq.27.1706801019449;
        Thu, 01 Feb 2024 07:23:39 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWL0d7Ugr++UEHsJvIKxBYZi9F1A+/6aubU+Ro8eXX5vxRO+mg9PgqLH/KrlyrNxir73EU5QsKivnH8EPMWDirtNVQGVZQp/dFNwJcT8Pput4S6nynwJVCnKwrwvgR8gZ+sHoE+dGXvEcAUZ5tQuiMDb1ZNN5FuGDvpCPs/BJDWg3v8OffzNMQVhA91yTqpyM5BKqBVhY+8i4RMPl7VgagIAszO8VMZKAaqgrGTA2rvNU3PzMy+NegVU3ivUBzi1OzpztrmjK+qNWtwZRKXiIZmhbb5zJ/pkIsMQMbqUVQlsQto6x+ZawSrPYgZURyjlAaTpD0PnmGRouCpwcSDEY0ZAxF71Eu34Q+drwcNiHVHriAzjMvimHcTHFv+Bsrr8XRzxiRrKrz12thShte6WF4KORgdjfO31VfCkanLtx0DOXUINNrqTjJ5wTLzmhpiwQxxLkcCbNTKzJ+ria7oJvPOv43Djp6jgM0kNDI7nG3Fwps2+aj/qvEb6ycT3uxNj2YFKxwtSEva+tTznbThnS8tcAyaQCvt+iI0oZnzwOyi8oP+IzVXH9VJjEj2fv1ATjWYczhMbNwGThcxB2KRYV+SIeMFP2ihcf0NOwCZNFA6i+6cW8qSJuXHhhPo+R1MXpiNDBI=
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id f6-20020a7bc8c6000000b0040e621feca9sm4651115wml.17.2024.02.01.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 07:23:38 -0800 (PST)
Message-ID: <5d696d79d453c6b77f4ebc2d91256e4de6cd5ef5.camel@linaro.org>
Subject: Re: [PATCH v2 5/6] clk: samsung: gs101: don't mark non-essential
 clocks as critical
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  alim.akhtar@samsung.com,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com,  cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org,  devicetree@vger.kernel.org
Date: Thu, 01 Feb 2024 15:23:37 +0000
In-Reply-To: <8dfab6a9-f9d1-46c2-8bd1-6ead4b26fbe1@linaro.org>
References: <20240130093812.1746512-1-andre.draszik@linaro.org>
	 <20240130093812.1746512-6-andre.draszik@linaro.org>
	 <8dfab6a9-f9d1-46c2-8bd1-6ead4b26fbe1@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Thu, 2024-02-01 at 11:02 +0100, Krzysztof Kozlowski wrote:
> On 30/01/2024 10:36, Andr=C3=A9 Draszik wrote:
> > The peric0_top1_ipclk_0 and peric0_top1_pclk_0 are the clocks going to
> > peric0/uart_usi, with pclk being the bus clock. Without pclk running,
> > any bus access will hang.
> > Unfortunately, in commit d97b6c902a40 ("arm64: dts: exynos: gs101:
> > update USI UART to use peric0 clocks") the gs101 DT ended up specifying
> > an incorrect pclk in the respective node and instead the two clocks
> > here were marked as critical.
> >=20
> > We have fixed the gs101 DT and can therefore drop this incorrect
> > work-around here, the uart driver will claim these clocks as needed.
>=20
> How did you fixed the DTS? Which commit did it? Are we going back to
> basics of driver changes depending on DTS?

Sorry if the description isn't clear.

a) these clocks are not critical for the system to work, and this patch fix=
es that.
b) the initial DTSI for gs101 used incorrect clocks for the serial, and it =
didn't
work. The work-around was to specify these clocks here as critical instead.=
 Patch
#4 in this series has corrected the DTSI.

So there is no dependency between the DTS update and the driver update here=
 as such,
no new properties, or otherwise.

That said, now that b) above has been fixed (in patch #4), it is OK to mark=
 these
clocks as non-critical without any ill effects. That's all that is happenin=
g. I was
merely referencing that in the commit message.

I can rephrase things if you wish.


Cheers,
Andre'


Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6ED2232C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705508864; cv=none; b=hagGDIJp5IzCYdj4vTN4em6pQ9BRHtujf+8vZS0C0Q1Tk6y3u/2DWxUuE/I4piYepwiSeXagEZap+ncC3XuRLOVM1eU9mz388j78sXKql4DYhX52o+IyJnAV0ZNi71pQiniIBjaAXlH47V1JjoWuJiOzVI0xVZPwPg/OihJsUj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705508864; c=relaxed/simple;
	bh=x86NWqdks6zwTuT2tte0SAr59t1LG4uqkDpYG3GImHc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=i5BOO9pBp50JkUlNdNSAt7lI8xrt5fcjetFvIHbLEg14g8Sw1Hg3rK27FswcIgYsSGPp54EEdIV8K6YkjRa/+62a334YZqYmCrcBQ8wSVSgVY0vTZi3Xk+fylcHed4jxPKmYeG5PbybByu4fE1tXNXWLvb64kafE+1V/ypeskZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=laKmSzOC; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="laKmSzOC"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso8843044a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 08:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705508862; x=1706113662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksZCgmtZ+uYq06W17SlEi7GeCSqCqSUiALZdlInZSQ8=;
        b=laKmSzOCKuRfkoJ/cstwYQ3uDXyg9pDm6EJ2nyPCKezkGUMEC5gKYx5RpcnTptdKxj
         QOwLhjSP9KTiqsblF9qyaTfqKNrDYv6Bf63dDv8S2+9DElrX00K9GXH9MR4apQGsDsph
         lAGTsoHhTM+Wat+s07ftufWJQmPGyCeK2Sb+d3F4s94XL+ZHFSN3ZjqWL/dCygo3+8wx
         1YI9Eia8RJk+hfEb5VC3m5YjysK1T+kYC/HTiLrku5KS97tZ3KElFOMQLovGEoXZiKZf
         2vw2PyMsgdRP0eOX/ckpkWtLymCRA5MWeNlxhZ/jtVPuXkPOimrWMYU12rrg9f+ySfxp
         oV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705508862; x=1706113662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksZCgmtZ+uYq06W17SlEi7GeCSqCqSUiALZdlInZSQ8=;
        b=OoyA8a8xgCXzG2LIqgOt6m2J9ShmqpHf5/fojrQ0U9qdJHNeyg/mJwDEEXzYgbtQBF
         1rstAWoIi9I8TbXbBa18BJbG9o4B4357Y3AcoW5G2wfI+LE8P7Z86LmKV+vZjQM1mY3c
         zi59uNFGp2OioABdVWyYVQZJfbt6wT+XsbwJM+Fd1a1GB5MLwAMfRAEuUa83tzowH8cp
         DVsN2m/rgVR1NkSh+hBCfQMkm4DRIEkXgLy0JYQ7/EboDEqkOUNNO/TpA2R19IRy+TMJ
         uFuyrkhe2eoWvMWG3U5DfTPIaIxT0ahY61lmvSm0YLcOCXPQIIwW2lqoGYt5ESJYs2zv
         YjLA==
X-Gm-Message-State: AOJu0Yx5Q0F2MXPYsF+w0N/h9u8zKgkQqyZHIjJz9b7Ie12w9EipdlXj
	3xJkYkPwDVhkC/qRApefaONpdtadyB9Adz/A8wISAEmBtq3wqQ==
X-Google-Smtp-Source: AGHT+IG3Wxp0vQ4MxKK/BQ6afjVSc7Ch9N0YW5QeNus26UnIwTMSBGUD4DplaD4th94B7Z+Ny1N7vvCJRL3CKnemZ4Y=
X-Received: by 2002:a17:90a:a782:b0:28b:fe06:5dfc with SMTP id
 f2-20020a17090aa78200b0028bfe065dfcmr6387501pjq.29.1705508862366; Wed, 17 Jan
 2024 08:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org>
 <20240110102102.61587-11-tudor.ambarus@linaro.org> <CAPLW+4=YYdUSaaLcsdEyPswC4s6onxuSh24vSfw4xys=sPZG_Q@mail.gmail.com>
 <b21a54a7-fe13-4a29-8e7e-6b653d5c24ef@linaro.org> <026bdf502c0af8260c67a7a851562633a6976031.camel@linaro.org>
 <97c3579d-d6e3-475f-9f90-d4a2b3e25e86@linaro.org>
In-Reply-To: <97c3579d-d6e3-475f-9f90-d4a2b3e25e86@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 17 Jan 2024 10:27:31 -0600
Message-ID: <CAPLW+4nZtb8JBRe6GE0mGJj9-4uLPVryh_=8VHbCUAVVagy10w@mail.gmail.com>
Subject: Re: [PATCH 10/18] tty: serial: samsung: make max_count unsigned int
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 9:54=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
>
>
> On 1/17/24 15:38, Andr=C3=A9 Draszik wrote:
> >>>> +       unsigned int max_count =3D port->fifosize;
> >>> What if port->fifosize is 0? Then this code below:
> >>>
> >>>     while (max_count-- > 0) {
> >>>
> >>> would cause int overflow, if max_count is unsigned?
> >>>
> >> good catch, Sam!
> > Does it matter, though? As this is a post-decrement, the test is done f=
irst, and the
> > decrement after. Therefore, it'll still bail out as expected.
>
> Indeed, it doesn't. This reminds me of stop replying to emails at the
> end of the day :)
>

And it reminds me to drink some coffee in the morning before doing any
reviews :) With above condition sorted, feel free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> Cheers Andre'!
> ta

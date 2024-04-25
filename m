Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3EB1BF40
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714047579; cv=none; b=ZytMU1QQA5ZKQFrEjNp72Yd93eDUo2BgEUOol7HKVnIajAShTdzrxpESbWm902Rin8DH1a2+Hn+unGqUIk0L7VFRFrWryiFBHtMVQUoYqeStEDKgzQ0RZr4Hp0SAB8byacfu1T50d4/3sSNe1hu3NeRgXqnSp98xmncOPWYEjfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714047579; c=relaxed/simple;
	bh=fH6Ge321Em8jNgYwUzy/eyUsQfoQQSDtSXKHNcV0zg0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iKsZo8A1AK+gatroqTKT2DiumXdzQfle3If4hh9+6uRSHD7p9X+gN9lW3k0XACQmxqBH82Zwlu+fALmzgis4sGvUwSlWYccVNIYLSyjyOfwOm1atW0mmzhLh64tdJwHFwySBtMxLZjScqcHA5D+iak5OzJgn8cYe7YCG1uxLzuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q3wiNuPs; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q3wiNuPs"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34665dd7744so640435f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 05:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714047576; x=1714652376; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fH6Ge321Em8jNgYwUzy/eyUsQfoQQSDtSXKHNcV0zg0=;
        b=q3wiNuPscscaLiyJpaCoHgUgxW96alCL5HKPSdcj0N077aPc5CljsCRcYUPwTK67kL
         j0LgP6ycGC+473rfaTEypnPdWtcBG7RvjajN+ili5wVyfX59u7WjZe25alDcIr9fuIQw
         0XfMVEQSgB4jGCq6BlbzK/n+fwMOpXwUhB8XKkh3tJ6lu2m9g7aul+ecFl68RiB8F97o
         93MKoodgtERsEC90NiS26DPDfqUL3x9yWcSl7kUmsDGdofLTEMFHM2rfoQ6JOzl8TRtk
         9TBtYxM0BmiU+gXra67xqzIwEgz8EI+RvXPjAtVL1BRxCLp7s3cGIA0ziRZGdOW7FbiV
         tGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714047576; x=1714652376;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fH6Ge321Em8jNgYwUzy/eyUsQfoQQSDtSXKHNcV0zg0=;
        b=eU4GbRaRoZ+V3KEBKy0ZE7OAOf3XA2A6edJ7cCYTYBhKF9tRZk67a/zfBEwF+9sVRM
         SngbC3sNxjK9lsLvDC1C2/2ZQVsEwCbM6vtW3JzHPvAE32QIFKwb+RVc70pfC8ktWjhl
         li28v5l1TGLfNGApW6/ORECYLEbVA+CUwnoX1/pskXSj1swhOfz54Oh7kZ6SPmTZzvad
         I1uHEM+t8HT/+AvByaPnEmNlHNSXJFkO4LLUiTZ8tU13NFl1GHAdxzP9/SfXvZrj2UVM
         T0bubZ1WKdOVYg3jmI8bYW16GIjsFm0kB0LIDI6g09s7deyag9Md6IRfCGvmM0ivzeL6
         C0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQYqGC+AJv2p0KWPtG6E4obPZafDbhLmSF8inde9GHSz9Q+7yYjtu5dH8JWQCJ0r6sc5X4Sd1fp10vJQMsFIN0RarE1lbL5DM/e7+pE8XkIII=
X-Gm-Message-State: AOJu0YwA8nlYqq0lsumzU3/Wl4RZS5QYrQ+A9P0ozXG8pr7aWenXEjLs
	PK2M33iQx6VNIbnWD8ORzlX8aiIVspCZFB9Xdr2xGecO12LLiQ8Y/MSwMSU9jT4=
X-Google-Smtp-Source: AGHT+IE2TH+pN7yy08jvuwgtvA2UNlAOwg1IRTXuZTpSF7RMUOppxvhcrI4dU+bpkMR6oChsLtEGUA==
X-Received: by 2002:a5d:5984:0:b0:34c:d80:5da5 with SMTP id n4-20020a5d5984000000b0034c0d805da5mr1283469wri.55.1714047576275;
        Thu, 25 Apr 2024 05:19:36 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d49ca000000b0034bfc32a4f6sm2019801wrs.48.2024.04.25.05.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 05:19:35 -0700 (PDT)
Message-ID: <375fef8d5811d88a0024e44262bac7c702bdb72e.camel@linaro.org>
Subject: Re: [PATCH v2 01/14] dt-bindings: clock: google,gs101-clock:  add
 HSI2 clock management unit
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
 alim.akhtar@samsung.com,  avri.altman@wdc.com, bvanassche@acm.org,
 s.nawrocki@samsung.com,  cw00.choi@samsung.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com,  James.Bottomley@hansenpartnership.com,
 ebiggers@kernel.org,  linux-scsi@vger.kernel.org,
 linux-phy@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 tudor.ambarus@linaro.org,  saravanak@google.com, willmcvicker@google.com
Date: Thu, 25 Apr 2024 13:19:34 +0100
In-Reply-To: <20240424195144.GA360683-robh@kernel.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
	 <20240423205006.1785138-2-peter.griffin@linaro.org>
	 <20240424195144.GA360683-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-04-24 at 14:51 -0500, Rob Herring wrote:
> On Tue, Apr 23, 2024 at 09:49:53PM +0100, Peter Griffin wrote:
> > Add dt schema documentation and clock IDs for the High Speed Interface
> > 2 (HSI2) clock management unit. This CMU feeds high speed interfaces
> > such as PCIe and UFS.
> >=20
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../bindings/clock/google,gs101-clock.yaml=C2=A0=C2=A0=C2=A0 | 30=
 ++++++++-
> > =C2=A0include/dt-bindings/clock/google,gs101.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 63 +++++++++++++++++++
> > =C2=A02 files changed, 91 insertions(+), 2 deletions(-)
>=20
> This collides with Andr=C3=A9's work adding HSI0. Perhaps combine the ser=
ies=20
> or even the patches and just send clocks as a series. Then it is clear=
=20
> who should merge it.

I'll add Peter's clock-related HSI2 patches into my HSI0 series, which will
avoid more merge conflicts.


Cheers,
Andre'


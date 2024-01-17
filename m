Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784D722326
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 16:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705508776; cv=none; b=GOAQX9apaOmXCsOquTKNVLVvXMl0FJhov+LNGhSB9OSAxPoR4Tn9kcr7FuvuMVG5YggfztADOB/z7jLVSa8PZ6hgI+g3vX/Gc0S7otnqshpQwvM+P8KQeNU2uVsdd9gDKDXBnEdDfctFGPbchYW4NZbeU+QSEJhJpZ0r6tz1RBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705508776; c=relaxed/simple;
	bh=55HKiHT9VhXQDcvhsVYui2uBU7EYV5t4AI48/DT5ybQ=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=R7BjyLLXHAysRRlcbagff28zCUePy9441zy9CAZDdcgRcEfa5OtQ1bTvS1quOFrAidfRxMkF4XcQ/pucmMl+FXFrgAJTxTeLuD5dTirVJgNpC/xdOu8uim94/uMp3ilfOHHrdfhCNkC52j+iqjKMqRoTwihSCSxshWzXdPkBAc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2a1b2O4; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2a1b2O4"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-28e7b2f1988so1233600a91.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 08:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705508775; x=1706113575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwDfdGSK5tbIitnnChIc4CkmHS3deC+kI8bko4f+KI4=;
        b=C2a1b2O4V8WeJlzJiOI0kVD1b/7+GXNSDx+tstsJaQMqng4UYDES2dYqHq5/BGpBQZ
         VCCS6MDBi4TPKlryCbdDz6Nnh7LR0ZU2eQUfpZ1vF0nidVQJrAX/6XibkQiVMy+zV9Iu
         rLDxK+eP69VYlj4QnIUauGAPPjUWbeiFyEFGWO4uAvUHail4vUpFtQM97YqaAS2whjzE
         LFC64KszKzVO93rD9dxccfrzeOW098bSYjK4/xGdrqKxgeHr39kE2vLGPj6tzIivsz8L
         lyQ5jZOiVVrgDVVYzzIsMR9E5GmfxSpCjlVMj2xCFufXV8+FxKN0zPCV3BaRgtjtR98f
         uGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705508775; x=1706113575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwDfdGSK5tbIitnnChIc4CkmHS3deC+kI8bko4f+KI4=;
        b=eiMF1C4LyTzLjNIJ/V2yS4W9Hw+JxT3IVEIxhwdLk83NyqmfUf0OjcNaUlvm7wgMAZ
         7RI0u4QP7qsK66qq8OzR7VxQvMFqopk2eVHv9674z8B0PGzGt13x4RcOC/X0lM2/Iapv
         QOk75xUfO5N2cKbHFFOFpZWR1j6vPD9FPjywzOwv/FBSvxrOLHCPIKJrNp6pamkMJouG
         JoMTdGji4od5eC/t/NEb8YSh2mGdpsOW5J7Wrn+nLnIk9KjVlS1n0ervj2Q6N4xDJp6U
         6IlkBt2UAitfcNRp0QtR+EJBCvNCHxLJTtQMbZVqQkPCINFNRtDYrGeXbEchtKtp8n+i
         yKJg==
X-Gm-Message-State: AOJu0YzT0+GuWRZsFlJQ//CPqQe7CT0I6YxtfvzRYImMzhxaQOAuWmXp
	R5DLXMYCcc/whaf69ihP4q5+B/cfhm1+UUgifP8rqVsD+eKjeg==
X-Google-Smtp-Source: AGHT+IHtz96i192wuHbHGDlX8ymOFFRVWDC3NtgoZ8FjqGRAy/Ibw6ttfpwcK2tiXMCHQca0amVpgrIuJz3W6RfsGUg=
X-Received: by 2002:a17:90a:b30d:b0:28c:fec9:f205 with SMTP id
 d13-20020a17090ab30d00b0028cfec9f205mr4686711pjr.29.1705508774764; Wed, 17
 Jan 2024 08:26:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org>
 <20240110102102.61587-11-tudor.ambarus@linaro.org> <CAPLW+4=YYdUSaaLcsdEyPswC4s6onxuSh24vSfw4xys=sPZG_Q@mail.gmail.com>
 <b21a54a7-fe13-4a29-8e7e-6b653d5c24ef@linaro.org> <026bdf502c0af8260c67a7a851562633a6976031.camel@linaro.org>
In-Reply-To: <026bdf502c0af8260c67a7a851562633a6976031.camel@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 17 Jan 2024 10:26:03 -0600
Message-ID: <CAPLW+4=G0+Vuwm0Jdp4wxbL9aUTaM8S+srXYwYkm10K+=hXbOg@mail.gmail.com>
Subject: Re: [PATCH 10/18] tty: serial: samsung: make max_count unsigned int
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, krzysztof.kozlowski@linaro.org, 
	alim.akhtar@samsung.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 9:38=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Hi,
>
> On Wed, 2024-01-17 at 15:21 +0000, Tudor Ambarus wrote:
> >
> >
> > On 1/16/24 18:21, Sam Protsenko wrote:
> > > On Wed, Jan 10, 2024 at 4:23=E2=80=AFAM Tudor Ambarus <tudor.ambarus@=
linaro.org> wrote:
> > > >
> > > > ``max_count`` negative values are not used. Since ``port->fifosize`=
`
> > > > is an unsigned int, make ``max_count`` the same.
> > > >
> > > > Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> > > > ---
> > > >  drivers/tty/serial/samsung_tty.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/=
samsung_tty.c
> > > > index 90c49197efc7..dbbe6b8e3ceb 100644
> > > > --- a/drivers/tty/serial/samsung_tty.c
> > > > +++ b/drivers/tty/serial/samsung_tty.c
> > > > @@ -760,8 +760,8 @@ static irqreturn_t s3c24xx_serial_rx_chars_dma(=
void *dev_id)
> > > >  static void s3c24xx_serial_rx_drain_fifo(struct s3c24xx_uart_port =
*ourport)
> > > >  {
> > > >         struct uart_port *port =3D &ourport->port;
> > > > +       unsigned int max_count =3D port->fifosize;
> > >
> > > What if port->fifosize is 0? Then this code below:
> > >
> > >     while (max_count-- > 0) {
> > >
> > > would cause int overflow, if max_count is unsigned?
> > >
> >
> > good catch, Sam!
>
> Does it matter, though? As this is a post-decrement, the test is done fir=
st, and the
> decrement after. Therefore, it'll still bail out as expected.
>

Good catch on my good catch :)

> > I'm thinking of amending this and add at the beginning of the method:
> >
> > if (!max_count)
> >       return tty_flip_buffer_push(&port->state->port);
>
> This will not help with overflow. It'll still have wrapped around after c=
ompleting the
> while() (always, no matter what start-value max_count had)
>
> Cheers,
> Andre'
>

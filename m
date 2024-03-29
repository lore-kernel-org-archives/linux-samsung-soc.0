Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19A93D541
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Mar 2024 06:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692091; cv=none; b=QOCsrZSCN9noR7K9U9LmN3jmPJmAKk+rIO7UKCIHXsxBiutLa4cCLwrksq4sDcnPdpgd6KiSrJ1MEKJUbZPeA8olRlR+8NE1/mB3R0k8V2GzUuWn9llY7Edb1r1KIh5ZpT4rj3JOzHe8Grrr8ik85uPTcibR89yxgsRgKuJ6Kyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692091; c=relaxed/simple;
	bh=eYhRwcbx0XWwpVC/UC0BiSKNkbAvIb8jgfQM087pM8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kgge9nw1SUEFPtGFVyyRzuYtnsES6E5//VQcQHWo0eOsg+Zl78pE+TbCTgCWz6Iw/D1dCD5KWzChJluVzoRP2JZ72VavgDJiPjiB8hK+Vv4H77W4zy/wj8o8W8XzgczXwOXhAxwxcLwBoNXIK7qUb9Vwu5k1YI90aiW7TE5h3EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g1MmE03Z; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g1MmE03Z"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61446b42423so2086607b3.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Mar 2024 23:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692088; x=1712296888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jZQnJj79swR2183Bur6/x2Cdu0g+Xgm+SPz3uqZYcg=;
        b=g1MmE03ZKyVxqTLg0LUNlhY9/dNPztW5qAuPDUSXyrtBWRnfaLzUw+3aCWLxY6jKui
         xs1bO0F4UWzIQ6CRT/nSUV+YdHNYVub7U5Bxd4Xd6MX28lJVeG1+WZYGv3g2ceeuvwUQ
         0sqo7oyzr8VT9BkDBCkLVypO+kuVOUSUvDFUAMjaxCOUAqLVRB3webm0AUmt/OU/pS+2
         mKEAS1BYTrCwv6KE/mUlnWChBD0e4+1VyKc/O3jBNrItbpTkrsQNhpPozQsL1i7ckTLD
         w3ScDZ+bEKXsezCeKTCX4x9AGO2CUiWRJ9YzcwXHMSeLB0zHP3bgU/Ih2rsK8oGhdq+K
         WQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692088; x=1712296888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jZQnJj79swR2183Bur6/x2Cdu0g+Xgm+SPz3uqZYcg=;
        b=OP8XCYxwqfWkeP72x/yrIBDw5sxXC2JEp9rd6ldBHc1z4ZPZt8bgBRjVpCZl6axRfB
         qqvjaz/DJpb1I49OVw4LsC88u3wIDS/PfmITrcvLCTgZ9OJ9WcRhqf1qFaBWjJOSACX9
         2WPhH18dAC4AIZEiutXGxXhp6uz1gU8vkN7fRn9lSyhT/azqC+Q8vX9M5/f+bh29UvaB
         6tmtolWuVi4BsnXdKnnGcUU3vARNOD9YaIb9znH6ClneIBYmzg6WaoFhj9aSg1DQoGyq
         L01Izl4u0jGeZ0oGKrGKPupc1hx4VcWt+90OeEhmQJnxulYf9IYd42RYm6KGZSzY2UVr
         T7Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWECJ3w2l+y8WrewnW5JTo/yQMlMdOCKI5ovxr19m71Y3Thgi6R/34rex35ZpVBpde8t64ajj+JMSwMcdJQE9upUTwFLQmwP5bZ3SS9byXVq0Y=
X-Gm-Message-State: AOJu0YyLP40Ly/BaQPkpXES8DvRshVcgys58+MawHiOn+0q3pZpczW5/
	HQ+5nPYrn3z+XIWLYeztnHCcW3FbvCaI/n2C3HwjSlDgLPx8U30WGNVPzf3Tm0YjbPqyC/mgEZm
	EE08FCTsrGH9BCTfGssHJriuG4PgIBsUQFQd5GQ==
X-Google-Smtp-Source: AGHT+IGIaj72yIsdDmZY61mw/oq49jdxC1hhIzgqQONAQJUH2pq4vxcEaW+O77sbNMoSdyIwDmNBiWsdXjkBLSjILWY=
X-Received: by 2002:a25:6d86:0:b0:dc2:2d75:5fde with SMTP id
 i128-20020a256d86000000b00dc22d755fdemr1372219ybc.29.1711692087927; Thu, 28
 Mar 2024 23:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240327033501epcas2p2bbe21301da5584f7f3a073c51a363c00@epcas2p2.samsung.com>
 <20240327033041.83625-1-jaewon02.kim@samsung.com> <CAPLW+4k4qh4ZYBufZoGbUZN0yxSE2X8bOdkEQVw1Zg9YUVpbug@mail.gmail.com>
 <63355869-e679-7226-7719-36b62169db7e@samsung.com>
In-Reply-To: <63355869-e679-7226-7719-36b62169db7e@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 29 Mar 2024 01:01:16 -0500
Message-ID: <CAPLW+4k7GnK+jqbH2t8ZEMwFCW9nVD84k9ca3YY9KfDaiSkOTA@mail.gmail.com>
Subject: Re: [PATCH] spi: s3c64xx: Use DMA mode from fifo size
To: Jaewon Kim <jaewon02.kim@samsung.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 12:53=E2=80=AFAM Jaewon Kim <jaewon02.kim@samsung.c=
om> wrote:
>
> Hi Sam,
>
> Thanks for your review.
>
>
> On 3/29/24 02:58, Sam Protsenko wrote:
> > On Tue, Mar 26, 2024 at 10:35=E2=80=AFPM Jaewon Kim<jaewon02.kim@samsun=
g.com>  wrote:
> >> The SPI data size is smaller than FIFO, it operates in PIO mode,
> > Spelling: "The" -> "If the"
>
> Thanks, I will fix it v2.
>
> >> and if it is larger than FIFO mode, DMA mode is selected.
> >>
> >> If the data size is the same as the FIFO size, it operates in PIO mode
> >> and data is separated into two transfer. In order to prevent,
> > Nit: "transfer" -> "transfers", "prevent" -> "prevent it"
>
> Thanks, I will fix it v2.
>
> >> DMA mode must be used from the case of FIFO and data size.
> >>
> > You probably mean this code (it occurs two times in the driver):
> >
> >      xfer->len =3D fifo_len - 1;
> >
> > Can you please elaborate on why it's done this way? Why can't we just
> > do "xfer->len =3D fifo_len" and use the whole FIFO for the transfer
> > instead? I don't understand the necessity to split the transfer into
> > two chunks if its size is of FIFO length -- wouldn't it fit into FIFO
> > in that case? (I'm pretty sure this change is correct, just want to
> > understand how exactly it works).
>
> In IRQ mode(S3C64XX_SPI_MODE_RX_RDY_LVL enable), TxOverrun/RxUnderrun
> irq occurs when FIFO is full.
>
> To avoid FIFO full, it is transmitted in a smaller size than
> fifo_len.(fifo-len - 1)
>
> However, in case of "fifo_len =3D=3D data size" "fifo_len - 1" byte + "1"
> byte were transmitted separately.
>
> This problem can be solved by starting DMA transmission start size from
> fifo_len.
>

Thanks for the explanation! Please feel free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> >> Fixes: 1ee806718d5e ("spi: s3c64xx: support interrupt based pio mode")
> > Just wonder if that fixes some throughput regression, or something
> > worse (like failed transfers when the transfer size is the same as
> > FIFO size)?
>
> It is not a critical issue, but When I look at the actual waveform, it
> seems strange that only the last 1-byte is transmitted separately.
>
> I thought it was "Fixes", but if not, I will remove it.
>

No no, I was just curious. "Fixes" is fine with me.

> >> Signed-off-by: Jaewon Kim<jaewon02.kim@samsung.com>
> >> ---
> >>   drivers/spi/spi-s3c64xx.c | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> >> index 9fcbe040cb2f..81ed5fddf83e 100644
> >> --- a/drivers/spi/spi-s3c64xx.c
> >> +++ b/drivers/spi/spi-s3c64xx.c
> >> @@ -430,7 +430,7 @@ static bool s3c64xx_spi_can_dma(struct spi_control=
ler *host,
> >>          struct s3c64xx_spi_driver_data *sdd =3D spi_controller_get_de=
vdata(host);
> >>
> >>          if (sdd->rx_dma.ch && sdd->tx_dma.ch)
> >> -               return xfer->len > sdd->fifo_depth;
> >> +               return xfer->len >=3D sdd->fifo_depth;
> >>
> >>          return false;
> >>   }
> >> @@ -826,11 +826,11 @@ static int s3c64xx_spi_transfer_one(struct spi_c=
ontroller *host,
> >>                          return status;
> >>          }
> >>
> >> -       if (!is_polling(sdd) && (xfer->len > fifo_len) &&
> >> +       if (!is_polling(sdd) && xfer->len >=3D fifo_len &&
> >>              sdd->rx_dma.ch && sdd->tx_dma.ch) {
> >>                  use_dma =3D 1;
> >>
> > Would be nice to remove this empty line, while at it.
> Good, I will remove it also.
> >> -       } else if (xfer->len >=3D fifo_len) {
> >> +       } else if (xfer->len > fifo_len) {
> > Below in the same function I can see similar code:
> >
> >              if (target_len >=3D fifo_len)
> >                  xfer->len =3D fifo_len - 1;
> >
> > Shouldn't that 'if' condition be fixed too? Or it's ok as it is? (Just
> > noticed it by searching, not sure myself, hence asking).
>
> You are correct. This 'if' condition should not have been modified.
>
> >>                  tx_buf =3D xfer->tx_buf;
> >>                  rx_buf =3D xfer->rx_buf;
> >>                  origin_len =3D xfer->len;
> >> --
> >> 2.43.2
> >>
> >>
>
> Thanks
>
> Jaewon Kim
>

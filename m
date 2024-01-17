Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F17E2F46
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 16:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705509108; cv=none; b=RL8ypmPWmhkr9K0/vVVNzV8NTlhId6ggvKjlexiLvMytsqR0+uwMZN2cy3nK6nyjlXoHDDQtV45T4dh/GZ1UV3Fpg4aqpQacHHNa4FRuwoIrRX5PpMCgOETy4DciSiSTAVNfuhJ2uo67VdZIIKde6XYLiMZv9H+hf9m0lzX+/V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705509108; c=relaxed/simple;
	bh=nlUZyb6PQMJa8TWF5yY5pqZGKXAFWnjqoT+Qcq62oAI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=KGR6lluDWk/cTIrELPeiZLQompK4a+VnJMbYYee/iswJmm7gOwAUNaTwhuUGQZZEoxA2iF8pvK12usF7laFtkTTJVQdXVf6WvWBr/NJB86RDWEnNiVQVKQugiKw0cyxF9jj7FoDFn6WmQ/OqYft/KpWi7FQZivzNHoZW8R0OfIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hELeLl8u; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hELeLl8u"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6d9bc8939d0so7297044b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 08:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705509105; x=1706113905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5Kt83B2lSeIPpXpI9RBHXXNMjqSltP3MVyZFOWbdO8=;
        b=hELeLl8uafz82Jw+oH7nZ8NSoLi3vE5vX+X+9s7HmAbZS+avswYE0WCF5PSf0AfPdA
         RWTDTiIFTCs7EWVgL/Qz5XEc8ruF2h14411bi+aIurxI8aAOTQLJG4zAb/NTN4bainhd
         Lwy5M/N4DtFD2BngdCbSNodkEq+JfaufCrEDBO7LO0a/Yx8n8NyLt2WZZ3AusVhKP/XZ
         9zLC6zzfZIFVhfI6lJ6cI92NvIB1x7hUC9oVz6SsoOx6amhRGO0hLbqp5k5QQAUsPyZn
         7C4fGGEaacwPsQEhZMUI3zUtI9yckB7PSyUYB0VSTJ/9kDUDoKcPIUQw4eWzkuQIzi8S
         Av2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705509105; x=1706113905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5Kt83B2lSeIPpXpI9RBHXXNMjqSltP3MVyZFOWbdO8=;
        b=naS60rwEF6Dr9+LjXw1qq25Qxj1zfyCY3d7KMknFD36liEnDApltfQOXPI8JUmpM1Q
         L/NPYn5v34a9hN+2zZj6NmEBzkraeOXfuiAjFBebv0B6qUcR5RH9jD5qNLxOUkSRSjRY
         zHSzJUBIvI/ux1Xfbt+ktLs1XnzZ3KDTWXlPmQoObjNRNBldSmZoX1Y/d1W4wwMSvBen
         4WrG83tGlVOafm4TqoCMFETeDdGAgBhfP5LuCkZ9LeFENgKTZqdFdvPMJ0WGkMTXaWsG
         wplsO/lWQPbnoc8NaU8eugE/3Hk0pw1khDtlHTyjDKa4Ohg2qD4nUm8x/IWlDehSSxXz
         ajzA==
X-Gm-Message-State: AOJu0YxRL4RgjxmgJRi7Bl/dEV71WfV4dARs7RaQtCWsl3QeYtz7o0bc
	+qBYlkx9SRxXEtHrucfBNcvz3x+PJU5L+zGp9hlZedbSB0QJDQ==
X-Google-Smtp-Source: AGHT+IFQ2ORGYud6wc2ZMVYoLRk0PoBeQhkS67CH5oMfQckkL70T6lvm5xOpQAVZi5DqYkknmCLpvxXq77bnI8IDgTM=
X-Received: by 2002:a05:6a20:1a88:b0:199:eb43:1542 with SMTP id
 ci8-20020a056a201a8800b00199eb431542mr4054642pzb.1.1705509105546; Wed, 17 Jan
 2024 08:31:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org>
 <20240110102102.61587-17-tudor.ambarus@linaro.org> <CAPLW+4kndXo9Ab2PL3fts9pJNhhitX3Sr=V2b8mS4cArov4Tog@mail.gmail.com>
 <40d66ddc-8293-4213-a0bd-321262a1a3ef@linaro.org>
In-Reply-To: <40d66ddc-8293-4213-a0bd-321262a1a3ef@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 17 Jan 2024 10:31:34 -0600
Message-ID: <CAPLW+4=W=j4KSOWpErfOkQDExmJ9JHXkTZ1WtNgd14kqoEHdSA@mail.gmail.com>
Subject: Re: [PATCH 16/18] tty: serial: samsung: shrink the clock selection to
 8 clocks
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 10:26=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
>
>
> On 1/16/24 19:09, Sam Protsenko wrote:
> > On Wed, Jan 10, 2024 at 4:25=E2=80=AFAM Tudor Ambarus <tudor.ambarus@li=
naro.org> wrote:
> >>
> >> <linux/serial_s3c.h> provides a clock selection pool of maximum 4 cloc=
ks.
> >
> > Then maybe it makes sense to turn those two field into 4-bit bit
> > fields? More importantly, what particular problem does this patch
> > solve, is this optimization really needed, and why? I'm not saying
> > it's not needed, just that commit message might've been more verbose
> > about this.
> >
>
> I guess I could have been more verbose in the phrase from below and said
> that for arm64 ``struct s3c24xx_uart_info`` spans through 2 cachelines
> and contains 2 holes, and with a bit of love it can fit a single
> cacheline with no holes. The end goal is to reduce the memory footprint
> of that struct.
>

Oh yeah, I actually like the cachelines part. Please add that bit to
the commit message if you don't mind.

> I chose u8 and allowed a max of 8 clocks simple because it's large
> enough to allow more clocks than are supported by the driver now, and
> not too big to cause spanning of the structure through 2 cachelines.
>

Gotcha. Maybe also add that reasoning to the commit message. Just a
thought. With above comments addressed, feel free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>
> >> Update the driver to consider a pool selection of maximum 8 clocks. Th=
e
> >> final scope is to reduce the memory footprint of
> >> ``struct s3c24xx_uart_info``.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> ---
> >>  drivers/tty/serial/samsung_tty.c | 22 +++++++++++-----------
> >>  1 file changed, 11 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/sam=
sung_tty.c
> >> index 436739cf9225..5df2bcebf9fb 100644
> >> --- a/drivers/tty/serial/samsung_tty.c
> >> +++ b/drivers/tty/serial/samsung_tty.c
> >> @@ -81,11 +81,11 @@ struct s3c24xx_uart_info {
> >>         unsigned long           tx_fifomask;
> >>         unsigned long           tx_fifoshift;
> >>         unsigned long           tx_fifofull;
> >> -       unsigned int            def_clk_sel;
> >> -       unsigned long           num_clks;
> >>         unsigned long           clksel_mask;
> >>         unsigned long           clksel_shift;
> >>         unsigned long           ucon_mask;
> >> +       u8                      def_clk_sel;
> >> +       u8                      num_clks;
> >>         u8                      iotype;
> >>

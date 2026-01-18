Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1708E306D40
	for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Jan 2026 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768769712; cv=none; b=Kr4vlHw45EuiwXMlCDWZBsi84OncyuDCufvXZskAAf1QvoJ1xAHHewBp7CFM5mlReKM1d7K0DZwgxae/FHWdCzMogkmVrjbyuL5DcG4ck/lPzwxK+TVQF83b9PL4ghg8wA4wnntlJvPMpWIXsleDLFJRzO9DH47uPgEN9vT4LjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768769712; c=relaxed/simple;
	bh=i0slpHsOkoHDgBqcCGvUcIOPgBfiHJ/g9Q2QUHLiqMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWHzttSJt+yxSl+rdeKQqQE4zuaVoIQcYaaIO1augRhKRIDYSpya4yGgZzuiuPDNap0RPtC7aQNXTd5Wc6OOk9YgU+wrEbj2txF49USOzx+LkyvjLWgxhZM0QVwHLvQPSX6SGUf87QzyI3lUJmy5mlwAW0YvEBh6yRR/I2NO/pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i84SEvKi; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i84SEvKi"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-45c7a71ba20so824002b6e.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Jan 2026 12:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769710; x=1769374510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrgl77zcKnWLxzpIMhQvmyDGsnBn1orcJjdPE5SYcOM=;
        b=i84SEvKifb6C04d2/IC8msO7J4Fq4UBJ22QgSHTE6ozDzKz5fFaGVacd/gfy+dnGhD
         q3sISUN/Janue4Xvjzmpxo2//qDBc4Doy82RPJ/2rxvnC5dH/iKuUgkIevSeSET5jP0e
         bf23/pYq+73V0I/GQLK4AfbRWyRPBYxOXpn+VVX11QFkgGUZrSo4LDqIwQhmevyjm+hw
         2CXYHDAM8SLG5G9PZZliU3fLetzxK2eGfdNO7ZVhMnqsRkuXUFWI7o9+7RfdWEqBdX3Q
         bR2PYyJ1nHI7ieKxtQomJzjHRxeSTZgZHtJwEHQo1RcO7l6GJHOX/I4UeIjTK5aXEyd1
         v+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769710; x=1769374510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrgl77zcKnWLxzpIMhQvmyDGsnBn1orcJjdPE5SYcOM=;
        b=d+dcUfAK4OUd8zwI9q4WtnS02uqcMzC573+8+8+xZcFCirQTwhbgq2NXO+L7HNZQU1
         emsb8vkem1oyda7m9Ots5+U+rEHXsnXMxJeZ3GVnukPe54Q4saJUSztLhz39ZB/27Sfr
         uwzasmn3Z5EmubLPbJZG2aWyoWvepWrJHH6+CuIm34LPR5QlkB0fd7uzdgtOXHaujCG8
         XqNZz+uygjixYE3V64Bpk/ZLt069Ft/CJk1ibUnXWH8wGICFGB4Y/dwbOFxj+iMmvKVy
         ZhEPYwa2/a9dln7QaCF9iWcLMu/D5Qr3Jm7jz5s/8Nwaf5ao7gcWC/G38cd7AaxMnFX2
         8PCw==
X-Forwarded-Encrypted: i=1; AJvYcCXAAPNoicnsKUzSLQqN7df9nOrycFA+fhKHWBvBeCJi5L2bmlZQaY9P5gsQzNeIM4LPxSDwud6EkLIkUvgZHO4kxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxWoiUFKotSGTcKcM8ynGIboCWyQv4mAtiPrepuTTBXHxLxeW
	AVcyGK+Bjmy78+RKzK9+FxPMSUBm9i657bR3QrLFrFASBRjtPOrNtN37X2I9SbN53WfeWG0oK0r
	mhquu96MmwcCRUznkld3M2r76ZCdbamk=
X-Gm-Gg: AY/fxX4d+INRa7s0AlFpoRRNDut9hJcGHrBhIUareRm9e83XMJyNjlGtUr5MxqcJp01
	gaQfmGtViYV61nQlKLfAn65j1OS3r8hQCUPFUToBO0ghPAiQpLoNH8gybzdViPif0DwD39vYbfG
	rG4GKP9Tpu6fUqP3kd+5+Chga51bFKvkpFXxJlsILkDsyWZ9aBFcCSwL1heIEpjpvm+KKDrMpgs
	y3+OZmW2tR4x3CgtAdGrq8zZaBFRnDFP8Nd62KQo7y0xzpwyO4jBZ+dRJCtZedURBZFDnyD
X-Received: by 2002:a05:6808:1796:b0:44f:ff2c:f65 with SMTP id
 5614622812f47-45c9c14fd09mr3833538b6e.38.1768769710061; Sun, 18 Jan 2026
 12:55:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-mailbox-acpm-pclk-ptr-v1-1-8474de8c4584@linaro.org>
In-Reply-To: <20260105-mailbox-acpm-pclk-ptr-v1-1-8474de8c4584@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:54:58 -0600
X-Gm-Features: AZwV_QjtmoWR7zpXN6PxwxPWVnylbaevwQAzHArvG4i3Nw7LDMwRySbg8e6wc08
Message-ID: <CABb+yY0YVfWi5sUOn=LWndy9Xpo8ws+cSJ5LYXagJ2uOA0B=LA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: exynos: drop unneeded runtime pointer (pclk)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 6:34=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> pclk is not needed past probe(), just drop it. This saves a little bit
> of runtime memory.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-ma=
ilbox.c
> index 2320649bf60c86980c0e8554f2d5fd32af218a6d..5f2d3b81c1dbec8d1a1535376=
9b4b3a1d6ebdf21 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -35,12 +35,10 @@
>   * struct exynos_mbox - driver's private data.
>   * @regs:      mailbox registers base address.
>   * @mbox:      pointer to the mailbox controller.
> - * @pclk:      pointer to the mailbox peripheral clock.
>   */
>  struct exynos_mbox {
>         void __iomem *regs;
>         struct mbox_controller *mbox;
> -       struct clk *pclk;
>  };
>
>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
> @@ -100,6 +98,7 @@ static int exynos_mbox_probe(struct platform_device *p=
dev)
>         struct exynos_mbox *exynos_mbox;
>         struct mbox_controller *mbox;
>         struct mbox_chan *chans;
> +       struct clk *pclk;
>         int i;
>
>         exynos_mbox =3D devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNE=
L);
> @@ -119,9 +118,9 @@ static int exynos_mbox_probe(struct platform_device *=
pdev)
>         if (IS_ERR(exynos_mbox->regs))
>                 return PTR_ERR(exynos_mbox->regs);
>
> -       exynos_mbox->pclk =3D devm_clk_get_enabled(dev, "pclk");
> -       if (IS_ERR(exynos_mbox->pclk))
> -               return dev_err_probe(dev, PTR_ERR(exynos_mbox->pclk),
> +       pclk =3D devm_clk_get_enabled(dev, "pclk");
> +       if (IS_ERR(pclk))
> +               return dev_err_probe(dev, PTR_ERR(pclk),
>                                      "Failed to enable clock.\n");
>
>         mbox->num_chans =3D EXYNOS_MBOX_CHAN_COUNT;
>
> ---
> base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
> change-id: 20260105-mailbox-acpm-pclk-ptr-c25c99dacb34
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
Applied to mailbox/for-next.
Thanks.

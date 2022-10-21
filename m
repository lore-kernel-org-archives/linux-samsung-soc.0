Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E74C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Oct 2022 11:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbiJULsa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Oct 2022 07:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiJULs2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Oct 2022 07:48:28 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED9625ED28
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Oct 2022 04:48:26 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id q10-20020a17090a304a00b0020b1d5f6975so2696030pjl.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Oct 2022 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gP2ytTs+LAre/BcxYYn7OcjeedfuE4P1v/EP76rYVYc=;
        b=WWwJKWiyw/cZZLt69AZe42IuxkHicl8eE4lNf+g/G/Oz8Asz/Tkx3rUS2F2ihuW2CE
         +eu+LmFWryKy7D9NybKfY/jUl8aaXlWe8DgJyo0MPG5v1hT7bsAgcOreYIiMHULOFge2
         mCrcw54kLSntdpIxCyUN48rGrEyA6o5Js2UbT2xxZnN8fnM3XMRn48Re0EdEl3zUt+ZH
         SVEruc7G0s8iuEPfcknYbRENySw9InUPeIkMmnUh2NuKk48dMdOP3PXqzZkkFYO4j4CA
         5Vqkta0XIT6MjlW7TzM16RBe5hyLF9JJbWvYkRR1ZXlUJPN5uhszE4uRI15/kBFoDCQd
         dNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gP2ytTs+LAre/BcxYYn7OcjeedfuE4P1v/EP76rYVYc=;
        b=xp0jZ9U5C66xrm/IJKB5Pk0A1N/nTYv1IUza+0t/ImCqFAxvOCOuf2+ukWDxadur72
         Hsd3Bmsh6vBLjmT65v84zA8jkk/PcZR4ULKDMIIZx0RjkAmudrxWaKhQ2NeIcYDKQrkG
         u22aT1GfAdiD+Rc57Qe2qa9j+u5WWw5uJYWi5MG0RVAvU0n2y/jDQdFQW4E7Y7uSFW7q
         w5Czoj98sotAAywexZ7BdUwYIuXUHogEgi5f2crOAh0UU9QVaSZRYGhbHh0zNajSx4Kq
         2UACpKL+UFcmKsERSmQWN9szCVajNE+yGgj5K3N8k8EkStxc8Pw7bkKjg/xSjF4Fm1PS
         VSCA==
X-Gm-Message-State: ACrzQf2tnp6dkpg5GpgHeZ5iWWsJh47ZldYKwjE58z+ErXj6IhOUg0He
        pyFmI5wxg0gw7znOS6selKawpyR73JMN/vBoRtS+CQ==
X-Google-Smtp-Source: AMsMyM4Ln3GENJVVY9y9uUTjBv6QEb5fLuIGqTxCjw4QcCnqPFs6DE+BPvh41R7oPBc3h7Tjvx44bZy9NmwEwWcg40w=
X-Received: by 2002:a17:90a:64c3:b0:212:d67d:a034 with SMTP id
 i3-20020a17090a64c300b00212d67da034mr1218159pjm.55.1666352906221; Fri, 21 Oct
 2022 04:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221019091151.6692-1-ilpo.jarvinen@linux.intel.com> <20221019091151.6692-29-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20221019091151.6692-29-ilpo.jarvinen@linux.intel.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 21 Oct 2022 13:48:14 +0200
Message-ID: <CAPLW+4mFiuuSGq-ucqsif=qhzWz7p87Na_Q0U6VVopmfhh-=Wg@mail.gmail.com>
Subject: Re: [PATCH 28/44] serial: samsung_tty: Use uart_xmit_advance()
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 19 Oct 2022 at 11:35, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Take advantage of the new uart_xmit_advance() helper.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/tty/serial/samsung_tty.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 77d1363029f5..7e34361a1085 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -288,7 +288,6 @@ static void s3c24xx_serial_stop_tx(struct uart_port *=
port)
>  {
>         struct s3c24xx_uart_port *ourport =3D to_ourport(port);
>         struct s3c24xx_uart_dma *dma =3D ourport->dma;
> -       struct circ_buf *xmit =3D &port->state->xmit;
>         struct dma_tx_state state;
>         int count;
>
> @@ -316,8 +315,7 @@ static void s3c24xx_serial_stop_tx(struct uart_port *=
port)
>                                         DMA_TO_DEVICE);
>                 async_tx_ack(dma->tx_desc);
>                 count =3D dma->tx_bytes_requested - state.residue;
> -               xmit->tail =3D (xmit->tail + count) & (UART_XMIT_SIZE - 1=
);
> -               port->icount.tx +=3D count;
> +               uart_xmit_advance(port, count);
>         }
>
>         ourport->tx_enabled =3D 0;
> @@ -351,8 +349,7 @@ static void s3c24xx_serial_tx_dma_complete(void *args=
)
>
>         spin_lock_irqsave(&port->lock, flags);
>
> -       xmit->tail =3D (xmit->tail + count) & (UART_XMIT_SIZE - 1);
> -       port->icount.tx +=3D count;
> +       uart_xmit_advance(port, count);
>         ourport->tx_in_progress =3D 0;
>
>         if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
> @@ -916,8 +913,7 @@ static void s3c24xx_serial_tx_chars(struct s3c24xx_ua=
rt_port *ourport)
>                         break;
>
>                 wr_reg(port, S3C2410_UTXH, xmit->buf[xmit->tail]);
> -               xmit->tail =3D (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
> -               port->icount.tx++;
> +               uart_xmit_advance(port, 1);
>                 count--;
>         }
>
> --
> 2.30.2
>

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 03/16] pinctrl: samsung: Detect and handle unsupported
 configuration types
Date: Wed, 10 Oct 2012 09:37:42 +0200
Message-ID: <CACRpkda8mBsetmkWSfed0VpGA_Aw4vNUSGZcTx=bY8LDRzxFdA@mail.gmail.com>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
	<1349685556-23718-4-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:63913 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752302Ab2JJHho (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 03:37:44 -0400
Received: by mail-we0-f174.google.com with SMTP id t9so131506wey.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Oct 2012 00:37:43 -0700 (PDT)
In-Reply-To: <1349685556-23718-4-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch modifies the pinctrl-samsung driver to detect when width of a
> bit field is set to zero (which means that such configuraton type is not
> supported) and return an error instead of trying to modify an inexistent
> register.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  drivers/pinctrl/pinctrl-samsung.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
> index dd108a9..c660fa5 100644
> --- a/drivers/pinctrl/pinctrl-samsung.c
> +++ b/drivers/pinctrl/pinctrl-samsung.c
> @@ -391,6 +391,9 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pctldev, unsigned int pin,
>                 return -EINVAL;
>         }
>
> +       if (!width)
> +               return -EINVAL;
> +

Can this patch be applied in isolation from the others?
Thomas A: can you ACK this so I can apply it in that case?

Yours,
Linus Walleij

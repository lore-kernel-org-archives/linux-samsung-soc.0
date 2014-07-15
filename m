From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: Add mask-tpm-reset to the device tree
Date: Tue, 15 Jul 2014 09:19:12 -0700
Message-ID: <CAD=FV=XJD=Dt8z5Vmy2wXs4_FWqiW3=AhVw=sSZXFxv31+FHhA@mail.gmail.com>
References: <1405420294-9323-1-git-send-email-vikas.sajjan@samsung.com>
	<1405420294-9323-2-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:40301 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751279AbaGOQTN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 12:19:13 -0400
Received: by mail-vc0-f171.google.com with SMTP id id10so10710911vcb.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2014 09:19:12 -0700 (PDT)
In-Reply-To: <1405420294-9323-2-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Thomas P Abraham <thomas.ab@samsung.com>

Vikas,

On Tue, Jul 15, 2014 at 3:31 AM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> From: Doug Anderson <dianders@chromium.org>
>
> The mask-tpm-reset GPIO is used by the kernel to prevent the TPM from
> being reset across sleep/wake.  If we don't set it to anything then
> the TPM will be reset.  U-Boot will detect this as invalid
> and will reset the system on resume time. This GPIO can always be low
> and not hurt anything.  It will get pulled back high again during a
> normal warm reset when it will default back to an input.
>
> To properly preserve the TPM state across suspend/resume and to make
> the chrome U-Boot happy, properly set the GPIO to mask the
> reset to the TPM.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   12 ++++++++++++
>  1 file changed, 12 insertions(+)

Looks good to me.  I'll assume Kukjin will add the words
"exynos5420-peach-pit" into the patch description when applying.

Reviewed-by: Doug Anderson <dianders@chromium.org>

-Doug

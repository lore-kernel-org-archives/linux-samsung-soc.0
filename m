From: Doug Anderson <dianders@chromium.org>
Subject: Re: ARM: dts: Remove mau_pd node for Exynos5420
Date: Tue, 22 Apr 2014 09:34:32 -0700
Message-ID: <CAD=FV=VZec7yRqehxLz_2GT0_QBje8PQcx7i0d-_hvNKm6eOoQ@mail.gmail.com>
References: <1398145155-4615-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:47477 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753194AbaDVQed (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 12:34:33 -0400
Received: by mail-vc0-f170.google.com with SMTP id hr9so1622013vcb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 09:34:32 -0700 (PDT)
In-Reply-To: <1398145155-4615-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Tushar,

On Mon, Apr 21, 2014 at 10:39 PM, Tushar Behera
<tushar.behera@linaro.org> wrote:
> MAU powerdomain provides clocks for Audio sub-system block. This block
> comprises of the I2S audio controller, audio DMA blocks and Audio
> sub-system clock registers.
>
> Right now, there is no way to hook up power-domains with clock providers.
> During late boot when this power-domain gets disabled, we get following
> external abort.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>
> ---
> arch/arm/boot/dts/exynos5420.dtsi |    5 -----
>  1 file changed, 5 deletions(-)

Tested-by: Doug Anderson <dianders@chromium.org>

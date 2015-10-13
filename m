From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 3/4] ARM: multi_v7_defconfig: Enable Maxim 8997 family drivers
Date: Tue, 13 Oct 2015 10:36:50 +0200
Message-ID: <CABxcv=m3tjo6rX3QVTjy3YPiM8AXF=m45TLVvc4-eZK+51X-8Q@mail.gmail.com>
References: <1444699628-3774-1-git-send-email-k.kozlowski@samsung.com>
	<1444699628-3774-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:32902 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751086AbbJMIgv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2015 04:36:51 -0400
Received: by ykoo7 with SMTP id o7so9765738yko.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2015 01:36:51 -0700 (PDT)
In-Reply-To: <1444699628-3774-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>

Hello Krzysztof,

On Tue, Oct 13, 2015 at 3:27 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> Enable support for Maxim 8997 Multi Function Device present on Trats and
> Origen boards by toggling on drivers: main MFD, charger, haptic motor,
> regulator, LED and RTC.
>
> This allows to test and usage of these boards with multi_v7 config.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

[snip]

>  CONFIG_MFD_MAX77686=y
>  CONFIG_MFD_MAX77693=y
>  CONFIG_MFD_MAX8907=y
> +CONFIG_MFD_MAX8997=y

Only slightly related with your patch but some of the MFD driver for
PMICs used in Exynos boards (like MAX77686) have a tristate Kconfig
symbol while others like this one have a boolean. Do you know if there
are any restrictions w.r.t build this as module or is just an
arbitrary decision? I'm asking since probably we should either allow
this to build as a module or convert the others to boolean.

Patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
Javier

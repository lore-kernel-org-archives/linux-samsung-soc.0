From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Add EHCI AHB burst function
Date: Wed, 29 Feb 2012 18:31:54 +0530
Message-ID: <CAJuYYwTW6rBiSJdeFYMui96t6nszjADW4t+14XakRkc=_4DbBA@mail.gmail.com>
References: <1330519283-4722-1-git-send-email-sangwook.lee@linaro.org>
	<1330519283-4722-2-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:46404 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755147Ab2B2NBz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 08:01:55 -0500
Received: by vcqp1 with SMTP id p1so3314399vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Feb 2012 05:01:54 -0800 (PST)
In-Reply-To: <1330519283-4722-2-git-send-email-sangwook.lee@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangwook Lee <sangwook.lee@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, gregkh@suse.de, kgene.kim@samsung.com, stern@rowland.harvard.edu, jg1.han@samsung.com, jy0922.shim@samsung.com, patches@linaro.org, linaro-dev@lists.linaro.org, linux@arm.linux.org.uk

Hi Sangwook,

On 29 February 2012 18:11, Sangwook Lee <sangwook.lee@linaro.org> wrote=
:
> Enable burst transfer from AHB for EHCI.
> This fixes data transfer of USB Ethernet with EHCI.
> Without this patch, scp hardly works.
>
> Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
> ---
> =A0arch/arm/mach-exynos/setup-usb-phy.c =A0 =A0 =A0| =A0 =A06 ++++++
> =A0arch/arm/plat-samsung/devs.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02=
 ++
> =A0arch/arm/plat-samsung/include/plat/ehci.h | =A0 19 +++++++++++++++=
++++
> =A03 files changed, 27 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exy=
nos/setup-usb-phy.c
> index 41743d2..5a20460 100644
> --- a/arch/arm/mach-exynos/setup-usb-phy.c
> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
> @@ -18,6 +18,7 @@
> =A0#include <mach/regs-usb-phy.h>
> =A0#include <plat/cpu.h>
> =A0#include <plat/usb-phy.h>
> +#include <plat/ehci.h>
>
> =A0static atomic_t host_usage;
>
> @@ -149,3 +150,8 @@ int s5p_usb_phy_exit(struct platform_device *pdev=
, int type)
>
> =A0 =A0 =A0 =A0return -EINVAL;
> =A0}
> +
> +void s5p_ehci_burst_enable(struct platform_device *pdev, void __iome=
m *base)
> +{
> + =A0 =A0 =A0 writel(EHCI_INSNREG00_ENABLE_BURST, base + EHCI_INSNREG=
00);
> +}

This functionality can be added in ehci-s5p itself and avoid adding a
new platform callback in platform data. If this is specific to exynos,
driver data could be added in ehci-s5p to indicate platforms that need
this to be enabled.

Thanks,
Thomas.

[...]

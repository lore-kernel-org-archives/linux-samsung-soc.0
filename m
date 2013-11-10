From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Add enable property to power domains
Date: Sun, 10 Nov 2013 20:06:45 +0100
Message-ID: <1646520.A0KuNSviNZ@flatron>
References: <1383806575-28401-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:62327 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751892Ab3KJTGr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Nov 2013 14:06:47 -0500
In-Reply-To: <1383806575-28401-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, Prathyush K <prathyush.k@samsung.com>

Hi Sachin,

On Thursday 07 of November 2013 12:12:55 Sachin Kamat wrote:
> From: Prathyush K <prathyush.k@samsung.com>
> 
> Different power domains of Exynos SOCs have different enable values.
> E.g. Exynos5250:
> ROTATOR_MEM_CONFIGURATION -> 0x3
> GSCL_CONFIGURATION -> 0x7
> Currently, there is no way to differentiate between these power domains
> and we write default value of 0x7 to turn on all the power domains.
> 
> This patch adds a new 'enable' property to the power domain structure.
> This enable value can be set from the device tree by adding a property
> 'enable' in the device node. If no such property is found, the default
> value of 0x7 is used as enable value.

Is this patch really needed? Is there any problem with simply using 0x7?
Patch description should always include rationale behind the change.

> 
> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  .../bindings/arm/exynos/power_domain.txt           |    5 +++++
>  arch/arm/mach-exynos/pm_domains.c                  |   10 +++++++---
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> index 5216b419016a..6b24b234617c 100644
> --- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> +++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> @@ -9,6 +9,10 @@ Required Properties:
>  - reg: physical base address of the controller and length of memory mapped
>      region.
>  
> +Optional Properties:
> +- enable: enable value of the register which is used to turn on the power
> +    domain. If no enable is specificed, default value of 0x7 is used.

Vendor-specific properties should have vendor prefix added, so this one
should be called samsung,enable instead. Also enable is not a very
specific name.

So in the end, if it turns out that we really need such patch, I'd prefer
something like:

- samsung,enable-bit-mask: Mask of power control register bits that need
    to be set to enable the power domain. If omitted, it defaults to 0x7.

Best regards,
Tomasz

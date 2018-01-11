From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: s5pv210: add interrupt-parent for ohci
Date: Thu, 11 Jan 2018 09:09:11 +0100
Message-ID: <CAJKOXPfhQOBg5z3rXHqH7-rA+S_ggTeu=OxHEYm7NG=NDy-8qQ@mail.gmail.com>
References: <20180110161045.4052684-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753660AbeAKIJO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 03:09:14 -0500
In-Reply-To: <20180110161045.4052684-1-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Guenter Roeck <linux@roeck-us.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 10, 2018 at 5:10 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> The ohci-hcd node has an interrupt number but no interrupt-parent,
> leading to a warning with current dtc versions:
>
> arch/arm/boot/dts/s5pv210-aquila.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
> arch/arm/boot/dts/s5pv210-goni.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
> arch/arm/boot/dts/s5pv210-smdkc110.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
> arch/arm/boot/dts/s5pv210-smdkv210.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
> arch/arm/boot/dts/s5pv210-torbreck.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
>
> As seen from the related exynos dts files, the ohci and ehci controllers
> always share one interrupt number, and the number is the same here as
> well, so setting the same interrupt-parent is the reasonable solution
> here.

Your patch is correct. However my last pull request still waits and it
is quite late in this release cycle so I will apply it for v4.17 after
this merge window. On the other hand you can take it directly (in that
case: Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>).

Best regards,
Krzysztof

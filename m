From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 3/5] ARM: Exynos4: Add pinctrl devices and pin maps
Date: Mon, 12 Mar 2012 09:52:10 +0530
Message-ID: <CAJuYYwQPrOte4EjpfBbUW0vg+qFJwYgZcSM88iZ95C8LwWuptg@mail.gmail.com>
References: <1331469965-28846-1-git-send-email-thomas.abraham@linaro.org>
	<1331469965-28846-4-git-send-email-thomas.abraham@linaro.org>
	<4F5D1661.4090007@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F5D1661.4090007@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

2012/3/12 Kukjin Kim <kgene.kim@samsung.com>:
> Thomas Abraham wrote:
>> Add the three pinctrl platform devices and the pin maps for Exynos4.
>>
>> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
>> ---
>> =A0 arch/arm/mach-exynos/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
1 +
>> =A0 arch/arm/mach-exynos/Makefile =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01=
 +
>> =A0 arch/arm/mach-exynos/common.h =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A06=
 ++
>> =A0 arch/arm/mach-exynos/dev-pinctrl.c =A0 =A0 =A0 =A0| =A0115 +++++=
++++++++++++++++++++++++
>> =A0 arch/arm/plat-samsung/include/plat/devs.h | =A0 =A03 +
>> =A0 5 files changed, 126 insertions(+), 0 deletions(-)
>> =A0 create mode 100644 arch/arm/mach-exynos/dev-pinctrl.c
>
> [...]
>
>> +#include<linux/kernel.h>
>> +#include<linux/dma-mapping.h>
>> +#include<linux/platform_device.h>
>> +#include<linux/interrupt.h>
>> +#include<linux/pinctrl/machine.h>
>
> #include <linux/ioport.h> for DEFINE_RES_xxx at below.
>
>> +
>> +#include<plat/devs.h>
>> +#include<plat/pinctrl.h>
>> +
>> +#include<mach/map.h>
>> +
>> +static struct resource exynos4_pinctrl_resource0[] =3D {
>> + =A0 =A0 [0] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D EXYNOS4_PA_GPIO1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D EXYNOS4_PA_GPIO1 + SZ_4K -=
 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
>> + =A0 =A0 },
>
> [0] =3D DEFINE_RES_MEM(EXYNOS4_PA_GPIO1, SZ_4K),
>
>> + =A0 =A0 [1] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_GPIO_XA,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_GPIO_XA,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
>> + =A0 =A0 },
>
> [1] =3D DEFINE_RES_IRQ(IRQ_GPIO_XA),
>
> But I'm thinking, we need to move to use EXYNOS4_IRQ_GPIO_XA here for
> both EXYNOS4 and EXYNOS5 and as a note, I'm working on updating IRQ
> naming you can see it in this week :)

Thanks for reviewing this patch series. I will use DEFINE_RES_xxx for
resource instantiation.

Regards,
Thomas.

[...]

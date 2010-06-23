From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v2 0/4] ARM: S5P: Support gpio interrupts
Date: Wed, 23 Jun 2010 22:36:54 +0900
Message-ID: <AANLkTilGbh8F-LzBhbB-q8h6bcrFPHlFSriuDo_WXKMB@mail.gmail.com>
References: <4C11F4CA.10802@samsung.com>
	<004601cb12a8$c869e560$593db020$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:61214 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751932Ab0FWNgz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 09:36:55 -0400
Received: by pvh11 with SMTP id 11so879982pvh.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jun 2010 06:36:54 -0700 (PDT)
In-Reply-To: <004601cb12a8$c869e560$593db020$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Eric Miao <eric.y.miao@gmail.com>

On Wed, Jun 23, 2010 at 4:50 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Joonyoung Shim wrote:
>>
>> This patch v2 set is to support gpio interrupts of samsung s5p cpus,=
 and
>> the GPIOlib gpio_to_irq goes to plat-samsung gpiolib, so patch v2 se=
t
>> has four commit smaller than v1.
>>
>> Changes since v1:
>> - Add irq_base to s3c_gpio_chip struct
>> - GPIOlib gpio_to_irq() is implemented to samsung_gpiolib_to_irq() o=
f
>> =A0 plat-samsung gpiolib
>>
>> Joonyoung Shim (4):
>> =A0 =A0 =A0 ARM: S5PV210: Add gpio interrupt support
>> =A0 =A0 =A0 ARM: S5PC100: Use S5P gpio interrupts interface
>> =A0 =A0 =A0 ARM: S5PC100: Move external interrupt defines
>> =A0 =A0 =A0 ARM: SAMSUNG: Add GPIOlib gpio_to_irq
>>
>> =A0arch/arm/mach-s5pc100/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
>> =A0arch/arm/mach-s5pc100/gpiolib.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 70 ++-----
>> =A0arch/arm/mach-s5pc100/include/mach/gpio.h =A0 =A0 =A0| =A0 =A07 -
>> =A0arch/arm/mach-s5pc100/include/mach/irqs.h =A0 =A0 =A0| =A0 18 ++-
>> =A0arch/arm/mach-s5pc100/include/mach/regs-gpio.h | =A0 =A07 +
>> =A0arch/arm/mach-s5pc100/irq-gpio.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
266
> ------------------------
>> =A0arch/arm/mach-s5pv210/gpiolib.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 18 ++-
>> =A0arch/arm/mach-s5pv210/include/mach/irqs.h =A0 =A0 =A0| =A0 16 ++-
>> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-
>> =A0arch/arm/plat-s5p/irq-gpioint.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0208 ++++++++++++++++++
>> =A0arch/arm/plat-samsung/gpiolib.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A09 +
>> =A0arch/arm/plat-samsung/include/plat/gpio-core.h | =A0 =A06 +
>> =A012 files changed, 295 insertions(+), 334 deletions(-)
>> =A0delete mode 100644 arch/arm/mach-s5pc100/irq-gpio.c
>> =A0create mode 100644 arch/arm/plat-s5p/irq-gpioint.c
>>
>
> I am sure this patchset is working code, but Ben had made suggestion =
about
> 'sparse irq'...
> It is because there are too many gpio interrupts and having support o=
f all
> of them is unnecessary as realistically only few of them maybe used.
> In fact in SMDK board there is no use of gpio in interrupt mode.
>
> Ben, I remember your suggestion for using 'sparse irq' for handling g=
pio
> interrupts.
> And in fact, sparse irq implementation can be beneficial to many othe=
r
> boards...
> Could you please explain about that?
Interesting.
you can find it by "[ARM] Preliminary support for dynamic IRQ" written =
by Eric.
Instead define the 'NR_IRQS' of chip, board can define each 'nr_irqs'
at init time.

Maybe smdk don't use the GPIOs. but mobile phones at samsung use the un=
til MP0x.
Sometime H/W team connect it at MP04 or MP05 which doesn't support
GPIO interrupt.

Thank you,
Kyungmin Park

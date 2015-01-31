From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: =?UTF-8?B?UFJPQkxFTTrCoEJVRyAgYXBwZWFyaW5nIHdoZW4gdHJ5aW5nIHQ=?=
 =?UTF-8?B?byBhbGxvY2F0ZSBpbnRlcnJ1cHQgb24gRXh5bm9zIE1DVCBhZnRlciBDUFUgaG8=?=
 =?UTF-8?B?dHBsdWc=?=
Date: Sat, 31 Jan 2015 10:21:54 +0100
Message-ID: <54CC9EB2.7010409@linaro.org>
References: <544907D4.1020409@samsung.com> <20141023140644.GI27405@n2100.arm.linux.org.uk> <54494BEE.9020702@codeaurora.org> <544A52B0.9050901@samsung.com> <544EA810.6090502@codeaurora.org> <5450C391.2070007@samsung.com> <54CC2B18.2070809@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:61996 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752537AbbAaJV7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 31 Jan 2015 04:21:59 -0500
Received: by mail-we0-f176.google.com with SMTP id w62so30952222wes.7
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jan 2015 01:21:58 -0800 (PST)
In-Reply-To: <54CC2B18.2070809@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Marcin Jabrzyk <m.jabrzyk@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Mark Rutland <Mark.Rutland@arm.com>, Chander Kashyap <chander.kashyap@linaro.org>

On 01/31/2015 02:08 AM, Stephen Boyd wrote:
> Kept meaning to get back to this thread. Have you resolved it?
>
> On 10/29/14 03:38, Marcin Jabrzyk wrote:
>> So I've tried this patch, it resolves one problem but introduces als=
o
>> new ones. As expected the BUG warning is not showing after applying
>> this patch but there are some interesting side effects.
>
> Well that's half good news.
>
>> I was looking on /proc/interrupts output. IRQ for CPU0 have "MCT" na=
me
>> and IRQ for CPU1 has unexpectedly no name at all.
>
> This is pretty confusing. I don't see how the patch could cause this =
to
> happen.
>
>> After making hotplug cycle of CPU1 I've observed that IRQs attached
>> originally for that CPU are generating on really low count and not i=
n
>> order with IRQ for CPU0.
>> What's more the interrupt for CPU1 is showing to me as being counted
>> for both CPUs, so it's probably not being attached to CPU1.
>>
>
> yeah. Can you give the output of /proc/timer_list in addition to
> /proc/interrupts? It may give some hints on what's going on. It may a=
lso
> be interesting to see if irq_force_affinity() is failing. Please chec=
k
> the return value and print an error

Hi Stephen, Marcin,

can you have a look if the patch [1] fixes this issue ?

  -- Daniel

[1] https://lkml.org/lkml/2015/1/30/423


> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/e=
xynos_mct.c
> index 1800053b4644..3c4538e26731 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -450,6 +450,7 @@ static int exynos4_local_timer_setup(struct clock=
_event_device *evt)
>   {
>   	struct mct_clock_event_device *mevt;
>   	unsigned int cpu =3D smp_processor_id();
> +	int ret;
>
>   	mevt =3D container_of(evt, struct mct_clock_event_device, evt);
>
> @@ -468,7 +469,9 @@ static int exynos4_local_timer_setup(struct clock=
_event_device *evt)
>   	if (mct_int_type =3D=3D MCT_INT_SPI) {
>   		evt->irq =3D mct_irqs[MCT_L0_IRQ + cpu];
>   		enable_irq(evt->irq);
> -		irq_force_affinity(mct_irqs[MCT_L0_IRQ + cpu], cpumask_of(cpu));
> +		ret =3D irq_force_affinity(mct_irqs[MCT_L0_IRQ + cpu], cpumask_of(=
cpu));
> +		if (ret)
> +			pr_err("force failed %d\n", ret);
>   	} else {
>   		enable_percpu_irq(mct_irqs[MCT_L0_IRQ], 0);
>   	}
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

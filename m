From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v2 1/1] irqchip: exynos-combiner: Save IRQ enable set
 on suspend
Date: Fri, 12 Jun 2015 11:56:46 +0100
Message-ID: <557ABAEE.9010703@arm.com>
References: <1434087795-13990-1-git-send-email-javier.martinez@collabora.co.uk> <557AB00C.5040606@arm.com> <557AB793.1060809@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:58374 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751067AbbFLK4v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 06:56:51 -0400
In-Reply-To: <557AB793.1060809@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Chanho Park <parkch98@gmail.com>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Peter Chubb <peter.chubb@nicta.com.au>, Shuah Khan <shuahkhan@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>



On 12/06/15 11:42, Krzysztof Kozlowski wrote:
> On 12.06.2015 19:10, Sudeep Holla wrote:
>>
>>
>> On 12/06/15 06:43, Javier Martinez Canillas wrote:
>>> The Exynos interrupt combiner IP loses its state when the SoC enters
>>> into a low power state during a Suspend-to-RAM. This means that if a
>>> IRQ is used as a source, the interrupts for the devices are disabled
>>> when the system is resumed from a sleep state so are not triggered.
>>>
>>> Save the interrupt enable set register for each combiner group and
>>> restore it after resume to make sure that the interrupts are enabled.
>>>
>>
>> Not sure if you need this. IMO it's not clean and redundant though I
>> admit many drivers do exactly same thing. I am trying to remove or point
>> out those redundant code as irqchip core has options/flags to do what
>> you need. I assume there are no wakeup sources connected to this
>> combiner.
>
> It may have wake up sources connected. Correct me if I am wrong but (at
> least) on Exynos5250 combiner takes care of gpx1 GPIO pins which may be
> external interrupts (e.g. power key on Exynos5250 Snow). I didn't check
> other boards.
>

In that case, this irqchip should implement irq_set_wake and the driver
implementing power key should use enable_irq_wake in the suspend path.
Just saving all the mask/enable registers is not scalable solution and
also useless if it's just one or to interrupts that are very few IRQs
registered/actively being used.

Regards,
Sudeep

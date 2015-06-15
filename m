From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/1] irqchip: exynos-combiner: Save IRQ enable set on
 suspend
Date: Tue, 16 Jun 2015 08:57:43 +0900
Message-ID: <557F6677.8080507@samsung.com>
References: <1434087795-13990-1-git-send-email-javier.martinez@collabora.co.uk>
 <557AB00C.5040606@arm.com> <557AC23D.8040602@collabora.co.uk>
 <557AC85E.5070705@arm.com> <557AD728.7090908@collabora.co.uk>
 <557B34A7.4090507@collabora.co.uk>
 <CAD=FV=UQF+n8AjSXYajqUb0qswcoUrSgnsasV82JaS3dBtNO8Q@mail.gmail.com>
 <557E82BC.7080203@collabora.co.uk> <557E947B.3030804@arm.com>
 <557EE890.2050001@collabora.co.uk> <557EEA6C.6020002@arm.com>
 <557EEDFB.7080502@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:40570 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750989AbbFOX5u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 19:57:50 -0400
In-reply-to: <557EEDFB.7080502@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Sudeep Holla <sudeep.holla@arm.com>, Doug Anderson <dianders@chromium.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Chanho Park <parkch98@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Peter Chubb <peter.chubb@nicta.com.au>, Shuah Khan <shuahkhan@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 16.06.2015 00:23, Javier Martinez Canillas wrote:
(...)
>>> To do a more intrusive change, I should better understand the interactions
>>> between the Exynos pinctrl / GPIO, interrupt combiner and the GIC and in the
>>> meantime S2R will continue to be broken on these platforms unless someone
>>> more familiar with all this could point me in the right direction.
>>>
>>
>> As I said I am fine with this patch for now and I don't want to block it.
>>
> 
> Thanks a lot, Krzysztof who is one of the Exynos maintainers has also agreed
> with the patch so hopefully this can land sooner rather than later.

I assume this will go through irqchip tree, right?

Best regards,
Krzysztof

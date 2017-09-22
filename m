From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Add dwc3 SUSPHY quirk
Date: Fri, 22 Sep 2017 10:18:54 +0200
Message-ID: <894725fe-595b-45dc-e567-41caf48a012b@samsung.com>
References: <1505728934-6200-1-git-send-email-andrzej.p@samsung.com>
        <CGME20170918100230eucas1p29fae00c53f1106af1961a6e269740b2f@eucas1p2.samsung.com>
        <1505728934-6200-2-git-send-email-andrzej.p@samsung.com>
        <20170919174038.2sspjvadt6ggka65@kozik-lap>
        <fcefaaab-b99c-a8cc-9684-98cc3c4d803e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50206 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751704AbdIVITI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Sep 2017 04:19:08 -0400
In-reply-to: <fcefaaab-b99c-a8cc-9684-98cc3c4d803e@arm.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Felipe Balbi <balbi@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

Hi,

W dniu 19.09.2017 o 20:10, Robin Murphy pisze:
> On 19/09/17 18:40, Krzysztof Kozlowski wrote:
>> On Mon, Sep 18, 2017 at 12:02:13PM +0200, Andrzej Pietrasiewicz wrote:
>>> Odroid XU4 board does not enumerate SuperSpeed devices.
>>> This patch makes exynos5 series chips use USB SUSPHY quirk,
>>> which solves the problem.
>>>
>>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
>>> ---
>>>   arch/arm/boot/dts/exynos54xx.dtsi | 2 ++
>>>   1 file changed, 2 insertions(+)
>>
>> Makes sense to me... was it tested also on XU3 and XU?
> 
> Well, it at least doesn't make USB3 on my XU any more or less broken
> than it was before ;) (both ports still report an over-current condition
> even with nothing plugged in - I suspect there's probably still some
> pinctrl/regulator stuff missing)
> 
> Robin.
> 
Similar with XU3: nothing is any more or less broken with this patch
compared to the situation without the patch.

Andrzej

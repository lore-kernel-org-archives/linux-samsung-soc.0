From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 0/4] Exynos SROMc configuration and Ethernet support for
 SMDK5410
Date: Thu, 05 Nov 2015 17:07:41 +0900
Message-ID: <563B0E4D.6020808@samsung.com>
References: <cover.1446542020.git.p.fedin@samsung.com>
 <5639B588.1080901@samsung.com> <000b01d1179f$ed5032b0$c7f09810$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34402 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1032099AbbKEIHu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2015 03:07:50 -0500
In-reply-to: <000b01d1179f$ed5032b0$c7f09810$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Kukjin Kim' <kgene@kernel.org>

On 05.11.2015 16:59, Pavel Fedin wrote:
>  Hello!
> 
>>> This patchset also depends on Exynos 5410 pinctrl support, introduced by
>>> patches 0003 and 0004 from this set:
>>> [PATCH v4 0/5] ARM: EXYNOS: ODROID-XU DT and LEDs
>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/330862.html
>>
>> Only the first patch made up to kernel. The rest (2-5) received feedback
>> and I am waiting for fixing it. Andreas apparently loose the interest...
> 
>  I have rechecked the original thread on archives and found nothing new. Where can
> i read those feedbacks? Perhaps it makes sense for me to pick them up and include
> into my set.

Go ahead. The only waiting feedback is at patch 2/5:

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/330910.html
Javier's pointed use of linux,stdout-path and putting xxti in
exynos5410.dtsi (and customizing it per board if needed).

Patches already got reviews and acks so only 2/5 is the stopper.

Best regards,
Krzysztof

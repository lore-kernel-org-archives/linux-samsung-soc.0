From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Only Odroid XU3-family boards use DTSI
 with CPU thermal nodes
Date: Wed, 11 May 2016 07:49:19 +0200
Message-ID: <5732C7DF.2080800@samsung.com>
References: <1462774789-15360-1-git-send-email-k.kozlowski@samsung.com>
 <CANAwSgT9SY3kj8+beMpc1xGoC=rMBSya+2v2dyZQp6ykH+V0=g@mail.gmail.com>
 <573198BE.6020900@samsung.com>
 <CANAwSgTy6p9AVmmOWATpSO1JqVbwE0v+y_y-RLd+32RnNJTA+Q@mail.gmail.com>
 <5731D764.8070007@samsung.com>
 <CANAwSgRsjdQh6ygT__5XcH8-cF9Ch+zbk8oupebwYzY1kCZu6g@mail.gmail.com>
 <5731EA1B.4070201@samsung.com>
 <CANAwSgQGhrBca7=Ow8+Hh9t0W9HWp=F43KR0Frfpx9fGngPSaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38033 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751152AbcEKFtZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 01:49:25 -0400
In-reply-to: <CANAwSgQGhrBca7=Ow8+Hh9t0W9HWp=F43KR0Frfpx9fGngPSaw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 05/10/2016 09:45 PM, Anand Moon wrote:
> Hi Krzysztof,
> 
> Sorry I am not able to explain my self clearly.
> But I have once gain tested these changes.
> 
> Only could you append with following changes.
> --------------------------------------------------------
> +                               cpu_crit0: cpu-crit-0 {
> +                                       temperature = <120000>; /*
> millicelsius */
> +                                       hysteresis = <5000>; /* millicelsius */
> +                                       type = "critical";
> +                               };
> --------------------------------------------------------
> hysteresis time help to adjust the present and past temperature inputs
> before critical shutdown.

I need more details why you want this patch. What is the point of
hysteresis on critical trip point? When reaching this trip point the
system shutdowns... there is nothing more to do, I think.

Best regards,
Krzysztof

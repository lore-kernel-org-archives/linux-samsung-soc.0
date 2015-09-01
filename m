From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] ARM: EXYNOS: reset KFC cores when cpu is up
Date: Tue, 01 Sep 2015 12:33:06 -0700
Message-ID: <7hy4gq6ikt.fsf@deeprootsystems.com>
References: <1441031111-6549-1-git-send-email-parkch98@gmail.com>
	<7hmvx785wx.fsf@deeprootsystems.com>
	<55E4D93E.4090307@osg.samsung.com> <55E4EFA3.1050007@samsung.com>
	<CAM4voamGcz_g+ONa-YaYMs0ZGgcPiXGGOeCV47U5nw_uu48+Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:35050 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778AbbIATdJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Sep 2015 15:33:09 -0400
Received: by pacfv12 with SMTP id fv12so5326170pac.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Sep 2015 12:33:08 -0700 (PDT)
In-Reply-To: <CAM4voamGcz_g+ONa-YaYMs0ZGgcPiXGGOeCV47U5nw_uu48+Jg@mail.gmail.com>
	(Abhilash Kesavan's message of "Tue, 1 Sep 2015 20:17:14 +0530")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Chanho Park <parkch98@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, Heesub Shin <heesub.shin@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Przemyslaw Marczak <p.marczak@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Abhilash Kesavan <kesavan.abhilash@gmail.com> writes:

> On Tue, Sep 1, 2015 at 5:51 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> On 01.09.2015 07:46, Javier Martinez Canillas wrote:

[...]

>>> I posted a similar patch that instead disabling CCI for the XU3 board,
>>> it disables in exynos5422-odroidxu3-common.dtsi since all Exynos5422
>>> Odroid boards have the same broken firmware and so the same issue:
>>>
>>> https://lkml.org/lkml/2015/8/29/59

OK, that makes more sense.  Thanks.

>>> Krzysztof tested it on an Odroid XU3 Lite and reported that disabling
>>> CCI caused some CPUs to fail to boot even with $subject applied:
>>>
>>> https://lkml.org/lkml/2015/8/29/65
>>>
>>> Did you succeed booting all CPUs with CONFIG_ARM_BIG_LITTLE_CPUIDLE
>>> enabled and CCI disabled in the the Odroid XU3 DTS?

I thought so, but re-testing I'm seein the same results as Krzysztof:

>> Indeed. On Odroid XU3 Chanho's patch gives me 8 CPUs up. Disabling CCI
>> causes fails on CPU{5,6,7} (Cortex-A15).
>
> Chanho's patch is for the exynos mcpm back-end. However, when we
> disable CCI the mcpm code is bypassed and we default to the code in
> exynos' platsmp.c/firmware.c. If the A7s were failing to boot-up then
> the reason could have been that Chanho's workaround was not being
> executed after applying the CCI disablement patch.
> According to the comments the A15s are not booting and so the
> exynos_boot_secondary function needs to be checked further.

Thanks for the explanation.  That makes sense.  $SUBJECT fix should
be made so it works for both scenarios.

Kevin

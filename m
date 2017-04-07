From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v9 03/12] ARM: EXYNOS: remove secondary startup
 initialization from smp_prepare_cpus
Date: Fri, 7 Apr 2017 17:45:44 +0530
Message-ID: <9b1b33ee-b88c-2fe3-0552-8afac2920334@samsung.com>
References: <CGME20170330131424epcas5p4fccfab06e5d77d70d09c3835c3332ee5@epcas5p4.samsung.com>
        <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
        <1490879826-16754-4-git-send-email-pankaj.dubey@samsung.com>
        <CAJKOXPcyvVmsAvBUhqxV=WuFKjqKCqcidTFQ5mTtUFDAfmpcrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26729 "EHLO
        epoutp01.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S933609AbdDGMMb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 08:12:31 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by epoutp01.samsung.com (KnoxPortal) with ESMTP id 20170407121229epoutp01b27abb926cd3a5cd147d669c7b10de9e~zHGtpKMVE0593005930epoutp01s
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 12:12:29 +0000 (GMT)
In-Reply-To: <CAJKOXPcyvVmsAvBUhqxV=WuFKjqKCqcidTFQ5mTtUFDAfmpcrg@mail.gmail.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, Marek Szyprowski <m.szyprowski@samsung.com>, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>



On Friday 07 April 2017 02:01 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 30, 2017 at 3:16 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>> We are taking care of setting secondary cpu boot address in
>> exynos_boot_secondary just before sending ipi to secondary CPUs,
>> so we can safely remove this setting from smp_prepare_cpus.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>  arch/arm/mach-exynos/platsmp.c | 26 --------------------------
>>  1 file changed, 26 deletions(-)
>>
> 
> I also wondered why we need this twice... Testing on different
> platforms would be nice to be sure that we did not miss anything but
> it looks correct for me. For my reference:
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 

Thanks for review.
I am trying to get one Exynos3250 based board for testing, once I get
chance to test on it, I will update status about this.

Pankaj Dubey
> Best regards,
> Krzysztof
> 
> 
> 

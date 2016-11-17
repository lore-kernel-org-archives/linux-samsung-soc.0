From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 02/16] ARM: EXYNOS: use generic API to enable SCU
Date: Thu, 17 Nov 2016 07:45:58 +0530
Message-ID: <42557882-731a-02ea-d1df-e2e18489f83d@samsung.com>
References: <1479099731-28108-1-git-send-email-pankaj.dubey@samsung.com>
 <1479099731-28108-3-git-send-email-pankaj.dubey@samsung.com>
 <CGME20161115185949epcas3p257a8db846b495017a5d30522bf8ab5ea@epcas3p2.samsung.com>
 <20161115185939.GA14626@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40144 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751953AbcKQCNF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 21:13:05 -0500
In-reply-to: <20161115185939.GA14626@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, arnd@arndb.de, horms@verge.net.au, magnus.damm@gmail.com, geert+renesas@glider.be, vireshk@kernel.org, shiraz.linux.kernel@gmail.com, thomas.ab@samsung.com, linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Wednesday 16 November 2016 12:29 AM, Krzysztof Kozlowski wrote:
> On Mon, Nov 14, 2016 at 10:31:57AM +0530, Pankaj Dubey wrote:
>> Now as we have of_scu_enable which takes care of mapping
>> scu base from DT, lets use it.
>>
>> This patch also fixes build failure in case !SMP caused
>> by commit SHA ID: 94210b1abb2 which is already merged in
>> krzk/for-next branch
>>
>> CC: Krzysztof Kozlowski <krzk@kernel.org>
>> CC: linux-samsung-soc@vger.kernel.org
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>  arch/arm/mach-exynos/common.h  |  1 -
>>  arch/arm/mach-exynos/platsmp.c | 30 ++++--------------------------
>>  arch/arm/mach-exynos/pm.c      |  4 ++--
>>  arch/arm/mach-exynos/suspend.c | 14 ++++----------
>>  4 files changed, 10 insertions(+), 39 deletions(-)
>>
> 
> Looks correct, for reference:
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 

Thanks for review.

> However this depends on changes in my next/soc branch (and these changes
> were the trigger for this patchset). I can either provide a tag with
> Exynos commits or accept one with common SCU code.
> 

I am not sure through which tree this series need to be taken. I will
leave this to you and ARM-SOC maintainers.

As there are few comments on few patches of this series, I will address
them and soon post v2. Though I don't see any changes will be in v2 for
exynos platform. So I will include your review tag.

Thanks,
Pankaj Dubey

> Best regards,
> Krzysztof
> 
> 
> 

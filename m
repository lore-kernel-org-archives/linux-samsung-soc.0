From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 2/2] phy: Select PHY_EXYNOS_DP_VIDEO by default for
 ARCH_EXYNOS
Date: Fri, 21 Feb 2014 17:25:04 +0100
Message-ID: <53077DE0.7080108@samsung.com>
References: <1392997802-29050-1-git-send-email-s.nawrocki@samsung.com>
 <1392997802-29050-2-git-send-email-s.nawrocki@samsung.com>
 <1753680.KKj0Q1erxA@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:10128 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754370AbaBUQZK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Feb 2014 11:25:10 -0500
In-reply-to: <1753680.KKj0Q1erxA@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: kishon@ti.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, linux-kernel@vger.kernel.org

On 21/02/14 16:59, Arnd Bergmann wrote:
> On Friday 21 February 2014 16:50:02 Sylwester Nawrocki wrote:
>>  config PHY_EXYNOS_DP_VIDEO
>>         tristate "EXYNOS SoC series Display Port PHY driver"
>>         depends on OF
>> +       depends on ARCH_EXYNOS || COMPILE_TEST
>> +       default y
>>         select GENERIC_PHY
>>         help
>>
> 
> That would turn them on automatically if you enable COMPILE_TEST, which
> is probably not what you want.
> 
> How about "default ARCH_EXYNOS"?

Hmm, good point, I will modify it that way.

For patch 1/2 I guess it should be:

"default ARCH_S5PV210 || ARCH_EXYNOS"

or rather

"default y if ARCH_S5PV210 || ARCH_EXYNOS" ?

Thanks,
Sylwester

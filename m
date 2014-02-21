From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 2/2] phy: Select PHY_EXYNOS_DP_VIDEO by default for
 ARCH_EXYNOS
Date: Fri, 21 Feb 2014 17:50:44 +0100
Message-ID: <530783E4.6090206@samsung.com>
References: <1392997802-29050-1-git-send-email-s.nawrocki@samsung.com>
 <1753680.KKj0Q1erxA@wuerfel> <53077DE0.7080108@samsung.com>
 <1888663.ccFYmJ9QJl@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:18360 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932141AbaBUQuv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Feb 2014 11:50:51 -0500
In-reply-to: <1888663.ccFYmJ9QJl@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, kishon@ti.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, linux-kernel@vger.kernel.org

On 21/02/14 17:41, Arnd Bergmann wrote:
> On Friday 21 February 2014 17:25:04 Sylwester Nawrocki wrote:
>> > 
>> > Hmm, good point, I will modify it that way.
>> > 
>> > For patch 1/2 I guess it should be:
>> > 
>> > "default ARCH_S5PV210 || ARCH_EXYNOS"
>> > 
>> > or rather
>> > 
>> > "default y if ARCH_S5PV210 || ARCH_EXYNOS" ?
>
> Right. I'd probably use the first syntax, but it doesn't really matter.

Oops, I've already sent patch using the second one, as it seemed
more common.

Thanks,
Sylwester

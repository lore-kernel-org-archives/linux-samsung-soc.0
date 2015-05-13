From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL] ARM: EXYNOS: dts: DTS fixes for 4.1, second try
Date: Wed, 13 May 2015 09:47:23 +0900
Message-ID: <55529F1B.3050703@samsung.com>
References: <1431313819-16843-1-git-send-email-k.kozlowski@samsung.com>
 <5552461A.6070304@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36084 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964800AbbEMAr3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 20:47:29 -0400
In-reply-to: <5552461A.6070304@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org

On 13.05.2015 03:27, Kukjin Kim wrote:
> On 05/11/15 12:10, Krzysztof Kozlowski wrote:
>> Dear Kukjin,
>>
>> This groups one fix missed in your last pull requst. This fixes suspend
>> on Peach boards related to Marvell mwifiex driver. The driver was
>> enabled for Exynos defconfig during merge window so currently
>> the suspend on these boards on this config fails.
>>
> Yes, you're right. Only exynos5250-snow related patch has been fixed
> before and this should be sent to upstream together. I've applied this
> into samsung-fixes-2 with your signed-off-by.
> 
> Note this will be sent to arm-soc before a couple of days of -rc4 with
> your other fix for suspend on exynos4.

Great, thank you!

What about the patches for next release (v4.2 or v4.3)? Do you have any
comments on them? These are mostly small improvements except one: the
coupled cpuidle driver for Exynos3250.

Best regards,
Krzysztof

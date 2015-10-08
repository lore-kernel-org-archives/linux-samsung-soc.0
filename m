From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4412-odroid: unify voltage regulator style
Date: Thu, 08 Oct 2015 09:57:56 +0900
Message-ID: <5615BF94.5080406@samsung.com>
References: <1442858340-4584-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1442858340-4584-2-git-send-email-tjakobi@math.uni-bielefeld.de>
 <561458C3.8030806@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22495 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752727AbbJHA6D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Oct 2015 20:58:03 -0400
In-reply-to: <561458C3.8030806@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org

On 07.10.2015 08:26, Tobias Jakobi wrote:
> Gentle ping!

Both patches are now in Kukjin's tree.

Best regards,
Krzysztof

> 
> - Tobias
> 
> Tobias Jakobi wrote:
>> Use 'ldoN_reg: LDON' syntax and drop the deprecated
>> 'regulator-compatible' property.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] ARM: dts: exynos4412-odroid: unify voltage regulator
 style
Date: Thu, 8 Oct 2015 12:25:30 +0200
Message-ID: <5616449A.6030508@math.uni-bielefeld.de>
References: <1442858340-4584-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1442858340-4584-2-git-send-email-tjakobi@math.uni-bielefeld.de>
 <561458C3.8030806@math.uni-bielefeld.de> <5615BF94.5080406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:42157 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754914AbbJHKZe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Oct 2015 06:25:34 -0400
In-Reply-To: <5615BF94.5080406@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org

Krzysztof Kozlowski wrote:
> On 07.10.2015 08:26, Tobias Jakobi wrote:
>> Gentle ping!
> 
> Both patches are now in Kukjin's tree.
Thanks Krzysztof for the heads up!

With best wishes,
Tobias


> Best regards,
> Krzysztof
> 
>>
>> - Tobias
>>
>> Tobias Jakobi wrote:
>>> Use 'ldoN_reg: LDON' syntax and drop the deprecated
>>> 'regulator-compatible' property.
>>>
>>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>> ---
>>>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 6 ++----
>>>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

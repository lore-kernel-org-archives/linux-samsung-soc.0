From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/5] clk: Combine DT binding doc for max77686 and max77802
Date: Thu, 16 Jun 2016 11:34:50 +0200
Message-ID: <576272BA.50800@samsung.com>
References: <1466000018-16784-1-git-send-email-ldewangan@nvidia.com>
 <1466000018-16784-3-git-send-email-ldewangan@nvidia.com>
 <a9a4bf3b-7ece-f92f-9d49-d4745f512e3c@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:19603 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752605AbcFPJez (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 05:34:55 -0400
In-reply-to: <a9a4bf3b-7ece-f92f-9d49-d4745f512e3c@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>

On 06/15/2016 05:19 PM, Javier Martinez Canillas wrote:
>> Remove the separate DT binding document file for maxim,max77802 and
>> move all information to maxim,max77686 DT binding document.
>>
> 
> Now, I wonder if this is the correct approach. A system integrator is
> probably going to search for the bindings of the chip that is present
> in their system. For example there are different DT bindings docs for
> both the max77686 and max77802 PMIC even when support is implemented
> by the same driver (drivers/mfd/max77686.c).
> 
> But maybe I'm wrong so I'll let people with more DT experience to say
> if merging the bindings docs in a single one is the correct approach.

I personally prefer having one binding document for all devices because
essentially it is almost the same device. For looking up I use git grep
with compatible string (or device name) so it does not matter, IMHO.

Best regards,
Krzysztof

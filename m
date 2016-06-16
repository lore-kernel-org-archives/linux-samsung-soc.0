From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 4/5] clk: max77686: Add support for MAX77620 clocks
Date: Thu, 16 Jun 2016 15:22:37 +0530
Message-ID: <576276E5.5040500@nvidia.com>
References: <1466000018-16784-1-git-send-email-ldewangan@nvidia.com> <1466000018-16784-5-git-send-email-ldewangan@nvidia.com> <57627757.50101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:11543 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752360AbcFPKFx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 06:05:53 -0400
In-Reply-To: <57627757.50101@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, javier@osg.samsung.com, mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>

Hi Krzysztof/Javier,
Thanks for review of the series.

I will post the V2 after taking care of all comment.

One query about the comment.

Thanks,
Laxman

On Thursday 16 June 2016 03:24 PM, Krzysztof Kozlowski wrote:
> On 06/15/2016 04:13 PM, Laxman Dewangan wrote:
>>   enum chip_name {
>>   	CHIP_MAX77686,
>>   	CHIP_MAX77802,
>> +	CHIP_MAX77620,
> Now it is more obvious why it is here. However I don't like the
> duplication of device IDs, under different names and different values:
> 1. include/linux/mfd/max77686-private.h
> 2. include/linux/mfd/max77620.h
> 3. here
>
> I was thinking about way of combining it... but these headers are
> different. Unless there will be one header for all three devices.
>
> Anyway, please add the max77686 prefix to the enum.

so will it be:

enum max77686_chip_name {
     CHIP_MAX77686,
     CHIP_MAX77802,
     CHIP_MAX77620,
};


Will it be fine here?

From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] drivers: amba: properly handle devices with power
 domains
Date: Wed, 25 Nov 2015 14:34:46 +0100
Message-ID: <5655B8F6.1070104@samsung.com>
References: <1448456127-31842-1-git-send-email-m.szyprowski@samsung.com>
 <1448456289-31960-1-git-send-email-m.szyprowski@samsung.com>
 <20151125132458.GL8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:65441 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751106AbbKYNet (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 08:34:49 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYD00EEGHPZ0J00@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Nov 2015 13:34:47 +0000 (GMT)
In-reply-to: <20151125132458.GL8644@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

On 2015-11-25 14:24, Russell King - ARM Linux wrote:
> On Wed, Nov 25, 2015 at 01:58:09PM +0100, Marek Szyprowski wrote:
>> To read pid/cid registers, the probed device need to be properly turned on.
>> When it is inside a power domain, the bus code should ensure that the
>> given power domain is enabled before trying to access device's registers.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/amba/bus.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
>> index f009936..25715cb 100644
>> --- a/drivers/amba/bus.c
>> +++ b/drivers/amba/bus.c
>> @@ -373,6 +373,12 @@ int amba_device_add(struct amba_device *dev, struct resource *parent)
>>   		goto err_release;
>>   	}
>>   
>> +	ret = dev_pm_domain_attach(&dev->dev, true);
>> +	if (ret) {
>> +		iounmap(tmp);
>> +		goto err_release;
>> +	}
>> +
> NAK.  If dev_pm_domain_attach() returns an error, even -EPROBE_DEFER,
> the result will be a missing device that has no way to be recovered.
> This is too fragile.

Then how the problem of accessing registers in turned-off device should 
be solved?

Is ignoring dev_pm_domain_attach() return value a solution for you?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

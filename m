From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] drivers: amba: properly handle devices with power
 domains
Date: Wed, 25 Nov 2015 15:43:07 +0100
Message-ID: <5655C8FB.8060902@samsung.com>
References: <1448456127-31842-1-git-send-email-m.szyprowski@samsung.com>
 <1448456289-31960-1-git-send-email-m.szyprowski@samsung.com>
 <20151125132458.GL8644@n2100.arm.linux.org.uk> <5655B8F6.1070104@samsung.com>
 <CAPDyKFqTqPijF+Lbq0+a-Gv8CyaAr13JvZPjUN1-GNL5i3-mAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:9874 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799AbbKYOnL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 09:43:11 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYD00FBFKVW8U20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Nov 2015 14:43:08 +0000 (GMT)
In-reply-to: <CAPDyKFqTqPijF+Lbq0+a-Gv8CyaAr13JvZPjUN1-GNL5i3-mAw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

On 2015-11-25 14:56, Ulf Hansson wrote:
> On 25 November 2015 at 14:34, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 2015-11-25 14:24, Russell King - ARM Linux wrote:
>>> On Wed, Nov 25, 2015 at 01:58:09PM +0100, Marek Szyprowski wrote:
>>>> To read pid/cid registers, the probed device need to be properly turned
>>>> on.
>>>> When it is inside a power domain, the bus code should ensure that the
>>>> given power domain is enabled before trying to access device's registers.
>>>>
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> ---
>>>>    drivers/amba/bus.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
>>>> index f009936..25715cb 100644
>>>> --- a/drivers/amba/bus.c
>>>> +++ b/drivers/amba/bus.c
>>>> @@ -373,6 +373,12 @@ int amba_device_add(struct amba_device *dev, struct
>>>> resource *parent)
>>>>                  goto err_release;
>>>>          }
>>>>    +     ret = dev_pm_domain_attach(&dev->dev, true);
>>>> +       if (ret) {
>>>> +               iounmap(tmp);
>>>> +               goto err_release;
>>>> +       }
>>>> +
>>> NAK.  If dev_pm_domain_attach() returns an error, even -EPROBE_DEFER,
>>> the result will be a missing device that has no way to be recovered.
>>> This is too fragile.
> I agree with Russell here, this isn't going to work.
>
>>
>> Then how the problem of accessing registers in turned-off device should be
>> solved?
> The long term solution has been discussed [1], please have a look and
> feel free to hack on it if you like. If not, I will sooner or later
> find time to pick up the work I have started, but can't give you any
> promises when ready.

Frankly, I still don't get how do you want to solve the problem of
incomplete/not-yet-probed pm domain during the amba_device_add() and reading
pid/cid identifiers, so I will leave it for you.

>> Is ignoring dev_pm_domain_attach() return value a solution for you?
> That's probably better than nothing, but I wonder if it in practice
> will have any effect? It requires the PM domain to be initialized (and
> having a DT provider for it) before you register the AMBA device, is
> that so in your case?

Yes, this will work for me, as power domain driver is registered very early
on Exynos platform (this was already needed to let it working with IOMMU
driver).

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

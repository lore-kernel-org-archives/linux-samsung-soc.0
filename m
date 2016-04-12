From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v5 RESEND 4/5] ARM: amba: Move reading of periphid to
 amba_match()
Date: Tue, 12 Apr 2016 16:09:02 +0200
Message-ID: <570D017E.7060105@samsung.com>
References: <1455101250-11327-1-git-send-email-m.szyprowski@samsung.com>
 <1455101250-11327-5-git-send-email-m.szyprowski@samsung.com>
 <20160215175250.GJ10826@n2100.arm.linux.org.uk> <56C426C4.7040907@samsung.com>
 <20160217200828.GH19428@n2100.arm.linux.org.uk>
 <CAPDyKFph8O+P9F124R859+OqY7B0YXCm=oOGxviyOo6tkNPQzQ@mail.gmail.com>
 <CAPDyKFpjTOhmG69x=EP=jje76C1ijjh0m_N8PrJ3yxqRq3HFiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51211 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933536AbcDLOJH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Apr 2016 10:09:07 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5I00HKFXZ34QA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Apr 2016 15:09:03 +0100 (BST)
In-reply-to: <CAPDyKFpjTOhmG69x=EP=jje76C1ijjh0m_N8PrJ3yxqRq3HFiw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Ulf,

On 2016-04-12 13:39, Ulf Hansson wrote:
> - trimmed cc list
>
> On 2 March 2016 at 11:16, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>> On 17 February 2016 at 21:08, Russell King - ARM Linux
>> <linux@arm.linux.org.uk> wrote:
>>> On Wed, Feb 17, 2016 at 08:52:36AM +0100, Marek Szyprowski wrote:
>>>> Then the only solution right now I see is to get back to v1:
>>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/388199.html
>>>> which at least handles correctly device registration when power domain
>>>> driver is available.
>>> ... and which has the ability to break platforms if the PM domain is
>>> not already available.
>>>
>>> What's wrong with the patch in the link above _combined_ with a patch
>>> which addresses the concern I have with that patch: build a list of
>>> the failed-to-register devices, and retry them later - maybe from a
>>> late_initcall(), or a similar mechanism?
>> This will improve the robustness of the device registration process,
>> but I wonder if it's really worth the efforts of complicating the amba
>> device registration code.
>>
>> The problem I see with such approach, is to know *when* shall we retry
>> to register the devices.
>>
>> We will rely on the PM domain driver to be probed, as to have the
>> corresponding OF genpd provider registered, else the device
>> registration will continue to fail.
>> Now, I don't think there are PM domain drivers as removable modules
>> (yet), but in such cases a late_initcall won't help much.
>>
>>> My view is the risk to existing systems is _too_ high to apply either
>>> this patch, or the patch you link to above, and I refuse to play the
>>> "lets apply it and see if we break anything" lottery with this.
>> I agree!
>>
>> Although I think with some adjustments, perhaps we can move forward with v1?
>>
>> The adjustments I think is needed:
>> Instead of propagating the error code from dev_pm_domain_attach(),
>> let's print a debug message and continue the device registration.
>> In that way, we shouldn't introduce regressions for cases where the OF
>> genpd provider hasn't yet been registered, but the issue Marek is
>> trying to solve for Exynos should be fixed.
>>
>> What do you think?
>>
> Ping. Any news on this? Would be nice if we could agree on a way forward.

I'm sorry for the lack of any update for quite a long time, but I was 
terribly
busy with some internal stuff. I will send v6 in a few minutes based on the
late_initcall idea from Russell.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

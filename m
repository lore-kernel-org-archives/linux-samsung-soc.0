From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Add MFC memory banks for Peach boards
Date: Fri, 06 May 2016 16:13:59 +0200
Message-ID: <572CA6A7.1040102@samsung.com>
References: <1461871311-18344-1-git-send-email-javier@osg.samsung.com>
 <cef99c21-3886-c055-05bf-cd04e3b588b3@osg.samsung.com>
 <572CA2F3.4050407@samsung.com>
 <23883a5f-bfed-9474-51a7-14271b6c391f@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:50384 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758054AbcEFOOF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 May 2016 10:14:05 -0400
In-reply-to: <23883a5f-bfed-9474-51a7-14271b6c391f@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org

On 05/06/2016 04:12 PM, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 05/06/2016 09:58 AM, Krzysztof Kozlowski wrote:
>> On 05/06/2016 03:44 PM, Javier Martinez Canillas wrote:
>>> Hello Krzysztof,
>>>
>>> On 04/28/2016 03:21 PM, Javier Martinez Canillas wrote:
>>>> The MFC nodes with the memory regions reserved for memory allocations
>>>> are missing in the Exynos5420 Peach Pit and Exynos5800 Peach Pi DTS.
>>>>
>>>> This causes the s5p-mfc driver probe to fail with the following error:
>>>>
>>>> [    4.140647] s5p_mfc_alloc_memdevs:1072: Failed to declare coherent memory for MFC device
>>>> [    4.216163] s5p-mfc: probe of 11000000.codec failed with error -12
>>>>
>>>> Add the missing nodes so the driver probes and the {en,de}coder video
>>>> nodes are registered correctly:
>>>>
>>>> [    4.096277] s5p-mfc 11000000.codec: decoder registered as /dev/video4
>>>> [    4.102282] s5p-mfc 11000000.codec: encoder registered as /dev/video5
>>>>
>>>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>>>
>>>> ---
>>>>
>>>>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 5 +++++
>>>>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 5 +++++
>>>>  2 files changed, 10 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> index b644858231b6..f9d2e4f1a0e0 100644
>>>> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> @@ -694,6 +694,11 @@
>>>>  	status = "okay";
>>>>  };
>>>>  
>>>> +&mfc {
>>>> +	samsung,mfc-r = <0x43000000 0x800000>;
>>>> +	samsung,mfc-l = <0x51000000 0x800000>;
>>>> +};
>>>> +
>>>>  &mmc_0 {
>>>>  	status = "okay";
>>>>  	num-slots = <1>;
>>>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>>> index 6ba9aec15485..62ceb89e073f 100644
>>>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>>> @@ -669,6 +669,11 @@
>>>>  	status = "okay";
>>>>  };
>>>>  
>>>> +&mfc {
>>>> +	samsung,mfc-r = <0x43000000 0x800000>;
>>>> +	samsung,mfc-l = <0x51000000 0x800000>;
>>>> +};
>>>> +
>>>>  &mmc_0 {
>>>>  	status = "okay";
>>>>  	num-slots = <1>;
>>>>
>>>
>>> Any comments about this patch?
>>
>> What is up with the rush now (a week for ping)? As I understand, this
> 
> Sorry about that... I should had waited for more time for the ping indeed.
> I just thought the patch was trivial and you usually answer within days.
> 
>> was broken for very long time on these boards (since adding DT support
>> in 2012?).
>>
> 
> Yes, that's correct. And in fact even the s5p-mfc driver is currently
> not working in mainline. But I posted some fixes and will post more
> patches from other people today to get it working. So I thought that
> would be nice to have this in since one of my test machines is a Peach.

Okay, no problem. I have few more not-so-critical fixes. Queued for
earliest possible release.

Best regards,
Krzysztof

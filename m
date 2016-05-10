From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Only Odroid XU3-family boards use DTSI
 with CPU thermal nodes
Date: Tue, 10 May 2016 14:43:16 +0200
Message-ID: <5731D764.8070007@samsung.com>
References: <1462774789-15360-1-git-send-email-k.kozlowski@samsung.com>
 <CANAwSgT9SY3kj8+beMpc1xGoC=rMBSya+2v2dyZQp6ykH+V0=g@mail.gmail.com>
 <573198BE.6020900@samsung.com>
 <CANAwSgTy6p9AVmmOWATpSO1JqVbwE0v+y_y-RLd+32RnNJTA+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:27115 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751498AbcEJMnW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 May 2016 08:43:22 -0400
In-reply-to: <CANAwSgTy6p9AVmmOWATpSO1JqVbwE0v+y_y-RLd+32RnNJTA+Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 05/10/2016 11:29 AM, Anand Moon wrote:
>>
>> I am sorry but I do not understand.
>> 1. Are you saying that my patch causes the issue?
>> 2. Are you saying that I should not send some patches because of
>> conflicting work? (that would be peculiar...)
>> 3. Are you saying that I should not apply this patch to me tree because
>> of conflicting work?
>> 4. Other?
>>
>> Best regards.
>> Krzysztof
>>
>>
> 
> Sorry for the confusion it's not about you patch.
> The feature is not working correctly as per my testing with the
> original source code.
> It need to be more tuned or some other approach to the issue need to found.

Known issue. You don't have cpufreq cooling enabled. I sent patches for
that and they are in the mainline. However cpufreq cooling requires
cpufreq which cannot work with BL_SWITCHER and on Exynos542x on
exynos_defconfig BL_SWITCHER is enabled.

Just disable the BL_SWITCHER.

Best regards,
Krzysztof

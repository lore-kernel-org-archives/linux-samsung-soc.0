From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCHv6 2/4] ARM: dts: exynos5422-odroidxu3: Enable TMU at Exynos5422
 base
Date: Mon, 15 Jun 2015 10:41:11 +0200
Message-ID: <557E8FA7.1090200@fivetechno.de>
References: <1434277445-5243-1-git-send-email-linux.amoon@gmail.com> <1434277445-5243-2-git-send-email-linux.amoon@gmail.com> <557E181C.7070209@samsung.com> <CANAwSgTOY3MECYLTjgmfSo5WrRuNycSSet2ZDhNTb-=gy8DGYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:53889 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752177AbbFOIl1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 04:41:27 -0400
In-Reply-To: <CANAwSgTOY3MECYLTjgmfSo5WrRuNycSSet2ZDhNTb-=gy8DGYQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hi Anand, Krzysztof

Am 15.06.2015 um 04:23 schrieb Anand Moon:
> hi Krzysztof
> 
> On 15 June 2015 at 05:41, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
>> On 14.06.2015 19:24, Anand Moon wrote:
>>> This changes enables TMU IP block on the Exynos5422 Odroid-XU3
>>> device.
>>>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> Tested-by: Markus Reichl <m.reichl@fivetechno.de>
>>
>> This does not look right.
>> You put this "Tested-by" since beginning of this patchset (v1) but first
>> it was LDO10. Then you proposed LDO18 and now you use LDO7 from my
>> suggestion. Which of this was tested by Markus because I cannot find his
>> emails with it on LKML?
> 
> Markus Reichl tested the earlier version with LDO10.

This is right.

> Commit logs got carry forward by mistake.
> 
> -Anand Moon
> 
>>
>> Krzysztof
>>
>>> Acked-by: Lukasz Majewski <l.majewski@samsung.com>
>>> ---
>>> Changes rebase on git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung branch for-next
>>> Changes from v5: Use LDO7 regulator instead of LD010.
>>>
>>> The output of LDO18 goes to VDD_EMMC_1V8. This is not regulator for TMU.
>>>
>>> I think the schematics are missing some of details but it can be deducted that:
>>> 1. TEMP SE is supplied by VDD18_TS power domain. It consists of 5
>>> pairs of pins (XTSTEST_OUT[0-4], XTSEXT_RES[0-4]).
>>> 2. The VDD18_TS01, VDD18_TS23 and VDD18_TS4 are wired to the LDO7 of
>>> S2MPS11 PMIC.
>>> 3. I confirmed with the Exynos5422 datasheet that these
>>> VDD18_TS{01,23,4} supply the XTSTEST pins (OUT and RES).
>>>
>>> So the LDO7 it is... but before using it there is a caveat. The LDO7
>>> is also connected to VDD of MIPI, HDMI and few more. So when you use
>>> this regulator in TMU it may be turned off by TMU driver (e.g. during
>>> unbind). In such case these other blocks also should be tested and
>>> checked whether they take this regulator and enable it.
>>> ---
>>>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 25 ++++++++++++++++++++++
>>>  1 file changed, 25 insertions(+)
>>
> 
> 


-- 
Markus Reichl

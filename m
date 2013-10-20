From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V7] ARM: dts: Add dwmmc DT nodes for exynos5420 SOC
Date: Mon, 21 Oct 2013 05:56:15 +0900
Message-ID: <5264436F.20205@samsung.com>
References: <1378188001-22216-1-git-send-email-yuvaraj.cd@samsung.com>	<CAKuRcOLyEjxGjHR6ff_Fe8sXwKW2Qdm1gOM-YyhMOr0964GLMA@mail.gmail.com> <CAKuRcOK5x021VxTfHNRs5SK4oOmwM+WyxYVZfSQXi6g5V5-RQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:53350 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751654Ab3JTU4V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Oct 2013 16:56:21 -0400
In-Reply-To: <CAKuRcOK5x021VxTfHNRs5SK4oOmwM+WyxYVZfSQXi6g5V5-RQg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar <yuvaraj.cd@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Tomasz Figa <t.figa@samsung.com>, Douglas Anderson <dianders@chromium.org>, Chris Ball <cjb@laptop.org>, Thomas Abraham <thomas.abraham@linaro.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

On 10/18/13 20:07, Yuvaraj Kumar wrote:
> Gentle Ping...
>
> On Thu, Sep 26, 2013 at 12:13 PM, Yuvaraj Kumar<yuvaraj.cd@gmail.com>  wrote:
>> Hi Kukjin,
>>   Can you please take this patch to your tree?
>>
>> Best Regards
>> Yuvaraj
>>
>> On Tue, Sep 3, 2013 at 11:30 AM, Yuvaraj Kumar C D<yuvaraj.cd@gmail.com>  wrote:
>>> This patch adds the mmc device tree node entries for exynos5420 SOC.
>>> Exynos5420 has a different version of DWMMC controller,so a new
>>> compatible string is used to distinguish it from the prior SOC's.
>>>
>>> This patch depends on
>>>          [1]mmc: dw_mmc: exynos: configure SMU in exynos5420
>>>          [2]mmc: dw_mmc: exynos: Add a new compatible string for exynos5420
>>>          [3]mmc: dw_mmc: update binding document exynos-dw-mshc.txt
>>>

Yuvaraj,

Looks good to me, applied but please make sure above patches are merged 
into mmc tree for upcoming merge window.

Thanks,
Kukjin


>>> changes since v6:
>>>          1.renamed node name to mmc
>>>          2.Used compatible string "samsung,exynos5420-dw-mshc"
>>>            for controller instance which does not have SMU.
>>>          3.Used compatible string "samsung,exynos5420-dw-mshc-smu"
>>>            for controller instance which has SMU.
>>>
>>> changes since v5:
>>>          1.removed instance index from node name.
>>>          2.changed the node name to mshc.
>>>          3.changed the reg property value for mshc_2.
>>>
>>> changes since v4:
>>>          1.Droppped the bypass-smu binding property.
>>>          2.Used compatible string "samsung,exynos5250-dw-mshc"
>>>            for controller instance which does not have SMU.
>>>
>>> changes since V3:
>>>          1.change fifo-depth size from 0x80 to 0x40
>>>          2.Move the below properties
>>>                  a.card-detect-delay
>>>                  b.samsung,dw-mshc-ciu-div
>>>                  c.samsung,dw-mshc-sdr-timing
>>>                  d.samsung,dw-mshc-ddr-timing
>>>          from SOC dts to board dts file as suggested by Doug Anderson
>>>
>>> changes since V2:
>>>          1.dropped num-slots property from node as its not required
>>>            if number of card slots available is 1.
>>>
>>>          2.Move the below properties
>>>                  a.fifo-depth
>>>                  b.card-detect-delay
>>>                  c.samsung,dw-mshc-ciu-div
>>>                  d.samsung,dw-mshc-sdr-timing
>>>                  e.samsung,dw-mshc-ddr-timing
>>>          from board dts to SOC dts,as these are not board specific properties.
>>>
>>>          3.Updated the binding document exynos-dw-mshc.txt.
>>>
>>> changes since V1:
>>>          1.disable node by status = disabled in SOC file
>>>          2.enable node by status = okay in board specific file
>>>
>>> Signed-off-by: Yuvaraj Kumar C D<yuvaraj.cd@samsung.com>
>>> ---
>>>   .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |    2 +
>>>   arch/arm/boot/dts/exynos5420-smdk5420.dts          |   33 +++++++++++++++++
>>>   arch/arm/boot/dts/exynos5420.dtsi                  |   39 ++++++++++++++++++++
>>>   3 files changed, 74 insertions(+)

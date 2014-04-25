From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: exynos4: add PMU syscon node
Date: Sat, 26 Apr 2014 01:52:15 +0200
Message-ID: <535AF52F.4090906@gmail.com>
References: <1397479700-15864-1-git-send-email-chanho61.park@samsung.com> <1397479700-15864-2-git-send-email-chanho61.park@samsung.com> <535936A7.9050003@samsung.com> <CAGm_ybjhcAqX7biOvqLMgzHPQK=-EtaHtXpCtcJ1rcdRsxN_Og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:57771 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751334AbaDYXwT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 19:52:19 -0400
In-Reply-To: <CAGm_ybjhcAqX7biOvqLMgzHPQK=-EtaHtXpCtcJ1rcdRsxN_Og@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <sajjan.linux@gmail.com>, Tomasz Figa <t.figa@samsung.com>
Cc: devicetree@vger.kernel.org, k.debski@samsung.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Chanho Park <chanho61.park@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Grant Likely <grant.likely@secretlab.ca>

Hi Vikas,

On 25.04.2014 10:05, Vikas Sajjan wrote:
> Hi,
>
>
> On Thu, Apr 24, 2014 at 9:37 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> Hi Chanho,
>>
>>
>> On 14.04.2014 14:48, Chanho Park wrote:
>>>
>>> This patch adds a PMU(Power Management Unit) syscon node. This
>>> should be required for USB Phy syscon regmap I/F.
>>>
>>> Cc: Tomasz Figa <t.figa@samsung.com>
>>> Cc: Kamil Debski <k.debski@samsung.com>
>>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>>> ---
>>>    arch/arm/boot/dts/exynos4.dtsi | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4.dtsi
>>> b/arch/arm/boot/dts/exynos4.dtsi
>>> index 2f8bcd0..e565b86 100644
>>> --- a/arch/arm/boot/dts/exynos4.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>>> @@ -110,6 +110,11 @@
>>>                  reg = <0x10010000 0x400>;
>>>          };
>>>
>>> +       pmu_reg: syscon@10020000 {
>>> +               compatible = "samsung,exynos4-pmureg", "syscon";
>>
>
>   Assume a case where exynos PMU is made as platform driver [1] and we
> need use the compatible  "samsung,exynos4-pmureg" in the driver.
> But since syscon driver uses compatible "syscon" and once the syscon
> driver is probed, the  exynos PMU platform driver [1] will NEVER be
> probed.
> So my question is, can we have 2 compatible strings for a DT node, and
> both the compatible strings are used for probing purpose?
> Recently I faced this issue on exynos5250, where i was testing PMU
> driver [1] and I noticed that  PMU driver [1] was NEVER probed, if I
> enable syscon driver in menuconfig.

No, it is not possible to bind two drivers with different compatible 
strings to the same node. Basically this is because only one platform 
driver can be bound to particular platform device.

The rule is that the most specific compatible string (e.g. the first 
from the left) that matches should be used, but I'm not sure if this is 
implemented this way in Linux kernel, especially considering that a 
platform driver usually probes when it is being registered. So we might 
have a race here, which you can work around by making sure that your PMU 
driver is always registered first (e.g. by lowering its initcall level).

Best regards,
Tomasz

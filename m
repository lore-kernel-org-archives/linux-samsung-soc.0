From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC PATCH 12/14] ARM: dts: exynos5: add system register support
Date: Tue, 15 Apr 2014 15:01:59 +0530
Message-ID: <CAK9yfHyuD=uD7QDezX3wSFBwLEvzs6NfSkzcOWkbnU=591U=YA@mail.gmail.com>
References: <1397540862-21359-1-git-send-email-yj44.cho@samsung.com>
	<1397540862-21359-13-git-send-email-yj44.cho@samsung.com>
	<CAK9yfHz9yFjQ8x2UuR7uvPTR+E8wUo4W+2XYKiF17RmwMji8OQ@mail.gmail.com>
	<534CF982.4020102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:51391 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750855AbaDOJcA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 05:32:00 -0400
Received: by mail-ob0-f174.google.com with SMTP id gq1so2168431obb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2014 02:32:00 -0700 (PDT)
In-Reply-To: <534CF982.4020102@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: YoungJun Cho <yj44.cho@samsung.com>, Dave Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

On 15 April 2014 14:48, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> On 15/04/14 10:41, Sachin Kamat wrote:
>> On 15 April 2014 11:17, YoungJun Cho <yj44.cho@samsung.com> wrote:
>>> This patch adds sysreg device node, and sysreg property to fimd device node
>>> which is required to use I80 interface.
>>>
>>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>>> ---
>>>  arch/arm/boot/dts/exynos5.dtsi |    6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
>>> index 258dca4..f938bbb 100644
>>> --- a/arch/arm/boot/dts/exynos5.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5.dtsi
>>> @@ -88,12 +88,18 @@
>>>                 status = "disabled";
>>>         };
>>>
>>> +       sys_reg: syscon@10050000 {
>>> +               compatible = "samsung,exynos5-sysreg", "syscon";
>>
>> Do we really need a separate string for this? Can't we use
>> "samsung,exynos4-sysreg" itself?
>
> Currently only "syscon" is meaningful in Linux, and we add second SoC
> specific compatible to be able to distinguish between various SoC
> revisions, should any SoC specific quirks be handled in future.
> Thus there is no much point in adding "samsung,exynos4-sysreg" to
> exynos5.dtsi. We could as well only leave "syscon" entry alone.
> My suggestion is to keep "samsung,exynos5-sysreg", so for instance
> Exynos4 and Exynos5 SOC series SYSREG blocks can be identified in
> an OS.

Yes, this sounds reasonable.

-- 
With warm regards,
Sachin

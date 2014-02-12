From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH v2 16/21] ARM: dts: exynos5250: add display power
 domain node
Date: Wed, 12 Feb 2014 12:59:50 +0100
Message-ID: <52FB6236.6070706@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
 <1392204688-4591-17-git-send-email-a.hajda@samsung.com>
 <CAK9yfHwikyhoV6rLgB+vHoFdjuFWSZxCtE3xth7AhF6o=oS2GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15011 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752341AbaBLL74 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:59:56 -0500
In-reply-to: <CAK9yfHwikyhoV6rLgB+vHoFdjuFWSZxCtE3xth7AhF6o=oS2GQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 02/12/2014 12:51 PM, Sachin Kamat wrote:
Hi Sachin,
> Hi Andrzej,
>
> On 12 February 2014 17:01, Andrzej Hajda <a.hajda@samsung.com> wrote:
>> The patch adds power domain for display subsystem.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5250.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> index c8745a0..0935dca 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -84,6 +84,11 @@
>>                 reg = <0x10044040 0x20>;
>>         };
>>
>> +       pd_disp: mfc-power-domain@100440a0 {
> Looks like a typo here.
>
Fortunately it is harmless, but thanks for pointing it out. Will be fixed.

Regards
Andrzej

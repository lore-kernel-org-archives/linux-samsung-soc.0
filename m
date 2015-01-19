From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RESEND PATCH v3] clocksource: exynos_mct: Add the support for
 Exynos 64bit SoC
Date: Mon, 19 Jan 2015 19:24:32 +0900
Message-ID: <54BCDB60.1020509@samsung.com>
References: <1421213603-5020-1-git-send-email-cw00.choi@samsung.com>
 <54B69072.4080607@kernel.org> <54B692FB.7030703@linaro.org>
 <54BC55BB.7050809@samsung.com> <54BCCE16.8050607@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:23247 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751412AbbASKYe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 05:24:34 -0500
In-reply-to: <54BCCE16.8050607@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>, tglx@linutronix.de, inki.dae@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Doug Anderson <dianders@chromium.org>, 'Olof Johansson' <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>, Paul Walmsley <pwalmsley@nvidia.com>

Hi Daniel,

On 01/19/2015 06:27 PM, Daniel Lezcano wrote:
> On 01/19/2015 01:54 AM, Chanwoo Choi wrote:
>> Dear Daniel and Kukjin,
>>
>> On 01/15/2015 01:02 AM, Daniel Lezcano wrote:
>>> On 01/14/2015 04:51 PM, Kukjin Kim wrote:
>>>> On 01/14/15 14:33, Chanwoo Choi wrote:
>>>>
>>>> Hi,
>>>>
>>>> + Doug, Olof
>>>>
>>>>> This patch adds the support for Exynos 64bit SoC. The delay_timer is only used
>>>>> for Exynos 32bit SoC.
>>>>>
>>>> Yes, the Exynos MCT(Multi-Core Timer) is 64bit timer and it is available
>>>> on 64bit exynos SoC such as exynos7. But basically ARMv8 architecture is
>>>> including ARM ARCH timer (ARM Generic Timer) and exynos7 also has
>>>> implemented it and additionally its access is faster than using memory
>>>> mapped register called SFR for MCT...so Doug submitted patch to use MCT
>>>> on 32bit exynos SoCs before.
>>>>
>>>> I know using MCT on 64bit exynos is usefulness for Power Management and
>>>> I need to talk to relevant guys in office again. If anything, I'll let
>>>> you know.
>>>
>>> I will wait for your answer before digging more the patch.
> 
> Hi Chanwoo,
> 
> [ ... ]
> 
>> Do you have any comment about this patch?
> 
> Yes, a similar patch has been posted for the tegra2 timer to run on arm64. The patch in question put macros #ifdef CONFIG_ARM64 to disable some parts of the code. That ended, the tegra2 timer was not needed for the moment because of the arch timer present, so it has been disabled from the compilation until a proper fix without macros could be proposed.
> 
> It is happening exactly the same with this patch. As Kukjin pointed it, the exynos_mct may not be needed (at least until a backup timer is needed at PM time).
> 
> I suggest you look at a nicer way to fix that instead of introducing macros (which is by the way valid but not recommended by the CodingStyle rules) and perhaps sync with Paul and Thierry [cc'ed] to find a common solution.

OK, I understand your opinion. I'll try to consider it without adding '#ifdef'.

Best Regards,
Chanwoo Choi

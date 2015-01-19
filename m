From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RESEND PATCH v3] clocksource: exynos_mct: Add the support for
 Exynos 64bit SoC
Date: Mon, 19 Jan 2015 10:27:50 +0100
Message-ID: <54BCCE16.8050607@linaro.org>
References: <1421213603-5020-1-git-send-email-cw00.choi@samsung.com> <54B69072.4080607@kernel.org> <54B692FB.7030703@linaro.org> <54BC55BB.7050809@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54BC55BB.7050809@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: tglx@linutronix.de, inki.dae@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Doug Anderson <dianders@chromium.org>, 'Olof Johansson' <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>, Paul Walmsley <pwalmsley@nvidia.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 01/19/2015 01:54 AM, Chanwoo Choi wrote:
> Dear Daniel and Kukjin,
>
> On 01/15/2015 01:02 AM, Daniel Lezcano wrote:
>> On 01/14/2015 04:51 PM, Kukjin Kim wrote:
>>> On 01/14/15 14:33, Chanwoo Choi wrote:
>>>
>>> Hi,
>>>
>>> + Doug, Olof
>>>
>>>> This patch adds the support for Exynos 64bit SoC. The delay_timer =
is only used
>>>> for Exynos 32bit SoC.
>>>>
>>> Yes, the Exynos MCT(Multi-Core Timer) is 64bit timer and it is avai=
lable
>>> on 64bit exynos SoC such as exynos7. But basically ARMv8 architectu=
re is
>>> including ARM ARCH timer (ARM Generic Timer) and exynos7 also has
>>> implemented it and additionally its access is faster than using mem=
ory
>>> mapped register called SFR for MCT...so Doug submitted patch to use=
 MCT
>>> on 32bit exynos SoCs before.
>>>
>>> I know using MCT on 64bit exynos is usefulness for Power Management=
 and
>>> I need to talk to relevant guys in office again. If anything, I'll =
let
>>> you know.
>>
>> I will wait for your answer before digging more the patch.

Hi Chanwoo,

[ ... ]

> Do you have any comment about this patch?

Yes, a similar patch has been posted for the tegra2 timer to run on=20
arm64. The patch in question put macros #ifdef CONFIG_ARM64 to disable=20
some parts of the code. That ended, the tegra2 timer was not needed for=
=20
the moment because of the arch timer present, so it has been disabled=20
from the compilation until a proper fix without macros could be propose=
d.

It is happening exactly the same with this patch. As Kukjin pointed it,=
=20
the exynos_mct may not be needed (at least until a backup timer is=20
needed at PM time).

I suggest you look at a nicer way to fix that instead of introducing=20
macros (which is by the way valid but not recommended by the CodingStyl=
e=20
rules) and perhaps sync with Paul and Thierry [cc'ed] to find a common=20
solution.

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

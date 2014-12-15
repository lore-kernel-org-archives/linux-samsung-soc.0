From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] clk: samsung: Fix Exynos 5420 pinctrl setup and clock disable failure due to domain being gated
Date: Mon, 15 Dec 2014 14:26:18 -0800
Message-ID: <7h8ui8h7n9.fsf@deeprootsystems.com>
References: <1417788934-23447-1-git-send-email-k.kozlowski@samsung.com>
	<1418129982.19339.6.camel@AMDC1943> <5486F69B.6020005@samsung.com>
	<7hlhmfo1b0.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hlhmfo1b0.fsf@deeprootsystems.com> (Kevin Hilman's message of
	"Wed, 10 Dec 2014 09:35:31 -0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Mike Turquette <mturquette@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Kevin Hilman <khilman@kernel.org> writes:

> Sylwester Nawrocki <s.nawrocki@samsung.com> writes:
>
>> On 09/12/14 13:59, Krzysztof Kozlowski wrote:
>>> On pi=C4=85, 2014-12-05 at 15:15 +0100, Krzysztof Kozlowski wrote:
>>>> > Audio subsystem clocks are located in separate block. On Exynos =
5420 if
>>>> > clock for this block (from main clock domain) 'mau_epll' is gate=
d then
>>>> > any read or write to audss registers will block.
>>>> >=20
>>>> > This kind of boot hang was observed on Arndale Octa and Peach Pi=
/Pit
>>>> > after introducing runtime PM to pl330 DMA driver. After that com=
mit the
>>>> > 'mau_epll' was gated, because the "amba" clock was disabled and =
there
>>>> > were no more users of mau_epll.
>>>> >=20
>>>> > The system hang on one of steps:
>>>> > 1. Disabling unused clocks from audss block.
>>>> > 2. During audss GPIO setup (just before probing i2s0 because
>>>> >    samsung_pinmux_setup() tried to access memory from audss bloc=
k which was
>>>> >    gated.
>>>> >=20
>>>> > Add a workaround for this by enabling the 'mau_epll' clock in pr=
obe.
>>>> >=20
>>>> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>> > ---
>>>> >  drivers/clk/samsung/clk-exynos-audss.c | 29 +++++++++++++++++++=
+++++++++-
>>>> >  1 file changed, 28 insertions(+), 1 deletion(-)
>>>
>>> Sorry for pinging so quick but merge window is open and it looks li=
ke
>>> booting Exynos542x boards will be broken (because pl330 will no lon=
ger
>>> hold adma clock enabled so whole audss domain will be gated).
>>>=20
>>> This is a non-intrusive workaround for that issue, as wanted by
>>> Sylwester:
>>> https://lkml.org/lkml/2014/12/5/223
>>>=20
>>> Any comments on this?
>>
>> The patch looks OK to me, it would be good though if someone else
>> has confirmed it fixes the bug. I don't have any clock patches queue=
d
>> at the moment. Perhaps you could apply it directly, Mike ?
>
> I confirm it fixes the boot hang in linux-next (next-20141210) on my
> exynos5800-peach-pi and exynos5420-arndale-octa.  Tested both
> exynos_defconfig and multi_v7_defconfig.
>
> Tested-by: Kevin Hilman <khilman@linaro.org>

What's the status of this patch?  linux-next is still broken for severa=
l
Exynos5 platforms without this fix.

Kevin

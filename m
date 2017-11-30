From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: exynos: Switch to dedicated Odroid-XU3
 sound card binding
Date: Thu, 30 Nov 2017 08:30:11 +0100
Message-ID: <46152007-e599-23eb-6a07-cc5f3ff32c70@samsung.com>
References: <20171103165446.15438-1-s.nawrocki@samsung.com>
        <CGME20171103165539epcas1p48cc87811574dace9dfe91d8e9ec6f7ca@epcas1p4.samsung.com>
        <20171103165446.15438-2-s.nawrocki@samsung.com>
        <20171127181213.lxtbbiw75wbz2dbz@kozik-lap>
        <CAJKOXPegJsQPrbDH8mXBhypOBnT9+Nn1T6NF=Cav=PV+9b-2MA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAJKOXPegJsQPrbDH8mXBhypOBnT9+Nn1T6NF=Cav=PV+9b-2MA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mihailescu2m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 2017-11-29 18:55, Krzysztof Kozlowski wrote:
> On Mon, Nov 27, 2017 at 7:12 PM, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Nov 03, 2017 at 05:54:45PM +0100, Sylwester Nawrocki wrote:
>>> The new sound card DT binding is used for Odroid XU3 in order
>>> to properly support the HDMI audio path.
>>> Clocks configuration is changed so the I2S controller is now the bit
>>> and the frame clock master with EPLL as the root clock source.
>>>
>>> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>   arch/arm/boot/dts/exynos4.dtsi                    |  1 +
>>>   arch/arm/boot/dts/exynos5420.dtsi                 |  1 +
>>>   arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 60 ++++++++++++++---------
>>>   3 files changed, 40 insertions(+), 22 deletions(-)
>>>
>
> Unfortunately this patch causes the audio card to disappear on Odroid
> XU3. "aplay -L" shows nothing and obviously speaker-test fails.
>
> Applied on v4.15-rc1... any dependencies are missing?
>
> Full boot-logs are here:
> http://www.krzk.eu/#/builders/1/builds/976
> (test exits on aplay -L).
>
> Should this be dropped?

Please add CONFIG_SND_SOC_ODROID=y to you .config. Probably exynos_defconfig
and multi_v7_defconfig should be updated too.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

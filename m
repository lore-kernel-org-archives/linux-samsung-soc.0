From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v3 1/2] clk: samsung: cpu: Prepare for addition for
 Exynos7 CPU clocks
Date: Mon, 11 Jul 2016 16:44:30 +0200
Message-ID: <CAM4voamm5-upxvwYG0b-WpgO3OpJR+ZswVzjwRO89fjQqovFbw@mail.gmail.com>
References: <1467750561-13957-1-git-send-email-a.kesavan@samsung.com>
 <1467750561-13957-2-git-send-email-a.kesavan@samsung.com> <577E32E5.4010902@samsung.com>
 <2318982.ZLuIVQzhgE@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2318982.ZLuIVQzhgE@amdc1976>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Bartlomiej,

Thanks for the comments.

On Thu, Jul 7, 2016 at 1:17 PM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
> Hi
>
> On Thursday, July 07, 2016 12:45:57 PM Sylwester Nawrocki wrote:
>> On 07/05/2016 10:29 PM, Abhilash Kesavan wrote:
>> > Exynos7 has the same CPU clock registers layout as that present
>
> Please precise for which Exynos7 SoC this change is needed
> (all three of them?).

As mentioned in my recently posted PMU series, the exynos7 is a quad
core A57 based SoC and not meant to be a SoC family.
I have reviewed various exynos7xxx UMs in terms of the CPU CMU. Both
exynos7580 and exynos7420 have a similar CMU register layout along
with the same mux stat bits as exynos7. Exynos7870 on the other hand
is quite different.

Please let me know what naming convention you would prefer that I use
E7/E7420/E7580 ?

>
>> > in Exynos5433 except for the bits in the MUX_STAT* registers.
>> > Add a new CLK_CPU_HAS_MODIFIED_MUX_STAT flag to handle this change.
>>
>> > --- a/drivers/clk/samsung/clk-cpu.h
>> > +++ b/drivers/clk/samsung/clk-cpu.h
>> > @@ -63,6 +63,8 @@ struct exynos_cpuclk {
>> >  /* The CPU clock registers have Exynos5433-compatible layout */
>> >  #define CLK_CPU_HAS_E5433_REGS_LAYOUT      (1 << 2)
>>
>> > +/* Exynos5433-compatible layout with different MUX_STAT register bits */
>> > +#define CLK_CPU_HAS_MODIFIED_MUX_STAT      (1 << 3)
>>
>> It's getting a bit messy, what if there comes another SoC version
>> which has some other modification of exynos5433 registers structure?
>> We would need another variant of HAS_MODIFIED_MUX_STAT flag and we
>> could easily get lost while trying to determine which modification
>> is which. How about indicating explicitly it's an exynos7 bits
>> layout and renaming the flag to something like
>>
>> #define CLK_CPU_HAS_E7_MUX_STAT       (1 << 16) ?
>
> ditto
>
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>

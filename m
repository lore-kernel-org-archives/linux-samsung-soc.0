From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 01/13] clk: samsung: exynos5433: Add binding document
 for Exynos5433 clock domains
Date: Mon, 02 Feb 2015 17:25:17 +0100
Message-ID: <54CFA4ED.3050902@samsung.com>
References: <1422882074-19758-1-git-send-email-cw00.choi@samsung.com>
 <1422882074-19758-2-git-send-email-cw00.choi@samsung.com>
 <54CF81DE.3010902@samsung.com> <54CF84D8.7070208@samsung.com>
 <54CF8C75.7000104@samsung.com>
 <CAGTfZH0o4Npii9_3SidG_E69SoOnAE6euUW4DvDqp9nTwVY3zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAGTfZH0o4Npii9_3SidG_E69SoOnAE6euUW4DvDqp9nTwVY3zw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, "pankaj.dubey@samsung.com" <pankaj.dubey@samsung.com>, sangbae90.lee@samsung.com, "inki.dae@samsung.com" <inki.dae@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

On 02/02/15 16:51, Chanwoo Choi wrote:
> On Mon, Feb 2, 2015 at 11:40 PM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> > On 02/02/15 15:08, Chanwoo Choi wrote:
>> >
>>> >> OK, I'll add more following information:
>>> >> I'll send only patch1 with following information.
>>> >>
>>> >> + - clocks: list of clock identifiers which are fed as the input to
>>> >> +       the given clock controller. Please refer the next section to
>>> >> +       find the input clocks for a given controller.
>>> >> + - clock-names: list of names of clocks which are fed as the input
>>> >> +       to the given clock controller.
>>> >> +
>> >
>> > Perhaps:
>> >
>> > + - clocks: list of the clock controller input clock identifiers,
>> >         from common clock bindings. Please refer the next section
>> >         to find the input clocks for a given controller.
>> >
>> > +- clock-names: list of the clock controller input clock names,
>> >         as described in clock-bindings.txt.
>> >
>> > ?
>> > It's fine to resend just updated first patch from each series.
> OK,
> I'll modify the comment of 'clocks' and 'clock-names' and send only first patch.
> 
> I have a question. Do you prefer to add the list of input clocks for
> each clock domain as following?
> Or it is not necessary?
> 
>            +       Input clocks for top clock controller:
>            +               - oscclk
>            +               - sclk_mphy_pll
>            +               - sclk_mfc_pll
>            +               - sclk_bus_pll

We are supposed to document all required input clocks somehow, I would
keep the list in such form. The (example) cmu nodes are also a good
documentation IMHO, they also show clearly which cmu (block) given clock
is sourced from.

--
Thanks,
Sylwester

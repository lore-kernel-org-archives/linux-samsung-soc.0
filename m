From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v4 01/13] clk: samsung: exynos5433: Add binding document
 for Exynos5433 clock domains
Date: Tue, 3 Feb 2015 00:51:28 +0900
Message-ID: <CAGTfZH0o4Npii9_3SidG_E69SoOnAE6euUW4DvDqp9nTwVY3zw@mail.gmail.com>
References: <1422882074-19758-1-git-send-email-cw00.choi@samsung.com>
	<1422882074-19758-2-git-send-email-cw00.choi@samsung.com>
	<54CF81DE.3010902@samsung.com>
	<54CF84D8.7070208@samsung.com>
	<54CF8C75.7000104@samsung.com>
Reply-To: cw00.choi@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:61418 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932108AbbBBPv3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 10:51:29 -0500
In-Reply-To: <54CF8C75.7000104@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, "pankaj.dubey@samsung.com" <pankaj.dubey@samsung.com>, sangbae90.lee@samsung.com, "inki.dae@samsung.com" <inki.dae@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Sylwester,

On Mon, Feb 2, 2015 at 11:40 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 02/02/15 15:08, Chanwoo Choi wrote:
>
>> OK, I'll add more following information:
>> I'll send only patch1 with following information.
>>
>> + - clocks: list of clock identifiers which are fed as the input to
>> +       the given clock controller. Please refer the next section to
>> +       find the input clocks for a given controller.
>> + - clock-names: list of names of clocks which are fed as the input
>> +       to the given clock controller.
>> +
>
> Perhaps:
>
> + - clocks: list of the clock controller input clock identifiers,
>         from common clock bindings. Please refer the next section
>         to find the input clocks for a given controller.
>
> +- clock-names: list of the clock controller input clock names,
>         as described in clock-bindings.txt.
>
> ?
> It's fine to resend just updated first patch from each series.

OK,
I'll modify the comment of 'clocks' and 'clock-names' and send only first patch.

I have a question. Do you prefer to add the list of input clocks for
each clock domain as following?
Or it is not necessary?

           +       Input clocks for top clock controller:
           +               - oscclk
           +               - sclk_mphy_pll
           +               - sclk_mfc_pll
           +               - sclk_bus_pll

Thanks,
Chanwoo Choi

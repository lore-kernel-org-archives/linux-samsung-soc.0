From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 01/13] clk: samsung: exynos5433: Add binding document
 for Exynos5433 clock domains
Date: Tue, 03 Feb 2015 08:54:51 +0900
Message-ID: <54D00E4B.9040303@samsung.com>
References: <1422882074-19758-1-git-send-email-cw00.choi@samsung.com>
 <1422882074-19758-2-git-send-email-cw00.choi@samsung.com>
 <54CF81DE.3010902@samsung.com> <54CF84D8.7070208@samsung.com>
 <54CF8C75.7000104@samsung.com>
 <CAGTfZH0o4Npii9_3SidG_E69SoOnAE6euUW4DvDqp9nTwVY3zw@mail.gmail.com>
 <54CFA4ED.3050902@samsung.com>
 <CAGTfZH2Z-Z80XDtCnmcPPL5NBYUffaPsNRjOR5_XXRvnBvnSSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37210 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754569AbbBBXzE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 18:55:04 -0500
In-reply-to: <CAGTfZH2Z-Z80XDtCnmcPPL5NBYUffaPsNRjOR5_XXRvnBvnSSA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: cw00.choi@samsung.com, Chanwoo Choi <cwchoi00@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, "pankaj.dubey@samsung.com" <pankaj.dubey@samsung.com>, sangbae90.lee@samsung.com, "inki.dae@samsung.com" <inki.dae@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Sylwester,

On 02/03/2015 01:44 AM, Chanwoo Choi wrote:
> Hi Sylwester,
> 
> On Tue, Feb 3, 2015 at 1:25 AM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> Hi Chanwoo,
>>
>> On 02/02/15 16:51, Chanwoo Choi wrote:
>>> On Mon, Feb 2, 2015 at 11:40 PM, Sylwester Nawrocki
>>> <s.nawrocki@samsung.com> wrote:
>>>>> On 02/02/15 15:08, Chanwoo Choi wrote:
>>>>>
>>>>>>> OK, I'll add more following information:
>>>>>>> I'll send only patch1 with following information.
>>>>>>>
>>>>>>> + - clocks: list of clock identifiers which are fed as the input to
>>>>>>> +       the given clock controller. Please refer the next section to
>>>>>>> +       find the input clocks for a given controller.
>>>>>>> + - clock-names: list of names of clocks which are fed as the input
>>>>>>> +       to the given clock controller.
>>>>>>> +
>>>>>
>>>>> Perhaps:
>>>>>
>>>>> + - clocks: list of the clock controller input clock identifiers,
>>>>>         from common clock bindings. Please refer the next section
>>>>>         to find the input clocks for a given controller.
>>>>>
>>>>> +- clock-names: list of the clock controller input clock names,
>>>>>         as described in clock-bindings.txt.
>>>>>
>>>>> ?
>>>>> It's fine to resend just updated first patch from each series.
>>> OK,
>>> I'll modify the comment of 'clocks' and 'clock-names' and send only first patch.
>>>
>>> I have a question. Do you prefer to add the list of input clocks for
>>> each clock domain as following?
>>> Or it is not necessary?
>>>
>>>            +       Input clocks for top clock controller:
>>>            +               - oscclk
>>>            +               - sclk_mphy_pll
>>>            +               - sclk_mfc_pll
>>>            +               - sclk_bus_pll
>>
>> We are supposed to document all required input clocks somehow, I would
>> keep the list in such form. The (example) cmu nodes are also a good
>> documentation IMHO, they also show clearly which cmu (block) given clock
>> is sourced from.
> 
> I agree that the binding document have to contain all required information.
> The binding document of exynos5433-clock will contain all input clocks for
> each clock domain. Also, I'll modify the description of 'clocks'/'clock-names'
> according to your comment and then I'll re-send only updated first
> patch for document.

I send only updated first patch[1] and will post new patch-set(v3) for remainings 9 patches with input clock information.
[1] https://lkml.org/lkml/2015/2/2/761
- [PATCH v6] clk: samsung: exynos5433: Add binding document for Exynos5433 clock domains

Thanks,
Chanwoo Choi

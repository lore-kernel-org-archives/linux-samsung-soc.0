From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v2 1/2] clk: samsung: exynos5250: Add DISP1 clocks
Date: Sat, 17 Oct 2015 08:41:33 +0900
Message-ID: <56218B2D.9040007@kernel.org>
References: <1444905084-22540-1-git-send-email-tomeu.vizoso@collabora.com> <1444905084-22540-2-git-send-email-tomeu.vizoso@collabora.com> <56203AD3.2050905@samsung.com> <20151016124935.20687.4394@quantum> <20151016172651.GB23912@codeaurora.org> <CAAObsKAjZX8XxTAFVKq4BCSZSrKG5xQPTue+z+xnJDD8QwK88Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:41747 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752460AbbJPXlo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Oct 2015 19:41:44 -0400
In-Reply-To: <CAAObsKAjZX8XxTAFVKq4BCSZSrKG5xQPTue+z+xnJDD8QwK88Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger

On 10/17/15 03:56, Tomeu Vizoso wrote:
> On 16 October 2015 at 19:26, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> On 10/16, Michael Turquette wrote:
>>> Quoting Krzysztof Kozlowski (2015-10-15 16:46:27)
>>>> On 15.10.2015 19:31, Tomeu Vizoso wrote:
>>>>> When the DISP1 power domain is powered off, there's two clocks that need
>>>>> to be temporarily reparented to OSC, and back to their original parents
>>>>> when the domain is powered on again.
>>>>>
>>>>> We expose these two clocks in the DT bindings so that the DT node of the
>>>>> power domain can reference them.
>>>>>
>>>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>>> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
>>>>> ---
>>>>>
>>>>> Changes in v2:
>>>>> - Reuse mout_aclk200_p
>>>>> - Rename div_aclk300 as div_aclk300_disp
>>>>>
>>>>>  drivers/clk/samsung/clk-exynos5250.c   | 14 +++++++++++++-
>>>>>  include/dt-bindings/clock/exynos5250.h |  4 +++-
>>>>>  2 files changed, 16 insertions(+), 2 deletions(-)
>>>>>
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>
>>> Applied to clk-next.
>>>
>>
>> I think Tomeu wanted to take this through arm-soc? Otherwise
>> we'll need to provide a stable branch for the dt header.
> 
> Hi, Stephen is right, the second patch depends on this one.
> 
So...how can I take 2nd patch of this series in samsung(arm-soc) tree?
And this series shouldn't be for fixes for 4.3?...Mike how do you think?

Thanks,
Kukjin

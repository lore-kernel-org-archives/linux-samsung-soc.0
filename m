From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/4] clk: samsung: out: Add infrastructure to register
 CLKOUT
Date: Thu, 15 May 2014 16:07:24 +0200
Message-ID: <5374CA1C.8000207@samsung.com>
References: <1399640410-30957-1-git-send-email-tushar.behera@linaro.org>
 <1399640410-30957-2-git-send-email-tushar.behera@linaro.org>
 <536DA243.6000600@samsung.com> <53705243.1030704@linaro.org>
 <CAPdUM4N=k-pPxdhPQgVHh0fb+nqkgs7StwM2Pb6C8gcjx6dw-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58411 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754531AbaEOOHd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 10:07:33 -0400
In-reply-to: <CAPdUM4N=k-pPxdhPQgVHh0fb+nqkgs7StwM2Pb6C8gcjx6dw-w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, Tushar Behera <tushar.behera@linaro.org>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, sunil joshi <joshi@samsung.com>

Hi Rahul, Tushar,

On 15.05.2014 15:44, Rahul Sharma wrote:
> Hi Tushar,
> 
> Basically you are adding a new clock-type for Clkout. IMO clkout
> is not a special hardware. Existing clock types can be reused to
> support clkout. I see 3 major problem here:
> 
> 1) Clkout -> (Mux + Gate). You clubbed mux and gate together, and
> exposing as a single clock which is something like a composite clock.
> IMO this is not a recommended way in CCF.
> 
> 2) New Clock Type: Since clkout is just a combination of a simple
> mux and gate which are already supported, it is a unnecessary
> duplication.
> 
> 3) Clkout registered along with CMU: which is not correct. Clkout is in PMU
> (Separate physical IP) and should be registered as a independent Clock
> provider which provides 1 mux and 1 gate clock (As if now). It should also be
> well connected with main CMU.
> 
> I understand the challenge in using regmap interface for a clock provider. But
> we need to identify a clean solution. IMHO a independent clock provider with
> iomap, is relatively cleaner approach till CCF is not ready with regmap based
> reg access for clock registers.
> 
> Experts!! please comment.

It's quite unfortunate that Tushar has duplicated the effort to create a
clkout driver, considering the fact that we did have such driver
internally at SRPOL and it was quite nice and simple.

I will post a cleaned-up version today, that is about 2 times smaller in
terms of lines of added code and provides the same functionality,
without introducing custom clock types. In addition, it models the
clkout properly as a feature of PMU, not CMU (CMU only provides outputs
of particular sub-blocks that are fed into the PMU).

Best regards,
Tomasz

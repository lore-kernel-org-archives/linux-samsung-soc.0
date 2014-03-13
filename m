From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/3] mfd: sec-core: Add of_compatible strings for MFD
 cells
Date: Thu, 13 Mar 2014 13:49:51 +0100
Message-ID: <1394714991.20773.5.camel@AMDC1943>
References: <1394703425-6462-1-git-send-email-k.kozlowski@samsung.com>
 <1394703425-6462-3-git-send-email-k.kozlowski@samsung.com>
 <53219F80.9000300@samsung.com> <1394712996.20773.1.camel@AMDC1943>
 <5321A6A2.9070509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46646 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751120AbaCMMt5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 08:49:57 -0400
In-reply-to: <5321A6A2.9070509@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Thu, 2014-03-13 at 13:37 +0100, Tomasz Figa wrote:
> On 13.03.2014 13:16, Krzysztof Kozlowski wrote:
> > On Thu, 2014-03-13 at 13:07 +0100, Tomasz Figa wrote:
> >> Hi Krzysztof,
> >>
> >> On 13.03.2014 10:37, Krzysztof Kozlowski wrote:
> >>> Add of_compatible strings for MFD cells for regulator, clock and RTC
> >>> drivers in S5M8767, S2MPS11 and S2MPS14 PMIC-s.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >>> ---
> >>>    drivers/mfd/sec-core.c |    8 ++++++++
> >>>    1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> >>> index d163c66edebb..c5b9b95b2099 100644
> >>> --- a/drivers/mfd/sec-core.c
> >>> +++ b/drivers/mfd/sec-core.c
> >>> @@ -55,28 +55,36 @@ static const struct mfd_cell s5m8763_devs[] = {
> >>>    static const struct mfd_cell s5m8767_devs[] = {
> >>>    	{
> >>>    		.name = "s5m8767-pmic",
> >>> +		.of_compatible = "samsung,s5m8767-regulators",
> >>>    	}, {
> >>>    		.name = "s5m-rtc",
> >>> +		.of_compatible = "samsung,s5m8767-rtc",
> >>>    	}, {
> >>>    		.name = "s5m8767-clk",
> >>> +		.of_compatible = "samsung,s5m8767-clk",
> >>>    	}
> >>>    };
> >>>
> >>>    static const struct mfd_cell s2mps11_devs[] = {
> >>>    	{
> >>>    		.name = "s2mps11-pmic",
> >>> +		.of_compatible = "samsung,s2mps11-regulators",
> >>>    	}, {
> >>>    		.name = "s2mps11-clk",
> >>> +		.of_compatible = "samsung,s2mps11-clk",
> >>>    	}
> >>>    };
> >>>
> >>>    static const struct mfd_cell s2mps14_devs[] = {
> >>>    	{
> >>>    		.name = "s2mps14-pmic",
> >>> +		.of_compatible = "samsung,s2mps14-regulators",
> >>>    	}, {
> >>>    		.name = "s2mps14-rtc",
> >>> +		.of_compatible = "samsung,s2mps14-rtc",
> >>>    	}, {
> >>>    		.name = "s2mps14-clk",
> >>> +		.of_compatible = "samsung,s2mps14-clk",
> >>>    	}
> >>>    };
> >>
> >> Are these compatible strings documented anywhere?
> >
> > The "-clk" compatible strings are (in next patch). The "-rtc" and
> > "-regulators" are not.
> 
> Hmm, this doesn't sound good.
> 
> > Actually they aren't also used by child driver (each child driver parses
> > from parent of_node).
> 
> Do you need to add compatible strings to mfd_cell entries of such cells 
> then?

>From my point of view there isn't any special need for them (except for
clk).

Dear Lee,

Do you wish to have these compatibles for all of child drivers even when
they aren't used directly by them? If yes then probably I should
document them.


Best regards,
Krzysztof

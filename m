From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 09/16] clk: samsung: pll: Use new registration method
 for PLL45xx
Date: Thu, 22 Aug 2013 13:59:09 -0600
Message-ID: <52166D8D.1070900@wwwdotorg.org>
References: <1377019903-14614-1-git-send-email-t.figa@samsung.com> <1377019903-14614-10-git-send-email-t.figa@samsung.com> <CAKew6eV79H60iU9X5DKOKo57Y51RfVtML2qEqD1z4m6rT_yLJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:55167 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754449Ab3HVT7O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 15:59:14 -0400
In-Reply-To: <CAKew6eV79H60iU9X5DKOKo57Y51RfVtML2qEqD1z4m6rT_yLJA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Kyungmin Park <kyungmin.park@samsung.com>

On 08/21/2013 07:17 AM, Yadwinder Singh Brar wrote:
>>  };
>>
>> +static struct __initdata samsung_pll_clock exynos4210_plls[nr_plls] = {
> 
> NIT: __initdata should be at last.

It's helpful if you only quote as much of the patch as you need to in
order to reply to it; it wasn't obvious in your message that you had no
comments on the rest of the patch that you quoted, so people have to
scroll through it looking carefully for any other comments.

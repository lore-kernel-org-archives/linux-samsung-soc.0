From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 0/8] clk: max77686: Clock provider implementation fixes
Date: Thu, 02 Jan 2014 16:22:12 +0100
Message-ID: <2890647.PEOApIOYyP@amdc1227>
References: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
 <20131231194215.12054.39705@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23219 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751631AbaABPWR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 10:22:17 -0500
In-reply-to: <20131231194215.12054.39705@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>

On Tuesday 31 of December 2013 11:42:15 Mike Turquette wrote:
> Quoting Tomasz Figa (2013-12-12 08:07:13)
> > This series intends to improve clock provider impementation of max77686
> > PMIC driver. First two patches are simple fixes of current implementation
> > to allow correct control of provided clocks. Further patches refactor
> > the driver to make the code cleaner and prepare for further patches. Then
> > last two patches add registration of OF clock provider and adjust device
> > tree nodes of boards containing max77686 chip to contain properties
> > required by clock provider.
> 
> Acked-by: Mike Turquette <mturquette@linaro.org>

Hmm... Shouldn't this series go through the clk tree directly? If not, who
should be taking it?

Best regards,
Tomasz

From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] regulator: MAX8998: set_voltage bugfix. ramp_up
 delay and min/max voltage
Date: Tue, 20 Jul 2010 09:54:59 +0100
Message-ID: <20100720085459.GG10222@rakim.wolfsonmicro.main>
References: <1279391048.3070.11.camel@odin>
 <1279606027-18345-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:50187 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755620Ab0GTIzB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jul 2010 04:55:01 -0400
Content-Disposition: inline
In-Reply-To: <1279606027-18345-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lrg@slimlogic.co.uk, sameo@linux.intel.com, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Tue, Jul 20, 2010 at 08:07:07AM +0200, Marek Szyprowski wrote:
> From: MyungJoo Ham <myungjoo.ham@samsung.com>
> 
> Two issues are addressed for max8998_set_voltage function.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

but as IIRC I said last time it would be nicer to fix one issue per
patch.

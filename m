From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] regulator: MAX8998: set_voltage bugfix. ramp_up delay
 and min/max voltage
Date: Fri, 16 Jul 2010 09:20:41 +0100
Message-ID: <20100716082041.GB9082@rakim.wolfsonmicro.main>
References: <1279267760-6971-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:41845 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S935937Ab0GPIUn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 04:20:43 -0400
Content-Disposition: inline
In-Reply-To: <1279267760-6971-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, myungjoo.ham@gmail.com, lrg@slimlogic.co.uk, sameo@linux.intel.com, m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org

On Fri, Jul 16, 2010 at 05:09:20PM +0900, MyungJoo Ham wrote:
> Two issues are addressed for max8998_set_voltage function.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Ideally you should've submitted this as two separate patches.

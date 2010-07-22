From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: [PATCH v2] regulator: MAX8998: set_voltage bugfix. ramp_up
 delay and min/max voltage
Date: Thu, 22 Jul 2010 13:02:10 +0100
Message-ID: <1279800130.3083.44.camel@odin>
References: <1279391048.3070.11.camel@odin>
	 <1279606027-18345-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:37152 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751260Ab0GVMCO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jul 2010 08:02:14 -0400
Received: by wyf19 with SMTP id 19so498665wyf.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jul 2010 05:02:13 -0700 (PDT)
In-Reply-To: <1279606027-18345-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, broonie@opensource.wolfsonmicro.com, sameo@linux.intel.com

On Tue, 2010-07-20 at 08:07 +0200, Marek Szyprowski wrote:
> From: MyungJoo Ham <myungjoo.ham@samsung.com>
> 
> Two issues are addressed for max8998_set_voltage function.
> 
> 1. Min/Max Voltage.
> 
> 	max8998_set_voltage had been using the voltage value of
> 
> 	min ( voltage[i] >= max_vol , i )
> 
> 	This is corrected to use:
> 
> 	min ( voltage[i] >= min_vol , i )
> 
> 2. Ramp Up Delay.
> 
> 	max8998_set_voltage should provide delay for BUCK1/2
> if ENRAMP is on. It reads RAMP value from ONOFF4 register to determine
> RAMP delay length. However, when max8998_set_voltage's new voltage is
> lower than the previous, we don't care because it does not deteriorate
> the stability.
> 
> Changes since v1:
> - rebased onto latest regulator-for-next tree

Applied. Btw, please run checkpatch and/or cleanpatch before submitting
next time as this patch contained some trailing white space.

Thanks

Liam
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

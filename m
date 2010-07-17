From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: [PATCH] regulator: MAX8998: set_voltage bugfix. ramp_up delay
 and min/max voltage
Date: Sat, 17 Jul 2010 19:24:08 +0100
Message-ID: <1279391048.3070.11.camel@odin>
References: <1279267760-6971-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:39397 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756437Ab0GQSYM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 17 Jul 2010 14:24:12 -0400
Received: by wyb42 with SMTP id 42so3004353wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 17 Jul 2010 11:24:11 -0700 (PDT)
In-Reply-To: <1279267760-6971-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sameo@linux.intel.com, broonie@opensource.wolfsonmicro.com, kyungmin.park@samsung.com, myungjoo.ham@gmail.com, m.szyprowski@samsung.com

On Fri, 2010-07-16 at 17:09 +0900, MyungJoo Ham wrote:
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
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> --
> I've omitted some CC in the previous email, adding them here. Sorry for the duplicated submission.

This doesn't apply. Can you re-create against my regulator for-next
branch.

git://git.kernel.org/pub/scm/linux/kernel/git/lrg/voltage-2.6.git for-next

Thanks

Liam
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

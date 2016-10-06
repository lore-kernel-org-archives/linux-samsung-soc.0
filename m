From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: Problem: "clk: max77686: Migrate to clk_hw based OF and
 registration APIs" breaks s3c-rtc on Odroid U3
Date: Thu, 6 Oct 2016 13:28:20 +0200
Message-ID: <57F63554.1050703@math.uni-bielefeld.de>
References: <29925ac0-3c97-df1d-0700-de25f1191082@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55553 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755238AbcJFL22 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Oct 2016 07:28:28 -0400
In-Reply-To: <29925ac0-3c97-df1d-0700-de25f1191082@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc@vger.kernel.org, stephen.boyd@linaro.org, krzk@kernel.org, javier@osg.samsung.com
Cc: ldewangan@nvidia.com

Hello,

I quickly went over the commit, and I don't see the 'num_clks' fields
being initialized anywhere. So that's probably the reason why it's
always zero and the check in of_clk_max77686_get() fails.

With best wishes,
Tobias


Markus Reichl wrote:
> Hi,
> 
> since commit
> 
> [9b4cac33adc7716bb232b3a82a5ed0806286fe9a] clk: max77686: Migrate to clk_hw based OF and registration APIs
> 
> s3-rtc does not get it's source clock and fails:
> 
> [    1.963782] of_clk_max77686_get: invalid index 0
> [    1.967460] ERROR: could not get clock /rtc@10070000:rtc_src(1)
> [    1.973638] s3c-rtc 10070000.rtc: failed to find rtc source clock
> 
> 
> Regards,
> --
> Markus Reichl
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Problem: "clk: max77686: Migrate to clk_hw based OF and registration
 APIs" breaks s3c-rtc on Odroid U3
Date: Thu, 6 Oct 2016 12:48:47 +0200
Message-ID: <29925ac0-3c97-df1d-0700-de25f1191082@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:51608 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751438AbcJFLHw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Oct 2016 07:07:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, stephen.boyd@linaro.org, krzk@kernel.org, javier@osg.samsung.com
Cc: ldewangan@nvidia.com

Hi,

since commit

[9b4cac33adc7716bb232b3a82a5ed0806286fe9a] clk: max77686: Migrate to clk_hw based OF and registration APIs

s3-rtc does not get it's source clock and fails:

[    1.963782] of_clk_max77686_get: invalid index 0
[    1.967460] ERROR: could not get clock /rtc@10070000:rtc_src(1)
[    1.973638] s3c-rtc 10070000.rtc: failed to find rtc source clock


Regards,
--
Markus Reichl

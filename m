From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH Resend 1/1] clk: exynos5250: Add CLK_SET_RATE_PARENT flag
 to mout_apll
Date: Mon, 30 Dec 2013 18:51:29 +0100
Message-ID: <3616477.6ZBKa1KffA@amdc1227>
References: <1387442019-2445-1-git-send-email-sachin.kamat@linaro.org>
 <20131219193708.18119.53403@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:24076 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755634Ab3L3Rvy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 12:51:54 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MYM00BL3SAGST10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Dec 2013 17:51:52 +0000 (GMT)
In-reply-to: <20131219193708.18119.53403@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thursday 19 of December 2013 11:37:08 Mike Turquette wrote:
> Quoting Sachin Kamat (2013-12-19 00:33:39)
> > Add CLK_SET_RATE_PARENT flag to mout_apll clock. This will let us set the
> > clock rate in the cpufreq driver.
> > 
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> 
> Ack.

Applied onto next branch.

Best regards,
Tomasz

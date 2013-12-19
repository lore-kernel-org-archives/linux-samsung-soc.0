From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 6/7] clk/samsung: add support for pll2650xx
Date: Thu, 19 Dec 2013 12:45:07 +0100
Message-ID: <1419145.DZQg0ZkHVU@amdc1227>
References: <1386345391-23482-1-git-send-email-rahul.sharma@samsung.com>
 <1386345391-23482-7-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52329 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751845Ab3LSLpZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 06:45:25 -0500
In-reply-to: <1386345391-23482-7-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@linaro.org, kgene.kim@samsung.com, thomas.ab@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, pankaj.dubey@samsung.com, yg1004.jang@samsung.com, arun.kk@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On Friday 06 of December 2013 21:26:30 Rahul Sharma wrote:
> Add support for pll2650xx in samsung pll file. This pll variant
> is close to pll36xx but uses CON2 registers instead of CON1.

If the ops are otherwise idential, why not reuse the ops for pll36xx
and use CON1 or CON2 register conditionally based on pll->type field?
(Just as it is already done for pll4600, 4650 and 4650c.)

Best regards,
Tomasz

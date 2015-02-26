From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] phy: exynos-mipi-video: Fixup the test for state->regmap
Date: Thu, 26 Feb 2015 10:47:46 +0100
Message-ID: <54EEEBC2.3090201@samsung.com>
References: <1424922488.2076.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:8997 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753182AbbBZJr5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Feb 2015 04:47:57 -0500
In-reply-to: <1424922488.2076.1.camel@phoenix>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 26/02/15 04:48, Axel Lin wrote:
> syscon_regmap_lookup_by_phandle() returns ERR_PTR on error.
> Thus don't use null test against state->regmap.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Thanks for the patch, I had this on my todo list.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

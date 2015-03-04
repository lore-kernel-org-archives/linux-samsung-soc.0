From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH RFT] phy: exynos-mipi-video: Use spin_lock to protct state->regmap
 rmw operations
Date: Wed, 4 Mar 2015 18:23:55 +0530
Message-ID: <54F70063.6090205@ti.com>
References: <1425009057.12126.1.camel@phoenix> <54F070D0.2050504@samsung.com> <54F6F98E.2000709@ti.com> <54F6FEE4.1090005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:39848 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755200AbbCDMyH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Mar 2015 07:54:07 -0500
In-Reply-To: <54F6FEE4.1090005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Axel Lin <axel.lin@ingics.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



On Wednesday 04 March 2015 06:17 PM, Sylwester Nawrocki wrote:
> Hi,
>
> On 04/03/15 13:24, Kishon Vijay Abraham I wrote:
>> This patch doesn't apply on 4.0-rc1. Can to refresh it to mainline
>> latest?
>
> It depends on Axel's previous patch: "phy: exynos-mipi-video: Fixup
> the test for state->regmap". Are there any issues even with that patch
> applied ?

no. okay I'll apply in that order.

Cheers
kishon

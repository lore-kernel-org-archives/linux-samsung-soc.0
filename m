From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v2 04/10] rtc: max77686: Use a driver data struct instead
 hard-coded values
Date: Fri, 22 Jan 2016 15:20:51 +0530
Message-ID: <56A1FB7B.5060903@nvidia.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com> <1453407813-14646-5-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:10885 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978AbcAVKBh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jan 2016 05:01:37 -0500
In-Reply-To: <1453407813-14646-5-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org


On Friday 22 January 2016 01:53 AM, Javier Martinez Canillas wrote:
> The driver has some hard-coded values such as the minimum delay needed
> before a RTC update or the mask used for the sec/min/hour/etc registers.
>
> Use a data structure that contains these values and pass as driver data
> using the platform device ID table for each device.
>
> This allows to make the driver's ops callbacks more generic so other RTC
> that are similar but don't have the same values can also be supported.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>

Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v2 05/10] rtc: max77686: Add an indirection level to access
 RTC registers
Date: Fri, 22 Jan 2016 15:22:16 +0530
Message-ID: <56A1FBD0.20606@nvidia.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com> <1453407813-14646-6-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9832 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529AbcAVKDE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jan 2016 05:03:04 -0500
In-Reply-To: <1453407813-14646-6-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org


On Friday 22 January 2016 01:53 AM, Javier Martinez Canillas wrote:
> The max77686 driver is generic enough that can be used for other
> Maxim RTC IP blocks but these might not have the same registers
> layout so instead of accessing the registers directly, add a map
> to translate offsets to the real registers addresses for each IP.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

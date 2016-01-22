From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v2 07/10] rtc: max77686: Use dev_warn() instead of pr_warn()
Date: Fri, 22 Jan 2016 15:26:00 +0530
Message-ID: <56A1FCB0.8050306@nvidia.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com> <1453407813-14646-8-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:2417 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752853AbcAVKGr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jan 2016 05:06:47 -0500
In-Reply-To: <1453407813-14646-8-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org


On Friday 22 January 2016 01:53 AM, Javier Martinez Canillas wrote:
> It is better to use dev_*() log functions instead of pr_*() to print
> information about the device in the kernel log in a standardized way.
>
> This also allows to remove the local pr_fmt() defined macro.
>
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

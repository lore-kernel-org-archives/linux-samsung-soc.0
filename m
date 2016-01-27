From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v4 02/10] rtc: max77686: Use ARRAY_SIZE() instead of current
 array length
Date: Wed, 27 Jan 2016 11:27:38 +0530
Message-ID: <56A85C52.6040607@nvidia.com>
References: <1453865806-4661-1-git-send-email-javier@osg.samsung.com> <1453865806-4661-3-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:9577 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753110AbcA0GIh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jan 2016 01:08:37 -0500
In-Reply-To: <1453865806-4661-3-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org


On Wednesday 27 January 2016 09:06 AM, Javier Martinez Canillas wrote:
> It is better to use the ARRAY_SIZE() macro instead of the array length
> to avoid bugs if the array is later changed and the length not updated.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Andi Shyti <andi.shyti@samsung.com>
>

Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

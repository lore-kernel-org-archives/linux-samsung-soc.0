From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH] ARM: EXYNOS: Use platform device name as power domain
 name
Date: Tue, 10 Feb 2015 14:12:00 +0100
Message-ID: <54DA03A0.9040305@collabora.co.uk>
References: <1423573035-21960-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:42695 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753117AbbBJNMG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Feb 2015 08:12:06 -0500
In-Reply-To: <1423573035-21960-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Hello 

Krzysztof,

On 02/10/2015 01:57 PM, Krzysztof Kozlowski wrote:
> The power domain nodes in DTS may be very generic (e.g. "power-domain"
> for Exynos 5420) making it very hard to debug:
> 
> $ cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
>     domain                      status         slaves
> power-domain                    on
> 
> Use platform device name instead so the names will be a little more user
> friendly:
>     domain                      status         slaves
> 100440e0.power-domain           on
> 

I would had preferred to have even more info like 100440e0.mau-power-domain.
Maybe using the OF aliases approach that Sylwester suggested? But in any case
that could be complementary to your patch.

> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Suggested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier

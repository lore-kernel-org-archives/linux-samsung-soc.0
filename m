From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 3/5] ARM: EXYNOS: Move "mach/map.h" inclusion from
 regs-pmu.h to platsmp.c
Date: Mon, 30 Jun 2014 18:20:34 +0200
Message-ID: <53B18E52.1060906@samsung.com>
References: <1403705032-14835-1-git-send-email-pankaj.dubey@samsung.com>
 <1403705032-14835-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36632 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755065AbaF3QVI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 12:21:08 -0400
In-reply-to: <1403705032-14835-4-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com

Hi Pankaj,

On 25.06.2014 16:03, Pankaj Dubey wrote:
> As we have removed static mappings from "regs-pmu.h" it does not
> need map.h anymore. But "platsmp.c" needed this and till now it
> got included indirectly. So lets move header inclusion of
> "mach/map.h" from "regs-pmu.h" to "platsmp.c".
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c  |    2 ++
>  arch/arm/mach-exynos/regs-pmu.h |    2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

IMHO this could be squashed with previous patch.

Best regards,
Tomasz

From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v4 09/11] ARM: EXYNOS: Move "mach/map.h" inclusion from
 regs-pmu.h to platsmp.c
Date: Tue, 17 Jun 2014 18:04:08 +0200
Message-ID: <53A066F8.9060702@samsung.com>
References: <1399704998-13321-1-git-send-email-pankaj.dubey@samsung.com>
 <1399704998-13321-10-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28559 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755414AbaFQQE2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jun 2014 12:04:28 -0400
In-reply-to: <1399704998-13321-10-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, chow.kim@samsung.com, vikas.sajjan@samsung.com

On 10.05.2014 08:56, Pankaj Dubey wrote:
> As we have removed static mappings from "regs-pmu.h" it does not
> need map.h anymore. But "platsmp.c" needed this and till now it
> got included indirectly. So lets move header inclusion of
> "mach/map.h" from "regs-pmu.h" to "platsmp.c".
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c  |    1 +
>  arch/arm/mach-exynos/regs-pmu.h |    2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)

This could be probably squashed with other one of previous patches, but
anyway:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz

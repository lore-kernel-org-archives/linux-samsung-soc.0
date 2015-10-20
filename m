From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 6/6] ARM: EXYNOS: Remove code for restart and poweroff
 for exynos SoCs
Date: Tue, 20 Oct 2015 12:31:48 +0200
Message-ID: <56261814.3050403@osg.samsung.com>
References: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
 <1445333085-22837-7-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:38028 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751760AbbJTKbx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 06:31:53 -0400
In-Reply-To: <1445333085-22837-7-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello Alim,

On 10/20/2015 11:24 AM, Alim Akhtar wrote:
> Now we can use the generic syscon-{reboot/poweroff} drivers,
> so we don't need special handling for reboot/poweroff in
> exynos pmu driver. This patch remove the same.
> 
> Note: This will break reboot/poweroff on boards with older dtbs
> with a newer kernel.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  arch/arm/mach-exynos/pmu.c |   43 -------------------------------------------
>  1 file changed, 43 deletions(-)
> 

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

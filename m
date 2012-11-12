From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v3 6/6] ARM: EXYNOS: Add secure firmware support to
	secondary CPU bring-up
Date: Mon, 12 Nov 2012 09:52:31 +0000
Message-ID: <20121112095231.GE28327@n2100.arm.linux.org.uk>
References: <1351178560-19188-1-git-send-email-t.figa@samsung.com> <1351178560-19188-7-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40698 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783Ab2KLJwj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 04:52:39 -0500
Content-Disposition: inline
In-Reply-To: <1351178560-19188-7-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Thu, Oct 25, 2012 at 05:22:40PM +0200, Tomasz Figa wrote:
> @@ -47,6 +48,8 @@ static inline void __iomem *cpu_boot_reg(int cpu)
>  {
>  	void __iomem *boot_reg;
>  
> +	if (!call_firmware_op(cpu_boot_reg, cpu, &boot_reg))
> +		return boot_reg;
>  	boot_reg = cpu_boot_reg_base();

That code makes no sense.

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] ARM: s3c24xx: formatting cleanup in
 mach-mini2440.c
Date: Mon, 10 Sep 2018 19:06:18 +0200
Message-ID: <20180910170618.dfe6uxngz72vodr2@kozik-lap>
References: <20180907215446.15160-1-sed@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180907215446.15160-1-sed@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Cedric Roux <sed@free.fr>
Cc: kgene@kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 07, 2018 at 11:54:45PM +0200, Cedric Roux wrote:
> Running:
>     scripts/checkpatch.pl -f arch/arm/mach-s3c24xx/mach-mini2440.c
> revealed several errors and warnings.
> 
> They were all removed, except one which is an #if 0 around the declaration
> of a gpio pin. This needs some more investigation and I prefer to let it
> here. This is not some dead code.
> 
> 'printk' was replaced by 'pr_info'.
> 
> Signed-off-by: Cedric Roux <sed@free.fr>
> ---
>  arch/arm/mach-s3c24xx/mach-mini2440.c | 80 ++++++++++++++-------------

Thanks, applied.

Best regards,
Krzysztof

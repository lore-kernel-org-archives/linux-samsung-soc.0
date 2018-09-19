From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: s3c24xx: fix usage of pr_info/pr_cont
Date: Wed, 19 Sep 2018 19:11:05 +0200
Message-ID: <20180919171105.GA10129@kozik-lap>
References: <20180917204350.15192-1-sed@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180917204350.15192-1-sed@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Cedric Roux <sed@free.fr>
Cc: kgene@kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Sep 17, 2018 at 10:43:50PM +0200, Cedric Roux wrote:
> This commit fixes the wrong usage of pr_info introduced by the
> commit e728e4f20100 ("ARM: s3c24xx: formatting cleanup in
> mach-mini2440.c").
> 
> Since the idea is to print on a single line, pr_cont has to be used.
> 
> Signed-off-by: Cedric Roux <sed@free.fr>
> ---
>  arch/arm/mach-s3c24xx/mach-mini2440.c | 6 +++---

Thanks, applied.

Best regards,
Krzysztof

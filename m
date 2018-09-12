From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 1/2] ARM: s3c24xx: formatting cleanup in mach-mini2440.c
Date: Wed, 12 Sep 2018 12:21:37 -0700
Message-ID: <b97d7ccc921572ca5d783584eea1de04341ab02f.camel@perches.com>
References: <20180907215446.15160-1-sed@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180907215446.15160-1-sed@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Cedric Roux <sed@free.fr>, kgene@kernel.org, krzk@kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 2018-09-07 at 23:54 +0200, Cedric Roux wrote:
> Running:
>     scripts/checkpatch.pl -f arch/arm/mach-s3c24xx/mach-mini2440.c
> revealed several errors and warnings.
> 
> They were all removed, except one which is an #if 0 around the declaration
> of a gpio pin. This needs some more investigation and I prefer to let it
> here. This is not some dead code.
[]
> diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
[]
> @@ -674,17 +680,17 @@ static void __init mini2440_init(void)
>  		mini2440_fb_info.displays =
>  			&mini2440_lcd_cfg[features.lcd_index];
>  
> -		printk(KERN_INFO "MINI2440: LCD");
> +		pr_info("MINI2440: LCD");

OK

>  		for (li = 0; li < ARRAY_SIZE(mini2440_lcd_cfg); li++)
>  			if (li == features.lcd_index)
> -				printk(" [%d:%dx%d]", li,
> +				pr_info(" [%d:%dx%d]", li,
>  					mini2440_lcd_cfg[li].width,
>  					mini2440_lcd_cfg[li].height);

pr_cont

>  			else
> -				printk(" %d:%dx%d", li,
> +				pr_info(" %d:%dx%d", li,

pr_cont

>  					mini2440_lcd_cfg[li].width,
>  					mini2440_lcd_cfg[li].height);
> -		printk("\n");
> +		pr_info("\n");

pr_cont

So only the first printk should use pr_info().
The subsequent printk uses should use pr_cont()

>  		s3c24xx_fb_set_platdata(&mini2440_fb_info);
>  	}
>  

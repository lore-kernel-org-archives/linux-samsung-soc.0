From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Fix compilation warning in
 setup-usb-phy.c file
Date: Thu, 12 Jul 2012 14:52:25 +0530
Message-ID: <CAK9yfHw=obimeLs_sKA-kJuD1yRF_65gPzirHvvJnZ_uKa1gqw@mail.gmail.com>
References: <1341899860-17979-1-git-send-email-sachin.kamat@linaro.org>
	<0fa801cd600e$1b1e6d80$515b4880$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:56725 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753544Ab2GLJW2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:22:28 -0400
Received: by vbbff1 with SMTP id ff1so1358681vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jul 2012 02:22:25 -0700 (PDT)
In-Reply-To: <0fa801cd600e$1b1e6d80$515b4880$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, arnd@arndb.de, patches@linaro.org

On 12/07/2012, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> Fixes the following warning:
>> arch/arm/mach-exynos/setup-usb-phy.c: In function
>> =91exynos4210_usb_phy_clkset=92:
>> arch/arm/mach-exynos/setup-usb-phy.c:83:2:
>> warning: =91phyclk=92 may be used uninitialized in this function [-
>> Wuninitialized]
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/arm/mach-exynos/setup-usb-phy.c |    8 ++++----
>>  1 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-
>> exynos/setup-usb-phy.c
>> index d26deb7..1eaa0b0 100644
>> --- a/arch/arm/mach-exynos/setup-usb-phy.c
>> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
>> @@ -31,7 +31,6 @@ static void exynos4210_usb_phy_clkset(struct
>> platform_device *pdev)
>>  	struct clk *xusbxti_clk;
>>  	u32 phyclk;
>>
>> -
>>  	xusbxti_clk =3D clk_get(&pdev->dev, "xusbxti");
>>  	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
>>  		if (soc_is_exynos4210()) {
>> @@ -50,6 +49,8 @@ static void exynos4210_usb_phy_clkset(struct
>> platform_device *pdev)
>>  				phyclk |=3D EXYNOS4210_CLKSEL_48M;
>>  				break;
>>  			}
>> +			clk_put(xusbxti_clk);
>> +			writel(phyclk, EXYNOS4_PHYCLK);
>>  		} else if (soc_is_exynos4212() || soc_is_exynos4412()) {
>>  			/* set clock frequency for PLL */
>>  			phyclk =3D readl(EXYNOS4_PHYCLK) &
>> ~EXYNOS4X12_CLKSEL_MASK;
>> @@ -76,11 +77,10 @@ static void exynos4210_usb_phy_clkset(struct
>> platform_device *pdev)
>>  				phyclk |=3D EXYNOS4X12_CLKSEL_24M;
>>  				break;
>>  			}
>> +			clk_put(xusbxti_clk);
>> +			writel(phyclk, EXYNOS4_PHYCLK);
>>  		}
>> -		clk_put(xusbxti_clk);
>>  	}
>> -
>> -	writel(phyclk, EXYNOS4_PHYCLK);
>>  }
>>
>>  static int exynos4210_usb_phy0_init(struct platform_device *pdev)
>> --
>> 1.7.4.1
>
> Well, I think, following is enough?
No. That will still give the same warning if none of the cases are true=
=2E

>
> And if you're ok on this, I will squash into your original one which =
is
> still in my tree.

OK.

>
> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c
> b/arch/arm/mach-exynos/setup-usb-phy.c
> index d26deb7..3f82414 100644
> --- a/arch/arm/mach-exynos/setup-usb-phy.c
> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
> @@ -31,7 +31,6 @@ static void exynos4210_usb_phy_clkset(struct
> platform_device *pdev)
>  	struct clk *xusbxti_clk;
>  	u32 phyclk;
>
> -
>  	xusbxti_clk =3D clk_get(&pdev->dev, "xusbxti");
>  	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
>  		if (soc_is_exynos4210()) {
> @@ -78,9 +77,8 @@ static void exynos4210_usb_phy_clkset(struct
> platform_device *pdev)
>  			}
>  		}
>  		clk_put(xusbxti_clk);
> +		writel(phyclk, EXYNOS4_PHYCLK);
>  	}
> -
> -	writel(phyclk, EXYNOS4_PHYCLK);
>  }
>
>  static int exynos4210_usb_phy0_init(struct platform_device *pdev)
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--=20
With warm regards,
Sachin

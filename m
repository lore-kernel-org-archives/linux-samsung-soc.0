From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: SAMSUNG: updates sdhci.h for Samsung SoCs
Date: Mon, 5 Jul 2010 22:02:03 +0900
Message-ID: <AANLkTilEZV1-xiP5mmfy1NFI9f9hSNP5qBE2JFk4pRkN@mail.gmail.com>
References: <1278332288-28021-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:57715 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753091Ab0GENCG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jul 2010 09:02:06 -0400
Received: by pzk26 with SMTP id 26so673120pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jul 2010 06:02:05 -0700 (PDT)
In-Reply-To: <1278332288-28021-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi,

Instead of refactoring, how about to delete it and move to dev-hsmmc fi=
le.
We don't need to call each sdhci_setup at each cpu files. just set
platform data and register platform data.

Just focus the each dev-hsmmc file and no need to change header file an=
ymore.

How do you think?

Thank you,
Kyungmin Park

On Mon, Jul 5, 2010 at 9:18 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> This patch updates sdhci.h as Maurus suggestion like following:
>
> From:
> =A0 =A0 =A0 =A0#ifdef ...
> =A0 =A0 =A0 =A0function()
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0blahblah;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0#else
> =A0 =A0 =A0 =A0function() { }
> =A0 =A0 =A0 =A0#endif
>
> To:
> =A0 =A0 =A0 =A0function()
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0#ifdef ...
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0blahblah;
> =A0 =A0 =A0 =A0#endif
> =A0 =A0 =A0 =A0}
>
> And fixes a couple of typos.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Note: depends on previous v3 patch set, Add support HSMMC on Samsung =
SMDKV210
>
> =A0arch/arm/plat-samsung/include/plat/sdhci.h | =A0 91 +++++++++-----=
--------------
> =A01 files changed, 30 insertions(+), 61 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/pl=
at-samsung/include/plat/sdhci.h
> index 1314ffa..5ad1e94 100644
> --- a/arch/arm/plat-samsung/include/plat/sdhci.h
> +++ b/arch/arm/plat-samsung/include/plat/sdhci.h
> @@ -82,12 +82,11 @@ extern void s5pv210_setup_sdhci1_cfg_gpio(struct =
platform_device *, int w);
> =A0extern void s5pv210_setup_sdhci2_cfg_gpio(struct platform_device *=
, int w);
> =A0extern void s5pv210_setup_sdhci3_cfg_gpio(struct platform_device *=
, int w);
>
> -/* S3C6400 SDHCI setup */
> +/* S3C64XX SDHCI setup */
>
> =A0#ifdef CONFIG_S3C64XX_SETUP_SDHCI
> =A0extern char *s3c64xx_hsmmc_clksrcs[4];
>
> -#ifdef CONFIG_S3C_DEV_HSMMC
> =A0extern void s3c6400_setup_sdhci_cfg_card(struct platform_device *d=
ev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 void __iomem *r,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct mmc_ios *ios,
> @@ -95,76 +94,62 @@ extern void s3c6400_setup_sdhci_cfg_card(struct p=
latform_device *dev,
>
> =A0static inline void s3c6400_default_sdhci0(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.clocks =3D s3c64xx_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.cfg_gpio =3D s3c64xx_setup_sdh=
ci0_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.cfg_card =3D s3c6400_setup_sdh=
ci_cfg_card;
> +#endif
> =A0}
>
> -#else
> -static inline void s3c6400_default_sdhci0(void) { }
> -#endif =A0/* CONFIG_S3C_DEV_HSMMC */
> -
> -#ifdef CONFIG_S3C_DEV_HSMMC1
> =A0static inline void s3c6400_default_sdhci1(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC1
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.clocks =3D s3c64xx_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.cfg_gpio =3D s3c64xx_setup_sdh=
ci1_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.cfg_card =3D s3c6400_setup_sdh=
ci_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s3c6400_default_sdhci1(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC1 */
>
> -#ifdef CONFIG_S3C_DEV_HSMMC2
> =A0static inline void s3c6400_default_sdhci2(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC2
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.clocks =3D s3c64xx_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.cfg_gpio =3D s3c64xx_setup_sdh=
ci2_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.cfg_card =3D s3c6400_setup_sdh=
ci_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s3c6400_default_sdhci2(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC2 */
> -
> -/* S3C6410 SDHCI setup */
>
> =A0extern void s3c6410_setup_sdhci_cfg_card(struct platform_device *d=
ev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 void __iomem *r,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct mmc_ios *ios,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct mmc_card *card);
>
> -#ifdef CONFIG_S3C_DEV_HSMMC
> =A0static inline void s3c6410_default_sdhci0(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.clocks =3D s3c64xx_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.cfg_gpio =3D s3c64xx_setup_sdh=
ci0_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.cfg_card =3D s3c6410_setup_sdh=
ci_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s3c6410_default_sdhci0(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC */
>
> -#ifdef CONFIG_S3C_DEV_HSMMC1
> =A0static inline void s3c6410_default_sdhci1(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC1
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.clocks =3D s3c64xx_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.cfg_gpio =3D s3c64xx_setup_sdh=
ci1_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.cfg_card =3D s3c6410_setup_sdh=
ci_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s3c6410_default_sdhci1(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC1 */
>
> -#ifdef CONFIG_S3C_DEV_HSMMC2
> =A0static inline void s3c6410_default_sdhci2(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC2
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.clocks =3D s3c64xx_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.cfg_gpio =3D s3c64xx_setup_sdh=
ci2_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.cfg_card =3D s3c6410_setup_sdh=
ci_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s3c6410_default_sdhci2(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC2 */
>
> =A0#else
> =A0static inline void s3c6410_default_sdhci0(void) { }
> @@ -184,48 +169,42 @@ extern void s5pc100_setup_sdhci0_cfg_card(struc=
t platform_device *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 struct mmc_ios *ios,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 struct mmc_card *card);
>
> -#ifdef CONFIG_S3C_DEV_HSMMC
> =A0static inline void s5pc100_default_sdhci0(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.clocks =3D s5pc100_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.cfg_gpio =3D s5pc100_setup_sdh=
ci0_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.cfg_card =3D s5pc100_setup_sdh=
ci0_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s5pc100_default_sdhci0(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC */
>
> -#ifdef CONFIG_S3C_DEV_HSMMC1
> =A0static inline void s5pc100_default_sdhci1(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC1
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.clocks =3D s5pc100_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.cfg_gpio =3D s5pc100_setup_sdh=
ci1_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.cfg_card =3D s5pc100_setup_sdh=
ci0_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s5pc100_default_sdhci1(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC1 */
>
> -#ifdef CONFIG_S3C_DEV_HSMMC2
> =A0static inline void s5pc100_default_sdhci2(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC2
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.clocks =3D s5pc100_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.cfg_gpio =3D s5pc100_setup_sdh=
ci2_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.cfg_card =3D s5pc100_setup_sdh=
ci0_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s5pc100_default_sdhci2(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC1 */
> -
>
> =A0#else
> =A0static inline void s5pc100_default_sdhci0(void) { }
> =A0static inline void s5pc100_default_sdhci1(void) { }
> =A0static inline void s5pc100_default_sdhci2(void) { }
> +
> =A0#endif /* CONFIG_S5PC100_SETUP_SDHCI */
>
> +/* S5PV210 SDHCI setup */
>
> -/* S5PC110 SDHCI setup */
> =A0#ifdef CONFIG_S5PV210_SETUP_SDHCI
> =A0extern char *s5pv210_hsmmc_clksrcs[4];
>
> @@ -234,58 +213,48 @@ extern void s5pv210_setup_sdhci_cfg_card(struct=
 platform_device *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 struct mmc_ios *ios,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 struct mmc_card *card);
>
> -#ifdef CONFIG_S3C_DEV_HSMMC
> =A0static inline void s5pv210_default_sdhci0(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.clocks =3D s5pv210_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.cfg_gpio =3D s5pv210_setup_sdh=
ci0_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc0_def_platdata.cfg_card =3D s5pv210_setup_sdh=
ci_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s5pv210_default_sdhci0(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC */
>
> -#ifdef CONFIG_S3C_DEV_HSMMC1
> =A0static inline void s5pv210_default_sdhci1(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC1
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.clocks =3D s5pv210_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.cfg_gpio =3D s5pv210_setup_sdh=
ci1_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc1_def_platdata.cfg_card =3D s5pv210_setup_sdh=
ci_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s5pv210_default_sdhci1(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC1 */
>
> -#ifdef CONFIG_S3C_DEV_HSMMC2
> =A0static inline void s5pv210_default_sdhci2(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC2
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.clocks =3D s5pv210_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.cfg_gpio =3D s5pv210_setup_sdh=
ci2_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc2_def_platdata.cfg_card =3D s5pv210_setup_sdh=
ci_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s5pv210_default_sdhci2(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC2 */
>
> -#ifdef CONFIG_S3C_DEV_HSMMC3
> =A0static inline void s5pv210_default_sdhci3(void)
> =A0{
> +#ifdef CONFIG_S3C_DEV_HSMMC3
> =A0 =A0 =A0 =A0s3c_hsmmc3_def_platdata.clocks =3D s5pv210_hsmmc_clksr=
cs;
> =A0 =A0 =A0 =A0s3c_hsmmc3_def_platdata.cfg_gpio =3D s5pv210_setup_sdh=
ci3_cfg_gpio;
> =A0 =A0 =A0 =A0s3c_hsmmc3_def_platdata.cfg_card =3D s5pv210_setup_sdh=
ci_cfg_card;
> +#endif
> =A0}
> -#else
> -static inline void s5pv210_default_sdhci3(void) { }
> -#endif /* CONFIG_S3C_DEV_HSMMC3 */
>
> =A0#else
> =A0static inline void s5pv210_default_sdhci0(void) { }
> =A0static inline void s5pv210_default_sdhci1(void) { }
> =A0static inline void s5pv210_default_sdhci2(void) { }
> =A0static inline void s5pv210_default_sdhci3(void) { }
> -#endif /* CONFIG_S5PC100_SETUP_SDHCI */
> -
> -
>
> +#endif /* CONFIG_S5PV210_SETUP_SDHCI */
>
> =A0#endif /* __PLAT_S3C_SDHCI_H */
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

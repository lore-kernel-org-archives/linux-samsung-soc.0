From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 1/2] ARM: SAMSUNG: Add pm_caps into platform data
Date: Wed, 16 Nov 2011 17:17:41 +0530
Message-ID: <CAJuYYwQ56z2jwE+PXrGO=Wifz-e0F6Eo=twhaPR0kpgq3V1FNA@mail.gmail.com>
References: <1321438848-3607-1-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:57680 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756087Ab1KPLrm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Nov 2011 06:47:42 -0500
Received: by yenq3 with SMTP id q3so1829941yen.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2011 03:47:42 -0800 (PST)
In-Reply-To: <1321438848-3607-1-git-send-email-sangwook.lee@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangwook Lee <sangwook.lee@linaro.org>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, patches@linaro.org, Sangwook Lee <sangwook.lee@samsung.com>

Dear Mr. Lee,

On 16 November 2011 15:50, Sangwook Lee <sangwook.lee@linaro.org> wrote=
:
> Add pm_caps into platform_data. This is power management, usually
> for SDIO device such as SDIO WLAN.
>
> Signed-off-by: Sangwook Lee <sangwook.lee@samsung.com>
> ---
> =A0arch/arm/plat-samsung/include/plat/sdhci.h | =A0 =A02 ++
> =A0arch/arm/plat-samsung/platformdata.c =A0 =A0 =A0 | =A0 =A02 ++
> =A02 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/pl=
at-samsung/include/plat/sdhci.h
> index dcff7dd..fcd02d4 100644
> --- a/arch/arm/plat-samsung/include/plat/sdhci.h
> +++ b/arch/arm/plat-samsung/include/plat/sdhci.h
> @@ -40,6 +40,7 @@ enum clk_types {
> =A0* struct s3c_sdhci_platdata() - Platform device data for Samsung S=
DHCI
> =A0* @max_width: The maximum number of data bits supported.
> =A0* @host_caps: Standard MMC host capabilities bit field.
> + * @pm_caps: SDIO host PM capabilities bit field.
> =A0* @cd_type: Type of Card Detection method (see cd_types enum above=
)
> =A0* @clk_type: Type of clock divider method (see clk_types enum abov=
e)
> =A0* @ext_cd_init: Initialize external card detect subsystem. Called =
on
> @@ -63,6 +64,7 @@ enum clk_types {
> =A0struct s3c_sdhci_platdata {
> =A0 =A0 =A0 =A0unsigned int =A0 =A0max_width;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0host_caps;
> + =A0 =A0 =A0 unsigned int =A0 =A0pm_caps;
> =A0 =A0 =A0 =A0enum cd_types =A0 cd_type;
> =A0 =A0 =A0 =A0enum clk_types =A0clk_type;
>
> diff --git a/arch/arm/plat-samsung/platformdata.c b/arch/arm/plat-sam=
sung/platformdata.c
> index ceb9fa3..0f70718 100644
> --- a/arch/arm/plat-samsung/platformdata.c
> +++ b/arch/arm/plat-samsung/platformdata.c
> @@ -53,6 +53,8 @@ void s3c_sdhci_set_platdata(struct s3c_sdhci_platda=
ta *pd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set->cfg_gpio =3D pd->cfg_gpio;
> =A0 =A0 =A0 =A0if (pd->host_caps)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set->host_caps |=3D pd->host_caps;
> + =A0 =A0 =A0 if (pd->pm_caps)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set->pm_caps |=3D pd->pm_caps;


Are the 'pm_caps' specific to a (on-board) sdio host attached to the
sdhci controller? If yes, then this change should be fine. If no,
please let me know. I am kind of worried of any new addition to
platform data. Because, if that new addition in platform data is not
board specific data, then it becomes difficult to represent that
information in device tree.

Thanks,
Thomas.


> =A0 =A0 =A0 =A0if (pd->clk_type)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set->clk_type =3D pd->clk_type;
> =A0}
> --
> 1.7.4.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

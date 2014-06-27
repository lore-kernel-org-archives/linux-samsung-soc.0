From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2] drm/exynos: Support DP CLKCON register in FIMD driver
Date: Fri, 27 Jun 2014 14:00:55 +0530
Message-ID: <CAEC9eQMgYHV2YFOATScPzvP8uFjtxs68ABdJfDx7c0=e49+06g@mail.gmail.com>
References: <1403793398-31593-1-git-send-email-ajaykumar.rs@samsung.com>
	<53AD1E9A.2030904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:40785 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836AbaF0Ia4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 04:30:56 -0400
Received: by mail-ve0-f173.google.com with SMTP id db11so4987915veb.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2014 01:30:55 -0700 (PDT)
In-Reply-To: <53AD1E9A.2030904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, "cpgs ." <cpgs@samsung.com>

Hi Inki,

Thanks for the review.

On Fri, Jun 27, 2014 at 1:04 PM, Inki Dae <inki.dae@samsung.com> wrote:
> On 2014=EB=85=84 06=EC=9B=94 26=EC=9D=BC 23:36, Ajay Kumar wrote:
>> Add the missing setting for DP CLKCON register.
>>
>> This register is present on Exynos5 based FIMD controllers,
>> and needs to be used if we are using DP.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>> Changes since V1:
>>  - Remove usage of driver_data to configure DP CLKCON register
>>  drivers/gpu/drm/exynos/exynos_dp_core.c  | 2 ++
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  | 8 ++++++++
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 5 +++++
>>  include/video/samsung_fimd.h             | 4 ++++
>>  4 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/d=
rm/exynos/exynos_dp_core.c
>> index 2e77a15..d8868f3 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> @@ -1336,6 +1336,8 @@ static int exynos_dp_bind(struct device *dev, =
struct device *master, void *data)
>>
>>       platform_set_drvdata(pdev, &exynos_dp_display);
>>
>> +     exynos_fimd_output_type =3D EXYNOS_FIMD_OUTPUT_DP;
>> +
>>       return exynos_drm_create_enc_conn(drm_dev, &exynos_dp_display)=
;
>>  }
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/d=
rm/exynos/exynos_drm_drv.h
>> index 36535f3..1089744 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> @@ -60,6 +60,12 @@ enum exynos_drm_output_type {
>>       EXYNOS_DISPLAY_TYPE_VIDI,
>>  };
>>
>> +enum exynos_fimd_output_type {
>> +     EXYNOS_FIMD_OUTPUT_MIPI,
>> +     EXYNOS_FIMD_OUTPUT_DPI,
>> +     EXYNOS_FIMD_OUTPUT_DP,
>> +};
>> +
>>  /*
>>   * Exynos drm common overlay structure.
>>   *
>> @@ -380,4 +386,6 @@ extern struct platform_driver fimc_driver;
>>  extern struct platform_driver rotator_driver;
>>  extern struct platform_driver gsc_driver;
>>  extern struct platform_driver ipp_driver;
>> +
>> +extern enum exynos_fimd_output_type exynos_fimd_output_type;
>>  #endif
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/=
drm/exynos/exynos_drm_fimd.c
>> index bb45ab2..a46a9c4 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -90,6 +90,8 @@ static struct fimd_driver_data exynos5_fimd_driver=
_data =3D {
>>       .has_shadowcon =3D 1,
>>  };
>>
>> +enum exynos_fimd_output_type exynos_fimd_output_type;
>> +
>>  struct fimd_win_data {
>>       unsigned int            offset_x;
>>       unsigned int            offset_y;
>> @@ -331,6 +333,9 @@ static void fimd_commit(struct exynos_drm_manage=
r *mgr)
>>       if (clkdiv > 1)
>>               val |=3D VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR=
;
>>
>> +     if (exynos_fimd_output_type =3D=3D EXYNOS_FIMD_OUTPUT_DP)
>> +             writel(DP_CLK_ENABLE, ctx->regs + DP_CLKCON);
>
>
> You are passing output type directly from dp driver to fimd driver us=
ing
> extern variable. This is really not good. Is that really only way for=
 it?
>
> One is,
> it's to add a dt property in fimd node and use it; ex.
> samsung,output_type. Whether fimd output should be DPI, DSI, or eDP
> would be dependent on Machine.
>
> Other is,
> crtc driver is to get output type though encoder callback. At this
> moment, crtc driver already knows encoder/connector driver. So I thin=
k
> you can use a callback of encoder to get output type like below,
>
> exynos_display_ops {
>         ...
>         ...get_output(struct drm_crtc *crtc);
> };
>
> at exynos_drm_encoder.c,
> ... exynos_drm_get_output_type(struct drm_crtc *crtc)
> {
>         ...
>         return display_ops->get_output(...);
> }
>
> at fimd_commit function,
>         ...
>         ctx->output_type =3D exynos_drm_get_output_type(mgr->crtc);
>
>
> I think first way is more simple and reasonable.
>
> One more thing, does FIMD ip of Exynos4 series have DP_CLKCON registe=
r?
> No, they have no any DP_CLKCON register so you would need to consider
> other SoC without DP_CLKCON. For this, a proper volunteer would be
> fimd_driver_data.
Right, I should also consider putting DP CLKCON register inside driver_=
data.
And, I will use the DT property you mentioned.
Will send a patchset ASAP.

Regards,
Ajay Kumar

> Thanks,
> Inki Dae
>
>
>> +
>>       writel(val, ctx->regs + VIDCON0);
>>  }
>>
>> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fi=
md.h
>> index b039320..d8f4b0b 100644
>> --- a/include/video/samsung_fimd.h
>> +++ b/include/video/samsung_fimd.h
>> @@ -435,6 +435,10 @@
>>  #define BLENDCON_NEW_8BIT_ALPHA_VALUE                (1 << 0)
>>  #define BLENDCON_NEW_4BIT_ALPHA_VALUE                (0 << 0)
>>
>> +/* Video clock enable for DP */
>> +#define DP_CLKCON                            0x27C
>> +#define DP_CLK_ENABLE                                0x2
>> +
>>  /* Notes on per-window bpp settings
>>   *
>>   * Value     Win0     Win1     Win2     Win3     Win 4
>>
>

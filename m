From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 7/9] drm/exynos: use of_get_named_gpio to get hdmi hpd gpio
Date: Tue, 18 Jun 2013 17:35:32 +0530
Message-ID: <CAPdUM4OQGgGfzg-fjvVj4mBBL96f4+2yFwkgdAivDcHZpzoBCw@mail.gmail.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
	<1370959891-8923-8-git-send-email-rahul.sharma@samsung.com>
	<51BAC3A0.7000002@samsung.com>
	<CAAQKjZNGuhpWck4VqbpP+Ge5fWDP0hkLSHj2zVAKc5sUPok2Xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:43752 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755919Ab3FRMFe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 08:05:34 -0400
Received: by mail-we0-f172.google.com with SMTP id q56so3376290wes.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 05:05:32 -0700 (PDT)
In-Reply-To: <CAAQKjZNGuhpWck4VqbpP+Ge5fWDP0hkLSHj2zVAKc5sUPok2Xg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org, Rahul Sharma <rahul.sharma@samsung.com>

Thanks Mr. Dae,

Please discard the REST of the patches in this series. I am posting a
another patch-set which has all the patches independent of hdmiphy
related changes.

regards,
Rahul Sharma.

On Mon, Jun 17, 2013 at 8:22 AM, Inki Dae <inki.dae@samsung.com> wrote:
> Applied.
>
> Thanks,
> Inki Dae
>
>
> 2013/6/14 =EA=B9=80=EC=8A=B9=EC=9A=B0 <sw0312.kim@samsung.com>
>>
>> Hello Rahul,
>>
>> this patch is not related with others and it looks good to me.
>>
>> On 2013=EB=85=84 06=EC=9B=94 11=EC=9D=BC 23:11, Rahul Sharma wrote:
>> > Cleanup by removing flags variable from drm_hdmi_dt_parse_pdata
>> > which is not used anywhere. Swtiching to of_get_named_gpio instead
>> > of of_get_named_gpio_flags solved this.
>> >
>> > Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>
>> Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
>>
>> > ---
>> >  drivers/gpu/drm/exynos/exynos_hdmi.c |    3 +--
>> >  1 file changed, 1 insertion(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> > b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> > index 1eb5ffb..fc6a9b0 100644
>> > --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> > +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> > @@ -2081,7 +2081,6 @@ static struct s5p_hdmi_platform_data
>> > *drm_hdmi_dt_parse_pdata
>> >  {
>> >       struct device_node *np =3D dev->of_node;
>> >       struct s5p_hdmi_platform_data *pd;
>> > -     enum of_gpio_flags flags;
>> >       u32 value;
>> >
>> >       pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>> > @@ -2095,7 +2094,7 @@ static struct s5p_hdmi_platform_data
>> > *drm_hdmi_dt_parse_pdata
>> >               goto err_data;
>> >       }
>> >
>> > -     pd->hpd_gpio =3D of_get_named_gpio_flags(np, "hpd-gpio", 0, =
&flags);
>> > +     pd->hpd_gpio =3D of_get_named_gpio(np, "hpd-gpio", 0);
>> >
>> >       return pd;
>> >
>> >
>>
>> --
>> Seung-Woo Kim
>> Samsung Software R&D Center
>> --
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

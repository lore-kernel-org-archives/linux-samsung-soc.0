From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: allocate non-contigous buffers when iommu is
 enabled
Date: Thu, 22 May 2014 15:41:02 +0900
Message-ID: <537D9BFE.7060101@samsung.com>
References: <1399463489-6925-1-git-send-email-rahul.sharma@samsung.com>
 <CAPdUM4OL+Kt8v1upyczDmjBPh5kT1d4gYDmYLBb=ZovQ=qOE7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:64769 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751576AbaEVGlH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 02:41:07 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5Y007LTQKERK90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 15:41:02 +0900 (KST)
In-reply-to: <CAPdUM4OL+Kt8v1upyczDmjBPh5kT1d4gYDmYLBb=ZovQ=qOE7w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>

On 2014=EB=85=84 05=EC=9B=94 22=EC=9D=BC 14:25, Rahul Sharma wrote:
> Hi Inki,
>=20
> The below fix doesn't affect the FB dev buffer allocation. IMO the sc=
enario
> where u-boot allocates the buffer is not disturbed.
> Please review the implementation.
>=20

Applied.

Thanks,
Inki Dae


> Regards,
> Rahul Sharma.
>=20
> On 7 May 2014 17:21, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> Allow to allocate non-contigous buffers when iommu is enabled.
>> Currently, it tries to allocates contigous buffer which consistently
>> fail for large buffers and then fall back to non contigous. Apart
>> from being slow, this implementation is also very noisy and fills
>> the screen with alloc fail logs.
>>
>> Change-Id: I523e95aa308122ed2edc55e065ae6eb8be996541
>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_gem.c |   22 ++++++++++----------=
--
>>  1 file changed, 10 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/d=
rm/exynos/exynos_drm_gem.c
>> index 5d88924..7136945 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> @@ -624,22 +624,20 @@ int exynos_drm_gem_dumb_create(struct drm_file=
 *file_priv,
>>         args->pitch =3D args->width * ((args->bpp + 7) / 8);
>>         args->size =3D args->pitch * args->height;
>>
>> -       exynos_gem_obj =3D exynos_drm_gem_create(dev, EXYNOS_BO_CONT=
IG |
>> -                                               EXYNOS_BO_WC, args->=
size);
>> -       /*
>> -        * If physically contiguous memory allocation fails and if I=
OMMU is
>> -        * supported then try to get buffer from non physically cont=
iguous
>> -        * memory area.
>> -        */
>> -       if (IS_ERR(exynos_gem_obj) && is_drm_iommu_supported(dev)) {
>> -               dev_warn(dev->dev, "contiguous FB allocation failed,=
 falling back to non-contiguous\n");
>> +       if (is_drm_iommu_supported(dev)) {
>> +               exynos_gem_obj =3D exynos_drm_gem_create(dev,
>> +                       EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC,
>> +                       args->size);
>> +       } else {
>>                 exynos_gem_obj =3D exynos_drm_gem_create(dev,
>> -                                       EXYNOS_BO_NONCONTIG | EXYNOS=
_BO_WC,
>> -                                       args->size);
>> +                       EXYNOS_BO_CONTIG | EXYNOS_BO_WC,
>> +                       args->size);
>>         }
>>
>> -       if (IS_ERR(exynos_gem_obj))
>> +       if (IS_ERR(exynos_gem_obj)) {
>> +               dev_warn(dev->dev, "FB allocation failed.\n");
>>                 return PTR_ERR(exynos_gem_obj);
>> +       }
>>
>>         ret =3D exynos_drm_gem_handle_create(&exynos_gem_obj->base, =
file_priv,
>>                         &args->handle);
>> --
>> 1.7.9.5
>>
>=20

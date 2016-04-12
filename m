From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 5/7] drm/exynos/decon5433: fix DECON standalone update
Date: Tue, 12 Apr 2016 09:33:33 +0200
Message-ID: <570CA4CD.3040106@samsung.com>
References: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
 <1458738918-32054-6-git-send-email-a.hajda@samsung.com>
 <570C5CB5.8000409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:22401 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752649AbcDLHoC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Apr 2016 03:44:02 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5I00ESEG3SVD00@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Apr 2016 08:43:04 +0100 (BST)
In-reply-to: <570C5CB5.8000409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

On 04/12/2016 04:25 AM, Inki Dae wrote:
> Hi Andrzej,
>
> 2016=EB=85=84 03=EC=9B=94 23=EC=9D=BC 22:15=EC=97=90 Andrzej Hajda =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> DECON should be updated after un-protecting windows and after changi=
ng
>> output parameters, otherwise image is not displayed in case of HDMI =
path.
> I'm not sure why STANDALONE_UPDATE_F bit should be updated after un-p=
rotecting windows and changing output parameters.
> The fields with _F prefix mean that these will be applied after vsync=
 so we use protection window in case of all registers which affect disp=
lay output so that they can be updated together.
>
> Wouldn't there be other thing which affects HDMI output?
>
> In addition, we would need another patch which updates TV relevant re=
gisters only in case of DECON-TV. DECON_UPDATE is a register for DECON-=
TV.

DECON_UPDATE is present in both DECON and DECON-TV and in both cases
have the same field STANDALONE_UPDATE_F.

Documentation for 5433 says:
> When you modify the shadow attributed registers, set
> STANDALONE_UPDATE_F.
>
So it should be set after setting registers with _F suffix,
but it has also _F suffix - contradiction. So I guess this _F suffix
should not be treated too strictly in this case. Moreover the suffix
has been removed in Exynos7420 - it is called just STANDALONE_UPDATE.

Anyway I am not sure what is exact purpose of this register and
the changes proposed in the patch are rather results of multiple tests
with hardware - documentation is rather poor on this subject.

I am also not sure why DECON works without it but DECON-TV does not,
anyway I set it in both variants because documentation says so.

Regards
Andrzej

>
> Thanks,
> Inki Dae
>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers=
/gpu/drm/exynos/exynos5433_drm_decon.c
>> index ab9154e..7fec656 100644
>> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> @@ -191,6 +191,8 @@ static void decon_commit(struct exynos_drm_crtc =
*crtc)
>> =20
>>  	/* enable output and display signal */
>>  	decon_set_bits(ctx, DECON_VIDCON0, VIDCON0_ENVID | VIDCON0_ENVID_F=
, ~0);
>> +
>> +	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
>>  }
>> =20
>>  static void decon_win_set_pixfmt(struct decon_context *ctx, unsigne=
d int win,
>> @@ -316,9 +318,6 @@ static void decon_update_plane(struct exynos_drm=
_crtc *crtc,
>> =20
>>  	/* window enable */
>>  	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, ~0);
>> -
>> -	/* standalone update */
>> -	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
>>  }
>> =20
>>  static void decon_disable_plane(struct exynos_drm_crtc *crtc,
>> @@ -336,9 +335,6 @@ static void decon_disable_plane(struct exynos_dr=
m_crtc *crtc,
>>  	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, 0);
>> =20
>>  	decon_shadow_protect_win(ctx, win, false);
>> -
>> -	/* standalone update */
>> -	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
>>  }
>> =20
>>  static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
>> @@ -352,6 +348,9 @@ static void decon_atomic_flush(struct exynos_drm=
_crtc *crtc)
>>  	for (i =3D ctx->first_win; i < WINDOWS_NR; i++)
>>  		decon_shadow_protect_win(ctx, i, false);
>> =20
>> +	/* standalone update */
>> +	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
>> +
>>  	if (ctx->out_type =3D=3D IFTYPE_I80)
>>  		set_bit(BIT_WIN_UPDATED, &ctx->flags);
>>  }
>> @@ -463,8 +462,10 @@ static void decon_clear_channels(struct exynos_=
drm_crtc *crtc)
>>  		decon_shadow_protect_win(ctx, win, true);
>>  		decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, 0);
>>  		decon_shadow_protect_win(ctx, win, false);
>> -		decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
>>  	}
>> +
>> +	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
>> +
>>  	/* TODO: wait for possible vsync */
>>  	msleep(50);
>> =20
>>

From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH 3/5 v2] drm/exynos: allow mulitple layer updates per vsync
 for mixer
Date: Tue, 24 Jun 2014 13:38:37 +0200
Message-ID: <53A9633D.4050800@suse.de>
References: <1403501545-16482-1-git-send-email-rahul.sharma@samsung.com> <1403501545-16482-4-git-send-email-rahul.sharma@samsung.com> <53A90ADA.2040306@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41003 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750806AbaFXLil (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 07:38:41 -0400
In-Reply-To: <53A90ADA.2040306@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Am 24.06.2014 07:21, schrieb Inki Dae:
> On 2014=EB=85=84 06=EC=9B=94 23=EC=9D=BC 14:32, Rahul Sharma wrote:
>> Allowing only one layer update per vsync can cause issues
>> while there are update available for both layers. There is
>> a good amount of possibility to loose updates if we allow
>> single update per vsync.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_mixer.c |    7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm=
/exynos/exynos_mixer.c
>> index d359501..6773b03 100644
>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>> @@ -511,13 +511,8 @@ static void vp_video_buffer(struct mixer_contex=
t *ctx, int win)
>>  static void mixer_layer_update(struct mixer_context *ctx)
>>  {
>>  	struct mixer_resources *res =3D &ctx->mixer_res;
>> -	u32 val;
>> -
>> -	val =3D mixer_reg_read(res, MXR_CFG);
>> =20
>> -	/* allow one update per vsync only */
>> -	if (!(val & MXR_CFG_LAYER_UPDATE_COUNT_MASK))
>> -		mixer_reg_writemask(res, MXR_CFG, ~0, MXR_CFG_LAYER_UPDATE);
>> +	mixer_reg_writemask(res, MXR_CFG, ~0, MXR_CFG_LAYER_UPDATE);
>=20
> Rahul, it looks good to me and ok as is. But above codes don't consid=
er
> Exynos4 series. In case of Exynos4xxx SoC,
> MXR_CFG_LAYER_UPDATE_COUNT_MASK and MXR_CFG_LAYER_UPDATE of MIXER_CFG
> register are reserved fields. So can you work that patch to be
> considered for Exynos4xxx SoC? That patch would be additional one.
>=20
> Anyway, will apply it as is, and I will wait for the additional patch=
=2E

If it's not too late, could you fix up "multiple" in the subject? :)

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg

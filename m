Return-Path: <SRS0=5+ny=5J=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD695C4332B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Mar 2020 11:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94551208D6
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Mar 2020 11:59:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5OL7hM7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbgCXL7O (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Mar 2020 07:59:14 -0400
Received: from mail-qv1-f65.google.com ([209.85.219.65]:42655 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbgCXL7O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Mar 2020 07:59:14 -0400
Received: by mail-qv1-f65.google.com with SMTP id ca9so9017693qvb.9;
        Tue, 24 Mar 2020 04:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IzasdxRYqM7rOFN66DBG3h2VMkVrFQ3GhK1sACp5S8U=;
        b=Q5OL7hM7fhWYS7E1vvbqxwxRQU8X06B/qc/qoWD7sTquEt4AdWaJ1sJ2KH16uIw8P5
         JlylgRJqGl9LOMT+8ib1IR+jISmtrNuwj1cujpS+JjdlrGemau0YqDswan/GNG9gW4ul
         f3g8/tQJglQFuWT2C98zBaPwT/lxC5nd84FkPLpC8mlinjlf6xqdPGm30uOO29ZdCRSB
         9J7nvn2vrwACeElwn1eXKQfXZTRsIy92MHiaXyhDkOsWgowcqpYCD43Di3dQj8J5gRO6
         3CdGLfY7noTkcnXpNlnG0RQc2PLwEXZX06wRkIfiYcKJKFbRJJb5VV/j89Vw5UAS0Hrt
         JwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IzasdxRYqM7rOFN66DBG3h2VMkVrFQ3GhK1sACp5S8U=;
        b=ak9ITDVgjsypZk+6ODJR4+90kX40viRpBJf03fGDe+HdhdNt+5MqHkpb5w/8iu1dzP
         16vIDs+dENn93hzpPXlZO0UAhpLX8MUNgd9w65aPO7fNCHlgK/woPu6qrBa1XgzkKE1A
         DCx3PP/kZGzPynqF3SqlQvL1KfXdmk1Sna+OLewkt+1B+Lb155gFEaanRtO4+PmF+IVl
         9on62rsaRlyHtbuDYbfYmVApX68QLgVRX3DRWnWWRkmIPcNCva+NsBGmjI+8xGLwLNPM
         wv3eSx/KK6C4Iq+e4Oe+T88OR+mM1sPzVeq0RMp7ENv6PgEh63zAWMDYimANPmZD5S2J
         q3Tw==
X-Gm-Message-State: ANhLgQ1gHYiwwU2wPC+QHhAxf4QrqsUGUIsuAP9yOzWLTCGK52SFnBfp
        xg2Xy0wFp9r/2//JDXaFQZM=
X-Google-Smtp-Source: ADFU+vsRrRM8GomjFcPHutO/gZSvZ9pBrvIDKkaAb0+Vm+OeJtn1ews7WZEp9PklwYeqveQN1bHBCQ==
X-Received: by 2002:a0c:edca:: with SMTP id i10mr6735372qvr.130.1585051152710;
        Tue, 24 Mar 2020 04:59:12 -0700 (PDT)
Received: from smtp.gmail.com ([2607:fea8:56a0:11a1::4])
        by smtp.gmail.com with ESMTPSA id x124sm2222237qkc.70.2020.03.24.04.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 04:59:11 -0700 (PDT)
Date:   Tue, 24 Mar 2020 07:59:05 -0400
From:   Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        abrodkin@synopsys.com, bbrezillon@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, jingoohan1@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        stefan@agner.ch, alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
        xinliang.liu@linaro.org, zourongrong@gmail.com,
        john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
        puck.chen@hisilicon.com, linux@armlinux.org.uk,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
        matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
        tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
        hamohammed.sa@gmail.com, sebastian.reichel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 20/22] drm/vkms: Use simple encoder
Message-ID: <20200324115905.dp5jqzbmvhbmk2rn@smtp.gmail.com>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-21-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xyxw5g6b72ps7vfq"
Content-Disposition: inline
In-Reply-To: <20200305155950.2705-21-tzimmermann@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--xyxw5g6b72ps7vfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

First of all, thanks for your patch!

I applied all your series, compiled it, and when I tried
`make INSTALL_MOD_PATH=3D/PATH/ modules_instal` I got the following
message:

 depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper
 depmod: ERROR: Found 2 modules in dependency cycles!
 make: *** [Makefile:1317: _modinst_post] Error 1

I cleaned up my local files and tried again, but I got the same error;
If I just use `drm-misc-next` everything is fine.  Did I miss something?

Thanks

On 03/05, Thomas Zimmermann wrote:
> The vkms driver uses an empty implementation for its encoder. Replace
> the code with the generic simple encoder.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/vkms/vkms_output.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index fb1941a6522c..85afb77e97f0 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -3,6 +3,7 @@
>  #include "vkms_drv.h"
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> =20
>  static void vkms_connector_destroy(struct drm_connector *connector)
>  {
> @@ -17,10 +18,6 @@ static const struct drm_connector_funcs vkms_connector=
_funcs =3D {
>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
>  };
> =20
> -static const struct drm_encoder_funcs vkms_encoder_funcs =3D {
> -	.destroy =3D drm_encoder_cleanup,
> -};
> -
>  static int vkms_conn_get_modes(struct drm_connector *connector)
>  {
>  	int count;
> @@ -70,8 +67,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int i=
ndex)
> =20
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> =20
> -	ret =3D drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init encoder\n");
>  		goto err_encoder;
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--xyxw5g6b72ps7vfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl559gMACgkQWJzP/com
vP9BEQ//bENFpSJc2y0XTYIOh3A9lmWbJYMBLW1j5T3uUJJu8x0lC0hqd0fJW3V8
iT1Pedxmmf7duluAn7uKjUQ1sPztm2PcJB8F9ADs+bJdKN2CqmsL3kB4Ip1Q+US7
t7cptBTF6FrLPo4e1WpZAEEu4UdyVsq16+0v3+8icC0YSX6KMQdI9QNvvp/5PmXF
xYc6wwyGGqNZhmVRyLu0Im+zG5TvscTmK3iIu1BOMEubsgZD/BP8ZSx0efQJKRhA
aPhzGs8S7Sp+EnE4wiTU6iZch3+KUw6D0lc398rdlvbZXmvxSxe8WxCwciMksgu5
c+A/+oJ80KIhkjWCQNpF5oddWXUUqy6yHZrzIWzkPAj9oVxQa0jr7EwAkT1h+Zp1
wUDLrQw9ZRw/GHv6awiSFDukLpHIabDgN9F0fsvx9aa/PJ53FOR6hilCOn8tIVnJ
oZabUjqa7pV3L8N5CFott+8EV2y4GZK5R+VW6MX8px2bfa7SaJl+9HgeKssOYOkF
6cwm+IquaD3wz9h7elWGmEQgqj3jOviny3HT7I8U+ZlmMa6+JCMt4iq5e1R9q4du
PP4mh695VhSas/mbB3qjZFy/FCj1bvJ8J6AdHOoNDmjM4JVv9F5S5yi3UN5uEBXC
ZtKmSxghh2GJS2LFK6b88yxVNVNYrCX6bYWSyfovToU6C0QzbKs=
=srDw
-----END PGP SIGNATURE-----

--xyxw5g6b72ps7vfq--

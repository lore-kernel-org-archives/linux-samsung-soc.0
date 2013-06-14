From: =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>
Subject: Re: [PATCH 1/9] drm/exynos: use SoC name to identify hdmi version
Date: Fri, 14 Jun 2013 15:53:16 +0900
Message-ID: <51BABDDC.60603@samsung.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
 <1370959891-8923-2-git-send-email-rahul.sharma@samsung.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37254 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751409Ab3FNGxR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 02:53:17 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOD00D2TF4L1HP0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 15:53:16 +0900 (KST)
In-reply-to: <1370959891-8923-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, joshi@samsung.com, Seung-Woo Kim <sw0312.kim@samsung.com>

Hello Rahul,

On 2013=EB=85=84 06=EC=9B=94 11=EC=9D=BC 23:11, Rahul Sharma wrote:
> Exynos hdmi IP version is named after hdmi specification version i.e.
> 1.3 and 1.4. This versioning mechanism is not sufficient to handle
> the diversity in the hdmi/phy IPs which are present across the exynos
> SoC family.
>=20
> This patch changes the hdmi version to the name of the SoC in which
> the IP was introduced for the first time. Same version is applicable
> to all subsequent SoCs having the same IP version.
>=20
> Exynos4210 has 1.3 HDMI, i2c mapped phy with configuration set.
> Exynos5250 has 1.4 HDMI, i2c mapped phy with configuration set.
> Exynos5420 has 1.4 HDMI, Platform Bus mapped phy with configuration s=
et.
>=20
> Based on the HDMI IP version we cannot decide to pick Exynos5250 phy =
conf
> and use i2c for data transfer or Exynos5420 phy confs and platform bu=
s
> calls for communication.

Considering your other patch to divide hdmi and hdmiphy, how do you
think using hdmiphy version parsed from hdmiphy dt binding from phy cod=
e
instead of using hdmi version for both hdmi and hdmiphy? If that, this
SoC identifying hdmi version is not necessary because there is no chang=
e
at least in hdmi side.

And IMO, it seems easy to merge hdmiphy related patch first before
merging patch for exynos5420.

>=20
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c |  249 +++++++++++++++++-------=
----------
>  drivers/gpu/drm/exynos/regs-hdmi.h   |   78 +++++------
>  2 files changed, 164 insertions(+), 163 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/e=
xynos/exynos_hdmi.c
> index 75a6bf3..9384ffc 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -73,9 +73,9 @@ enum HDMI_PACKET_TYPE {
>  	HDMI_PACKET_TYPE_AUI =3D HDMI_PACKET_TYPE_INFOFRAME + 4
>  };
> =20
> -enum hdmi_type {
> -	HDMI_TYPE13,
> -	HDMI_TYPE14,
> +enum hdmi_version {
> +	HDMI_VER_EXYNOS4210,
> +	HDMI_VER_EXYNOS4212,
>  };

<snip>

--=20
Seung-Woo Kim
Samsung Software R&D Center
--

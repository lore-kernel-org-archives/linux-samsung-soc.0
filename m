From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer support
Date: Fri, 25 Jul 2014 16:49:02 +0900
Message-ID: <53D20BEE.4070502@samsung.com>
References: <1405680964-6869-1-git-send-email-inki.dae@samsung.com>
 <1405680964-6869-2-git-send-email-inki.dae@samsung.com>
 <53D0DEA8.1090603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62854 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756912AbaGYHtg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 03:49:36 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9900AEFCDRMY90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jul 2014 16:49:04 +0900 (KST)
In-reply-to: <53D0DEA8.1090603@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>

On 2014=EB=85=84 07=EC=9B=94 24=EC=9D=BC 19:23, Andrzej Hajda wrote:
> Hi Inki,
>=20
> +CC: Thierry and Alexandre
>=20
> On 07/18/2014 12:56 PM, Inki Dae wrote:
>> This patch adds below two flags for LPM transfer, and it attaches LP=
M flags
>> to a msg in accordance with master's mode_flags set by LCD Panel dri=
ver.
>>
>> MIPI_DSI_MODE_CMD_LPM: low power command transfer
>> MIPI_DSI_MODE_VIDEO_LPM: low power video transfer
> What is the difference between these two?

They mean that MIPI DSI controller have to transfer command or video to
Panel in Low Power Mode according to these flags.

> Why not just MIPI_DSI_MODE_LPM combined optionally with
> MIPI_DSI_MODE_VIDEO ?
> Anyway as I understand the only role of this flag is to always trigge=
r
> MIPI_DSI_MSG_USE_LPM flag in DSI message. Maybe better is to check bo=
th
> flags in DSI host, using some helper function.

No any flag would mean that video and command data have to be
transferred in HS mode. On the other hands, if there is one of above
flags, the data would be transferred in Low Power Mode. So I think
separated flags, MIPI_DSI_MODE_VIDEO/COMMAND and MIPI_DSI_MODE_LPM
causes unnecessary flag combination.

>=20
>>
>> MIPI DSI spec says,
>>      "the host processor controls the desired mode of clock operatio=
n.
>>       Host protocol and applications control Clock Lane operating mo=
de
>>       (High Speed or Low Power mode). System designers are responsib=
le
>>       for understanding the clock requirements for peripherals attac=
hed
>>       to DSI and controlling clock behavior in accordance with those
>>       requirements."
>>
>> Some LCD Panel devices, nt35502a, would need LPM transfer support
>> because they should receive some initial commands with LPM by defaul=
t
>> hardware setting.
>=20
> It would be good to see usage of this flag in the driver. Is it possi=
ble
> to post it?

Yes, but that driver is needed for more cleanup works. Anyway I will
post it in the near future.
>=20
> I have posted few months ago TC358764 driver[1] which also uses LPM f=
or
> initialization, have you look at it.
>=20
> [1]:
> http://lists.freedesktop.org/archives/dri-devel/2014-February/053713.=
html
>=20
> Regards
> Andrzej
>=20
>>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  drivers/gpu/drm/drm_mipi_dsi.c |    3 +++
>>  include/drm/drm_mipi_dsi.h     |    4 ++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mi=
pi_dsi.c
>> index e633df2..6b2bbda 100644
>> --- a/drivers/gpu/drm/drm_mipi_dsi.c
>> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
>> @@ -232,6 +232,9 @@ int mipi_dsi_dcs_write(struct mipi_dsi_device *d=
si, unsigned int channel,
>>  		break;
>>  	}
>> =20
>> +	if (dsi->mode_flags & MIPI_DSI_MODE_CMD_LPM)
>> +		msg.flags =3D MIPI_DSI_MSG_USE_LPM;
>> +
>>  	return ops->transfer(dsi->host, &msg);
>>  }
>>  EXPORT_SYMBOL(mipi_dsi_dcs_write);
>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>> index 944f33f..1c41e49 100644
>> --- a/include/drm/drm_mipi_dsi.h
>> +++ b/include/drm/drm_mipi_dsi.h
>> @@ -94,6 +94,10 @@ void mipi_dsi_host_unregister(struct mipi_dsi_hos=
t *host);
>>  #define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
>>  /* disable EoT packets in HS mode */
>>  #define MIPI_DSI_MODE_EOT_PACKET	BIT(9)
>> +/* command low power mode */
>> +#define MIPI_DSI_MODE_CMD_LPM		BIT(10)
>> +/* video low power mode */
>> +#define MIPI_DSI_MODE_VIDEO_LPM		BIT(11)
>> =20
>>  enum mipi_dsi_pixel_format {
>>  	MIPI_DSI_FMT_RGB888,
>=20
>=20

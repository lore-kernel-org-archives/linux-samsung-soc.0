From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v3 1/3] drm/exynos: dp: add of_graph dt binding support for
 panel
Date: Fri, 04 Dec 2015 18:00:09 +0900
Message-ID: <56615619.2040208@samsung.com>
References: <1449135010-8111-1-git-send-email-inki.dae@samsung.com>
 <1449135010-8111-2-git-send-email-inki.dae@samsung.com>
 <566049D0.8070404@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41653 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755751AbbLDJAR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Dec 2015 04:00:17 -0500
In-reply-to: <566049D0.8070404@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, k.kozlowski@samsung.com

Hi Javier,

2015=EB=85=84 12=EC=9B=94 03=EC=9D=BC 22:55=EC=97=90 Javier Martinez Ca=
nillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Hello Inki,
>=20
> I found that v2 of this patch is alredy in your exynos-drm for-next b=
ranch so
> so I had to revert it in linux-next to apply this one to test. You sh=
ouldn't
> push patches that were still not reviewed (specially the ones that we=
ren't
> tested like this one) to your branch that gets pulled by -next. The i=
dea of
> -next is to have some test coverage but it should be as stable as pos=
sible.

exynos-drm/for-next branch is not really for-next branch. This branch i=
s used
only for integration test. As you know, there are many exynos maintaine=
rs
and they have their own repository. So we would need to test the integr=
ation.
=46or this, exynos-drm/for-next is merged to linux-next not Dave's tree=
=2E
Only exynos-drm-next branch will be merged to Dave's tree so only revie=
wed and
tested patches will be merged to exynos-drm-next.

>=20
> On 12/03/2015 06:30 AM, Inki Dae wrote:
>> This patch adds of_graph dt binding support for panel device
>> and also keeps the backward compatibility.
>>
>> i.e.,
>> The dts file for Exynos5800 based peach pi board
>> has a panel property so we need to keep the backward compatibility.
>>
>> Changelog v3:
>> - bind only one of two nodes outbound - panel or bridge.
>>
>=20
> This patch fixes one of the comments I had for v2 but I've another
> comment below.
> =20
>> Changelog v2:
>> - return -EINVAL if getting a port node failed.
>>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_dp_core.c | 21 ++++++++++++++++++++-
>>  1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/d=
rm/exynos/exynos_dp_core.c
>> index 94f02a0..60260a0 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> @@ -1392,7 +1392,7 @@ static const struct component_ops exynos_dp_op=
s =3D {
>>  static int exynos_dp_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev =3D &pdev->dev;
>> -	struct device_node *panel_node, *bridge_node, *endpoint;
>> +	struct device_node *panel_node =3D NULL, *bridge_node, *endpoint =3D=
 NULL;
>>  	struct exynos_dp_device *dp;
>>  	int ret;
>> =20
>> @@ -1403,14 +1403,32 @@ static int exynos_dp_probe(struct platform_d=
evice *pdev)
>> =20
>>  	platform_set_drvdata(pdev, dp);
>> =20
>> +	/* This is for the backward compatibility. */
>>  	panel_node =3D of_parse_phandle(dev->of_node, "panel", 0);
>>  	if (panel_node) {
>>  		dp->panel =3D of_drm_find_panel(panel_node);
>>  		of_node_put(panel_node);
>>  		if (!dp->panel)
>>  			return -EPROBE_DEFER;
>> +	} else {
>> +		endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
>> +		if (endpoint) {
>> +			panel_node =3D of_graph_get_remote_port_parent(endpoint);
>=20
> Here is asssumed that the endpoint will be a panel but it could be th=
at there
> is no "panel" phandle but the port is for a bridge chip (i.e: Peach P=
it) so
> this assumption seems fragile to me.
>=20
> That's what I meant when I said "Assuming you can make a distinction =
if the
> endpoint is a panel or a bridge" in the other thread.
>=20
>> +			if (panel_node) {
>> +				dp->panel =3D of_drm_find_panel(panel_node);
>> +				of_node_put(panel_node);
>> +				if (!dp->panel)
>> +					return -EPROBE_DEFER;
>> +			} else {
>> +				DRM_ERROR("no port node for panel device.\n");
>> +				return -EINVAL;
>> +			}
>> +		}
>>  	}
>> =20
>> +	if (endpoint)
>> +		goto out;
>> +
>=20
> Ok, so IIUC what's done here is to test if the panel lookup failed, t=
hen the
> endpoint is looked up again but this time a call to of_drm_find_bridg=
e() is
> made instead of a call to of_drm_find_panel(). I wonder if there is a=
 better
> way to do this...
>=20
> In any case then I think you should test if (panel_node) instead of e=
ndpoint.
>=20
>>  	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
>>  	if (endpoint) {
>>  		bridge_node =3D of_graph_get_remote_port_parent(endpoint);
>> @@ -1423,6 +1441,7 @@ static int exynos_dp_probe(struct platform_dev=
ice *pdev)
>>  			return -EPROBE_DEFER;
>>  	}
>> =20
>> +out:
>>  	pm_runtime_enable(dev);
>> =20
>>  	ret =3D component_add(&pdev->dev, &exynos_dp_ops);
>>
>=20
> I can't think of a better way to lookup either a panel or a bridge th=
ough
> and I'm not that familiar with DRM so with the correct check, the pat=
ch
> looks good to me.
>=20
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20
> Also on an Exynos5800 Peach Pi with the DTS patch I shared, the displ=
ay
> is working correctly and also I tested without the DTS patch to make
> sure that it does not cause a regression for older DTBs.
>=20
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Thanks,
Inki Dae

>=20
> Best regards,
>=20

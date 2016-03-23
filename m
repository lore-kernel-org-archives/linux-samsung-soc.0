From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [RFT PATCH] [media] exynos4-is: Fix fimc_is_parse_sensor_config()
 nodes handling
Date: Wed, 23 Mar 2016 23:33:00 +0100
Message-ID: <56F3199C.3060502@suse.de>
References: <1458749736-30690-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45183 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751264AbcCWWdD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 18:33:03 -0400
In-Reply-To: <1458749736-30690-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org

Hi Javier,

Am 23.03.2016 um 17:15 schrieb Javier Martinez Canillas:
> The same struct device_node * is used for looking up the I2C sensor, =
OF
> graph endpoint and port. So the reference count is incremented but no=
t
> decremented for the endpoint and port nodes.
>=20
> Fix this by having separate pointers for each node looked up.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
[...]
> diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/me=
dia/platform/exynos4-is/fimc-is.c
> index 979c388ebf60..0b04a5d25187 100644
> --- a/drivers/media/platform/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/exynos4-is/fimc-is.c
> @@ -165,6 +165,7 @@ static int fimc_is_parse_sensor_config(struct fim=
c_is *is, unsigned int index,
>  						struct device_node *node)
>  {
>  	struct fimc_is_sensor *sensor =3D &is->sensor[index];
> +	struct device_node *ep, *port;
>  	u32 tmp =3D 0;
>  	int ret;
> =20
> @@ -175,16 +176,18 @@ static int fimc_is_parse_sensor_config(struct f=
imc_is *is, unsigned int index,
>  		return -EINVAL;
>  	}
> =20
> -	node =3D of_graph_get_next_endpoint(node, NULL);
> -	if (!node)
> +	ep =3D of_graph_get_next_endpoint(node, NULL);
> +	if (!ep)
>  		return -ENXIO;
> =20
> -	node =3D of_graph_get_remote_port(node);
> -	if (!node)
> +	port =3D of_graph_get_remote_port(ep);
> +	of_node_put(ep);
> +	if (!port)
>  		return -ENXIO;
> =20
>  	/* Use MIPI-CSIS channel id to determine the ISP I2C bus index. */
> -	ret =3D of_property_read_u32(node, "reg", &tmp);
> +	ret =3D of_property_read_u32(port, "reg", &tmp);
> +	of_node_put(port);
>  	if (ret < 0) {
>  		dev_err(&is->pdev->dev, "reg property not found at: %s\n",
>  							 node->full_name);

port->full_name. You'll need to defer the of_node_put(port) then.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)

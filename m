From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [RFT PATCH] [media] exynos4-is: Fix fimc_is_parse_sensor_config()
 nodes handling
Date: Wed, 23 Mar 2016 21:30:43 -0300
Message-ID: <56F33533.5000201@osg.samsung.com>
References: <1458749736-30690-1-git-send-email-javier@osg.samsung.com>
 <56F3199C.3060502@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:56791 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751877AbcCXAax (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 20:30:53 -0400
In-Reply-To: <56F3199C.3060502@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org

Hello Andreas,

Thanks for your feedback.

On 03/23/2016 07:33 PM, Andreas F=E4rber wrote:
> Hi Javier,
>=20
> Am 23.03.2016 um 17:15 schrieb Javier Martinez Canillas:
>> The same struct device_node * is used for looking up the I2C sensor,=
 OF
>> graph endpoint and port. So the reference count is incremented but n=
ot
>> decremented for the endpoint and port nodes.
>>
>> Fix this by having separate pointers for each node looked up.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> [...]
>> diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/m=
edia/platform/exynos4-is/fimc-is.c
>> index 979c388ebf60..0b04a5d25187 100644
>> --- a/drivers/media/platform/exynos4-is/fimc-is.c
>> +++ b/drivers/media/platform/exynos4-is/fimc-is.c
>> @@ -165,6 +165,7 @@ static int fimc_is_parse_sensor_config(struct fi=
mc_is *is, unsigned int index,
>>  						struct device_node *node)
>>  {
>>  	struct fimc_is_sensor *sensor =3D &is->sensor[index];
>> +	struct device_node *ep, *port;
>>  	u32 tmp =3D 0;
>>  	int ret;
>> =20
>> @@ -175,16 +176,18 @@ static int fimc_is_parse_sensor_config(struct =
fimc_is *is, unsigned int index,
>>  		return -EINVAL;
>>  	}
>> =20
>> -	node =3D of_graph_get_next_endpoint(node, NULL);
>> -	if (!node)
>> +	ep =3D of_graph_get_next_endpoint(node, NULL);
>> +	if (!ep)
>>  		return -ENXIO;
>> =20
>> -	node =3D of_graph_get_remote_port(node);
>> -	if (!node)
>> +	port =3D of_graph_get_remote_port(ep);
>> +	of_node_put(ep);
>> +	if (!port)
>>  		return -ENXIO;
>> =20
>>  	/* Use MIPI-CSIS channel id to determine the ISP I2C bus index. */
>> -	ret =3D of_property_read_u32(node, "reg", &tmp);
>> +	ret =3D of_property_read_u32(port, "reg", &tmp);
>> +	of_node_put(port);
>>  	if (ret < 0) {
>>  		dev_err(&is->pdev->dev, "reg property not found at: %s\n",
>>  							 node->full_name);
>=20
> port->full_name. You'll need to defer the of_node_put(port) then.
>

Right, sorry for missing that and thanks a lot for pointing it out.
=20
> Regards,
> Andreas
>=20

Best regards,
--=20
Javier Martinez Canillas
Open Source Group
Samsung Research America

From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
Date: Tue, 6 Aug 2019 13:41:31 +0000
Message-ID: <VI1PR04MB5055BED59960B4F4147479AEEED50@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b@eucas1p2.samsung.com>
 <20190723122016.30279-10-a.swigon@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-2?Q?Artur_=A6wigo=F1?= <a.swigon@partner.samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "krzk@kernel.org" <krzk@kernel.org>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "georgi.djakov@linaro.org" <georgi.djakov@linaro.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 23.07.2019 15:21, Artur =A6wigo=F1 wrote:=0A=
=0A=
> +static int exynos_bus_icc_aggregate(struct icc_node *node, u32 avg_bw,=
=0A=
> +				    u32 peak_bw, u32 *agg_avg, u32 *agg_peak)=0A=
> +{=0A=
> +	*agg_peak =3D *agg_avg =3D peak_bw;=0A=
> +=0A=
> +	return 0;=0A=
> +}=0A=
=0A=
The only current provider aggregates "avg" with "sum" and "peak" with =0A=
"max", any particular reason to do something different? This function =0A=
doesn't even really do aggregation, if there is a second request for "0" =
=0A=
then the first request is lost.=0A=
=0A=
I didn't find any docs but my interpretation of avg/peak is that "avg" =0A=
is for constant traffic like a display or VPU pushing pixels and "peak" =0A=
is for variable traffic like networking. I assume devices which make =0A=
"peak" requests are aggregated with max because they're not expected to =0A=
all max-out together.=0A=
=0A=
In PATCH 11 you're making a bandwidth request based on resolution, that =0A=
traffic is constant and guaranteed to happend while the display is on so =
=0A=
it would make sense to request it as an "avg" and aggregate it with "sum".=
=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=

From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
Date: Thu, 08 Aug 2019 15:19:23 +0200
Message-ID: <7f4eeef81c2688c2cb18b7aae71d457197c6d018.camel@partner.samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <CGME20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b@eucas1p2.samsung.com>
        <20190723122016.30279-10-a.swigon@partner.samsung.com>
        <VI1PR04MB5055BED59960B4F4147479AEEED50@VI1PR04MB5055.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB5055BED59960B4F4147479AEEED50@VI1PR04MB5055.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>, Georgi Djakov <georgi.djakov@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "krzk@kernel.org" <krzk@kernel.org>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Thank you for your comments.

On Tue, 2019-08-06 at 13:41 +0000, Leonard Crestez wrote:
> On 23.07.2019 15:21, Artur Świgoń wrote:
> 
> > +static int exynos_bus_icc_aggregate(struct icc_node *node, u32 avg_bw,
> > +				    u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
> > +{
> > +	*agg_peak = *agg_avg = peak_bw;
> > +
> > +	return 0;
> > +}
> 
> The only current provider aggregates "avg" with "sum" and "peak" with 
> "max", any particular reason to do something different? This function 
> doesn't even really do aggregation, if there is a second request for "0" 
> then the first request is lost.

Yes, you're right. I adopted an oversimplified solution for the purpose of this
RFC (please bear in mind that currently only one icc_path is used, so there is
no aggregation anyway).

> I didn't find any docs but my interpretation of avg/peak is that "avg" 
> is for constant traffic like a display or VPU pushing pixels and "peak" 
> is for variable traffic like networking. I assume devices which make 
> "peak" requests are aggregated with max because they're not expected to 
> all max-out together.

That's correct (according to my understanding).

> In PATCH 11 you're making a bandwidth request based on resolution, that 
> traffic is constant and guaranteed to happend while the display is on so 
> it would make sense to request it as an "avg" and aggregate it with "sum".
> 
> --
> Regards,
> Leonard
> 
-- 
Artur Świgoń
Samsung R&D Institute Poland
Samsung Electronics

From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v4 0/4] Bugfix for of_match_node ordering
Date: Thu, 20 Feb 2014 11:53:51 +0000
Message-ID: <20140220115351.0DF7BC4050F@trevor.secretlab.ca>
References: <1392819290-1044-1-git-send-email-grant.likely@linaro.org> < CAK9yfHwwmZkFMRvxsxjBAfUbVXU3V+iPFDZO=DwQsFvJ3NQyKA@mail.gmail.com> < 20140220101240.GA3745@pek-khao-d1.corp.ad.wrs.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:43798 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753569AbaBTLx4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Feb 2014 06:53:56 -0500
Received: by mail-wg0-f41.google.com with SMTP id l18so492559wgh.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Feb 2014 03:53:55 -0800 (PST)
In-Reply-To: <20140220101240.GA3745@pek-khao-d1.corp.ad.wrs.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hao <haokexin@gmail.com>, Sachin Kamat <sachin.kamat@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Thu, 20 Feb 2014 18:12:40 +0800, Kevin Hao <haokexin@gmail.com> wrote:
> On Thu, Feb 20, 2014 at 02:09:08PM +0530, Sachin Kamat wrote:
> > Hi Grant,
> > 
> > I observe the following boot failure with today's (next-20140220) linux-next
> > tree on Exynos based boards with the default exynos_defconfig.
> 
> Does this help?

I've merged this in. I could get my unicore test platform to fail to
boot by turning on lock debugging. I'll leave that option on from now
one.

I've pushed this out to the following branch. Please test and report. It
will also be picked up by linux-next tomorrow.

git://git.secretlab.ca/git/linux devicetree/merge

> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 8a27fc907ab6..9cc893530b9a 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -381,12 +381,16 @@ static int __of_device_is_compatible(const struct device_node *device,
>  
>  	/* Compatible match has highest priority */
>  	if (compat && compat[0]) {
> -		of_property_for_each_string(device, "compatible", prop, cp) {
> +		prop = __of_find_property(device, "compatible", NULL);
> +		if (!prop)
> +			return 0;

The above 2 lines are unnecessary. of_prop_next_string() will return
NULL if prop is NULL.

g.

> +
> +		for (cp = of_prop_next_string(prop, NULL); cp;
> +				cp = of_prop_next_string(prop, cp), index++) {
>  			if (of_compat_cmp(cp, compat, strlen(compat)) == 0) {
>  				score = INT_MAX/2 - (index << 2);
>  				break;
>  			}
> -			index++;
>  		}
>  		if (!score)
>  			return 0;
> 
> 
> Thanks,
> Kevin

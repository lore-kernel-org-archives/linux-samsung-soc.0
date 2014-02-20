From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v4 0/4] Bugfix for of_match_node ordering
Date: Thu, 20 Feb 2014 15:57:07 +0530
Message-ID: <CAK9yfHzM_kyXMrnLC=M0qiLHKWxE41E-MdyGtipKA7AwoLnOqg@mail.gmail.com>
References: <1392819290-1044-1-git-send-email-grant.likely@linaro.org>
	<CAK9yfHwwmZkFMRvxsxjBAfUbVXU3V+iPFDZO=DwQsFvJ3NQyKA@mail.gmail.com>
	<20140220101240.GA3745@pek-khao-d1.corp.ad.wrs.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140220101240.GA3745@pek-khao-d1.corp.ad.wrs.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hao <haokexin@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kevin,

On 20 February 2014 15:42, Kevin Hao <haokexin@gmail.com> wrote:
> On Thu, Feb 20, 2014 at 02:09:08PM +0530, Sachin Kamat wrote:
>> Hi Grant,
>>
>> I observe the following boot failure with today's (next-20140220) linux-next
>> tree on Exynos based boards with the default exynos_defconfig.
>
> Does this help?

The below patch works for me. Thanks for the fix.

>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 8a27fc907ab6..9cc893530b9a 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -381,12 +381,16 @@ static int __of_device_is_compatible(const struct device_node *device,
>
>         /* Compatible match has highest priority */
>         if (compat && compat[0]) {
> -               of_property_for_each_string(device, "compatible", prop, cp) {
> +               prop = __of_find_property(device, "compatible", NULL);
> +               if (!prop)
> +                       return 0;
> +
> +               for (cp = of_prop_next_string(prop, NULL); cp;
> +                               cp = of_prop_next_string(prop, cp), index++) {
>                         if (of_compat_cmp(cp, compat, strlen(compat)) == 0) {
>                                 score = INT_MAX/2 - (index << 2);
>                                 break;
>                         }
> -                       index++;
>                 }
>                 if (!score)
>                         return 0;
>
>
> Thanks,
> Kevin



-- 
With warm regards,
Sachin

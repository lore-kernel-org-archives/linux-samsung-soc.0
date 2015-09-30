From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 05/17] drm: bridge: analogix/dp: dynamic parse sync_pol
 & interlace & dynamic_range
Date: Wed, 30 Sep 2015 17:26:18 +0900
Message-ID: <560B9CAA.9080109@samsung.com>
References: <1442906428-2609-1-git-send-email-ykk@rock-chips.com>
 <1442907477-3283-1-git-send-email-ykk@rock-chips.com>
 <560B73D4.30109@samsung.com> <560B8CF1.7050102@rock-chips.com>
 <560B9075.1000304@samsung.com> <560B9B33.2060409@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <560B9B33.2060409-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 30.09.2015 17:20, Yakir Yang wrote:
> Hi Krzysztof,
> 
> On 09/30/2015 03:34 PM, Krzysztof Kozlowski wrote:
>> On 30.09.2015 16:19, Yakir Yang wrote:
>>> Hi Krzysztof,
>>>
>>> On 09/30/2015 01:32 PM, Krzysztof Kozlowski wrote:
>>>> On 22.09.2015 16:37, Yakir Yang wrote:
>>>>> Both hsync/vsync polarity and interlace mode can be parsed from
>>>>> drm display mode, and dynamic_range and ycbcr_coeff can be judge
>>>>> by the video code.
>>>>>
>>>>> But presumably Exynos still relies on the DT properties, so take
>>>>> good use of mode_fixup() in to achieve the compatibility hacks.
>>>>>
>>>>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>>> ---
>>>>> Changes in v5:
>>>>> - Switch video timing type to "u32", so driver could use "of_property_read_u32"
>>>>>   to get the backword timing values. 
>>>> Okay
>>>>
>>>>> Krzysztof suggest me that driver could use
>>>>>   the "of_property_read_bool" to get backword timing values, but that interfacs
>>>>>   would modify the original drm_display_mode timing directly (whether those
>>>>>   properties exists or not).
>>>> Hmm, I don't understand. You have a:
>>>> 	struct video_info {
>>>> 		bool h_sync_polarity;
>>>> 		bool v_sync_polarity;
>>>> 		bool interlaced;
>>>> 	};
>>>>
>>>> so what is wrong with:
>>>> 	dp_video_config->h_sync_polarity =
>>>> 		of_property_read_bool(dp_node, "hsync-active-high");
>>>>
>>>> Is it exactly the same binding as previously?
>>> Yes, it is the same binding as previously. But just a note that we already
>>> mark those DT binding as deprecated.
>>>
>>> +-interlaced:            deprecated prop that can parsed frm drm_display_mode.
>>> +-vsync-active-high:     deprecated prop that can parsed frm drm_display_mode.
>>> +-hsync-active-high:     deprecated prop that can parsed frm drm_display_mode.
>>>
>>>
>>> For now those values should come from "struct drm_display_mode",
>>> and we already parsed them out from "drm_display_mode" before
>>> driver provide the backward compatibility.
>>>
>>> Let's used the "hsync-active-high" example:
>>>     As for now the code would like:
>>>     static void analogix_dp_bridge_mode_set(...)
>>>     {
>>>         // Parsed timing value from "drm_display_mode"
>>>         video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
>>>
>>>         // Try to detect the deprecated property, providing
>>>         // the backward compatibility
>>>         of_property_read_u32(dp_node, "hsync-active-high",
>>>                                  &video->h_sync_polarity);    
>>>
>>>         /*
>>>          * In this case, if "hsync-active-high" property haven't been
>>>          * found, then the video timing "h_sync_polarity" would  keep
>>>          * no change, keeping the parsed value from "drm_display_mode"
>>>          */     
>>>     }   
>>>
>>>     But if keep the "of_property_read_bool", then code would like:
>>>     static void analogix_dp_bridge_mode_set(...)
>>>     {
>>>         // Parsed timing value from "drm_display_mode"
>>>         video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
>>>
>>>         // Try to detect the deprecated property, providing
>>>         // the backward compatibility
>>>         video->h_sync_polarity =
>>>                     of_property_read_bool(dp_node, "hsync-active-high");
>>>    
>>>
>>>         /*
>>>          * In this case, if "hsync-active-high" property haven't been
>>>          * found, then the video timing "h_sync_polarity" would just
>>>          * modify to "false". That is the place we don't want, cause
>>>          * it would always modify the timing value parsed from
>>>          * "drm_display_mode"
>>>          */  
>>>     }   
>>>
>> OK, I see the point of overwriting values from drm_display_mode. However
>> I think you changed the binding. I believe the of_property_read_u32()
>> will behave differently for such DTS:
>>
>> exynos_dp {
>> 	...
>> 	hsync-active-high;
>> }
>>
>> It will return -EOVERFLOW which means it would be broken now...
> 
> Whoops, thanks for your remind, after try that, I do see over flow error.
> static void *of_find_property_value_of_size(const struct device_node *np,
>                         const char *propname, u32 len)
> {
>         ....
>         if (len > prop->length)
>                 return ERR_PTR(-EOVERFLOW);
>         ...
> }
> 
> So I though code should be:
>     if (of_property_read_bool(dp_node, "hsync-active-high"))
>         video->h_sync_polarity = true;

Looks good.

> 
> And we can't provide full backward compatibility for this property, cause
> the previous exynos_dp driver would set this timing value to "false" when
> property not defined, but analogix_dp driver keep this timing value
> corresponding to "drm_display_mode" when property not found.

Indeed, the behaviour changes. I don't know if this is important issue...

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v7 05/17] drm: bridge: analogix/dp: dynamic parse sync_pol
 & interlace & dynamic_range
Date: Mon, 12 Oct 2015 15:20:27 +0800
Message-ID: <561B5F3B.4020005@rock-chips.com>
References: <1444491357-26095-1-git-send-email-ykk@rock-chips.com> <1444624149-16180-1-git-send-email-ykk@rock-chips.com> <561B590B.6090806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561B590B.6090806-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org



On 10/12/2015 02:54 PM, Krzysztof Kozlowski wrote:
> On 12.10.2015 13:29, Yakir Yang wrote:
>> Both hsync/vsync polarity and interlace mode can be parsed from
>> drm display mode, and dynamic_range and ycbcr_coeff can be judge
>> by the video code.
>>
>> But presumably Exynos still relies on the DT properties, so take
>> good use of mode_fixup() in to achieve the compatibility hacks.
>>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>> *just add a note that this is v7 of only fifth patch.*
>>
>> Changes in v7:
>> - Back to use the of_property_read_bool() interfacs to provoid backward
>>    compatibility of "hsync-active-high" "vsync-active-high" "interlaced"
>>    to avoid -EOVERFLOW error (Krzysztof)
>>
>> Changes in v6: None
>> Changes in v5:
>> - Switch video timing type to "u32", so driver could use "of_property_read_u32"
>>    to get the backword timing values. Krzysztof suggest me that driver could use
>>    the "of_property_read_bool" to get backword timing values, but that interfacs
>>    would modify the original drm_display_mode timing directly (whether those
>>    properties exists or not).
>>
>> Changes in v4:
>> - Provide backword compatibility with samsung. (Krzysztof)
>>
>> Changes in v3:
>> - Dynamic parse video timing info from struct drm_display_mode and
>>    struct drm_display_info. (Thierry)
>>
>> Changes in v2: None
>>
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 148 +++++++++++++--------
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   2 +-
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  14 +-
>>   3 files changed, 103 insertions(+), 61 deletions(-)
>>
> Looks good and backward compatible to me:
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Thanks,

- Yakir

> Best regards,
> Krzysztof
>
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

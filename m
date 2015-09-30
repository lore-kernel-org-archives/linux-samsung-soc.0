From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 02/17] drm: bridge: analogix/dp: split exynos dp driver
 to bridge directory
Date: Wed, 30 Sep 2015 14:48:04 +0800
Message-ID: <560B85A4.2040907@rock-chips.com>
References: <1442906428-2609-1-git-send-email-ykk@rock-chips.com> <1442906963-2883-1-git-send-email-ykk@rock-chips.com> <560B7068.2000008@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <560B7068.2000008-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 09/30/2015 01:17 PM, Krzysztof Kozlowski wrote:
> On 22.09.2015 16:29, Yakir Yang wrote:
>> Split the dp core driver from exynos directory to bridge directory,
>> and rename the core driver to analogix_dp_*, rename the platform
>> code to exynos_dp.
>>
>> Beside the new analogix_dp driver would export four hooks.
>> "analogix_dp_bind()" and "analogix_dp_unbind()"
>> "analogix_dp_detect()" and "analogix_dp_get_modes()"
>>
>> The bind/unbind symbols is used for analogix platform driver to connect
>> with analogix_dp core driver. And the detect/get_modes is used for analogix
>> platform driver to init the connector.
>>
>> They reason why connector need register in helper driver is rockchip drm
>> haven't implement the atomic API, but Exynos drm have implement it, so
>> there would need two different connector helper functions, that's why we
>> leave the connector register in helper driver.
>>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>> Changes in v5:
>> - Correct the check condition of gpio_is_valid when driver try to get
>>    the "hpd-gpios" DT propery. (Heiko)
>> - Move the platform attach callback in the front of core driver bridge
>>    attch function. Cause once platform failed at attach, core driver should
>>    still failed, so no need to init connector before platform attached (Krzysztof)
>> - Keep code style no changes with the previous exynos_dp_code.c in this
>>    patch, and update commit message about the new export symbol (Krzysztof)
>> - Gather the device type patch (v4 11/16) into this one. (Krzysztof)
>> - leave out the connector registration to analogix platform driver. (Thierry)
> Thanks for fixing this, looks much better.
>
> I don't feel comfortable enough to provide a review tag but it looks
> good to me.

Thanks  ;)

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

From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: add Samsung's exynos4412-based midas
 boards
Date: Thu, 14 Dec 2017 10:04:45 +0100
Message-ID: <d20f09ee-e41c-7f90-86ed-d201e2a48407@samsung.com>
References: <20171212140815.28257-1-simon@lineageos.org>
        <20171212140815.28257-3-simon@lineageos.org>
        <CGME20171214084826epcas4p16bd7d4fb803b4120444003da38ed843a@epcas4p1.samsung.com>
        <CAJKOXPfkQvo09r6WpZG-E+EgUk+p32dVycxWi6L07kHzv1EsWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAJKOXPfkQvo09r6WpZG-E+EgUk+p32dVycxWi6L07kHzv1EsWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,


On 2017-12-14 09:48, Krzysztof Kozlowski wrote:
> Hi Simon,
>
> Thanks for new boards!
>
> +Cc Marek, Bartlomiej,
>
> On Tue, Dec 12, 2017 at 3:08 PM, Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org> wrote:
>> "midas" is the codename for a family of smartphones released by Samsung
>> Mobile. It includes the Galaxy S3 (GT-I9300/I9305) and the Galaxy
>> Note 2 (GT-N7100/N7105). The boards largely have the same peripherals:
>> the main differences are touchscreen, display panel and cellular modem.
>>
>> Signed-off-by: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi |  144 +++
>>   arch/arm/boot/dts/exynos4412-m0.dts         |   14 +
>>   arch/arm/boot/dts/exynos4412-m3.dts         |   19 +
>>   arch/arm/boot/dts/exynos4412-midas.dtsi     | 1291 +++++++++++++++++++++++++++
> M0 is essentially Trats2. You are duplicating here almost entire
> Trats2 which means:
> 1. A lot of duplicated code thus it will require more maintenance to
> keep DTS synced,
> 2. It is very difficult to spot the changes and possible errors
> between Trats2 and Midas DTSI/M0.
>
> Please make a generic family of devices based on Midas, including
> Trats2. You might make it in steps for easier review:
> 1. Split common Trats2 part,
> 2. Add new boards.

Krzysztof is right. Trats2 should also be based on midas.dtsi (it is very
similar to gt-i9300, the difference in mainly in the casing). We also used
gt-i9300 with modified bootloader with Trats2 dts.

It should not be hard to adapt it for common midas.dtsi base (hind: use
scripts/dtc/dtx_diff for checking if the final dts is correct).

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

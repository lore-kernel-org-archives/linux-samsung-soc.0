From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH v2 4/6] arm64: dts: exynos: add OF graph between MHL
 and USB connector
Date: Thu, 15 Feb 2018 16:22:28 +0100
Message-ID: <a8472ef5-16ea-7a18-3ec4-85ab7bf610a6@samsung.com>
References: <CGME20180215103927eucas1p24785b56277ed6c9fa2fd70058096b944@eucas1p2.samsung.com>
        <20180215103920.32017-1-a.hajda@samsung.com>
        <20180215103920.32017-5-a.hajda@samsung.com>
        <CAJKOXPdg81LPOFmxtJmL7hMXGgB2USAOhCz2yjU9obX1jWjEWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPdg81LPOFmxtJmL7hMXGgB2USAOhCz2yjU9obX1jWjEWw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 15.02.2018 13:14, Krzysztof Kozlowski wrote:
> On Thu, Feb 15, 2018 at 11:39 AM, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> OF graph describes MHL data lanes between MHL and respective USB
>> connector.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 31 +++++++++++++++++++---
>>  1 file changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> index 7e49fadee412..ef758f7337e9 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> @@ -779,9 +779,22 @@
>>                 clocks = <&pmu_system_controller 0>;
>>                 clock-names = "xtal";
>>
>> -               port {
>> -                       mhl_to_hdmi: endpoint {
>> -                               remote-endpoint = <&hdmi_to_mhl>;
>> +               ports {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       port@0 {
>> +                               reg = <0>;
>> +                               mhl_to_hdmi: endpoint {
>> +                                       remote-endpoint = <&hdmi_to_mhl>;
>> +                               };
>> +                       };
>> +
>> +                       port@1 {
>> +                               reg = <1>;
>> +                               mhl_to_musb_con: endpoint {
>> +                                       remote-endpoint = <&musb_con_to_mhl>;
>> +                               };
>>                         };
>>                 };
>>         };
>> @@ -804,6 +817,18 @@
>>                                              "usb-b-connector";
>>                                 label = "micro-USB";
>>                                 type = "micro";
>> +
>> +                               ports {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +
>> +                                       port@3 {
> I think you might need here "reg = <3>". Doesn't it produce a warning now?

You are right, I will fix it. Warning is produced only if compiled with W=1.

Regards
Andrzej

>
> BR,
> Krzysztof
>
>> +                                               musb_con_to_mhl: endpoint {
>> +                                                       remote-endpoint = <&mhl_to_musb_con>;
>> +                                               };
>> +                                       };
>> +                               };
>> +                       };
>>                         };
>>                 };
>>
>> --
>> 2.16.1
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Sachin Kamat <spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add TMU dt node to monitor the temperature for Exynos3250
Date: Wed, 2 Jul 2014 08:39:13 +0530
Message-ID: <CAK5sBcHrMPweMSxfde0SSDOtRHbf7t7WQZkf0wAZNTc+N2=Wgg@mail.gmail.com>
References: <1404175210-9278-1-git-send-email-cw00.choi@samsung.com>
	<CAK5sBcFJMK-y+MZPXCufKEmp=v1nFJHstvNTczsQ3ez3SUPbKw@mail.gmail.com>
	<53B23362.7080103@samsung.com>
	<CAK5sBcER-rFmqe74b8uS=ZxKnTNGtkE0x6f7zaLphmyuHJz7Yg@mail.gmail.com>
	<53B349AF.4080606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53B349AF.4080606-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 2, 2014 at 5:22 AM, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On 07/01/2014 01:10 PM, Sachin Kamat wrote:
>> Hi Chanwoo,
>>
>> On Tue, Jul 1, 2014 at 9:34 AM, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>> Hi Sachin,
>>>
>>> On 07/01/2014 12:33 PM, Sachin Kamat wrote:
>>>> Hi Chanwoo,
>>>>
>>>> On Tue, Jul 1, 2014 at 6:10 AM, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>>> This patch add TMU (Thermal Management Unit) dt node to monitor the high
>>>>> temperature for Exynos3250.
>>>>>
>>>>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>>> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>>> ---
>>>>> This patch has a dependency on following patch [1]:
>>>>>  [1] https://lkml.org/lkml/2014/6/30/805
>>>>>
>>>>>  arch/arm/boot/dts/exynos3250.dtsi | 10 ++++++++++
>>>>>  1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
>>>>> index 3660cab..1e566af 100644
>>>>> --- a/arch/arm/boot/dts/exynos3250.dtsi
>>>>> +++ b/arch/arm/boot/dts/exynos3250.dtsi
>>>>> @@ -192,6 +192,16 @@
>>>>>                         status = "disabled";
>>>>>                 };
>>>>>
>>>>> +               tmu: tmu@100C0000 {
>>>>> +                       compatible = "samsung,exynos3250-tmu";
>>>>> +                       interrupt-parent = <&gic>;
>>>>> +                       reg = <0x100C0000 0x100>;
>>>>> +                       interrupts = <0 216 0>;
>>>>> +                       clocks = <&cmu CLK_TMU_APBIF>;
>>>>> +                       clock-names = "tmu_apbif";
>>>>> +                       status = "disabled";
>>>>
>>>> I don't think there would be any board specific properties needed. Hence
>>>> leave the status as enabled (by deleting the above line).
>>>>
>>>
>>> I think that if specific board need TMU feature, dts file for specific board
>>> should include tmu dt node with 'okay' status. The specific board based on
>>> Exynos3250 might not need TMU feature.
>>
>> The status field in DT node is not meant for stating the build configuration but
>> represents the readiness of the hardware for usage on the platform. If
>> a particular
>> board does not need this feature it needs to be disabled in the build
>> config and only
>> for any special requirements disable it in board file.
>
> TMU (Thermal Management Unit) needs specific regulator for TMU power as following:
> The regulator for TMU is dependent on board.

In this case it makes sense to leave it disabled in dtsi.

-- 
Regards,
Sachin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

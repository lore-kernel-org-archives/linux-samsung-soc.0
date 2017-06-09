From: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Add support for the S6E3HF2 panel on TM2e board
Date: Fri, 09 Jun 2017 12:52:36 +0900
Message-ID: <50d5707c-378c-e338-3358-08ff1657cf8f@samsung.com>
References: <CGME20170418084047epcas5p493261a4cb9204e682f60cde8d659565c@epcas5p4.samsung.com>
        <1492504836-19225-1-git-send-email-hoegeun.kwon@samsung.com>
        <4b974579-eb2f-1258-86e3-21ffeb22589a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <4b974579-eb2f-1258-86e3-21ffeb22589a-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Dear Thierry,

Could you check these patches.

Regards,
Hoegeun

On 05/19/2017 03:56 PM, Hoegeun Kwon wrote:
> Dear Thierry,
>
> Could you check these patches?
> I think this patches have accumulated enough dust.
> If you have a another opinion, please tell me.
>
> Best regards,
> Hoegeun
>
> On 04/18/2017 05:40 PM, Hoegeun Kwon wrote:
>> Hi all,
>>
>> The purpose of this patch is add support for s6e3hf2 AMOLED panel on
>> the TM2e board. The panel has 1600x2560 resolution in 5.65" physical
>> panel in the TM2e device.
>>
>> The s6e3hf2 panel(5.65") is simliar to the previous s6e3ha2 panel(5.7"),
>> but resolution and some command message are different. So it can be
>> distinguished as a compatiblitiy string.
>>
>> Best regards,
>> Hoegeun
>>
>> Changes for V3:
>> - Remove te-gpios property in dts.
>> - Added Reviewed-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> on all patches.
>> - Added Reviewed-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> on patch (2/3).
>>
>> Changes for V2:
>> - Add new compatible string to "samsung,s6e3ha2.txt binding with 
>> comments.
>> - Fix the panel name from s6e3ha2-e to s6e3hf2
>>
>> Hoegeun Kwon (3):
>>    dt-bindings: Add support for samsung s6e3hf2 panel
>>    drm/panel: s6e3ha2: Add support for s6e3hf2 panel on TM2e board
>>    arm64: dts: exynos: Add support for s6e3hf2 panel device on TM2e 
>> board
>>
>>   .../bindings/display/panel/samsung,s6e3ha2.txt     |  5 +-
>>   arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 11 ++++
>>   drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 64 
>> +++++++++++++++++++---
>>   3 files changed, 72 insertions(+), 8 deletions(-)
>>
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

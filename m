From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v7 3/4] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Mon, 09 Jan 2017 08:37:25 +0100
Message-ID: <5df95abe-0d5d-0c48-2840-5996260201de@samsung.com>
References: <1483611609-23522-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170105102012epcas1p4ddeb577ea84b5c2cdf7029666b2091c1@epcas1p4.samsung.com>
 <1483611609-23522-4-git-send-email-hoegeun.kwon@samsung.com>
 <20170106052239.5prkyj3v4x4qcc46@gangnam.samsung>
 <586F2BF3.8080400@samsung.com>
 <20170106081806.h4y7o57kjbibau6l@gangnam.samsung>
 <586F5728.1010800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <586F5728.1010800-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 06.01.2017 09:36, Inki Dae wrote:
>
> 2017년 01월 06일 17:18에 Andi Shyti 이(가) 쓴 글:
>> Hi Inki,
>>
>> Thanks for the reply, but...
>>
>>>>> +static const struct drm_display_mode default_mode = {
>>>>> +	.clock = 222372,
>>>>> +	.hdisplay = 1440,
>>>>> +	.hsync_start = 1440 + 1,
>>>>> +	.hsync_end = 1440 + 1 + 1,
>>>>> +	.htotal = 1440 + 1 + 1 + 1,
>>>>> +	.vdisplay = 2560,
>>>>> +	.vsync_start = 2560 + 1,
>>>>> +	.vsync_end = 2560 + 1 + 1,
>>>>> +	.vtotal = 2560 + 1 + 1 + 15,
>>>>> +	.vrefresh = 60,
>>>>> +	.flags = 0,
>>>>> +};
>>>> how is this working with tm2e? Are these values valid for both
>>>> the boards?
>>> We don't need to consider tm2e board with two reasones,
>>> 1. there is no tm2e board support in mainline
>>> 2. the panel on tm2 would be a little bit different from one on tm2e
>> ... this display in the Tizen Kernel is supported by both:
>> tm2 [1] and tm2e [2]. The only differences are:
> Why tm2e dts file is in mainline? Seems communication miss with Chanwoo. :( 
>
>> TM2:
>>    clock-frequency = <14874444>;
>>    hactive = <1440>;
>>
>> TM2E:
>>    clock-frequency = <16523724>;
>>    hactive = <1600>;
>>
>> I don't know much about the differences you mention in point 2,
>> but it's a pity to drop support only because we don't want to put
>> in the dts the 'hactive', and 'clock-frequency' properties.
> Anyway, tm2e board is already in mainline so Panel driver may need to identify what kinds of panel is probed to decide porch values. I think there are relevant registers in MCU of the Panel device to check version or similar thing.

I think we can safely use different compatible string for tm2e - it uses
different display IC controller - s6e3hf2, driver will provide timings
based on it.
As far as I examined available specs/docs there is no reliable register
which can be used to safely distinguish it on runtime, but the docs I
have are far from completeness.

Regards
Andrzej

>
> Thanks.
>
>> Andi
>>
>> [1] https://git.tizen.org/cgit/platform/kernel/linux-exynos/tree/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts?h=tizen#n1284
>> [2] https://git.tizen.org/cgit/platform/kernel/linux-exynos/tree/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts?h=tizen#n1270
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>> .
>>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Javier Martinez Canillas <javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: Enable Mixer node for Exynos5800
 Peach Pi machine
Date: Tue, 12 Dec 2017 11:51:51 +0100
Message-ID: <a5c0aaca-d67d-7a8f-422d-f508e840ea0d@redhat.com>
References: <20171212074208.30753-1-javierm@redhat.com>
 <CAJKOXPc1rJCWABXUuyU2MKxnLY-MptrM9Mm0HyHVCJn870R+sg@mail.gmail.com>
 <CGME20171212100905epcas5p35a40946af3936f2020b4cabb6ee2cc95@epcas5p3.samsung.com>
 <CAJKOXPc1_n2cdgjuFbA9jNdcSXxfr8Zjf=fUx_jt_N3+LP0n8A@mail.gmail.com>
 <a42670aa-b3df-7a53-8ed2-f3acd97fd0d4@samsung.com>
 <ad03e2a8-00eb-464e-6983-374f83b9abf5@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ad03e2a8-00eb-464e-6983-374f83b9abf5-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

[adding Inki to cc list]

Hello Guillaume,

On 12/12/2017 11:43 AM, Guillaume Tucker wrote:
> On 12/12/17 10:17, Marek Szyprowski wrote:
>> Hi Krzysztof,
>>
>> On 2017-12-12 11:09, Krzysztof Kozlowski wrote:
>>> On Tue, Dec 12, 2017 at 10:55 AM, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>> On Tue, Dec 12, 2017 at 8:42 AM, Javier Martinez Canillas
>>>> <javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>>>> Commit 1cb686c08d12 ("ARM: dts: exynos: Add status property to Exynos 542x
>>>>> Mixer nodes") disabled the Mixer node by default in the DTSI and enabled
>>>>> for each Exynos 542x DTS. But unfortunately it missed to enable it for the
>>>>> Exynos5800 Peach Pi machine, since the 5800 is also an 542x SoC variant.
>>>>>
>>>>> Fixes: 1cb686c08d12 ("ARM: dts: exynos: Add status property to Exynos 542x Mixer nodes")
>>>>> Signed-off-by: Javier Martinez Canillas <javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>>> Acked-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>>>
>>>>> ---
>>>>>
>>>>> Changes in v2:
>>>>> - Remove RFT tag.
>>>> Thanks guys! However I still would like to see a tested-by for this on
>>>> Peach Pi (AFAIU, Marek's only acked the code/solution).
>>> On the other hand I could just apply it for my for-next branch and
>>> we'll see if it fixes kernel-ci boot tests... Not a nice way of
>>> testing but apparently no one has Peach Pi.
>>
>> Frankly, I don't expect that this will solve the boot hang issue on PeachPi.
>> However it should at least hide the unbalanced regulator issue.
> 
> We have a peach-pi in our LAVA lab so I've tested it and
> actually, it does fix the hang on v4.15-rc3:
> 
>    https://lava.collabora.co.uk/scheduler/job/1019877
>    https://lava.collabora.co.uk/scheduler/job/1019878
> 
> I ran it twice and it booted both times.  I also ran the same
> boot tests with the same kernel but the dtb from v4.15-rc3
> without the fix to double check and these failed:
> 
>    https://lava.collabora.co.uk/scheduler/job/1019879
>    https://lava.collabora.co.uk/scheduler/job/1019880
> 
> 
> Tested-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>
> 
> Thanks for the fix!
>

Thanks for testing!

Now, I think the exynos-drm driver should cope with an incorrect DTB and
don't crash the machine, the driver should only fail to probe and lead
to a working machine with no display.

But as mentioned, that's a different issue and orthogonal to the DTS fix.

> Guillaume
> 

Best regards,
-- 
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

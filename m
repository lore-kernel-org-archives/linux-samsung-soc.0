From: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2] ARM: dts: exynos: Enable Mixer node for Exynos5800
 Peach Pi machine
Date: Tue, 12 Dec 2017 11:40:57 +0100
Message-ID: <fe7b9dd6-c169-32bf-50c5-dc708872f977@redhat.com>
References: <20171212074208.30753-1-javierm@redhat.com>
 <CAJKOXPc1rJCWABXUuyU2MKxnLY-MptrM9Mm0HyHVCJn870R+sg@mail.gmail.com>
 <CAJKOXPc1_n2cdgjuFbA9jNdcSXxfr8Zjf=fUx_jt_N3+LP0n8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35716 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751507AbdLLKlA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 05:41:00 -0500
Received: by mail-wm0-f66.google.com with SMTP id f9so19462353wmh.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Dec 2017 02:41:00 -0800 (PST)
In-Reply-To: <CAJKOXPc1_n2cdgjuFbA9jNdcSXxfr8Zjf=fUx_jt_N3+LP0n8A@mail.gmail.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Shuah Khan <shuahkh@osg.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org

Hello Krzysztof,

On 12/12/2017 11:09 AM, Krzysztof Kozlowski wrote:
> On Tue, Dec 12, 2017 at 10:55 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Tue, Dec 12, 2017 at 8:42 AM, Javier Martinez Canillas
>> <javierm@redhat.com> wrote:
>>> Commit 1cb686c08d12 ("ARM: dts: exynos: Add status property to Exynos 542x
>>> Mixer nodes") disabled the Mixer node by default in the DTSI and enabled
>>> for each Exynos 542x DTS. But unfortunately it missed to enable it for the
>>> Exynos5800 Peach Pi machine, since the 5800 is also an 542x SoC variant.
>>>
>>> Fixes: 1cb686c08d12 ("ARM: dts: exynos: Add status property to Exynos 542x Mixer nodes")
>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>
>>> ---
>>>
>>> Changes in v2:
>>> - Remove RFT tag.

I removed the tag because Marek acked it and the patch has merits on its own
regardless of the boot issue (it just introduces a change that was missed in
the mentioned commit).
>>
>> Thanks guys! However I still would like to see a tested-by for this on
>> Peach Pi (AFAIU, Marek's only acked the code/solution).
> 
> On the other hand I could just apply it for my for-next branch and
> we'll see if it fixes kernel-ci boot tests... Not a nice way of

As Marek said this probably won't solve the issue, or at best it would just
mask it. Seems the problem is on the probe deferral path in exynos-drm driver.

> testing but apparently no one has Peach Pi.
>

I do have one, but I haven't used it for months and don't have time to setup
a test environment now. I will probably do that this weekend to dig deeper.

> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

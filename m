From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: [PATCH v2] ARM: dts: exynos: Enable Mixer node for Exynos5800
 Peach Pi machine
Date: Tue, 12 Dec 2017 10:43:40 +0000
Message-ID: <ad03e2a8-00eb-464e-6983-374f83b9abf5@collabora.com>
References: <20171212074208.30753-1-javierm@redhat.com>
 <CAJKOXPc1rJCWABXUuyU2MKxnLY-MptrM9Mm0HyHVCJn870R+sg@mail.gmail.com>
 <CGME20171212100905epcas5p35a40946af3936f2020b4cabb6ee2cc95@epcas5p3.samsung.com>
 <CAJKOXPc1_n2cdgjuFbA9jNdcSXxfr8Zjf=fUx_jt_N3+LP0n8A@mail.gmail.com>
 <a42670aa-b3df-7a53-8ed2-f3acd97fd0d4@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60606 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751400AbdLLKnp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 05:43:45 -0500
In-Reply-To: <a42670aa-b3df-7a53-8ed2-f3acd97fd0d4@samsung.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Shuah Khan <shuahkh@osg.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org

On 12/12/17 10:17, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 2017-12-12 11:09, Krzysztof Kozlowski wrote:
>> On Tue, Dec 12, 2017 at 10:55 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>> On Tue, Dec 12, 2017 at 8:42 AM, Javier Martinez Canillas
>>> <javierm@redhat.com> wrote:
>>>> Commit 1cb686c08d12 ("ARM: dts: exynos: Add status property to Exynos 542x
>>>> Mixer nodes") disabled the Mixer node by default in the DTSI and enabled
>>>> for each Exynos 542x DTS. But unfortunately it missed to enable it for the
>>>> Exynos5800 Peach Pi machine, since the 5800 is also an 542x SoC variant.
>>>>
>>>> Fixes: 1cb686c08d12 ("ARM: dts: exynos: Add status property to Exynos 542x Mixer nodes")
>>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>>> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - Remove RFT tag.
>>> Thanks guys! However I still would like to see a tested-by for this on
>>> Peach Pi (AFAIU, Marek's only acked the code/solution).
>> On the other hand I could just apply it for my for-next branch and
>> we'll see if it fixes kernel-ci boot tests... Not a nice way of
>> testing but apparently no one has Peach Pi.
> 
> Frankly, I don't expect that this will solve the boot hang issue on PeachPi.
> However it should at least hide the unbalanced regulator issue.

We have a peach-pi in our LAVA lab so I've tested it and
actually, it does fix the hang on v4.15-rc3:

   https://lava.collabora.co.uk/scheduler/job/1019877
   https://lava.collabora.co.uk/scheduler/job/1019878

I ran it twice and it booted both times.  I also ran the same
boot tests with the same kernel but the dtb from v4.15-rc3
without the fix to double check and these failed:

   https://lava.collabora.co.uk/scheduler/job/1019879
   https://lava.collabora.co.uk/scheduler/job/1019880


Tested-by: Guillaume Tucker <guillaume.tucker@collabora.com>


Thanks for the fix!

Guillaume

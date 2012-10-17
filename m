From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v3 0/6] arm: exynos: add dt based support for exynos5 hdmi
Date: Wed, 17 Oct 2012 09:36:47 +0530
Message-ID: <CAPdUM4MuLXi2mj91QWnOLHJj=D=s8nmQ+_rxqqhrt+YAUuVZ1Q@mail.gmail.com>
References: <1350343834-23992-1-git-send-email-rahul.sharma@samsung.com>
	<5746364.jIDeNjU3ph@amdc1227>
	<CAPdUM4OtZ3Gh3UKeop8V4n5MVPh=DazJb8-HT+3CUfb79k4r6A@mail.gmail.com>
	<CAH9JG2Wb-xnEJDQuR6jbqrb-VZc6jq4QguU=qRJUiacmaDFZaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f46.google.com ([209.85.213.46]:60026 "EHLO
	mail-yh0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814Ab2JQEGr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Oct 2012 00:06:47 -0400
Received: by mail-yh0-f46.google.com with SMTP id m54so2009234yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Oct 2012 21:06:47 -0700 (PDT)
In-Reply-To: <CAH9JG2Wb-xnEJDQuR6jbqrb-VZc6jq4QguU=qRJUiacmaDFZaw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Tomasz Figa <t.figa@samsung.com>, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com

Mr. Park,

Looks good to me.
Shall I divide the patch-set into two groups and re-post them?

regards,
Rahul Sharma.

On Wed, Oct 17, 2012 at 9:09 AM, Kyungmin Park
<kyungmin.park@samsung.com> wrote:
> Hi,
>
> It's common case, one topic but two different tree.
> So I suggest merge it at samsung sub-soc tree and drm parts will be
> merged after arm-soc tree is merged. since arm-soc tree collect arm
> soc-soc and merged early at merge window. then drm tree will be merged
> later.
> Until that time, drm patches are hold only at local git.
>
> How do you think?
>
> Thank you,
> Kyungmin Park
>
> On 10/16/12, Rahul Sharma <r.sh.open@gmail.com> wrote:
>> Hi Mr. Park, Mr. Kim,
>>
>> I had a suggestion here from Tomasz about dividing this patch-set into
>> 2 portions:
>>
>> 1) DT related (patches 1-4) for samsung-dt branch.
>> 2) Clocks, Arch data related to Exynos5. (patches 5,6) for
>> exynos-drm-fixes branch.
>>
>> Rationale behind this is kgene tree with all 6 patches applied will
>> have broken drm
>> exynos4 and incomplete drm exynos5.
>>
>> I want to know your opinion on this.
>>
>> regards,
>> Rahul Sharma
>>
>> On Tue, Oct 16, 2012 at 3:01 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>>> Hi Rahul,
>>>
>>>
>>>
>>> On Tuesday 16 of October 2012 05:00:28 Rahul Sharma wrote:
>>>
>>>> This patch set adds the DT based support for Samsung's Exynos5250. It
>>>
>>>> adds device tree nodes for hdmi, mixer, hdmiphy and hdmiddc. The name
>>>
>>>> of these devices are changed to the one matching with drivers.
>>>
>>>> Exynos-drm and exynos hdmi-drm-commmon devices are removed from machine
>>>
>>>> init code.
>>>
>>>>
>>>
>>>> Exynos-drm and exynos hdmi-drm-commmon devices are removed from machine
>>>
>>>> init code. Patch set which adds this code is posted to dri-devel list at
>>>
>>>> http://comments.gmane.org/gmane.comp.video.dri.devel/75121.
>>>
>>>>
>>>
>>>> This patchset is based on linux v3.6-rc6, branch v3.7-next/dt-samsung at
>>>
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>>>
>>>>
>>>
>>>> v1:
>>>
>>>> - dropped patch for hpd gpio initialisation from machine init.
>>>
>>>> - dropped patch for platform device registration.
>>>
>>>> - removed platform device registration from non-dt platforms.
>>>
>>>>
>>>
>>>> v2:
>>>
>>>> - removed version information from hdmi, mixer dt nodes.
>>>
>>>> - added DT binding documentation for hdmi, mixer, hdmiphy and hdmiddc.
>>>
>>>>
>>>
>>>> v3:
>>>
>>>> - corrected indentations.
>>>
>>>> - changed dt node names to name@address format.
>>>
>>>>
>>>
>>>> Rahul Sharma (6):
>>>
>>>> dts: exynos: add device tree support for exynos5 hdmi
>>>
>>>> dts: exynos: add device tree support for exynos5 mixer
>>>
>>>> dts: exynos: add device tree support for exynos5 hdmiphy
>>>
>>>> dts: exynos: add device tree support for exynos5 hdmiddc
>>>
>>>> arm: exynos: add clocks for exynos5 hdmi
>>>
>>>> arm: exynos: removing exynos-drm device registration from non-dt
>>>
>>>> platforms
>>>
>>>>
>>>
>>>> .../devicetree/bindings/drm/exynos/hdmi.txt | 22
>>>
>>>> +++++++++++++++ .../devicetree/bindings/drm/exynos/hdmiddc.txt |
>>>
>>>> 12 ++++++++ .../devicetree/bindings/drm/exynos/hdmiphy.txt | 12
>>>
>>>> ++++++++ .../devicetree/bindings/drm/exynos/mixer.txt | 15
>>>
>>>> ++++++++++ arch/arm/boot/dts/exynos5250-smdk5250.dts | 24
>>>
>>>> +++++++++++++++- arch/arm/boot/dts/exynos5250.dtsi |
>>>
>>>> 20 +++++++++++++ arch/arm/mach-exynos/Makefile |
>>>
>>>> 1 -
>>>
>>>> arch/arm/mach-exynos/clock-exynos5.c | 14 ++++++++-
>>>
>>>> arch/arm/mach-exynos/dev-drm.c | 29
>>>
>>>> -------------------- arch/arm/mach-exynos/include/mach/map.h
>>>
>>>> | 2 +
>>>
>>>> arch/arm/mach-exynos/mach-exynos5-dt.c | 8 +++++
>>>
>>>> arch/arm/mach-exynos/mach-nuri.c | 3 --
>>>
>>>> arch/arm/mach-exynos/mach-origen.c | 3 --
>>>
>>>> arch/arm/mach-exynos/mach-smdk4x12.c | 3 --
>>>
>>>> arch/arm/mach-exynos/mach-smdkv310.c | 3 --
>>>
>>>> arch/arm/mach-exynos/mach-universal_c210.c | 3 --
>>>
>>>> arch/arm/plat-samsung/include/plat/devs.h | 2 -
>>>
>>>> 17 files changed, 126 insertions(+), 50 deletions(-)
>>>
>>>> create mode 100644
>>>
>>>> Documentation/devicetree/bindings/drm/exynos/hdmi.txt create mode
>>>
>>>> 100644 Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt create
>>>
>>>> mode 100644 Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
>>>
>>>> create mode 100644
>>>
>>>> Documentation/devicetree/bindings/drm/exynos/mixer.txt delete mode
>>>
>>>> 100644 arch/arm/mach-exynos/dev-drm.c
>>>
>>>
>>>
>>> The patches look fine, but Kukjin's tree doesn't contain all the
>>>
>>> dependencies for them to be usable.
>>>
>>>
>>>
>>> Shouldn't they be based on exynos-drm-next branch of Kyungmin's tree at
>>>
>>> infradead instead:
>>>
>>>
>>>
>>> http://git.infradead.org/users/kmpark/linux-samsung/shortlog/refs/heads/exynos-drm-next
>>>
>>>
>>>
>>> Best regards,
>>>
>>> --
>>>
>>> Tomasz Figa
>>>
>>> Samsung Poland R&D Center
>>>
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>

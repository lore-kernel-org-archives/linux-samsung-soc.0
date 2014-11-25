From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration to
 module init
Date: Tue, 25 Nov 2014 11:05:49 +0530
Message-ID: <CAEC9eQNF_fvy0Z7PCzF7KgDx-augq-URrGQiw5-VKMcHxDDbOg@mail.gmail.com>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
	<7hh9xwxsev.fsf@deeprootsystems.com>
	<546CCAB8.9050402@collabora.co.uk>
	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
	<7hppchsu29.fsf@deeprootsystems.com>
	<546E293D.9000300@collabora.co.uk>
	<7hbno1spdt.fsf@deeprootsystems.com>
	<20141120234953.GA4010@luxor.wired.org>
	<546F22F0.5060204@suse.de>
	<CAEC9eQPaZ7FJj00DtZHuNSY7HkqvGAZzN1oX=pf7dwsuEw7qUA@mail.gmail.com>
	<546FA71C.8050804@collabora.co.uk>
	<547302E0.4000609@collabora.co.uk>
	<54734946.7090509@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:54585 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751810AbaKYFfu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Nov 2014 00:35:50 -0500
Received: by mail-ie0-f177.google.com with SMTP id rd18so10308542iec.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2014 21:35:50 -0800 (PST)
In-Reply-To: <54734946.7090509@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Paolo Pisati <p.pisati@gmail.com>, Kevin Hilman <khilman@kernel.org>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>

Hi Andreas,

On Mon, Nov 24, 2014 at 8:35 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Hi,
>
> Am 24.11.2014 um 11:05 schrieb Javier Martinez Canillas:
>> On 11/21/2014 09:57 PM, Javier Martinez Canillas wrote:
>>> On 11/21/2014 06:32 PM, Ajay kumar wrote:
>>>> I have rebased my bridge series on top of linux-next.
>>>>
>>>> This is my git log:
>>>> 4b38a6f Revert "Revert "ARM: exynos_defconfig: Enable options for
>>>> display panel support""
>>>> 6fb39a7 ARM: dts: peach-pit: represent the connection between brid=
ge
>>>> and panel using videoport and endpoints
>>>> aee649c ARM: dts: snow: represent the connection between bridge an=
d
>>>> panel using videoport and endpoints
>>>> 5b76d8d drm/bridge: Add i2c based driver for ps8622/ps8625 bridge
>>>> 581257f Documentation: bridge: Add documentation for ps8622 DT pro=
perties
>>>> 178e8b9 Documentation: devicetree: Add vendor prefix for parade
>>>> 0ceea75 Documentation: drm: bridge: move to video/bridge
>>>> f143e2e drm/bridge: ptn3460: use gpiod interface
>>>> 2d5cb9d drm/bridge: ptn3460: probe connector at the end of bridge =
attach
>>>> 32ac563 drm/bridge: ptn3460: support drm_panel
>>>> 91c6c30 drm/exynos: dp: support drm_bridge
>>>> 7eea7eb drm/bridge: ptn3460: Convert to i2c driver model
>>>> 602f343 drm/bridge: make bridge registration independent of drm fl=
ow
>>>> 14c7143 drm/bridge: do not pass drm_bridge_funcs to drm_bridge_ini=
t
>>>> 2c01ac4 drm/bridge: ptn3460: Few trivial cleanups
>>>> 7415f6c arm: dts: Exynos5: Use pmu_system_controller phandle for d=
p phy
>>>> 28655d1 drm/exynos: Move platform drivers registration to module i=
nit
>>>> ed6778a Add linux-next specific files for 20141121
>>>>
>>>> I have attached the rebased patches as well.
>>>> I tested it on snow, peach_pit and peach_pi without *clk_ignore_un=
used*.
>>>> Display is totally fine with exynos_defconfig (booting is fine eve=
n
>>>> with CONFIG_SND_SOC_SNOW=3Dy)
>>>
>>> Thanks for forward porting your patches to linux-next. Unfortunatel=
y I
>>> won't have time to test them until Monday but I wonder why you didn=
't
>>> have the boot issues that we have with next-20141121.
>>
>> I tested your ToT patches on top of next-20141121, this is my git lo=
g:
>>
>> 93fe3d7 Revert "Revert "ARM: exynos_defconfig: Enable options for di=
splay panel support""
>> 552f74e ARM: dts: peach-pit: represent the connection between bridge=
 and panel using videoport and endpoints
>> dbbc293 ARM: dts: snow: represent the connection between bridge and =
panel using videoport and endpoints
>> d8687f8 drm/bridge: Add i2c based driver for ps8622/ps8625 bridge
>> f29a649 Documentation: bridge: Add documentation for ps8622 DT prope=
rties
>> 6ade887 Documentation: devicetree: Add vendor prefix for parade
>> d81c42d Documentation: drm: bridge: move to video/bridge
>> 50b9828 drm/bridge: ptn3460: use gpiod interface
>> 1274c56 drm/bridge: ptn3460: probe connector at the end of bridge at=
tach
>> f3cf063 drm/bridge: ptn3460: support drm_panel
>> cab682b drm/exynos: dp: support drm_bridge
>> 6e78916 drm/bridge: ptn3460: Convert to i2c driver model
>> 93f4b5f drm/bridge: make bridge registration independent of drm flow
>> 81a038f drm/bridge: do not pass drm_bridge_funcs to drm_bridge_init
>> eb6996e drm/bridge: ptn3460: Few trivial cleanups
>> c41fa5d arm: dts: Exynos5: Use pmu_system_controller phandle for dp =
phy
>> 51b2c75 drm/exynos: Move platform drivers registration to module ini=
t
>> ed6778a Add linux-next specific files for 20141121
>>
>>> I found that the commit ae43b32 ("ARM: 8202/1: dmaengine: pl330: Ad=
d
>>> runtime Power Management support v12") had to be reverted in order =
to
>>> boot linux-next.
>>>
>>
>> Display works but I needed to revert the mentioned commit, otherwise
>> the boot hangs as reported before. I'm using exynos_defconfig and th=
is
>> kernel command line:
>>
>> console=3DttySAC3,115200N8 debug earlyprintk root=3D/dev/mmcblk1p2 r=
ootwait rw
>
> I tested Spring with next-20141124, and finally got it to work! :)
That's great to hear!

> Thanks a lot, Ajay and Javier!
>
> To be on the safe side, I reverted the patch pointed out by Javier an=
d
> was still using clk_ignore_unused.
>
> Ajay, note that your rebased Snow patch has the last hunk indented on=
e
> level too deep.
Ahh, right. I just saw that. I am not sure if these patches go in just
like this,
or I need to rebase on top of kukjin's for-next or some other branch/tr=
ee!
Will take care of this, then.

>
> I'll post a cleaned-up bridge patch for Spring later.
Ok, AFAIK, peach_pit DT properties can be reused.

Ajay

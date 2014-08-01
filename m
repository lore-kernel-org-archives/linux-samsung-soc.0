From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Fri, 01 Aug 2014 16:57:59 +0200
Message-ID: <53DBAAF7.3040207@suse.de>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>	<53D5435B.8030305@suse.de>	<CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>	<53D783CC.2080108@suse.de>	<CAEC9eQOpS90U9kWmY8YdcAtdxQYKoM9ikoWpkwMs6T2udLeZHA@mail.gmail.com>	<53D9484A.1070905@suse.de>	<CAEC9eQOFWQ8t1zzOVrHm2=aS4+N94EW6LSjBUG2fH51aFs0GLQ@mail.gmail.com>	<53DA0513.3080602@suse.de>	<20140731102348.GC7458@ulmo>	<53DA5120.7080709@suse.de> <CAEC9eQMoMC9Py+nvUANw_yHQX84tmpNCzEAQfFAhaN2GkeDwHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56571 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753111AbaHAO6F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 10:58:05 -0400
In-Reply-To: <CAEC9eQMoMC9Py+nvUANw_yHQX84tmpNCzEAQfFAhaN2GkeDwHw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Ajay,

Am 01.08.2014 09:02, schrieb Ajay kumar:
> On Thu, Jul 31, 2014 at 7:52 PM, Andreas F=E4rber <afaerber@suse.de> =
wrote:
>> Am 31.07.2014 12:23, schrieb Thierry Reding:
>>> On Thu, Jul 31, 2014 at 10:57:55AM +0200, Andreas F=E4rber wrote:
>>>> Am 31.07.2014 10:38, schrieb Ajay kumar:
>>>>> With just the spring-bridge.v6 branch of your own tree, I am able=
 to see
>>>>> bootup logo on Skate(a variant of spring which also contains ps86=
22).
>>>>> I have tried both exynos_defconfig and multi_v7_defconfig.
>>>>> I enable DRM, EXYNOS DRM, BRIDGE CHIPS, IOMMU, EXYNOS IOMMU
>>>>> in configs.
>> [...]
>>> If you have something like simplefb enabled in addition to a DRM dr=
iver,
>>> then perhaps the DRM driver isn't properly taking over the framebuf=
fer
>>> console.
>>
>> So, with simplefb reverted in U-Boot and ...
>>
>> * with just the v6 applied (...~2), I get only a black screen from
>> Linux, no penguins, but the backlight seems on. System comes up okay=
,
>> ssh available, and nothing stands out in dmesg.
>>
>> * with the two iommu patches on top, something breaks badly, no
>> backlight, no USB/network, system inaccessible.
>> I.e. U-Boot had no noticeable impact on these symptoms.
>>
>> * with the iommu patches, but dp-controller, ps8622, panel commented
>> out, I do get backlight but USB/network not working, system inaccess=
ible.
>>
>> With simplefb support in U-Boot and with just v6 applied, but
>> dp-controller, ps8622, panel commented out, things work as well as
>> before, i.e. this series has no bad side effects. Note that I never
>> claimed Ajay's series were broken, just reported that things regress=
ed
>> for me from v4, which may well be DT-related.
>>
>> The iommu patches interfere with my USB somehow (none or not all dev=
ices
>> powered; with v4, plugging my wifi dongle led to oops but ethernet
>> dongle worked, so not entirely new symptom), which is bad since my
>> rootfs is on USB. The internal SDIO-connected Wifi is not enabled ye=
t,
>> so USB based network is my only alternative to a working display onc=
e we
>> reach userspace.
> Well, there are 2 variants here:
> 1) Bootloader
> 2) config

Unfortunately your config doesn't work for me either, on my latest
spring-bridge.v6 branch.

> Type of the bootloader should not matter unless its switching on
> FET1 and FET6 of tps65090 for you.

It does switch them on, if I'm reading correctly:

https://github.com/afaerber/u-boot/blob/spring/board/samsung/smdk5250/s=
mdk5250.c#L599

https://github.com/afaerber/u-boot/blob/spring/board/samsung/smdk5250/s=
mdk5250.c#L907

Another observation I made is that sometimes in my testing (didn't spot
a pattern yet) after reboot or power-off/power-on the initial white
screen with the warning did not come up (no backlight), but Ctrl+U
worked fine and chain-loaded nv u-boot came up on screen okay.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg

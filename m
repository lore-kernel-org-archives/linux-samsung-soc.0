From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Thu, 31 Jul 2014 10:57:55 +0200
Message-ID: <53DA0513.3080602@suse.de>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>	<53D5435B.8030305@suse.de>	<CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>	<53D783CC.2080108@suse.de>	<CAEC9eQOpS90U9kWmY8YdcAtdxQYKoM9ikoWpkwMs6T2udLeZHA@mail.gmail.com>	<53D9484A.1070905@suse.de> <CAEC9eQOFWQ8t1zzOVrHm2=aS4+N94EW6LSjBUG2fH51aFs0GLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54554 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932250AbaGaI6A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 04:58:00 -0400
In-Reply-To: <CAEC9eQOFWQ8t1zzOVrHm2=aS4+N94EW6LSjBUG2fH51aFs0GLQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Ajay,

Am 31.07.2014 10:38, schrieb Ajay kumar:
> On Thu, Jul 31, 2014 at 1:02 AM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>> Am 30.07.2014 08:21, schrieb Ajay kumar:
>>> On Tue, Jul 29, 2014 at 4:51 PM, Andreas F=C3=A4rber <afaerber@suse=
=2Ede> wrote:
>>>> Am 28.07.2014 08:13, schrieb Ajay kumar:
>>>>> On 7/27/14, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>>>>>> Am 25.07.2014 21:22, schrieb Ajay Kumar:
>>>>>>> This series is based on exynos-drm-next branch of Inki Dae's tr=
ee at:
>>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exyno=
s.git
>>>>>>>
>>>>>>> I have tested this after adding few DT changes for exynos5250-s=
now,
>>>>>>> exynos5420-peach-pit and exynos5800-peach-pi boards.
>>>>>>
>>>>>> I'm trying to test this with a modified exynos5250-spring DT bas=
ed off
>>>>>> kgene's for-next branch due to DT, and I run into the following:
>>>>
>>>> Unfortunately the most I got on Spring with attached DT was a blan=
k
>>>> screen with a white horizontal line in the middle.
>>> Then, I think bridge chip is working fine.
>>> You just need to configure the proper mode for FIMD.
>>> You can see backlight also, right?
>>>
>>>> Do I need to specify a specific panel model for Spring?
>>> Yes! Try using "chunghwa,claa101wb01" as compatible string for
>>> panel node.
>>
>> With just your v6 applied plus updated DT patch (attached) [1], I se=
e
>> backlight and a black screen (no white line any more). dmesg attache=
d.
> I can see penguin's also!

See below...

>>>> For testing I re-applied your iommu patches (which btw fail now fo=
r 5420
>>>> due to disp_pd) but didn't know what to do about your panel-lvds
>>>> regulator patch now that it's gone.
>>> Ignore that regulator patch.
>>>
>>> Also, please attach the bootlog if possible after trying this.
>>
>> If I further apply the IOMMU patches [2], I get no backlight nor USB=
 and
>> thus can't obtain a boot log.
>>
>> Regards,
>> Andreas
>>
>> [1] https://github.com/afaerber/linux/commits/spring-next

(I updated the branch meantime, so what I meant was spring-bridge.v6~2)

>> [2] https://github.com/afaerber/linux/commits/spring-bridge.v6
> With just the spring-bridge.v6 branch of your own tree, I am able to =
see
> bootup logo on Skate(a variant of spring which also contains ps8622).
> I have tried both exynos_defconfig and multi_v7_defconfig.
> I enable DRM, EXYNOS DRM, BRIDGE CHIPS, IOMMU, EXYNOS IOMMU
> in configs.
>=20
> Even in your bootlogs, I can see DP getting probed.
> And, you say backlight is also visible. That means entire display
> path should be fine. Its just that you should start writing to the bu=
ffer.
> Have you enabled boot logos?

Let me clarify: U-Boot uses the display [*], so it is powered and I see
penguins initially. Then, when drm gets initialized, the screen goes
black and no longer prints kernel messages or systemd output or X11 gdm
login screen.

Since drm stuff is the only variance here and it works with simplefb,
surely something prints to some buffer!

Andreas

[*] https://github.com/afaerber/u-boot/commits/spring

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg

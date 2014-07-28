From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip support
Date: Mon, 28 Jul 2014 11:43:01 +0530
Message-ID: <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
	<53D5435B.8030305@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:57089 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751134AbaG1GNC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 02:13:02 -0400
In-Reply-To: <53D5435B.8030305@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com

Hi Andreas,

On 7/27/14, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> Hi Ajay,
>
> Am 25.07.2014 21:22, schrieb Ajay Kumar:
>> This series is based on exynos-drm-next branch of Inki Dae's tree at=
:
>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>>
>> I have tested this after adding few DT changes for exynos5250-snow,
>> exynos5420-peach-pit and exynos5800-peach-pi boards.
>
> I'm trying to test this with a modified exynos5250-spring DT based of=
f
> kgene's for-next branch due to DT, and I run into the following:
>
>   CC      drivers/gpu/drm/bridge/ptn3460.o
> drivers/gpu/drm/bridge/ptn3460.c: In function =E2=80=98ptn3460_post_e=
ncoder_init=E2=80=99:
> drivers/gpu/drm/bridge/ptn3460.c:275:2: error: implicit declaration o=
f
> function =E2=80=98drm_connector_register=E2=80=99 [-Werror=3Dimplicit=
-function-declaration]
>   drm_connector_register(&ptn_bridge->connector);
>   ^
Hope this might help:
http://www.spinics.net/lists/dri-devel/msg60578.html

Switch back to drm_sysfs_connector_add if your kernel doesn't have this=
 patch.

Ajay

> cc1: some warnings being treated as errors
> scripts/Makefile.build:257: recipe for target
> 'drivers/gpu/drm/bridge/ptn3460.o' failed
> make[4]: *** [drivers/gpu/drm/bridge/ptn3460.o] Error 1
> scripts/Makefile.build:404: recipe for target 'drivers/gpu/drm/bridge=
'
> failed
> make[3]: *** [drivers/gpu/drm/bridge] Error 2
> make[3]: *** Warte auf noch nicht beendete Prozesse...
> scripts/Makefile.build:404: recipe for target 'drivers/gpu/drm' faile=
d
> make[2]: *** [drivers/gpu/drm] Error 2
> scripts/Makefile.build:404: recipe for target 'drivers/gpu' failed
> make[1]: *** [drivers/gpu] Error 2
> Makefile:899: recipe for target 'drivers' failed
> make: *** [drivers] Error 2
>
> Any hint which prerequisite I'm missing? Didn't spot it in Inki's tre=
e,
> and it must be new since v4.
>
> Thanks,
> Andreas
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=
=C3=BCrnberg
>

From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH v6 1/2] ARM: EXYNOS: Change System MMU platform device definitions
Date: Tue, 15 Nov 2011 16:48:42 +0900
Message-ID: <CAHQjnOPrjc37tYc05OZqi5cJnQJn61OoqVAX6OvH=J4e6rL1Wg@mail.gmail.com>
References: <1321333132-17662-1-git-send-email-pullip.cho@samsung.com>
	<1321333132-17662-2-git-send-email-pullip.cho@samsung.com>
	<CAH9JG2UDZ92zFiiPQYxbNJgLqcqGv_D9dFNdqJa2o+BxiUzygg@mail.gmail.com>
	<CAHQjnOOMq9icOWY-b1z0YaJKZcx-b=Kv9ZT9dnwHAjVM5=hCrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:46416 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751591Ab1KOHso convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 02:48:44 -0500
In-Reply-To: <CAHQjnOOMq9icOWY-b1z0YaJKZcx-b=Kv9ZT9dnwHAjVM5=hCrQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, Sanghyun Lee <sanghyun75.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, YoungLak Kim <younglak1004.kim@samsung.com>

On Tue, Nov 15, 2011 at 3:12 PM, KyongHo Cho <pullip.cho@samsung.com> w=
rote:
> On Tue, Nov 15, 2011 at 2:37 PM, Kyungmin Park <kmpark@infradead.org>=
 wrote:
>>> @@ -988,6 +989,21 @@ static struct platform_device *universal_devic=
es[]
>>> __initdata =3D {
>>> =A0 =A0 =A0 &cam_i_core_fixed_reg_dev,
>>> =A0 =A0 =A0 &cam_s_if_fixed_reg_dev,
>>> =A0 =A0 =A0 &s5p_device_fimc_md,
>>> + =A0 =A0 &SYSMMU_PLATDEV(sss),
>>> + =A0 =A0 &SYSMMU_PLATDEV(jpeg),
>>> + =A0 =A0 &SYSMMU_PLATDEV(fimd1),
>>> + =A0 =A0 &SYSMMU_PLATDEV(2d),
>>> + =A0 =A0 &SYSMMU_PLATDEV(rot),
>>> + =A0 =A0 &SYSMMU_PLATDEV(mdma),
>>> + =A0 =A0 &SYSMMU_PLATDEV(tv),
>>> + =A0 =A0 &SYSMMU_PLATDEV(mfc_l),
>>> + =A0 =A0 &SYSMMU_PLATDEV(mfc_r),
>>> + =A0 =A0 &SYSMMU_PLATDEV(fimc0),
>>> + =A0 =A0 &SYSMMU_PLATDEV(fimc1),
>>> + =A0 =A0 &SYSMMU_PLATDEV(fimc2),
>>> + =A0 =A0 &SYSMMU_PLATDEV(fimc3),
>>> + =A0 =A0 &SYSMMU_PLATDEV(fimd0),
>>> + =A0 =A0 &SYSMMU_PLATDEV(pcie),
>> Platform device is optional for each board and pcie doesn't used at
>> mobile board. Does it require to register all platform devices at
>> board?
>
> Of course we make them selectable in menuconfig according
Of course we make them
Sorry
> to the selection of their host devices. But the array definition will
> contain lots of #ifdef.
>

Sorry. I omitted 'can' from "Of course we 'can' make them selectable"

> And I defined System MMU dev for PCIe for future use
> although it is useless in mobile devices.
>
>>>
>>> +static void __init sysmmu_init(void)
>>> +{
>>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(fimc0, &exynos4_device_pd[PD_CA=
M].dev);
>>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(fimc1, &exynos4_device_pd[PD_CA=
M].dev);
>>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(fimc2, &exynos4_device_pd[PD_CA=
M].dev);
>>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(fimc3, &exynos4_device_pd[PD_CA=
M].dev);
>>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(jpeg, &exynos4_device_pd[PD_CAM=
].dev);
>>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(mfc_l, &exynos4_device_pd[PD_MF=
C].dev);
>>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(mfc_r, &exynos4_device_pd[PD_MF=
C].dev);
>>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(fimd0, &exynos4_device_pd[PD_LC=
D0].dev);
>>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(rot, &exynos4_device_pd[PD_LCD0=
].dev);
>>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(mdma, &exynos4_device_pd[PD_LCD=
0].dev);
>>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(tv, &exynos4_device_pd[PD_TV].d=
ev);
>>> +
>>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(fimc0).dev, &s5p_device_=
fimc0.dev);
>>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(fimc1).dev, &s5p_device_=
fimc1.dev);
>>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(fimc2).dev, &s5p_device_=
fimc2.dev);
>>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(fimc3).dev, &s5p_device_=
fimc3.dev);
>>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(mfc_l).dev, &s5p_device_=
mfc.dev);
>>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(mfc_r).dev, &s5p_device_=
mfc.dev);
>>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(fimd0).dev, &s5p_device_=
fimd0.dev);
>>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(tv).dev, &s5p_device_mix=
er.dev);
>>> +}
>>> +
>>> =A0static void __init universal_machine_init(void)
>>> =A0{
>>> =A0 =A0 =A0 universal_sdhci_init();
>>> @@ -1040,6 +1080,8 @@ static void __init universal_machine_init(voi=
d)
>>>
>>> =A0 =A0 =A0 universal_camera_init();
>>>
>>> + =A0 =A0 sysmmu_init();
>> I think how do you implement the sysmm_init at cpu or common file? a=
nd
>> board select it to use iommu or not. no need to implement the almost
>> same codes at each board.
>>
> It is not easy to move sysmmu_init() out from mach_*.c files because =
System MMU
> configuration is vary from boards and APs. It is just machine-specifi=
c.
>
>> Otherwise looks good.
>>
> Thank you :)
>
> KyongHo.
>

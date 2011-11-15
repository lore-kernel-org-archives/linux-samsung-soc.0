From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH v6 1/2] ARM: EXYNOS: Change System MMU platform device
 definitions
Date: Tue, 15 Nov 2011 15:12:41 +0900
Message-ID: <CAHQjnOOMq9icOWY-b1z0YaJKZcx-b=Kv9ZT9dnwHAjVM5=hCrQ@mail.gmail.com>
References: <1321333132-17662-1-git-send-email-pullip.cho@samsung.com>
 <1321333132-17662-2-git-send-email-pullip.cho@samsung.com>
 <CAH9JG2UDZ92zFiiPQYxbNJgLqcqGv_D9dFNdqJa2o+BxiUzygg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAH9JG2UDZ92zFiiPQYxbNJgLqcqGv_D9dFNdqJa2o+BxiUzygg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, YoungLak Kim <younglak1004.kim@samsung.com>, iommu@lists.linux-foundation.org, Kukjin Kim <kgene.kim@samsung.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Nov 15, 2011 at 2:37 PM, Kyungmin Park <kmpark@infradead.org> wrote:
>> @@ -988,6 +989,21 @@ static struct platform_device *universal_devices[]
>> __initdata =3D {
>> =A0 =A0 =A0 &cam_i_core_fixed_reg_dev,
>> =A0 =A0 =A0 &cam_s_if_fixed_reg_dev,
>> =A0 =A0 =A0 &s5p_device_fimc_md,
>> + =A0 =A0 &SYSMMU_PLATDEV(sss),
>> + =A0 =A0 &SYSMMU_PLATDEV(jpeg),
>> + =A0 =A0 &SYSMMU_PLATDEV(fimd1),
>> + =A0 =A0 &SYSMMU_PLATDEV(2d),
>> + =A0 =A0 &SYSMMU_PLATDEV(rot),
>> + =A0 =A0 &SYSMMU_PLATDEV(mdma),
>> + =A0 =A0 &SYSMMU_PLATDEV(tv),
>> + =A0 =A0 &SYSMMU_PLATDEV(mfc_l),
>> + =A0 =A0 &SYSMMU_PLATDEV(mfc_r),
>> + =A0 =A0 &SYSMMU_PLATDEV(fimc0),
>> + =A0 =A0 &SYSMMU_PLATDEV(fimc1),
>> + =A0 =A0 &SYSMMU_PLATDEV(fimc2),
>> + =A0 =A0 &SYSMMU_PLATDEV(fimc3),
>> + =A0 =A0 &SYSMMU_PLATDEV(fimd0),
>> + =A0 =A0 &SYSMMU_PLATDEV(pcie),
> Platform device is optional for each board and pcie doesn't used at
> mobile board. Does it require to register all platform devices at
> board?

Of course we make them selectable in menuconfig according
to the selection of their host devices. But the array definition will
contain lots of #ifdef.

And I defined System MMU dev for PCIe for future use
although it is useless in mobile devices.

>>
>> +static void __init sysmmu_init(void)
>> +{
>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(fimc0, &exynos4_device_pd[PD_CAM].de=
v);
>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(fimc1, &exynos4_device_pd[PD_CAM].de=
v);
>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(fimc2, &exynos4_device_pd[PD_CAM].de=
v);
>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(fimc3, &exynos4_device_pd[PD_CAM].de=
v);
>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(jpeg, &exynos4_device_pd[PD_CAM].dev=
);
>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(mfc_l, &exynos4_device_pd[PD_MFC].de=
v);
>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(mfc_r, &exynos4_device_pd[PD_MFC].de=
v);
>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(fimd0, &exynos4_device_pd[PD_LCD0].d=
ev);
>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(rot, &exynos4_device_pd[PD_LCD0].dev=
);
>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(mdma, &exynos4_device_pd[PD_LCD0].de=
v);
>> + =A0 =A0 ASSIGN_SYSMMU_POWERDOMAIN(tv, &exynos4_device_pd[PD_TV].dev);
>> +
>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(fimc0).dev, &s5p_device_fimc0=
.dev);
>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(fimc1).dev, &s5p_device_fimc1=
.dev);
>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(fimc2).dev, &s5p_device_fimc2=
.dev);
>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(fimc3).dev, &s5p_device_fimc3=
.dev);
>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(mfc_l).dev, &s5p_device_mfc.d=
ev);
>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(mfc_r).dev, &s5p_device_mfc.d=
ev);
>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(fimd0).dev, &s5p_device_fimd0=
.dev);
>> + =A0 =A0 sysmmu_set_owner(&SYSMMU_PLATDEV(tv).dev, &s5p_device_mixer.de=
v);
>> +}
>> +
>> =A0static void __init universal_machine_init(void)
>> =A0{
>> =A0 =A0 =A0 universal_sdhci_init();
>> @@ -1040,6 +1080,8 @@ static void __init universal_machine_init(void)
>>
>> =A0 =A0 =A0 universal_camera_init();
>>
>> + =A0 =A0 sysmmu_init();
> I think how do you implement the sysmm_init at cpu or common file? and
> board select it to use iommu or not. no need to implement the almost
> same codes at each board.
>
It is not easy to move sysmmu_init() out from mach_*.c files because System=
 MMU
configuration is vary from boards and APs. It is just machine-specific.

> Otherwise looks good.
>
Thank you :)

KyongHo.

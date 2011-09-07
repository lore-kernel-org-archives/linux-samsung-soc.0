From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH 2/5] ARM: SAMSUNG: Make the sleep code common for S3C64XX
	and newer SoCs
Date: Wed, 7 Sep 2011 12:04:57 +0530
Message-ID: <CAM4voanOQyOxK=UfN7u_HPkZkKnhPQOofU3JH3FjrBaDY8MmEA@mail.gmail.com>
References: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
	<1313144787-30666-3-git-send-email-a.kesavan@samsung.com>
	<073501cc6391$31569f70$9403de50$%kim@samsung.com>
	<CAM4voak5ArO4YW-bfLDoUFtMndV58thnr2Z4oCbPhD3fRPS1Cw@mail.gmail.com>
	<000201cc6d23$973508e0$c59f1aa0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <000201cc6d23$973508e0$c59f1aa0$%kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mr Kim,

On Wed, Sep 7, 2011 at 11:31 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Abhilash Kesavan wrote:
>>
>> Hi Mr Kim,
>>
>> Thanks for your comments. Please find my reply below:
>>
>> Regards,
>> Abhilash
>>
>> On Fri, Aug 26, 2011 at 7:10 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
>> > Abhilash Kesavan wrote:
>> >>
>> >> The sleep code for S5PV210 and EXYNOS4 is identical; moreover it is
> quite
>> >> similar
>> >> to that for S3C64XX except for some SoC specific debug logic. S5P64X0
> and
>> >> S5PC100,
>> >> for which support will be added soon, can also use the same procedure.
>> > Create a
>> >> common sleep code in the plat-samsung directory so that it can be
> re-used.
>> >>
>> >> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> >> ---
>> >> =A0arch/arm/mach-exynos4/Kconfig =A0| =A0 =A01 +
>> >> =A0arch/arm/mach-exynos4/Makefile | =A0 =A02 +-
>> >> =A0arch/arm/mach-exynos4/sleep.S =A0| =A0 54 ------------------------=
---
>> >> =A0arch/arm/mach-s3c64xx/Kconfig =A0| =A0 =A01 +
>> >> =A0arch/arm/mach-s3c64xx/Makefile | =A0 =A01 -
>> >> =A0arch/arm/mach-s3c64xx/sleep.S =A0| =A0 72
>> > ------------------------------------
>> >> =A0arch/arm/mach-s5pv210/Kconfig =A0| =A0 =A01 +
>> >> =A0arch/arm/mach-s5pv210/Makefile | =A0 =A02 +-
>> >> =A0arch/arm/mach-s5pv210/sleep.S =A0| =A0 52 ------------------------=
--
>> >> =A0arch/arm/plat-samsung/Kconfig =A0| =A0 =A07 +++
>> >> =A0arch/arm/plat-samsung/Makefile | =A0 =A01 +
>> >> =A0arch/arm/plat-samsung/sleep.S =A0| =A0 80
>> >> ++++++++++++++++++++++++++++++++++++++++
>> >> =A012 files changed, 93 insertions(+), 181 deletions(-)
>> >> =A0delete mode 100644 arch/arm/mach-exynos4/sleep.S
>> >> =A0delete mode 100644 arch/arm/mach-s3c64xx/sleep.S
>> >> =A0delete mode 100644 arch/arm/mach-s5pv210/sleep.S
>> >> =A0create mode 100644 arch/arm/plat-samsung/sleep.S
>> >>
>> >
>> > (snip)
>> >
>> >> +ENTRY(s3c_cpu_resume)
>> >> +#if defined(CONFIG_S3C_PM_DEBUG_LED_SMDK)
>> >> +
>> >
>> > Hi Abhilash,
>> >
>> > Yes, would be nice if each sleep.S can be handled in plat-samsung for
>> > Samsung SoCs.
>> >
>> > Hmm...but the CONFIG_S3C_PM_DEBUG_LED_SMDK can be used on other
>> SoCs for
>> > same reason even though it is available only on S3C64XX now. I think, =
we
>> > need to add SoC detecting here.
>> Quite right, it is possible to use this for other SoCs. But as of now,
>> my patch just intends
>> to move all the sleep code to a common place. The S3C64XX sleep code
>> has this feature
>> and I didn't want to disturb it in anyway, hence it has been added to
>> the common file.
>> Perhaps, generalizing it for other SoCs can be done later on top of this
>
> Hmm, this codes should be cleaned for all Samsung SoCs because this can
> break one kernel image...
Do you mean for 24xx as well ? because that would be kind of difficult
considering that the 2412, 2410 sleep files are different.

If you feel this will prevent single image support, we can drop it.
The rationale
behind the patch was that rather than add another identical 64X0 sleep.s fi=
le
and another for C100 in the future, let me merge it.
But the patch isn't necessary as for S5P64X0 PM support as such. I can rewo=
rk
the existing patches with a new sleep.S.
>
>> >
>> >> +#undef S3C64XX_VA_GPIO
>> >> +#define S3C64XX_VA_GPIO (0x0)
>> >
>> > Please let me know why this is needed here.
>> The code is trying to access the registers at a stage where the MMU is
>> not enabled.
>> Hence, the VA_GPIO is being re-defined as 0 reducing S3C64XX_GPIOREG(reg)
>> to
>> reg.
>> It has been moved as is from the existing s3c64xx sleep code.
>
>
> Thanks.
>
> Best regards,
> Kgene.
Abhilash
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>

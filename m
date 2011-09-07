From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH 3/5] ARM: S5P64X0: Add pm save/restore functions for GPIO
	banks
Date: Wed, 7 Sep 2011 12:06:03 +0530
Message-ID: <CAM4voakBT3S7ETHx6y+Vv+mYJm_rFcbUJwqDROKSfmjWsaZzCg@mail.gmail.com>
References: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
	<1313144787-30666-4-git-send-email-a.kesavan@samsung.com>
	<000301cc6d23$9bad71a0$d30854e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <000301cc6d23$9bad71a0$d30854e0$%kim@samsung.com>
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
>> Fix the "no pm for GPIOXX" messages appearing during bootup due
>> to missing assignment of save/restore functions for those banks.
>>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> ---
>> =A0arch/arm/mach-s5p64x0/gpiolib.c =A0| =A0 =A01 +
>> =A0drivers/gpio/gpio-plat-samsung.c | =A0 =A04 +++-
>> =A02 files changed, 4 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5p64x0/gpiolib.c
> b/arch/arm/mach-s5p64x0/gpiolib.c
>> index e7fb3b0..76c0924 100644
>> --- a/arch/arm/mach-s5p64x0/gpiolib.c
>> +++ b/arch/arm/mach-s5p64x0/gpiolib.c
>> @@ -467,6 +467,7 @@ static void __init s5p64x0_gpio_add_rbank_4bit2(stru=
ct
>> s3c_gpio_chip *chip,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->chip.direction_input =3D
> s5p64x0_gpiolib_rbank_4bit2_input;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->chip.direction_output =3D
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 s5p64x0_gpiolib_rbank_4bit2_output;
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->pm =3D __gpio_pm(&s3c_gpio_pm_4bit);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpiolib_add(chip);
>> =A0 =A0 =A0 }
>> =A0}
>> diff --git a/drivers/gpio/gpio-plat-samsung.c
> b/drivers/gpio/gpio-plat-samsung.c
>> index ef67f19..4f7c387 100644
>> --- a/drivers/gpio/gpio-plat-samsung.c
>> +++ b/drivers/gpio/gpio-plat-samsung.c
>> @@ -200,6 +200,8 @@ void __init samsung_gpiolib_add_4bit2_chips(struct
>> s3c_gpio_chip *chip,
>> =A0void __init samsung_gpiolib_add_2bit_chips(struct s3c_gpio_chip *chip,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0int nr_chips)
>> =A0{
>> - =A0 =A0 for (; nr_chips > 0; nr_chips--, chip++)
>> + =A0 =A0 for (; nr_chips > 0; nr_chips--, chip++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->pm =3D __gpio_pm(&s3c_gpio_pm_2bit);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpiolib_add(chip);
>> + =A0 =A0 }
>> =A0}
>> --
>> 1.7.4.1
>
> Hi Abhilash,
>
> Since submitted gpio-samsung patch includes above changes, so we can drop
> this.
>
> If any problem, please let me know.
Sure. No problem.
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
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

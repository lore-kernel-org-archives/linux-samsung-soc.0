From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Remove useless codes on NURI board
Date: Thu, 6 Oct 2011 15:49:58 +0900
Message-ID: <CAJ0PZbQruMMQt=ijkXA2A+PHKtG1Q9mht9UAS1mNsynsBdEyhg@mail.gmail.com>
References: <1313758894-31814-1-git-send-email-kgene.kim@samsung.com>
	<CAH9JG2Ufwg7+6rAsf4v_RJ-fccp=5-8ziNFZEDX5ToUP5MpJ4A@mail.gmail.com>
	<CAJ0PZbTHOKazY=x17nbPGg1djyw=1DRL7n5qrtHMiUqC+PcKUg@mail.gmail.com>
	<00ed01cc83f1$865d7310$93185930$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:39689 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753003Ab1JFGuG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Oct 2011 02:50:06 -0400
Received: by bkbzt4 with SMTP id zt4so3060860bkb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Oct 2011 23:49:58 -0700 (PDT)
In-Reply-To: <00ed01cc83f1$865d7310$93185930$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Thu, Oct 6, 2011 at 3:31 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> MyungJoo Ham wrote:
>>
>> 2011/8/19 Kyungmin Park <kmpark@infradead.org>:
>> > Maybe charger manager codes are not merged. it's used for charger
> managers.
>> >
>> > To Mr. Ham,
>> > which patches are missing?
>> >
>> > Thank you,
>> > Kyungmin Park
>>
>> The patch to register Charger-Manager in Nuri is missing in the file=
=2E
>> In order to apply that, we will need to modify NTC driver (either
>> update hwmon framework or seperate NTC driver into two parts
>> (platorm-device + hwmon-device) first so that in-kernel modules can
>> read values from NTC.
>>
> If missing some stuff will not be merged in this time, to apply this =
is
> better to us to remove useless warning message during build and if re=
quired,
> we can add it later......
>
> Is ok to you?
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>

That's fine. I'll resubmit it as soon as charger-manager work is cleare=
d.


Cheers!
MyungJoo

>> >
>> > On Fri, Aug 19, 2011 at 10:01 PM, Kukjin Kim <kgene.kim@samsung.co=
m>
> wrote:
>> >> The 'nuri_cm_devices' is defined but not used.
>> >>
>> >> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>> >> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> >> ---
>> >> =A0arch/arm/mach-exynos4/mach-nuri.c | =A0 =A07 -------
>> >> =A01 files changed, 0 insertions(+), 7 deletions(-)
>> >>
>> >> diff --git a/arch/arm/mach-exynos4/mach-nuri.c
> b/arch/arm/mach-exynos4/mach-
>> nuri.c
>> >> index 43be71b..65df994 100644
>> >> --- a/arch/arm/mach-exynos4/mach-nuri.c
>> >> +++ b/arch/arm/mach-exynos4/mach-nuri.c
>> >> @@ -1037,13 +1037,6 @@ static struct platform_device
> nuri_max8903_device
>> =3D {
>> >> =A0 =A0 =A0 =A0},
>> >> =A0};
>> >>
>> >> -static struct device *nuri_cm_devices[] =3D {
>> >> - =A0 =A0 =A0 &s3c_device_i2c5.dev,
>> >> - =A0 =A0 =A0 &s3c_device_adc.dev,
>> >> - =A0 =A0 =A0 NULL, /* Reserved for UART */
>> >> - =A0 =A0 =A0 NULL,
>> >> -};
>> >> -
>> >> =A0static void __init nuri_power_init(void)
>> >> =A0{
>> >> =A0 =A0 =A0 =A0int gpio;
>> >> --
>> >> 1.7.1
>
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics

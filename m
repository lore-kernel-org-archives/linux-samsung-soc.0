From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 06/12] rtc-s3c: Fix breakage introduced by S3C2443/S3C2416 support
Date: Tue, 17 Apr 2012 14:09:03 +0530
Message-ID: <CAJuYYwR+qKTCkdHz4-GGKZ2zffMj1UteA1PvRTEUk3nz82z=9g@mail.gmail.com>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
	<1334641595-25301-7-git-send-email-thomas.abraham@linaro.org>
	<CAH9JG2V=5v0hp9rcynywcHYnrPUqN0XrS_hOcU-uY=FkNJ0O9g@mail.gmail.com>
	<CAJuYYwR14_wxBswzkVcObWAEDFqDXyi751gmiHyJNW+rA0JcQQ@mail.gmail.com>
	<CAH9JG2XzszmonUp_vqMEVKr13kK8O-ts8h47H2EDaMvPaZ0BLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:43544 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755313Ab2DQIjF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 04:39:05 -0400
Received: by wibhq7 with SMTP id hq7so384495wib.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Apr 2012 01:39:03 -0700 (PDT)
In-Reply-To: <CAH9JG2XzszmonUp_vqMEVKr13kK8O-ts8h47H2EDaMvPaZ0BLQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>

On 17 April 2012 13:55, Kyungmin Park <kmpark@infradead.org> wrote:
> On 4/17/12, Thomas Abraham <thomas.abraham@linaro.org> wrote:
>> On 17 April 2012 12:00, Kyungmin Park <kmpark@infradead.org> wrote:
>>> Hi,
>>>
>>> It's already merged with different patch,
>>
>> This is a repost of the patch from Heiko Stuebner which would be
>> required to fix compilation issue for rtc driver. I think you are
>> referring to that patch but it is not merged yet. So I am reposting =
it
>> with this series.
>
> No it's 3.4.0-rc3. it's already included.

Right, it is merged already. I was still on -rc2 and did not notice thi=
s change.

Thanks,
Thomas.

>>
>> Thanks,
>> Thomas.
>>
>>>
>>> #ifdef CONFIG_OF
>>> static const struct of_device_id s3c_rtc_dt_match[] =3D {
>>> =A0 =A0 =A0 =A0{
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.compatible =3D "samsung,s3c2410-rtc=
",
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.data =3D &s3c_rtc_drv_data_array[TY=
PE_S3C2410],
>>> =A0 =A0 =A0 =A0}, {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.compatible =3D "samsung,s3c2416-rtc=
",
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.data =3D &s3c_rtc_drv_data_array[TY=
PE_S3C2416],
>>> =A0 =A0 =A0 =A0}, {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.compatible =3D "samsung,s3c2443-rtc=
",
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.data =3D &s3c_rtc_drv_data_array[TY=
PE_S3C2443],
>>> =A0 =A0 =A0 =A0}, {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.compatible =3D "samsung,s3c6410-rtc=
",
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.data =3D &s3c_rtc_drv_data_array[TY=
PE_S3C64XX],
>>> =A0 =A0 =A0 =A0},
>>> =A0 =A0 =A0 =A0{},
>>> };
>>> MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);
>>> #else
>>> #define s3c_rtc_dt_match NULL
>>> #endif
>>>
>>> Thank you,
>>> Kyungmin Park
>>>
>>> On 4/17/12, Thomas Abraham <thomas.abraham@linaro.org> wrote:
>>>> From: Heiko Stuebner <heiko@sntech.de>
>>>>
>>>> Commits 7006ee4f (rtc-s3c: make room for more variants in devicetr=
ee
>>>> block)
>>>> and 6c0a2365 (rtc-s3c: add variants for S3C2443 and S3C2416)
>>>> introduced build-failures with enabled CONFIG_USE_OF option.
>>>>
>>>> This patch fixes missing "," in s3c_rtc_dt_match and wrong handlin=
g of
>>>> the of_device_id.data property.
>>>>
>>>> Reported-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>>>> ---
>>>> =A0drivers/rtc/rtc-s3c.c | =A0 18 +++++++++---------
>>>> =A01 files changed, 9 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
>>>> index 9ccea13..c792b6d 100644
>>>> --- a/drivers/rtc/rtc-s3c.c
>>>> +++ b/drivers/rtc/rtc-s3c.c
>>>> @@ -449,7 +449,7 @@ static inline int s3c_rtc_get_driver_data(stru=
ct
>>>> platform_device *pdev)
>>>> =A0 =A0 =A0 if (pdev->dev.of_node) {
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct of_device_id *match;
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 match =3D of_match_node(s3c_rtc_dt_mat=
ch, pdev->dev.of_node);
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 return match->data;
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 return (int)match->data;
>>>> =A0 =A0 =A0 }
>>>> =A0#endif
>>>> =A0 =A0 =A0 return platform_get_device_id(pdev)->driver_data;
>>>> @@ -667,17 +667,17 @@ static int s3c_rtc_resume(struct platform_de=
vice
>>>> *pdev)
>>>> =A0#ifdef CONFIG_OF
>>>> =A0static const struct of_device_id s3c_rtc_dt_match[] =3D {
>>>> =A0 =A0 =A0 {
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c2410-rtc"
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 .data =3D TYPE_S3C2410,
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c2410-rtc",
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 .data =3D (void *)TYPE_S3C2410,
>>>> =A0 =A0 =A0 }, {
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c2416-rtc"
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 .data =3D TYPE_S3C2416,
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c2416-rtc",
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 .data =3D (void *)TYPE_S3C2416,
>>>> =A0 =A0 =A0 }, {
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c2443-rtc"
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 .data =3D TYPE_S3C2443,
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c2443-rtc",
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 .data =3D (void *)TYPE_S3C2443,
>>>> =A0 =A0 =A0 }, {
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c6410-rtc"
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 .data =3D TYPE_S3C64XX,
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c6410-rtc",
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 .data =3D (void *)TYPE_S3C64XX,
>>>> =A0 =A0 =A0 },
>>>> =A0 =A0 =A0 {},
>>>> =A0};
>>>> --
>>>> 1.6.6.rc2
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe
>>>> linux-samsung-soc"
>>>> in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
>>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>

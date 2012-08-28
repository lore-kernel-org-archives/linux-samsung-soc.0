From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S3C24XX: Add .get_rate callback for "camif-upll"
 clock
Date: Tue, 28 Aug 2012 16:10:52 -0700
Message-ID: <503D4FFC.9010706@samsung.com>
References: <1346098329-32059-1-git-send-email-sylvester.nawrocki@gmail.com> <503BFB86.20607@samsung.com> <503D3108.1030804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:55863 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751218Ab2H1XK4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 19:10:56 -0400
Received: by pbbrr13 with SMTP id rr13so47169pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 16:10:56 -0700 (PDT)
In-Reply-To: <503D3108.1030804@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 08/28/12 13:58, Sylwester Nawrocki wrote:
> On 08/28/2012 12:58 AM, Kukjin Kim wrote:
>> On 08/27/12 13:12, Sylwester Nawrocki wrote:
>>> Add missing get_rate callback for the "camif-upll" clock, so freque=
ncy
>>> of this clock is properly reported with clk_get_rate().
>>>
>>> Signed-off-by: Sylwester Nawrocki<sylvester.nawrocki@gmail.com>
>>> ---
>>> arch/arm/mach-s3c24xx/clock-s3c2440.c | 14 ++++++++++++++
>>> 1 files changed, 14 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-s3c24xx/clock-s3c2440.c
>>> b/arch/arm/mach-s3c24xx/clock-s3c2440.c
>>> index cb2883d..749220f 100644
>>> --- a/arch/arm/mach-s3c24xx/clock-s3c2440.c
>>> +++ b/arch/arm/mach-s3c24xx/clock-s3c2440.c
>>> @@ -87,6 +87,19 @@ static int s3c2440_camif_upll_setrate(struct clk
>>> *clk, unsigned long rate)
>>> return 0;
>>> }
>>>
>>> +static unsigned long s3c2440_camif_upll_getrate(struct clk *clk)
>>> +{
>>> + unsigned long parent_rate =3D clk_get_rate(clk->parent);
>>> + unsigned long camdivn =3D __raw_readl(S3C2440_CAMDIVN);
>>> +
>>> + if (!(camdivn&  S3C2440_CAMDIVN_CAMCLK_SEL))
>>> + return parent_rate;
>>> +
>>> + camdivn&=3D S3C2440_CAMDIVN_CAMCLK_MASK;
>>> +
>>> + return parent_rate / (camdivn + 1) / 2;
>>
>> Well, why do we need '/ 2' here?
>
> I simply followed documentation of the camera clock divider register
> (CAMDIVN). This is how CAMCLK_SEL and CAMCLK_DIV bit fields are descr=
ibed
> there:
>
> CAMDIVN      |  Bit  |       Description
> ---------------------------------------------------------------------=
-----
> CAMCLK_SEL   | [4]   | 0 : Use CAMCLK with UPLL output(CAMCLK=3DUPLL =
output)
>               |       | 1 : CAMCLK is divided by CAMCLK_DIV value
> -------------+-------+-----------------------------------------------=
-----
> CAMCLK_DIV   | [3:0] | CAMCLK divide factor setting register(0 =96 15=
).
>               |       | Camera clock =3D UPLL / [(CAMCLK_DIV +1)x2].
>               |       | This bit is valid when CAMCLK_SEL=3D1.
>
> So, camera clock frequency =3D parent_rate / ((camdivn + 1) * 2).
> This is exactly same as 'parent_rate / ( camdivn + 1) / 2'.
>
> To be 1000% sure I compared frequency values reported from clk_get_ra=
te()
> in the driver with values measured with an oscilloscope at the CAMCLK=
OUT
> pin. Everything was as expected (UPLL - 48 MHz, CAMCLKOUT - 12 MHz).
>
> Also, it's easy to confirm correctness of this code by inversing equa=
tions
> found in function s3c2440_camif_upll_setrate(), i.e.
>
>   camdivn&=3D ~(S3C2440_CAMDIVN_CAMCLK_SEL | S3C2440_CAMDIVN_CAMCLK_M=
ASK);
>   if (rate !=3D parent_rate) {
>   	camdivn |=3D S3C2440_CAMDIVN_CAMCLK_SEL;
>   	camdivn |=3D (((parent_rate / rate) / 2) - 1);
>   }
>
>   __raw_writel(camdivn, S3C2440_CAMDIVN);
>
> --

Looks OK, thanks for your reply :-)

Applied.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

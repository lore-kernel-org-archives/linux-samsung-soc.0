From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 1/6] rtc: rtc-s3c: Fix access unit from byte to word on RTCCON
Date: Wed, 27 Oct 2010 16:31:35 +0900
Message-ID: <AANLkTi=+BH7nJFt5Amz_q=6HAn9STfXjKbCS6jSQeW5y@mail.gmail.com>
References: <1286494879-2932-1-git-send-email-kgene.kim@samsung.com>
	<1286494879-2932-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:51045 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752181Ab0J0Hbi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Oct 2010 03:31:38 -0400
Received: by gwj21 with SMTP id 21so155942gwj.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Oct 2010 00:31:37 -0700 (PDT)
In-Reply-To: <1286494879-2932-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, a.zummo@towertech.it, ben-linux@fluff.org, akpm@linux-foundation.org, Changhwan Youn <chaos.youn@samsung.com>

On Fri, Oct 8, 2010 at 8:41 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> From: Changhwan Youn <chaos.youn@samsung.com>
>
> S3C2410_RTCCON of TYPE_S3C64XX RTC should be read/written by
> readw and writew, because TYPE_S3C64XX RTC uses bit 8 and 9.
> And TYPE_S3C2410 RTC also can access it by readw and writew.
>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> [atul.dahiya@samsung.com: tested on smdk2416]
> Tested-by: Atul Dahiya <atul.dahiya@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> ---
> =A0drivers/rtc/rtc-s3c.c | =A0 36 ++++++++++++++++++-----------------=
-
> =A01 files changed, 18 insertions(+), 18 deletions(-)

Hello,


Sorry for a late reply...


Anyway, I have a small question in this rtc-s3c.c driver.

Is there any reason to use read/write b/w to access registers of rtc-s3=
c?

Why don't we use readl/writel when accessing registers in this drivers
and just forget which registers require at least 8 or 16 or 32 bits?

In fact, it appears that readw/writew accesses 16bits, not 32bits in
ARM machines, which may incur problems with TICCNT/CURTICCNT
registers.


>
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index f57a87f..4a0b875 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -100,7 +100,7 @@ static int s3c_rtc_setpie(struct device *dev, int=
 enabled)
> =A0 =A0 =A0 =A0spin_lock_irq(&s3c_rtc_pie_lock);
>
> =A0 =A0 =A0 =A0if (s3c_rtc_cpu_type =3D=3D TYPE_S3C64XX) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readb(s3c_rtc_base + S3C2410_RT=
CCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readw(s3c_rtc_base + S3C2410_RT=
CCON);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp &=3D ~S3C64XX_RTCCON_TICEN;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (enabled)
> @@ -318,7 +318,7 @@ static int s3c_rtc_proc(struct device *dev, struc=
t seq_file *seq)
> =A0 =A0 =A0 =A0unsigned int ticnt;
>
> =A0 =A0 =A0 =A0if (s3c_rtc_cpu_type =3D=3D TYPE_S3C64XX) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ticnt =3D readb(s3c_rtc_base + S3C2410_=
RTCCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ticnt =3D readw(s3c_rtc_base + S3C2410_=
RTCCON);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ticnt &=3D S3C64XX_RTCCON_TICEN;
> =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ticnt =3D readb(s3c_rtc_base + S3C2410=
_TICNT);
> @@ -391,11 +391,11 @@ static void s3c_rtc_enable(struct platform_devi=
ce *pdev, int en)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
> =A0 =A0 =A0 =A0if (!en) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readb(base + S3C2410_RTCCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readw(base + S3C2410_RTCCON);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (s3c_rtc_cpu_type =3D=3D TYPE_S3C64=
XX)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp &=3D ~S3C64XX_RTCC=
ON_TICEN;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp &=3D ~S3C2410_RTCCON_RTCEN;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(tmp, base + S3C2410_RTCCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writew(tmp, base + S3C2410_RTCCON);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (s3c_rtc_cpu_type =3D=3D TYPE_S3C24=
10) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp =3D readb(base + S=
3C2410_TICNT);
> @@ -405,25 +405,25 @@ static void s3c_rtc_enable(struct platform_devi=
ce *pdev, int en)
> =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* re-enable the device, and check it =
is ok */
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((readb(base+S3C2410_RTCCON) & S3C24=
10_RTCCON_RTCEN) =3D=3D 0){
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((readw(base+S3C2410_RTCCON) & S3C24=
10_RTCCON_RTCEN) =3D=3D 0){
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_info(&pdev->dev, "=
rtc disabled, re-enabling\n");
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readb(base + S3=
C2410_RTCCON);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(tmp|S3C2410_RTCC=
ON_RTCEN, base+S3C2410_RTCCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readw(base + S3=
C2410_RTCCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writew(tmp|S3C2410_RTCC=
ON_RTCEN, base+S3C2410_RTCCON);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((readb(base + S3C2410_RTCCON) & S3C=
2410_RTCCON_CNTSEL)){
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((readw(base + S3C2410_RTCCON) & S3C=
2410_RTCCON_CNTSEL)){
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_info(&pdev->dev, "=
removing RTCCON_CNTSEL\n");
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readb(base + S3=
C2410_RTCCON);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(tmp& ~S3C2410_RT=
CCON_CNTSEL, base+S3C2410_RTCCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readw(base + S3=
C2410_RTCCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writew(tmp& ~S3C2410_RT=
CCON_CNTSEL, base+S3C2410_RTCCON);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((readb(base + S3C2410_RTCCON) & S3C=
2410_RTCCON_CLKRST)){
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((readw(base + S3C2410_RTCCON) & S3C=
2410_RTCCON_CLKRST)){
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_info(&pdev->dev, "=
removing RTCCON_CLKRST\n");
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readb(base + S3=
C2410_RTCCON);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(tmp & ~S3C2410_R=
TCCON_CLKRST, base+S3C2410_RTCCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readw(base + S3=
C2410_RTCCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writew(tmp & ~S3C2410_R=
TCCON_CLKRST, base+S3C2410_RTCCON);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> =A0}
> @@ -514,8 +514,8 @@ static int __devinit s3c_rtc_probe(struct platfor=
m_device *pdev)
>
> =A0 =A0 =A0 =A0s3c_rtc_enable(pdev, 1);
>
> - =A0 =A0 =A0 pr_debug("s3c2410_rtc: RTCCON=3D%02x\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0readb(s3c_rtc_base + S3C2410_RTCCON)=
);
> + =A0 =A0 =A0 pr_debug("s3c2410_rtc: RTCCON=3D%02x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0readw(s3c_rtc_base + S3C2410_RTCCON)=
);
>
> =A0 =A0 =A0 =A0device_init_wakeup(&pdev->dev, 1);
>
> @@ -578,7 +578,7 @@ static int s3c_rtc_suspend(struct platform_device=
 *pdev, pm_message_t state)
> =A0 =A0 =A0 =A0/* save TICNT for anyone using periodic interrupts */
> =A0 =A0 =A0 =A0ticnt_save =3D readb(s3c_rtc_base + S3C2410_TICNT);
> =A0 =A0 =A0 =A0if (s3c_rtc_cpu_type =3D=3D TYPE_S3C64XX) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ticnt_en_save =3D readb(s3c_rtc_base + =
S3C2410_RTCCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ticnt_en_save =3D readw(s3c_rtc_base + =
S3C2410_RTCCON);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ticnt_en_save &=3D S3C64XX_RTCCON_TICE=
N;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0s3c_rtc_enable(pdev, 0);
> @@ -596,8 +596,8 @@ static int s3c_rtc_resume(struct platform_device =
*pdev)
> =A0 =A0 =A0 =A0s3c_rtc_enable(pdev, 1);
> =A0 =A0 =A0 =A0writeb(ticnt_save, s3c_rtc_base + S3C2410_TICNT);
> =A0 =A0 =A0 =A0if (s3c_rtc_cpu_type =3D=3D TYPE_S3C64XX && ticnt_en_s=
ave) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readb(s3c_rtc_base + S3C2410_RT=
CCON);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(tmp | ticnt_en_save, s3c_rtc_bas=
e + S3C2410_RTCCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readw(s3c_rtc_base + S3C2410_RT=
CCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writew(tmp | ticnt_en_save, s3c_rtc_bas=
e + S3C2410_RTCCON);
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (device_may_wakeup(&pdev->dev))
> --
> 1.6.2.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858

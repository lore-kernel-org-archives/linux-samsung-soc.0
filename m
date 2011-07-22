From: amit kachhap <amit.kachhap@gmail.com>
Subject: Re: [PATCH] I2C: Samsung: Add support for PM_runtime in the I2C driver.
Date: Fri, 22 Jul 2011 08:45:10 +0530
Message-ID: <CADGdYn6qQRpMm+xVOBS7bcepxY5sSHjz5C-akU=w7AncKK=qdw@mail.gmail.com>
References: <1301257963-17196-1-git-send-email-amit.kachhap@linaro.org>
	<20110327231135.GG9995@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:41383 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752399Ab1GVDPM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 23:15:12 -0400
In-Reply-To: <20110327231135.GG9995@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, patches@linaro.org

On Mon, Mar 28, 2011 at 4:41 AM, Ben Dooks <ben-linux@fluff.org> wrote:
> On Sun, Mar 27, 2011 at 04:32:43PM -0400, Amit Daniel Kachhap wrote:
>> This patch adds PM runtime management support in the I2C driver.
>> The functionality of the driver is not modified much but some extra =
I2C
>> states are added for PM runtime. The runtime suspend keeps the inter=
rupt
>> for the I2C interface disabled.
>
> ok, whilst this looks ok, it's too late for the current merge window,
> so will go into the -next for the next kernel
>

Hi Ben,

I do not see this patch in your i2c-next branch. Could you please
merge this patch in the next merge window.

Thanks,
Amit Daniel

>> Signed-off-by: =A0Amit Daniel Kachhap <amit.kachhap@linaro.org>
>> ---
>> =A0drivers/i2c/busses/i2c-s3c2410.c | =A0 61 +++++++++++++++++++++++=
++++++++++-----
>> =A01 files changed, 53 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i=
2c-s3c2410.c
>> index 6c00c10..8ebe621 100644
>> --- a/drivers/i2c/busses/i2c-s3c2410.c
>> +++ b/drivers/i2c/busses/i2c-s3c2410.c
>> @@ -35,6 +35,7 @@
>> =A0#include <linux/cpufreq.h>
>> =A0#include <linux/slab.h>
>> =A0#include <linux/io.h>
>> +#include <linux/pm_runtime.h>
>>
>> =A0#include <asm/irq.h>
>>
>> @@ -48,7 +49,9 @@ enum s3c24xx_i2c_state {
>> =A0 =A0 =A0 STATE_START,
>> =A0 =A0 =A0 STATE_READ,
>> =A0 =A0 =A0 STATE_WRITE,
>> - =A0 =A0 STATE_STOP
>> + =A0 =A0 STATE_STOP,
>> + =A0 =A0 STATE_STANDBY,
>> + =A0 =A0 STATE_SUSPEND
>> =A0};
>>
>> =A0enum s3c24xx_i2c_type {
>> @@ -59,7 +62,6 @@ enum s3c24xx_i2c_type {
>> =A0struct s3c24xx_i2c {
>> =A0 =A0 =A0 spinlock_t =A0 =A0 =A0 =A0 =A0 =A0 =A0lock;
>> =A0 =A0 =A0 wait_queue_head_t =A0 =A0 =A0 wait;
>> - =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0suspended:1;
>>
>> =A0 =A0 =A0 struct i2c_msg =A0 =A0 =A0 =A0 =A0*msg;
>> =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0msg_num;
>> @@ -400,8 +402,13 @@ static int i2s_s3c_irq_nextbyte(struct s3c24xx_=
i2c *i2c, unsigned long iicstat)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->msg=
++;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>>
>> + =A0 =A0 default:
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(i2c->dev, "%s: called with invalid=
 state\n", __func__);
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 /* acknowlegde the IRQ and get back on with the work */
>> @@ -485,7 +492,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c=
 *i2c,
>> =A0 =A0 =A0 int spins =3D 20;
>> =A0 =A0 =A0 int ret;
>>
>> - =A0 =A0 if (i2c->suspended)
>> + =A0 =A0 if (i2c->state =3D=3D STATE_SUSPEND)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;
>>
>> =A0 =A0 =A0 ret =3D s3c24xx_i2c_set_master(i2c);
>> @@ -555,12 +562,14 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter=
 *adap,
>> =A0 =A0 =A0 int ret;
>>
>> =A0 =A0 =A0 clk_enable(i2c->clk);
>> + =A0 =A0 pm_runtime_get_sync(i2c->dev);
>>
>> =A0 =A0 =A0 for (retry =3D 0; retry < adap->retries; retry++) {
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D s3c24xx_i2c_doxfer(i2c, msgs, nu=
m);
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret !=3D -EAGAIN) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm_runtime_put_sync(i2c->d=
ev);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_disable(i2c->clk);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> @@ -570,6 +579,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *=
adap,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(100);
>> =A0 =A0 =A0 }
>>
>> + =A0 =A0 pm_runtime_put_sync(i2c->dev);
>> =A0 =A0 =A0 clk_disable(i2c->clk);
>> =A0 =A0 =A0 return -EREMOTEIO;
>> =A0}
>> @@ -912,10 +922,14 @@ static int s3c24xx_i2c_probe(struct platform_d=
evice *pdev)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_cpufreq;
>> =A0 =A0 =A0 }
>>
>> + =A0 =A0 /*Set Initial I2C state*/
>> + =A0 =A0 i2c->state =3D STATE_STANDBY;
>> +
>> =A0 =A0 =A0 platform_set_drvdata(pdev, i2c);
>>
>> =A0 =A0 =A0 dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&=
i2c->adap.dev));
>> =A0 =A0 =A0 clk_disable(i2c->clk);
>> + =A0 =A0 pm_runtime_enable(&pdev->dev);
>> =A0 =A0 =A0 return 0;
>>
>> =A0 err_cpufreq:
>> @@ -956,6 +970,7 @@ static int s3c24xx_i2c_remove(struct platform_de=
vice *pdev)
>>
>> =A0 =A0 =A0 clk_disable(i2c->clk);
>> =A0 =A0 =A0 clk_put(i2c->clk);
>> + =A0 =A0 pm_runtime_disable(&pdev->dev);
>>
>> =A0 =A0 =A0 iounmap(i2c->regs);
>>
>> @@ -972,9 +987,9 @@ static int s3c24xx_i2c_suspend_noirq(struct devi=
ce *dev)
>> =A0 =A0 =A0 struct platform_device *pdev =3D to_platform_device(dev)=
;
>> =A0 =A0 =A0 struct s3c24xx_i2c *i2c =3D platform_get_drvdata(pdev);
>>
>> - =A0 =A0 i2c->suspended =3D 1;
>> -
>> + =A0 =A0 i2c->state =3D STATE_SUSPEND;
>> =A0 =A0 =A0 return 0;
>> +
>> =A0}
>>
>> =A0static int s3c24xx_i2c_resume(struct device *dev)
>> @@ -982,17 +997,47 @@ static int s3c24xx_i2c_resume(struct device *d=
ev)
>> =A0 =A0 =A0 struct platform_device *pdev =3D to_platform_device(dev)=
;
>> =A0 =A0 =A0 struct s3c24xx_i2c *i2c =3D platform_get_drvdata(pdev);
>>
>> - =A0 =A0 i2c->suspended =3D 0;
>> =A0 =A0 =A0 clk_enable(i2c->clk);
>> =A0 =A0 =A0 s3c24xx_i2c_init(i2c);
>> + =A0 =A0 i2c->state =3D STATE_STANDBY;
>> =A0 =A0 =A0 clk_disable(i2c->clk);
>>
>> =A0 =A0 =A0 return 0;
>> =A0}
>>
>> +static int s3c_i2c_runtime_suspend(struct device *dev)
>> +{
>> + =A0 =A0 struct platform_device *pdev =3D to_platform_device(dev);
>> + =A0 =A0 struct s3c24xx_i2c *i2c =3D platform_get_drvdata(pdev);
>> +
>> + =A0 =A0 i2c->state =3D STATE_STANDBY;
>> + =A0 =A0 s3c24xx_i2c_disable_irq(i2c);
>> + =A0 =A0 s3c24xx_i2c_disable_ack(i2c);
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static int s3c_i2c_runtime_resume(struct device *dev)
>> +{
>> + =A0 =A0 struct platform_device *pdev =3D to_platform_device(dev);
>> + =A0 =A0 struct s3c24xx_i2c *i2c =3D platform_get_drvdata(pdev);
>> +
>> + =A0 =A0 if (i2c->state !=3D STATE_STANDBY)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> +
>> + =A0 =A0 /*No major activity in runtime resume because all the regi=
sters are
>> + =A0 =A0 re-initialised for each i2c transfer, so just changing the=
 state*/
>> + =A0 =A0 i2c->state =3D STATE_IDLE;
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +
>> =A0static const struct dev_pm_ops s3c24xx_i2c_dev_pm_ops =3D {
>> - =A0 =A0 .suspend_noirq =3D s3c24xx_i2c_suspend_noirq,
>> - =A0 =A0 .resume =3D s3c24xx_i2c_resume,
>> + =A0 =A0 .suspend_noirq =A0 =A0 =A0 =A0 =A0=3D s3c24xx_i2c_suspend_=
noirq,
>> + =A0 =A0 .resume =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D s3c24xx_i2c_re=
sume,
>> + =A0 =A0 .runtime_suspend =A0 =A0 =A0 =A0=3D s3c_i2c_runtime_suspen=
d,
>> + =A0 =A0 .runtime_resume =A0 =A0 =A0 =A0 =3D s3c_i2c_runtime_resume=
,
>> =A0};
>>
>> =A0#define S3C24XX_DEV_PM_OPS (&s3c24xx_i2c_dev_pm_ops)
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
> --
> Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/
>
> Large Hadron Colada: A large Pina Colada that makes the universe disa=
ppear.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

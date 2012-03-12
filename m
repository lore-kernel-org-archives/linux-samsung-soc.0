From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 5/5] mmc: sdhci-s3c: setup pins using pinctrl interface
Date: Mon, 12 Mar 2012 10:07:54 +0530
Message-ID: <CAJuYYwSbtJvOM_EY7MXRJ-wEk-vNZvjk64+yKgYRxXABSFk2AQ@mail.gmail.com>
References: <1331469965-28846-1-git-send-email-thomas.abraham@linaro.org>
	<1331469965-28846-6-git-send-email-thomas.abraham@linaro.org>
	<CAH9JG2XJ3HrQROc-_6Lq6zccgF-QZupVozXCQnXYGN7+DBnq+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:55859 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751626Ab2CLEh4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Mar 2012 00:37:56 -0400
Received: by vcqp1 with SMTP id p1so3740055vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Mar 2012 21:37:55 -0700 (PDT)
In-Reply-To: <CAH9JG2XJ3HrQROc-_6Lq6zccgF-QZupVozXCQnXYGN7+DBnq+A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, kgene.kim@samsung.com, patches@linaro.org

On 12 March 2012 08:08, Kyungmin Park <kmpark@infradead.org> wrote:
> On 3/11/12, Thomas Abraham <thomas.abraham@linaro.org> wrote:
>> The platform specific callback to setup the sdhci pin mux and pin co=
nfig
>> is removed and the pinctrl subsystem interface is used to setup the
>> mux and config.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0drivers/mmc/host/sdhci-s3c.c | =A0 15 +++++++++++++--
>> =A01 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s=
3c.c
>> index ea0767e..76c1c36 100644
>> --- a/drivers/mmc/host/sdhci-s3c.c
>> +++ b/drivers/mmc/host/sdhci-s3c.c
>> @@ -22,6 +22,7 @@
>> =A0#include <linux/module.h>
>> =A0#include <linux/of.h>
>> =A0#include <linux/of_gpio.h>
>> +#include <linux/pinctrl/consumer.h>
>>
>> =A0#include <linux/mmc/host.h>
>>
>> @@ -50,6 +51,7 @@ struct sdhci_s3c {
>> =A0 =A0 =A0 struct platform_device =A0*pdev;
>> =A0 =A0 =A0 struct resource =A0 =A0 =A0 =A0 *ioarea;
>> =A0 =A0 =A0 struct s3c_sdhci_platdata *pdata;
>> + =A0 =A0 struct pinctrl =A0 =A0 =A0 =A0 =A0*pinctrl;
>> =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0cur_clk;
>> =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ext_cd_irq;
>> =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ext_cd_gpio;
>> @@ -529,6 +531,9 @@ static inline struct sdhci_s3c_drv_data
>> *sdhci_s3c_get_driver_data(
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 platform_get_device_id(p=
dev)->driver_data;
>> =A0}
>>
>> +#include <plat/map-s5p.h>
>> +#include <plat/map-base.h>
>
> Why this header files are required?

Sorry, that was a mistake. This was left over here after adding it
here for some debugging. I will take care next time.

>> +
>> =A0static int __devinit sdhci_s3c_probe(struct platform_device *pdev=
)
>> =A0{
>> =A0 =A0 =A0 struct s3c_sdhci_platdata *pdata;
>> @@ -538,6 +543,7 @@ static int __devinit sdhci_s3c_probe(struct
>> platform_device *pdev)
>> =A0 =A0 =A0 struct sdhci_s3c *sc;
>> =A0 =A0 =A0 struct resource *res;
>> =A0 =A0 =A0 int ret, irq, ptr, clks;
>> + =A0 =A0 char *pstate;
>>
>> =A0 =A0 =A0 if (!pdev->dev.platform_data && !pdev->dev.of_node) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "no device data specified\n=
");
>> @@ -643,8 +649,13 @@ static int __devinit sdhci_s3c_probe(struct
>> platform_device *pdev)
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 /* Ensure we have minimal gpio selected CMD/CLK/Detect *=
/
>> - =A0 =A0 if (pdata->cfg_gpio)
>> - =A0 =A0 =A0 =A0 =A0 =A0 pdata->cfg_gpio(pdev, pdata->max_width);
>> + =A0 =A0 pstate =3D pdata->max_width ? "sdhci-pcfg8" : "sdhci-pcfg4=
";
> You should check pdata->max_width =3D=3D 8 instead of max_width itsel=
f.

Thanks. I will fix that.

> BTW if platform set the amx_width as 1. How do you handle this?

If the bus width is 1, we need to add pin map entry for 1 bit bus
width and correspondingly change the code here. I used the sdhci-s3c
driver for testing the samsung pinctrl driver and only tested with
4-bit and 8-bit bus width. The changes in this patch are not final yet
and was mainly included in this series to show how platform callbacks
can be removed.

Thanks,
Thomas.

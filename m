From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 5/5] mmc: sdhci-s3c: setup pins using pinctrl interface
Date: Mon, 12 Mar 2012 09:58:06 +0530
Message-ID: <CAJuYYwToq0pHVQG2yuywe0Dxahy5vGbHjjpphtzQH6t9pp7LLQ@mail.gmail.com>
References: <1331469965-28846-1-git-send-email-thomas.abraham@linaro.org>
	<1331469965-28846-6-git-send-email-thomas.abraham@linaro.org>
	<4F5D1843.1010608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:34425 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083Ab2CLE2H convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Mar 2012 00:28:07 -0400
Received: by vcqp1 with SMTP id p1so3734001vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Mar 2012 21:28:06 -0700 (PDT)
In-Reply-To: <4F5D1843.1010608@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, patches@linaro.org

2012/3/12 Kukjin Kim <kgene.kim@samsung.com>:
> Thomas Abraham wrote:
>> The platform specific callback to setup the sdhci pin mux and pin co=
nfig
>> is removed and the pinctrl subsystem interface is used to setup the
>> mux and config.
>>
>> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
>> ---
>> =A0 drivers/mmc/host/sdhci-s3c.c | =A0 15 +++++++++++++--
>> =A0 1 files changed, 13 insertions(+), 2 deletions(-)
>>
> [...]
>
>>
>> +#include<plat/map-s5p.h>
>> +#include<plat/map-base.h>
>
> You can add <mach/map.h> instead of above.
>
>> +
>> =A0 static int __devinit sdhci_s3c_probe(struct platform_device *pde=
v)
>> =A0 {
>> =A0 =A0 =A0 struct s3c_sdhci_platdata *pdata;
>> @@ -538,6 +543,7 @@ static int __devinit sdhci_s3c_probe(struct plat=
form_device *pdev)
>> =A0 =A0 =A0 struct sdhci_s3c *sc;
>> =A0 =A0 =A0 struct resource *res;
>> =A0 =A0 =A0 int ret, irq, ptr, clks;
>> + =A0 =A0 char *pstate;
>>
>> =A0 =A0 =A0 if (!pdev->dev.platform_data&& =A0!pdev->dev.of_node) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "no device data specified\n=
");
>> @@ -643,8 +649,13 @@ static int __devinit sdhci_s3c_probe(struct pla=
tform_device *pdev)
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 /* Ensure we have minimal gpio selected CMD/CLK/Detect *=
/
>> - =A0 =A0 if (pdata->cfg_gpio)
>> - =A0 =A0 =A0 =A0 =A0 =A0 pdata->cfg_gpio(pdev, pdata->max_width);
>
> I'm not sure we can remove above now for all of Samsung stuff?

We the pin map table is fully populated for each SoC (and board as
necessary), then the platform callback functions to setup the pinmux
and pinconfig can be removed for the drivers. But before doing that,
the next step would be to add gpio interrupts and wakeup interrupts
support into the samsung pinctrl driver. When we have a fully
functional pinctrl driver, we could add the required bits in SoC and
board files and switch over to the pinctrl driver.

>
>> + =A0 =A0 pstate =3D pdata->max_width ? "sdhci-pcfg8" : "sdhci-pcfg4=
";
>
> Is this right? Current max_width can be 4 or 8 in each board file now=
=2E

Sorry, that is not correct. I will fix it. Thanks.

Regards,
Thomas.

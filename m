From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] backlight: add regulator support for platform_lcd driver
Date: Mon, 5 Dec 2011 14:44:14 +0530
Message-ID: <CAJuYYwTJOfCGUObv4+GakO8BN3N10=T6pH7MdCAiqtBrVGz1_Q@mail.gmail.com>
References: <1323074921-29291-1-git-send-email-thomas.abraham@linaro.org>
	<20111205085228.GF9900@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:42079 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752814Ab1LEJOP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Dec 2011 04:14:15 -0500
In-Reply-To: <20111205085228.GF9900@legolas.emea.dhcp.ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: rpurdie@rpsys.net, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Felipe,

On 5 December 2011 14:22, Felipe Balbi <balbi@ti.com> wrote:

[...]

>> + =A0 =A0 if (lcd_power) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (plcd->pdata->min_uV || plcd->pdata->ma=
x_uV)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (regulator_set_voltage(=
lcd_regulator,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 plcd->pdat=
a->min_uV, plcd->pdata->max_uV))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(p=
lcd->us,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "regulator voltage set failed\n");
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (regulator_enable(lcd_regulator))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(plcd->us, "failed=
 to enable regulator\n");
>> + =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 regulator_disable(lcd_regulator);
>> + =A0 =A0 }
>> +
>> + =A0 =A0 regulator_put(lcd_regulator);
>
> I wonder why you ->get() and ->put() everytime here. Wouldn't it be
> enough to ->get() on probe() and ->put() on remove() ??

Thanks for the suggestion. It would be simpler if done in probe. I
will redo this patch.

Regards,
Thomas.

>
> --
> balbi
>

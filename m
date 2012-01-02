From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [RFC][PATCH 2/4] lcd: platform-lcd: Add support for Hydis
 hv070wsa lcd panel
Date: Mon, 2 Jan 2012 23:11:07 +0530
Message-ID: <CAJuYYwRaB=gvM35sfAyb9gEZ62tSAH3z+AaS5K9oiE-pAyR-wQ@mail.gmail.com>
References: <1325483675-21908-1-git-send-email-thomas.abraham@linaro.org>
	<1325483675-21908-2-git-send-email-thomas.abraham@linaro.org>
	<1325483675-21908-3-git-send-email-thomas.abraham@linaro.org>
	<20120102114559.GE2899@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:63540 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752654Ab2ABRlI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 12:41:08 -0500
In-Reply-To: <20120102114559.GE2899@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, kyungmin.park@samsung.com, cbou@mail.ru, kwangwoo.lee@gmail.com, augulis.darius@gmail.com, ben-linux@fluff.org, patches@linaro.org

Hi Mark,

On 2 January 2012 17:15, Mark Brown <broonie@opensource.wolfsonmicro.co=
m> wrote:
> On Mon, Jan 02, 2012 at 11:24:33AM +0530, Thomas Abraham wrote:
>
>> +static void lcd_hv070wsa_set_power(struct platform_lcd *plcd, unsig=
ned int pwr)
>> +{
>> + =A0 =A0 struct plat_lcd_hydis_hv070wsa_pdata *pdata =3D plcd->lcd_=
pdata;
>> +
>> + =A0 =A0 gpio_direction_output(pdata->gpio, pwr);
>> +}
>
> This doesn't look at all specific to this panel - it's just setting a
> GPIO - so it should probably just be a generic gpio-lcd driver (or
> similar). =A0It ought to be possible to do a device tree binding for =
at
> least this subset of panels.

Right. I should not have made it specific to hv070wsa panel. This type
of functionality is reusable for other lcd panels as well. I will
modify this patch.

Thanks,
Thomas.

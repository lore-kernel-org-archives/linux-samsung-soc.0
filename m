From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [RFC][PATCH 4/4] lcd: platform-lcd: Add device tree support
Date: Mon, 2 Jan 2012 23:03:41 +0530
Message-ID: <CAJuYYwTk=+p=FQeM4eyhLt-qKzTdb2KuJ=OZmSPng1qK-jyzJg@mail.gmail.com>
References: <1325483675-21908-1-git-send-email-thomas.abraham@linaro.org>
	<1325483675-21908-2-git-send-email-thomas.abraham@linaro.org>
	<1325483675-21908-3-git-send-email-thomas.abraham@linaro.org>
	<1325483675-21908-4-git-send-email-thomas.abraham@linaro.org>
	<1325483675-21908-5-git-send-email-thomas.abraham@linaro.org>
	<20120102073406.GG13015@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:55509 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753037Ab2ABRdm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 12:33:42 -0500
In-Reply-To: <20120102073406.GG13015@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, broonie@opensource.wolfsonmicro.com, kyungmin.park@samsung.com, cbou@mail.ru, kwangwoo.lee@gmail.com, augulis.darius@gmail.com, ben-linux@fluff.org, patches@linaro.org

Hi Grant,

On 2 January 2012 13:04, Grant Likely <grant.likely@secretlab.ca> wrote=
:
> On Mon, Jan 02, 2012 at 11:24:35AM +0530, Thomas Abraham wrote:
>> Add device tree based initialization for Hydis hv070wsa lcd panel.
>>
>> Cc: Ben Dooks <ben-linux@fluff.org>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0drivers/video/backlight/platform_lcd.c | =A0 33 +++++++++++++++++=
+++++++++++++++
>> =A01 files changed, 33 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/=
backlight/platform_lcd.c

[...]

>> +#ifdef CONFIG_OF
>> + =A0 =A0 if (pdev->dev.of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 const struct of_device_id *match;
>> + =A0 =A0 =A0 =A0 =A0 =A0 match =3D of_match_node(platform_lcd_dt_ma=
tch, pdev->dev.of_node);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return (struct plat_lcd_driver_data *)matc=
h->data;
>
> .data is already void*; the cast should not be necessary.

Thanks. I will remove the cast.

Regards,
Thomas.

[...]

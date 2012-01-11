From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] backlight: lcd: add driver for raster-type lcd's with
 gpio controlled panel reset
Date: Wed, 11 Jan 2012 16:28:53 +0530
Message-ID: <CAJuYYwR6tySTcD9RdNcuGhqCRT2mSLep2sMf1MOJViXEbFEwxw@mail.gmail.com>
References: <1325778146-27056-1-git-send-email-thomas.abraham@linaro.org>
	<20120107182319.GA13181@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:53828 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752522Ab2AKK6y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jan 2012 05:58:54 -0500
In-Reply-To: <20120107182319.GA13181@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, lars@metafoo.de, kwangwoo.lee@gmail.com, patches@linaro.org, jg1.han@samsung.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, cbou@mail.ru, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, rpurdie@rpsys.net, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, augulis.darius@gmail.com

Hi Russell,

On 7 January 2012 23:53, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Thu, Jan 05, 2012 at 09:12:26PM +0530, Thomas Abraham wrote:
>> Add a lcd panel driver for simple raster-type lcd's which uses a gpi=
o
>> controlled panel reset. The driver controls the nRESET line of the p=
anel
>> using a gpio connected from the host system. The Vcc supply to the p=
anel
>> is (optionally) controlled using a voltage regulator. This driver ex=
cludes
>> support for lcd panels that use a serial command interface or direct
>> memory mapped IO interface.
>
> I'm trying to work out what kind of LCD panel this is for. =A0I assum=
e
> not the panels which would be connected to a SoC, which have a parall=
el
> interface to a frame buffer device (LCD controller)?
>
> If this is for these kinds of LCD panels, how are you handling the
> timing required for active panels - some of which must not be powered
> up without the LCD controller first being setup and enabled, and must
> be powered down before the LCD controller is disabled.
>
> I've seen this requirement with panels connected to ARM Ltd's develop=
ment
> boards, and also some SoCs.

This patch is for passive panels that use a nRESET line controlled by
a SoC GPIO and the panel do not use serial command interface (i2c or
spi) or memory-mapped-io for panel control. Panels that just need a
nRESET to be controlled can be handled by this driver.

Thanks,
Thomas.

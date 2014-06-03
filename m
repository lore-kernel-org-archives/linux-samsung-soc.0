From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] i2c: s3c2410: Remove class based instantiation
Date: Tue, 03 Jun 2014 14:03:05 +0200
Message-ID: <538DB979.1030305@gmail.com>
References: <1401786022-29587-1-git-send-email-sachin.kamat@samsung.com>	<20140603100546.GA12261@katana> <CAK5sBcEkCy0kDL_bG_RsDJ6nwuqZeAGN0fXpPV-MJkHugxuubw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:53184 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932482AbaFCMDZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jun 2014 08:03:25 -0400
In-Reply-To: <CAK5sBcEkCy0kDL_bG_RsDJ6nwuqZeAGN0fXpPV-MJkHugxuubw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ch.naveen@samsung.com, Olof Johansson <olof@lixom.net>

Hi Wolfram, Sachin,

On 03.06.2014 13:21, Sachin Kamat wrote:
> Hi Wolfram,
> 
> On Tue, Jun 3, 2014 at 3:35 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> On Tue, Jun 03, 2014 at 02:30:22PM +0530, Sachin Kamat wrote:
>>> With multiplatform support enabled for Exynos, class based
>>> instantiation causes a boot time delay due to I2C_CLASS_HWMON
>>> triggered probe. Since class based instantiation has been
>>> deprecated since some time now, remove it for Samsung I2C driver.
>>>
>>> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>>> Cc: Olof Johansson <olof@lixom.net>
>>
>> In my book, not long enough. I suggest I will take care of the removal.
>> I'll do it for all class deprecating drivers.

Couldn't it be made configurable with a Kconfig entry? E.g. "Enable
deprecated class-based instantiation" under Drivers / I2C? Turning it
off could make the code ignore the class field completely.

This way people that don't want it could just disable it and others
could also test whether disabling it affects them in any way.

> 
> The reason for the removal is the boot delay it is causing on Exynos 5250
> based boards by throwing the following errors continuously.
> 
> [   55.005300] s3c-i2c 12ce0000.i2c: cannot get bus (error -110)
> [   59.005300] s3c-i2c 12ce0000.i2c: cannot get bus (error -110)
> [   63.005300] s3c-i2c 12ce0000.i2c: cannot get bus (error -110)

Are you sure this is directly related to class-based instantiation? This
looks like the bus being driven low by some external component or
incorrectly configured pins. What is this bus used for on affected board?

Best regards,
Tomasz

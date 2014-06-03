From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: Re: [PATCH 1/1] i2c: s3c2410: Remove class based instantiation
Date: Tue, 3 Jun 2014 16:51:14 +0530
Message-ID: <CAK5sBcEkCy0kDL_bG_RsDJ6nwuqZeAGN0fXpPV-MJkHugxuubw@mail.gmail.com>
References: <1401786022-29587-1-git-send-email-sachin.kamat@samsung.com>
	<20140603100546.GA12261@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f66.google.com ([209.85.215.66]:60928 "EHLO
	mail-la0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202AbaFCLVR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jun 2014 07:21:17 -0400
In-Reply-To: <20140603100546.GA12261@katana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ch.naveen@samsung.com, Olof Johansson <olof@lixom.net>

Hi Wolfram,

On Tue, Jun 3, 2014 at 3:35 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Tue, Jun 03, 2014 at 02:30:22PM +0530, Sachin Kamat wrote:
>> With multiplatform support enabled for Exynos, class based
>> instantiation causes a boot time delay due to I2C_CLASS_HWMON
>> triggered probe. Since class based instantiation has been
>> deprecated since some time now, remove it for Samsung I2C driver.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>> Cc: Olof Johansson <olof@lixom.net>
>
> In my book, not long enough. I suggest I will take care of the removal.
> I'll do it for all class deprecating drivers.

The reason for the removal is the boot delay it is causing on Exynos 5250
based boards by throwing the following errors continuously.

[   55.005300] s3c-i2c 12ce0000.i2c: cannot get bus (error -110)
[   59.005300] s3c-i2c 12ce0000.i2c: cannot get bus (error -110)
[   63.005300] s3c-i2c 12ce0000.i2c: cannot get bus (error -110)

Regards,
Sachin

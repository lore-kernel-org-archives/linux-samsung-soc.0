From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v3 5/7] mfd: cros_ec: add bus-specific proto v3 code
Date: Wed, 27 May 2015 11:06:52 +0200
Message-ID: <5565892C.8020205@collabora.co.uk>
References: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk> <1432309340-13688-6-git-send-email-javier.martinez@collabora.co.uk> <20150527085355.GW11677@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33782 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751800AbbE0JG7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 May 2015 05:06:59 -0400
In-Reply-To: <20150527085355.GW11677@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Lee,

On 05/27/2015 10:53 AM, Lee Jones wrote:
> On Fri, 22 May 2015, Javier Martinez Canillas wrote:
> 
>> From: Stephen Barber <smbarber@chromium.org>
>> 
>> Add proto v3 support to the SPI, I2C, and LPC.
>> 
>> Signed-off-by: Stephen Barber <smbarber@chromium.org>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
>> Tested-by: Gwendal Grignou <gwendal@chromium.org>
>> ---
>> 
>> Changes since v2: None
>> 
>> Changes since v1:
>>  - Added Gwendal Grignou Reviewed-by and Tested-by tags
>> ---
>>  drivers/mfd/cros_ec_i2c.c             | 166 ++++++++++++++-
>>  drivers/mfd/cros_ec_spi.c             | 382 +++++++++++++++++++++++++++++-----
>>  drivers/platform/chrome/cros_ec_lpc.c |  73 ++++++-
>>  include/linux/mfd/cros_ec.h           |   6 +
>>  4 files changed, 569 insertions(+), 58 deletions(-)
> 
> I don't even know what to say; except, 600 lines of grimness!  I tried
> to review, but now my eyes and brain hurt.  I feel sorry for the guys
> who have to actively maintain this stuff.
>

Since I'm not the author of these drivers, it took me some time to
understand them as well. I've been trying to make it more suitable
for upstream and were improved a lot by following your suggestions
(thanks for a lot that!).

> However... you have enough vendor Acks and Tests to make me "happy",
> and if anything is wrong I'm sure you'll come back and fix it
> promptyly.
>

Yes I will and I'm sure that being in mainline will make the code
more maintainable in the long term.

> Acked-by: Lee Jones <lee.jones@linaro.org>
>

Thanks and best regards,
Javier

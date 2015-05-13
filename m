From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 06/10] mfd: cros_ec: add proto v3 skeleton
Date: Wed, 13 May 2015 14:25:47 +0200
Message-ID: <555342CB.8000504@collabora.co.uk>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk> <1431166241-15775-7-git-send-email-javier.martinez@collabora.co.uk> <20150513120510.GK3394@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150513120510.GK3394@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Lee,

Thanks a lot for your feedback.

On 05/13/2015 02:05 PM, Lee Jones wrote:
> On Sat, 09 May 2015, Javier Martinez Canillas wrote:
> 
>> From: Stephen Barber <smbarber@chromium.org>
>> 
>> Add support in cros_ec.c to handle EC host command protocol v3.
>> For v3+, probe for maximum shared protocol version and max
>> request, response, and passthrough sizes. For now, this will
>> always fall back to v2, since there is no bus-specific code
>> for handling proto v3 packets.
>> 
>> Signed-off-by: Stephen Barber <smbarber@chromium.org>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
>> Tested-by: Gwendal Grignou <gwendal@chromium.org>
>> ---
>> 
>> Changes since v1:
>>  - Squash change https://chromium-review.googlesource.com/#/c/262870/ in
>>    the patch. Suggested by Gwendal Grignou
>>  - Add Reviewed-by and Tested-by tags from Gwendal Grignou
>> ---
>>  drivers/mfd/cros_ec.c                 | 354 ++++++++++++++++++++++++++++++----
>>  drivers/mfd/cros_ec_i2c.c             |   4 +
>>  drivers/mfd/cros_ec_spi.c             |   7 +-
>>  drivers/platform/chrome/cros_ec_lpc.c |   4 +
>>  include/linux/mfd/cros_ec.h           |  20 +-
>>  5 files changed, 344 insertions(+), 45 deletions(-)
> 
> This patch nearly triples the size of the driver, which I'm less than
> happy about.  This driver is starting to suffer from feature-creep
> when comparing against the original implementation.  I'd like to extract
> 'protocol drivers' out if possible.  Would this be better suited in
> drivers/platform?
> 

Agreed that this mfd driver is getting too complex. I'll see how I can
split the communication/transport logic into a separate driver under
platforms/chrome and only keep the mfd cells registration logic in
drivers/mfd/cros_ec.c

Best regards,
Javier

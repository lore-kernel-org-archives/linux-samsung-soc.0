From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH RESEND v2 5/7] mfd: cros_ec: Instantiate ChromeOS EC character
 device
Date: Tue, 20 Jan 2015 17:03:31 +0100
Message-ID: <54BE7C53.8070605@collabora.co.uk>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk> <1420205572-2640-6-git-send-email-javier.martinez@collabora.co.uk> <20150120082013.GU21886@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:60919 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752736AbbATQDi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 11:03:38 -0500
In-Reply-To: <20150120082013.GU21886@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Lee,

Thanks a lot for your feedback.

On 01/20/2015 09:20 AM, Lee Jones wrote:
> On Fri, 02 Jan 2015, Javier Martinez Canillas wrote:
> 
>> The ChromeOS EC character device is an user-space interface to
>> allow applications to access the Embedded Controller.
>> 
>> Add a cell for this device so it's spawned from the mfd driver.
>> 
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> ---
>> 
>> Changes since v1: None, new patch.
>> 
>>  drivers/mfd/cros_ec.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
>> index c872e1b..70f9ed5 100644
>> --- a/drivers/mfd/cros_ec.c
>> +++ b/drivers/mfd/cros_ec.c
>> @@ -118,6 +118,10 @@ static const struct mfd_cell cros_devs[] = {
>>  		.id = 2,
>>  		.of_compatible = "google,cros-ec-i2c-tunnel",
>>  	},
>> +	{
>> +		.name = "cros-ec-dev",
> 
> *-dev is seldom suitable for naming things.
> 
> Please be more imaginative/descriptive in your naming.
>

You know this is one of the two hard problems in CS ;-)

But seriously, this is the name used in the downstream ChromiumsOS kernel
and tbh I don't think is that bad since after all is a character device
interface to access the Embedded Controller from user-space. So in that
sense is not worse than the i2c-dev or spidev names but I can try to come
up with something more creative if that will block the patch to be merged.

Best regards,
Javier

From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v3 5/6] mfd: cros_ec: wait for completion of commands
 that return IN_PROGRESS
Date: Thu, 18 Sep 2014 09:42:27 +0200
Message-ID: <541A8CE3.30206@collabora.co.uk>
References: <1410428289-18229-1-git-send-email-javier.martinez@collabora.co.uk> <1410428289-18229-6-git-send-email-javier.martinez@collabora.co.uk> <20140917162336.GK30918@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:40716 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755581AbaIRHmc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Sep 2014 03:42:32 -0400
In-Reply-To: <20140917162336.GK30918@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Derek Basehore <dbasehore@chromium.org>, Todd Broch <tbroch@chromium.org>, Olof Johansson <olof@lixom.net>, Andreas Faerber <afaerber@suse.de>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hello Lee,

Thanks a lot for your feedback.

On 09/17/2014 06:23 PM, Lee Jones wrote:
>>  
>>  	mutex_lock(&ec_dev->lock);
>>  	ret = ec_dev->cmd_xfer(ec_dev, msg);
>> +	if (msg->result == EC_RES_IN_PROGRESS) {
>> +		int i;
>> +		struct cros_ec_command status_msg;
>> +		struct ec_response_get_comms_status status;
>> +
>> +		status_msg.version = 0;
>> +		status_msg.command = EC_CMD_GET_COMMS_STATUS;
>> +		status_msg.outdata = NULL;
>> +		status_msg.outsize = 0;
>> +		status_msg.indata = (uint8_t *)&status;
>> +		status_msg.insize = sizeof(status);
>> +
>> +		/*
>> +		 * Query the EC's status until it's no longer busy or
>> +		 * we encounter an error.
>> +		 */
>> +		for (i = 0; i < EC_COMMAND_RETRIES; i++) {
>> +			usleep_range(EC_RETRY_DELAY_MS, EC_RETRY_DELAY_MS + 1);
> 
> Remove the EC_RETRY_DELAY_MS define and place the values in raw.
>

Ok, will do.

> You're now sleeping for 10us.  Did you test the changes?
> 

Duh, I must had been sleepy since I thought about changing the define but I
completely missed... which proves your point that raw values are more explicit
than using a define here.

Yes, I'm testing the changes and making sure that it does not add any
regression but I was not able to reproduce the case when an EC command result
is IN_PROGRESS. I'll investigate further on how to properly test that branch
before posting v4.

Best regards,
Javier

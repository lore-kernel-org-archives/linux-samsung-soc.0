From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v6 6/8] mfd: cros_ec: Support multiple EC in a system
Date: Fri, 05 Jun 2015 12:40:33 +0200
Message-ID: <55717CA1.8060503@collabora.co.uk>
References: <1433405154-16273-1-git-send-email-javier.martinez@collabora.co.uk> <1433405154-16273-7-git-send-email-javier.martinez@collabora.co.uk> <20150605103810.GF7058@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150605103810.GF7058@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Lee,

On 06/05/2015 12:38 PM, Lee Jones wrote:

[...]

>>  
>> -	err = mfd_add_devices(dev, 0, cros_devs,
>> -			      ARRAY_SIZE(cros_devs),
>> +	err = mfd_add_devices(ec_dev->dev, PLATFORM_DEVID_AUTO, &ec_cell, 1,
>>  			      NULL, ec_dev->irq, NULL);
>>  	if (err) {
>> -		dev_err(dev, "failed to add mfd devices\n");
>> +		dev_err(dev, "add Embedded Controller mfd device failed %d\n",
> 
> Nit: As you're likely to resubmit anyway, when do do so, can you turn
> this into an English sentence?
> 
> "failed to register Embedded Controller's sub-devices"
> 
> ... or something.
> 

Ok, I will.

Best regards,
Javier

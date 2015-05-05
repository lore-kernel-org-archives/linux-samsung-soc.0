From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RESEND PATCH 3/8] mfd: cros_ec: Instantiate sub-devices from
 device tree
Date: Tue, 05 May 2015 12:57:47 +0200
Message-ID: <5548A22B.3030000@collabora.co.uk>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk> <1428336906-14906-4-git-send-email-javier.martinez@collabora.co.uk> <20150429103943.GV9169@x1> <55488BA6.9030500@collabora.co.uk> <20150505105324.GA4047@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:34451 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752215AbbEEK5x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 06:57:53 -0400
In-Reply-To: <20150505105324.GA4047@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Lee,

On 05/05/2015 12:53 PM, Lee Jones wrote:
> On Tue, 05 May 2015, Javier Martinez Canillas wrote:
>> >>  };
>> >>  
>> >> @@ -150,6 +141,15 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>> >>  		return err;
>> >>  	}
>> >>  
>> >> +#ifdef CONFIG_OF
>> >> +	err = of_platform_populate(dev->of_node, NULL, NULL, dev);
>> >> +	if (err) {
>> >> +		mfd_remove_devices(dev);
>> >> +		dev_err(dev, "Failed to register sub-devices\n");
>> >> +		return err;
>> >> +	}
>> >> +#endif
>> > 
>> > And if we don't support OF?
>> >
>> 
>> These sub-devices are only present on machines that support OF so
>> is more flexible to use of_platform_populate() to register those.
>> 
>> Both machines using and not using DT, register a cros-ec-ctl which
>> is still a mfd_cell in the cros_devs array.
> 
> I'm not really a fan of #ifdiffery if it can be avoided.
> 
> How about?
> 
> if (np)
>    cros_ec_of_register();
> 

Works for me, I'll change it to avoid the ifdeffery.

Best regards,
Javier

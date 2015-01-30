From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v4 3/7] misc: Add cros_ec_lpc driver for x86 devices
Date: Fri, 30 Jan 2015 13:51:44 +0100
Message-ID: <54CB7E60.8040603@collabora.co.uk>
References: <1422538676-4615-1-git-send-email-javier.martinez@collabora.co.uk>	 <1422538676-4615-4-git-send-email-javier.martinez@collabora.co.uk> <1422565889.10643.6.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:48642 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755679AbbA3Mvu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jan 2015 07:51:50 -0500
In-Reply-To: <1422565889.10643.6.camel@x220>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Lee Jones <lee.jones@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Paul,

Thanks a lot for your feedback.

On 01/29/2015 10:11 PM, Paul Bolle wrote:
>>  
>> +config CROS_EC_LPC
>> +	tristate "ChromeOS Embedded Controller (LPC)"
>> +	depends on MFD_CROS_EC
>> +
> 
> Please drop this empty line.
>

Ok.
 
>> +	help
>> +	  If you say Y here, you get support for talking to the ChromeOS EC
>> +	  over an LPC bus. This uses a simple byte-level protocol with a
>> +	  checksum. This is used for userspace access only. The kernel
>> +	  typically has its own communication methods.
>> +
> 
> What happens when you say M?
> 

Since it is a tristate kconfig symbol, it can be built as a kernel module
but since there isn't a LPC subsystem, the platform device is registered
in the module_init() function. So, building as a module is trickier since
there won't be an uevent that can trigger a module auto-load based on the
modinfo aliases information.

One can of course force udev to load the module by adding to modules.conf
or such but I wonder if is better to change from tristate to boolean or
add to the help that it can be built as a module but auto-load does not
work in that case.

Best regards,
Javier

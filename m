From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 7/8] hwmon: pwm-fan: Read PWM FAN configuration from
 device tree
Date: Mon, 23 Feb 2015 08:23:05 -0800
Message-ID: <20150223162305.GB2165@roeck-us.net>
References: <1418897591-18332-1-git-send-email-l.majewski@samsung.com>
 <1424254056-5904-1-git-send-email-l.majewski@samsung.com>
 <1424254056-5904-8-git-send-email-l.majewski@samsung.com>
 <54E7D0B3.7040800@roeck-us.net>
 <20150223171336.2e09ce50@amdc2363>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38915 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752198AbbBWQYL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Feb 2015 11:24:11 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YPvnn-001vWA-45
	for linux-samsung-soc@vger.kernel.org; Mon, 23 Feb 2015 16:24:11 +0000
Content-Disposition: inline
In-Reply-To: <20150223171336.2e09ce50@amdc2363>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, Kamil Debski <k.debski@samsung.com>, Jean Delvare <jdelvare@suse.de>, Kukjin Kim <kgene@kernel.org>, lm-sensors@lm-sensors.org, Linux PM list <linux-pm@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Lukasz Majewski <l.majewski@majess.pl>, Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Abhilash Kesavan <a.kesavan@samsung.com>

On Mon, Feb 23, 2015 at 05:13:36PM +0100, Lukasz Majewski wrote:
> Hi Guenter,
> 
[ ... ]

> > 
> > If devicetree is not configured, of_property_count_elems_of_size
> > returns -ENOSYS, which is returned, causing the driver to fail
> > loading.
> 
> Has of_property_count_elems_of_size() returns -ENOSYS?
> 
> Maybe something has changed, but in my linux-vanila (3.19-rc4)
> at ./drivers/of/base.c it returns -EINVAL, -ENODATA or number of
> elements.
> 
> Have I missed something?
> 
Hi Lukasz,

Yes, you have. Check include/linux/of.h, line 484, in latest mainline.

Guenter

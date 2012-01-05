From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/2] PM / Domains: Add OF support
Date: Thu, 5 Jan 2012 21:12:43 +0530
Message-ID: <CAJuYYwT6bKgqn5y62Pi4Z3wyWq=1HtxtOMOv8kEUZs3kD3HR9g@mail.gmail.com>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
	<201112282317.54291.rjw@sisk.pl>
	<CAJuYYwQp7gfuovd8kKEe_D+ACyq4OafxZRW_G=U_9zCMOy+prA@mail.gmail.com>
	<201201032330.58602.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:34306 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755886Ab2AEPmo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jan 2012 10:42:44 -0500
In-Reply-To: <201201032330.58602.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, patches@linaro.org

Hi Rafael,

On 4 January 2012 04:00, Rafael J. Wysocki <rjw@sisk.pl> wrote:
[...]

>> The 'struct device_node' is a representation of a instance of a device
>> tree node. It can represent nodes that are not devices. Hence, it can
>> be used to represent a power domain in a device tree and also included
>> in the 'struct generic_pm_domain'.
>
> OK, so please address my second comment regarding the $subject patch,
> i.e. that you might add a wrapper around the original
> __pm_genpd_add_device() instead of modifying __pm_genpd_add_device()
> itself.

Thanks. I will prepare and submit the updated patch.

Regards,
Thomas.

>
> Thanks,
> Rafael

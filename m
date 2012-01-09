From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 1/2] PM / Domains: Add OF support
Date: Mon, 9 Jan 2012 18:41:34 +0530
Message-ID: <CAJuYYwSs+PTzhNuS5ZEvr2koD_+DSghKtcvytAd7NbDGm178XA@mail.gmail.com>
References: <1325931055-14486-1-git-send-email-thomas.abraham@linaro.org>
	<1325931055-14486-2-git-send-email-thomas.abraham@linaro.org>
	<201201082223.18603.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:49598 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753550Ab2AINLf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jan 2012 08:11:35 -0500
In-Reply-To: <201201082223.18603.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, patches@linaro.org

Hi Rafael,

2012/1/9 Rafael J. Wysocki <rjw@sisk.pl>:
> On Saturday, January 07, 2012, Thomas Abraham wrote:
>> A device node pointer is added to generic pm domain structure to ass=
ociate
>> the domain with a node in the device tree. The platform code parses =
the
>> device tree to find available nodes representing the generic power d=
omain,
>> instantiates the available domains and initializes them by calling
>> pm_genpd_init().
>>
>> Nodes representing the devices include a phandle of the power domain=
 to
>> which it belongs. As these devices get instantiated, the driver code
>> checkes for availability of a power domain phandle, converts the pha=
ndle
>> to a device node and uses the new pm_genpd_of_add_device() api to
>> associate the device with a power domain.
>>
>> pm_genpd_of_add_device() runs through its list of registered power d=
omains
>> and matches the OF node of the domain with the one specified as the
>> parameter. If a match is found, the device is associated with the ma=
tched
>> domain.
>>
>> Cc: Rafael J. Wysocki <rjw@sisk.pl>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>
> I can take this patch for 3.4, but your [2/2] depends on it, so I'm n=
ot
> sure how to handle that. =A0If you want me to take the other patch to=
o,
> it'll need ACKs from the Exynos maintaniers.

Thanks. There are some comments on the [2/2] patch which I will work
on. I will complete the rework and try to get the ack for the patch.

Regards,
Thomas.

>
> Thanks,
> Rafael

[...]

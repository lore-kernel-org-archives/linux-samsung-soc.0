From: Vasco Steinmetz <linux@kyberraum.net>
Subject: Slow performance of Odroid XU4 - cpufreq-dt patch needed?
Date: Wed, 13 Jan 2016 17:16:33 +0100
Message-ID: <56967861.10305@kyberraum.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from nexus.metro.kyberraum.net ([195.47.195.230]:39745 "EHLO
	mx1.kyberraum.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752725AbcAMQpq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jan 2016 11:45:46 -0500
Received: from pd9f791c7.dip0.t-ipconnect.de ([217.247.145.199] helo=[192.168.0.21])
	by mx1.kyberraum.net with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA:256)
	(Exim 4.85)
	(envelope-from <vasco@kyberraum.net>)
	id 1aJO67-00078s-Qy
	for linux-samsung-soc@vger.kernel.org; Wed, 13 Jan 2016 17:16:36 +0100
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hello,

I'm trying to get an Odroid XU4 to run a more recent (e.g. 4.4+) kernel
than the last semiofficial 4.2 port from hardkernel (which doesn't boot
here at all).

Currently (thanks to a lot of patches from you guys) the board boots
happily with a kernel build from linux-next.

Nonetheless the CPU performance is rather poor, though all 8 cores are
enabled (no b/l switcher).

It seems to me the Cortex A15s are running in their slowest performance
mode (that is: lowest clock).
I don't know a way to read the core clocks, as no cpufreq driver is working.
Tried that also with exynos_defconfig, but with the same effect.


My question therefore is:

Is Bartlomiej's cpufreq-dt patchset for exynos54xx (last update was
mid-December) necessary to obtain the full performance on the 5422?

Unfortunately I can't get that patchset to work with the linux-next from
within the last two weeks.
If there's an update I would volunteer to test it thoroughly (by
compiling Gentoo on it ;) on the XU4.


Another point:

The XU4's SD card controller supports UHS mode (tested by booting the
original ubuntu with an ancient 3.x kernel on the emmc flash and reading
from a UHS SD card), the current linux mainline kernel (4.4+) apparently
doesn't either detect or enable UHS mode. The maximum SD speed is around
20MB/s instead of the 90MB/s the card supports and was shown with the
test above.

Is there patch available (maybe some missing dt clock or flag to enable
UHS)?


Kind regards,
Vasco

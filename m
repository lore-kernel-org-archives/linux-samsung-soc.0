From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v10 1/4] phy: core: Add an exported of_phy_get function
Date: Fri, 07 Mar 2014 20:34:27 +0100
Message-ID: <531A1F43.4020506@math.uni-bielefeld.de>
References: <1394104609-28242-1-git-send-email-k.debski@samsung.com> <1394104609-28242-2-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:42126 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751506AbaCGTec (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 14:34:32 -0500
In-Reply-To: <1394104609-28242-2-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org, stern@rowland.harvard.edu, sander@humilis.net

Kamil Debski wrote:
> Previously the of_phy_get function took a struct device * and
> was declared static. It was impossible to call it from
> another driver and thus it was impossible to get phy defined
> for a given node. The old function was renamed to _of_phy_get
> and was left for internal use. of_phy_get function was added
> and it was exported. The function enables to get a phy for
> a given device tree node.
>
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> ---
>  drivers/phy/phy-core.c  |   45 ++++++++++++++++++++++++++++++++++++---------
>  include/linux/phy/phy.h |    6 ++++++
>  2 files changed, 42 insertions(+), 9 deletions(-)
>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

USB PHY was tested on an ODROID-X2 (Exynos4412 SoC) with patches from
Kamil's previous patchset to enable the usage of the new PHY in EHCI and
OCHI.

With best wishes,
Tobias

From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: exynos boot falures in linux-next
Date: Tue, 18 Nov 2014 00:25:10 +0100
Message-ID: <546A83D6.9060504@collabora.co.uk>
References: <E1XqKYI-0000pQ-4b@ip-10-35-177-41.ec2.internal>	<7hoas54y7k.fsf@deeprootsystems.com> <7hlhn9zcse.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:57533 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751515AbaKQXZV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 18:25:21 -0500
In-Reply-To: <7hlhn9zcse.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@deeprootsystems.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

Hello Kevin,

On 11/17/2014 11:24 PM, Kevin Hilman wrote:
> 
> As might have been expected, reverting the change that enables the
> DRM/display options in exynos_defconfig fixes the problem.
> 
> Kevin
>

I'm sorry for causing a boot failure but when I first posted that patch,
the Exynos DRM driver was working correctly (at least on the Exynos boards
I've access to) so it seems the regression was introduced while the patch
was posted but not yet picked.

I'm not sure what is the correct step in this case but I'm OK with
reverting the patch until the Exynos DRM driver bug is fixed.

Best regards,
Javier

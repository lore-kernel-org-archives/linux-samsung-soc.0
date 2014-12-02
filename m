From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: exynos boot falures in linux-next
Date: Tue, 02 Dec 2014 09:32:16 +0100
Message-ID: <547D7910.3020609@collabora.co.uk>
References: <E1XqKYI-0000pQ-4b@ip-10-35-177-41.ec2.internal> <7hoas54y7k.fsf@deeprootsystems.com> <7hlhn9zcse.fsf@deeprootsystems.com> <546A83D6.9060504@collabora.co.uk> <7hfvdhyxqi.fsf@deeprootsystems.com> <CAMAWPa8D-oRp2yC=n+Rgw_wtwV4+Go0OQi62y3iGRYxi0sow+g@mail.gmail.com> <546CCE2F.8030108@collabora.co.uk> <00ae01d00465$10d9edb0$328dc910$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:48507 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751296AbaLBIcW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Dec 2014 03:32:22 -0500
In-Reply-To: <00ae01d00465$10d9edb0$328dc910$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, 'Kevin Hilman' <khilman@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, 'Olof Johansson' <olof@lixom.net>

Hello Kukjin,

On 11/20/2014 02:55 AM, Kukjin Kim wrote:
>>
> Yeah, it could be a best solution at this moment. Let me revert the commit
> 0ef76aea7a34 ("ARM: exynos_defconfig: Enable options for display panel
> support")
> from -next in samsung tree.
> 

Maybe now that all the issues with the Exynos DRM driver that were causing
boot failures were found and fixed, we can enable these config options again?

After all, the fact that these symbols got enabled is what made the issues
to be detected in the first place so is useful to find regressions earlier.

Best regards,
Javier

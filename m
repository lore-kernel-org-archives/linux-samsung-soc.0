From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Remove old Samsung USB PHY
 configs
Date: Wed, 15 Jul 2015 18:43:43 +0200
Message-ID: <55A68DBF.3070309@osg.samsung.com>
References: <1436395246-17540-1-git-send-email-javier@osg.samsung.com>
 <07fa01d0be1d$4ea7c050$ebf740f0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53015 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752821AbbGOQns (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jul 2015 12:43:48 -0400
In-Reply-To: <07fa01d0be1d$4ea7c050$ebf740f0$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, 'Kevin Hilman' <khilman@linaro.org>, 'Arnd Bergmann' <arnd@arndb.de>, linux-kernel@vger.kernel.org, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

Hello Kukjin,

On 07/14/2015 12:10 PM, Kukjin Kim wrote:
> Javier Martinez Canillas wrote:
>>
>> The old drivers/usb/phy/phy-samsung-usb{2,3} are now deleted since
>> were replaced by newers drivers that use the Generic PHY framework
>> but their Kconfig options were left over in multi_v7_defconfig.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
> Acked-by: Kukjin Kim <kgene@kernel.org>
> 
> I think, this can be handled by arm-soc guy directly.
>

As far as I know, arm-soc maintainers now wanted sub-arch maintainers
to pick the multi_v7_defconfig patches for them and send it as a part
of the SoC specific pull requests.

I just posted another series that includes 2 more multi_v7_defconfig
patches for Exynos [0]. Please let me know if you prefer post to the
arm-soc maintainers instead so I can split the exynos_defconfig part
and the multi_v7_defconfig patches send to arm@kernel.org.

> Thanks,
> Kukjin
>

[0]: http://www.spinics.net/lists/arm-kernel/msg431822.html

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

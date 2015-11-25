From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable NFSv4 client
Date: Wed, 25 Nov 2015 09:12:59 -0300
Message-ID: <5655A5CB.6060106@osg.samsung.com>
References: <1448424815-30192-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:55072 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753010AbbKYMNE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 07:13:04 -0500
In-Reply-To: <1448424815-30192-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Krzysztof,

On 11/25/2015 01:13 AM, Krzysztof Kozlowski wrote:
> NFS client is already enabled (NFS_FS) and by default it enables clients
> for version 2 and 3. Enable explicitly the version 4 client to utilize
> the newer protocol.
> 
> The NFS client is especially useful for testing kernel in automated
> environments (network boot with network file system).
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
--- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

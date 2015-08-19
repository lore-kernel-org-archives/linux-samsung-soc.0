From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable CROS_EC_PROTO for ChromeOS
 EC mfd driver
Date: Wed, 19 Aug 2015 21:28:36 +0200
Message-ID: <55D4D8E4.2090003@osg.samsung.com>
References: <1439881281-22054-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:58586 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751016AbbHST2m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Aug 2015 15:28:42 -0400
In-Reply-To: <1439881281-22054-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Gwendal Grignou <gwendal@chromium.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On 08/18/2015 09:01 AM, Javier Martinez Canillas wrote:
> The ChromeOS mfd driver (MFD_CROS_EC) select the CROS_EC_PROTO config
> symbol because the driver uses some communication helper functions in
> drivers/platform/chrome/cros_ec_proto.c but other drivers depends on
> CROS_EC_PROTO instead. Mixing select and depends can lead to circular
> Kconfig dependencies so the MFD_CROS_EC select should be changed to a
> depends on CROS_EC_PROTO instead.
> 
> But doing so will break git bisect-ability since MFD_CROS_EC will not
> be enabled anymore unless the default configs first explicitly enable
> the CROS_EC_PROTO dependency.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

This patch has been superseded by the "[PATCH 0/6] ChromeOS EC
Kconfig cleanups" series: https://lkml.org/lkml/2015/8/19/194

Please just ignore it.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

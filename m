From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/2] mfd: max77693: Allow building as a module
Date: Tue, 5 Apr 2016 10:02:06 -0400
Message-ID: <5703C55E.1000805@osg.samsung.com>
References: <1459756459-22061-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:33581 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753060AbcDEOCS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Apr 2016 10:02:18 -0400
In-Reply-To: <1459756459-22061-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>

Hello Krzysztof,

On 04/04/2016 03:54 AM, Krzysztof Kozlowski wrote:
> The consumer of max77693 regulators on Trats2 board (samsung-usb2-phy
> driver) supports deferred probing so the max77693 main MFD driver can be
> built now as a module. This gives more flexibility and removes manual
> ordering of init calls.
> 
> Suggested-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

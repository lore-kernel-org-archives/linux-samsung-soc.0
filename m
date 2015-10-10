From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3] i2c: s3c2410: enable RuntimePM before registering to
 the core
Date: Sat, 10 Oct 2015 16:47:45 +0900
Message-ID: <5618C2A1.2030101@samsung.com>
References: <1444461874-2841-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:35845 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751354AbbJJHrv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Oct 2015 03:47:51 -0400
In-Reply-To: <1444461874-2841-1-git-send-email-wsa@the-dreams.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, Wolfram Sang <wsa+renesas@sang-engineering.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

W dniu 10.10.2015 o 16:24, Wolfram Sang pisze:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> The core may register clients attached to this master which may use
> funtionality from the master. So, RuntimePM must be enabled before, otherwise
> this will fail. While here, move drvdata, too.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v2: don't call runtime pm on adaper if it wasn't registered
> 
> Thanks to Krzysztof for testing!
> 
>  drivers/i2c/busses/i2c-s3c2410.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Works good. Error path seems to be working fine as well.

Tested on Odroid-XU3 Lite, on top of next-20151009.
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

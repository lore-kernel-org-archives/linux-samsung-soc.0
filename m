From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v3] i2c: s3c2410: enable RuntimePM before registering
 to the core
Date: Tue, 13 Oct 2015 04:15:21 +0900
Message-ID: <561C06C9.3090501@kernel.org>
References: <1444461874-2841-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48766 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751049AbbJLTP1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 15:15:27 -0400
In-Reply-To: <1444461874-2841-1-git-send-email-wsa@the-dreams.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/10/15 16:24, Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> The core may register clients attached to this master which may use
> funtionality from the master. So, RuntimePM must be enabled before, otherwise
> this will fail. While here, move drvdata, too.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Looks good to me,

Acked-by: Kukjin Kim <kgene@kernel.org>

Thanks,
Kukjin

> ---
> 
> Changes since v2: don't call runtime pm on adaper if it wasn't registered
> 
> Thanks to Krzysztof for testing!
> 
>  drivers/i2c/busses/i2c-s3c2410.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

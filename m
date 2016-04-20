From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 3/3] i2c: s3c2410: Cleanup indentation and comment style
Date: Wed, 20 Apr 2016 10:02:44 -0400
Message-ID: <57178C04.6090109@osg.samsung.com>
References: <1461144292-22141-1-git-send-email-k.kozlowski@samsung.com>
 <1461144292-22141-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:50737 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751783AbcDTOCw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Apr 2016 10:02:52 -0400
In-Reply-To: <1461144292-22141-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 04/20/2016 05:24 AM, Krzysztof Kozlowski wrote:
> Improve the readability by:
>  - fixing indentation,
>  - switching to proper block comments,
>  - removing spurious blank lines,
>  - checkpatch: void function return statements are not generally useful
>  - checkpatch: braces {} are not necessary for any arm of this statement
>  - checkpatch: missing a blank line after declarations
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

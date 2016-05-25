From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v4 3/7] media: s5p-mfc: replace custom reserved memory
 handling code with generic one
Date: Wed, 25 May 2016 12:51:20 -0400
Message-ID: <b5ac3ad0-d262-bbb7-d902-a17a4ce3a37f@osg.samsung.com>
References: <1464096690-23605-1-git-send-email-m.szyprowski@samsung.com>
 <1464096690-23605-4-git-send-email-m.szyprowski@samsung.com>
 <458196c1-806c-4cd6-abf1-f01dd23bff2a@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:44086 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754989AbcEYQve (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2016 12:51:34 -0400
In-Reply-To: <458196c1-806c-4cd6-abf1-f01dd23bff2a@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Uli Middelberg <uli@middelberg.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Marek,

On 05/25/2016 11:42 AM, Javier Martinez Canillas wrote:

[snip]

> 
> I couldn't test this exact patch because my Odroid XU4 died but I've tested
> the previous version and the only difference is that the memory reserve is
> made by index now instead of name, so I think you can add:
> 
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 

And now I also could test v4 of this patch on an Exynos5800 Peach Chromebook.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

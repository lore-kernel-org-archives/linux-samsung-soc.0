From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 3/3] ARM: EXYNOS: delete unneeded of_node_put
Date: Tue, 13 Oct 2015 00:40:36 +0200
Message-ID: <561C36E4.3050804@osg.samsung.com>
References: <1444682596-3065-1-git-send-email-Julia.Lawall@lip6.fr>
 <1444682596-3065-4-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:51360 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752009AbbJLWkp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 18:40:45 -0400
In-Reply-To: <1444682596-3065-4-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>, Russell King <linux@arm.linux.org.uk>
Cc: kernel-janitors@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>

Hello Julia,

On 10/12/2015 10:43 PM, Julia Lawall wrote:
> Device node iterators perform an of_node_put on each iteration, so putting
> an of_node_put before going around to the next iteration results in a
> double put.
> 
> Problem found using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>

Krzysztof sent the same patch yesterday and was already applied:
https://lkml.org/lkml/2015/10/12/688

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

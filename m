From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 18/51] mtd: docg3: use mtd_set_ecclayout() where appropriate
Date: Sat, 06 Feb 2016 22:55:05 +0100
Message-ID: <8737t54i86.fsf@belgarion.home>
References: <1454580434-32078-1-git-send-email-boris.brezillon@free-electrons.com>
	<1454580434-32078-19-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:53892 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752633AbcBFVzQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 6 Feb 2016 16:55:16 -0500
In-Reply-To: <1454580434-32078-19-git-send-email-boris.brezillon@free-electrons.com>
	(Boris Brezillon's message of "Thu, 4 Feb 2016 11:06:41 +0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Josh Wu <josh.wu@atmel.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, punnaiah choudary kalluri <punnaia@xilinx.com>, Priit Laes <plaes@plaes.org>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> Use the mtd_set_ecclayout() helper instead of directly assigning the
> mtd->ecclayout field.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert

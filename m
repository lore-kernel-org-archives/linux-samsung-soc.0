From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v2 1/4] ARM: dts: Add SROMc to Exynos 5410
Date: Wed, 28 Oct 2015 12:39:43 +0300
Message-ID: <003101d11164$93c83b70$bb58b250$@samsung.com>
References: <cover.1445935215.git.p.fedin@samsung.com>
 <91ae80f172192fa4dbc8bf8ee5a9068661592de6.1445935215.git.p.fedin@samsung.com>
 <56302F1F.5090206@samsung.com> <009001d1114f$3c7a1f60$b56e5e20$@samsung.com>
 <56307824.1050302@samsung.com> <563095BE.9050106@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:31138 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932627AbbJ1Jjr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 05:39:47 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWX00JSQC68QH70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 09:39:44 +0000 (GMT)
In-reply-to: <563095BE.9050106@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene@kernel.org>

 Hello!

> There is no offset such as SROM_BC{4,5} at least in these SoC
> manuals. Accordingly I modified size from 0x100 to 0x10.

 0x10 is indeed an offset for SROM_BC3. But, it occupies 4 bytes by itself, and you have to include it, because you are describing
*SIZE* of the region. :)

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia

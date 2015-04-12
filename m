From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/7] ARM: dts: Refactor Exynos5 boards for phandle notation
Date: Sun, 12 Apr 2015 22:07:02 +0200
Message-ID: <2603418.sEMfdEBYRq@wuerfel>
References: <1428841494-20769-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:51878 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751901AbbDLUHn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Apr 2015 16:07:43 -0400
In-Reply-To: <1428841494-20769-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>

On Sunday 12 April 2015 21:24:47 Krzysztof Kozlowski wrote:
> 
> The phandle notation reduces possible mistakes when overriding nodes
> by child board files and reduces duplication of addresses.
> 
> The patchset refactors Exynos5 boards to use the phandle way.
> 
> Tested by comparison of decompiled DTB for each commit.

The patches look fine, but the description is wrong as you are not
using 'phandles' here, you are using 'labels'.

A phandle is a reference to another device node inside of a property,
and while that is normally done using labels like

	interrupt-parent = <&gic>;

you can just as well use the full path in a phandle.

	Arnd

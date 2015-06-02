From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH v4 1/5] ARM: dts: Clean up exynos5410-smdk5410 indentation
Date: Tue, 02 Jun 2015 21:58:55 +0900
Message-ID: <556DA88F.6060609@gmail.com>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de> <1426456834-6308-2-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:35294 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753437AbbFBM7B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 08:59:01 -0400
In-Reply-To: <1426456834-6308-2-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, linux-arm-kernel@lists.infradead.org

W dniu 16.03.2015 o 07:00, Andreas F=C3=A4rber pisze:
> The UART status properties are indented one level too deep, and we wa=
nt
> to derive a device tree for the ODROID-XU. Fix this before it propaga=
tes.
>=20
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Applied to my tree. If Kukjin won't grab it from here, I'll push it
later to Kukjin depending on other pull requests.

Best regards,
Krzysztof

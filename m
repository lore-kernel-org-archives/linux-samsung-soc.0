From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 04/21] ARM: EXYNOS: Register drivers before devices
Date: Tue, 26 May 2015 09:41:19 +0900
Message-ID: <CAJKOXPc7F=qT3UzVJ5cQ+Z+_KkjkJrj8bwOn6=+Heb7nH0PxAw@mail.gmail.com>
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
	<1432565608-26036-5-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f44.google.com ([209.85.216.44]:45523 "EHLO
	mail-vn0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751211AbbEZAlV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 May 2015 20:41:21 -0400
In-Reply-To: <1432565608-26036-5-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <stephane.marchesin@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene@kernel.org>, Grant Likely <grant.likely@linaro.org>, Alexander Holler <holler@ahsoftware.de>

2015-05-25 23:53 GMT+09:00 Tomeu Vizoso <tomeu.vizoso@collabora.com>:
> So devices can be probed on demand, we need to have the drivers already
> registered as we don't have enough information to register a driver on
> demand.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

This is 4/21 but I can't see other patches. I found the cover letter
on samsung-soc list but where is the rest of this?

Best regards,
Krzysztof

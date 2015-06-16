From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] Documentation: ARM: EXYNOS: Describe boot loaders interface
Date: Tue, 16 Jun 2015 16:12:49 -0700
Message-ID: <7hlhfjw8lq.fsf@deeprootsystems.com>
References: <1433585151-3627-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:36171 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753125AbbFPXMx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Jun 2015 19:12:53 -0400
Received: by pabqy3 with SMTP id qy3so21424239pab.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jun 2015 16:12:52 -0700 (PDT)
In-Reply-To: <1433585151-3627-1-git-send-email-k.kozlowski.k@gmail.com>
	(Krzysztof Kozlowski's message of "Sat, 6 Jun 2015 19:05:51 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Krzysztof Kozlowski <k.kozlowski.k@gmail.com> writes:

> Various boot loaders for Exynos based boards use certain memory
> addresses during booting for different purposes. Mostly this is one of
> following :
> 1. as a CPU boot address,
> 2. for storing magic cookie related to low power mode (AFTR, sleep).
>
> The document, based solely on kernel source code, tries to group the
> information scattered over different files. This would help in the
> future when adding support for new SoC or when extending features
> related to low power modes.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Very nice, thank you for taking the time to pull all of this together
into one location.

Kevin

From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: s3c64xx: use "depends on" instead of "if" after prompt
Date: Mon, 25 Jan 2016 21:13:11 +0900
Message-ID: <CAJKOXPeyNtBVusQZUKRoBniyWTLMZiAB69KLYkAGxLmy6tfhCg@mail.gmail.com>
References: <1453722089-23101-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35183 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755781AbcAYMNL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jan 2016 07:13:11 -0500
In-Reply-To: <1453722089-23101-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>

2016-01-25 20:41 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This platform recently moved to multi-platform, so missed the global
> fixup by commit e32465429490 ("ARM: use "depends on" for SoC configs
> instead of "if" after prompt").  Fix it now.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  arch/arm/mach-s3c64xx/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks for the patch. In case it goes through Kukjin's tree:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

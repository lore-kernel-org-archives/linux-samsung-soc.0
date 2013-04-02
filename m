From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 07/23] i2c: s3c2410: make header file local
Date: Tue, 2 Apr 2013 22:36:32 +0200
Message-ID: <201304022236.32629.heiko@sntech.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de> <1362505353-8873-8-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38473 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761463Ab3DBUgc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 16:36:32 -0400
In-Reply-To: <1362505353-8873-8-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

Am Dienstag, 5. M=C3=A4rz 2013, 18:42:17 schrieb Arnd Bergmann:
> No other file in the kernel besides i2c-s3c2410.c uses
> the current plat/regs-iic.h, so we can simply move the
> header file to live in the same directory as the driver,
> as a preparation to multiplatform builds.

A patch doing the same is already sitting in the i2c for-next branch [0=
].


Heiko



[0] https://git.kernel.org/cgit/linux/kernel/git/wsa/linux.git/commit/?=
h=3Di2c/for-next&id=3De636602ac2613da8c1777cb42443223994be4107

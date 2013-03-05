From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/23] RFC: exynos multiplatform support
Date: Tue, 5 Mar 2013 22:21:03 +0000
Message-ID: <201303052221.03250.arnd@arndb.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de> <201303052154.22857.arnd@arndb.de> <681263925.o7yR7PPoHR@flatron>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:65026 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754796Ab3CEWVU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 17:21:20 -0500
In-Reply-To: <681263925.o7yR7PPoHR@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Tuesday 05 March 2013, Tomasz Figa wrote:
> AFAIR, the PL080 in S3C64xx is a slightly customized variant and requires 
> some modifications to the driver. However I'm saying this only based on 
> what I remember from the past, as I haven't checked current version of the 
> driver yet, so it's possible that it has been modified already.
> 
> I believe I will eventually have to take a look at it anyway, as it's a 
> necessary step towards S3C64xx DT support.

Ok. Let me know if you need any help adding DT support to the pl08x driver.
It would be nice to have that for SPEAr, Versatile and lpce32xx as well.

All three currently have full DT support except for the DMA binding,
since the common code for that was only added in 3.9-rc1.

	Arnd

From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] ARM: Exynos: Use generic uncompress.h
Date: Mon, 6 Jan 2014 16:49:36 +0100
Message-ID: <201401061649.36364.arnd@arndb.de>
References: <1388998975-32362-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:54230 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335AbaAFPuD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jan 2014 10:50:03 -0500
In-Reply-To: <1388998975-32362-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On Monday 06 January 2014, Sachin Kamat wrote:
> As a pre-requisite step towards enabling multi-platform support
> for Exynos, enable it to use generic uncompress.h instead of the
> one provided in machine code.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Both patches

Acked-by: Arnd Bergmann <arnd@arndb.de>

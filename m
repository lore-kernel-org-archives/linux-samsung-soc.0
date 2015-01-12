From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v3] ARM: dts: Add dts file for odroid XU3 board
Date: Mon, 12 Jan 2015 17:37:59 +0900
Message-ID: <54B387E7.3080406@kernel.org>
References: <1420671228-24692-1-git-send-email-sjoerd.simons@collabora.co.uk> <7htwzzvq0v.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:60900 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341AbbALIiI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jan 2015 03:38:08 -0500
In-Reply-To: <7htwzzvq0v.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Tyler Baker <tyler.baker@linaro.org>, Heesub Shin <heesub.shin@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org

On 01/10/15 02:10, Kevin Hilman wrote:
> Sjoerd Simons <sjoerd.simons@collabora.co.uk> writes:
> 
>> Add DTS for the Hardkernel Odroid XU3. The name of the DTS file is kept the
>> same as the vendors naming, which means it's prefixed with exynos5422
>> instead of exynos5800 as the SoC name even though it includes the
>> exyno5800 dtsi.
>>
>> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> 
> Boot tested on top of next-20150109 (with and without my hack for
> bringing up 8 cores.)
> 
> Tested-by: Kevin Hilman <khilman@linaro.org>
> 
Thanks for your test, Kevin.

I've applied, need to update devicetree bindings for samsung-boards
though because it can be updated later.

Thanks,
Kukjin

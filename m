From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: fix the clock-frequency of rinato board's
 panel
Date: Sat, 13 Jun 2015 15:15:01 +0900
Message-ID: <557BCA65.8090806@samsung.com>
References: <1434103610-24182-1-git-send-email-human.hwang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:33378 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750725AbbFMGPJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Jun 2015 02:15:09 -0400
In-Reply-To: <1434103610-24182-1-git-send-email-human.hwang@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hyungwon Hwang <human.hwang@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, inki.dae@samsung.com
Cc: stable@vger.kernel.org, sw0312.kim@samsung.com, jy0922.shim@samsung.com

W dniu 12.06.2015 o 19:06, Hyungwon Hwang pisze:
> After the commit abc0b1447d4974963548777a5ba4a4457c82c426
> ("drm: Perform basic sanity checks on probed modes"), proper
> clock-frequency becomes mandatory for validating the mode of panel.
> The display does not work if there is no mode validated. Also, this
> clock-frequency must be set appropriately for getting required frame
> rate.
> 
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>

Thanks for updating the commit message, description now looks fine.

But please indicate stable backporting properly, like in commit 242ddf0429.
Just add cc and fixes tags to commit message and send with git send-email.

Best regards,
Krzysztof

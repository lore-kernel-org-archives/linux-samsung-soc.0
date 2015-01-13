From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/2] arm: dts: disable CCI on exynos420 based arndale-octa
Date: Mon, 12 Jan 2015 18:05:48 -0800
Message-ID: <20150113020548.GC28758@quad.lixom.net>
References: <1420859496-27533-1-git-send-email-a.kesavan@samsung.com>
 <1420859496-27533-2-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f181.google.com ([209.85.160.181]:62460 "EHLO
	mail-yk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752419AbbAMCFi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jan 2015 21:05:38 -0500
Received: by mail-yk0-f181.google.com with SMTP id 142so186878ykq.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2015 18:05:37 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1420859496-27533-2-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, arm@kernel.org, arnd@arndb.de, khilman@kernel.org, linux-samsung-soc@vger.kernel.org, kesavan.abhilash@gmail.com, sudeep.holla@arm.com, nicolas.pitre@linaro.org, Punit.Agrawal@arm.com, Will.Deacon@arm.com, Mark.Rutland@arm.com, k.kozlowski@samsung.com

On Sat, Jan 10, 2015 at 08:41:36AM +0530, Abhilash Kesavan wrote:
> The arndale-octa board was giving "imprecise external aborts" during
> boot-up with MCPM enabled. CCI enablement of the boot cluster was found
> to be the cause of these aborts (possibly because the secure f/w was not
> allowing it). Hence, disable CCI for the arndale-octa board.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Tested-by: Kevin Hilman <khilman@linaro.org>
> Tested-by: Tyler Baker <tyler.baker@linaro.org>

Applied 1-2 to fixes for 3.19.

Fixed two typos (arm->ARM in subject, and 420->5420).


Thanks,

-Olof

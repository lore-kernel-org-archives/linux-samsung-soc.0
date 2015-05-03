From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] i2c: s3c2410: fix oops in suspend callback for non-dt platforms
Date: Mon, 4 May 2015 08:50:22 +0900
Message-ID: <CAJKOXPd71vnup-RZYAh7UM2Tky2M64tA=u0Ydy=ti0yOC6h5aQ@mail.gmail.com>
References: <1430676790-30500-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f43.google.com ([209.85.216.43]:34755 "EHLO
	mail-vn0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181AbbECXuX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 May 2015 19:50:23 -0400
In-Reply-To: <1430676790-30500-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org

2015-05-04 3:13 GMT+09:00 Vasily Khoruzhick <anarsoul@gmail.com>:
> Initialize sysreg by default, otherwise driver will crash in suspend callback.
>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

I think the crash is possible if device node is missing in DT or pdata
is supplied. If you agree, could you add this information to commit
message, along with Cc-stable and Fixes tag?

Anyway, the patch itself looks good:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

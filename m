From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 0/2] 3rd Round Samsung stuff for v3.12
Date: Wed, 28 Aug 2013 09:58:23 +0900
Message-ID: <235001cea389$b2059380$1610ba80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42895 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753051Ab3H1A6a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 20:58:30 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MS7000OWUP9JSG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Aug 2013 09:58:22 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Mike Turquette' <mturquette@linaro.org>

Hi Arnd, Olof and Kevin,

Sorry for a bit late pull-request.

Here is s3c64xx DT series and common clk stuff. It took some time due to
dependency problem with the clk tree, and fixed now by merge clk-s3c64xx
branch in Mike's clk tree. So many clock patches are included in 1st
pull-request but most of them are for Samsung clk stuff.

So I think, this branches would be sent to mainline after clk stuff during
merge window. Anyway, Tomasz's s3c64xx patches have been posted long time
and look nice to support for s3c64xx with DT.

If any problems, please kindly let me know.

Thanks,
Kukjin

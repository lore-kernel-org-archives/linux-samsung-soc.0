From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v6 01/16] clk: samsung: add common clock framework helper
 functions for Samsung platforms
Date: Sat, 09 Mar 2013 18:15:08 +0900
Message-ID: <042a01ce1ca6$98912140$c9b363c0$%kim@samsung.com>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
 <201303030208.49722.heiko@sntech.de> <51333149.1060105@gmail.com>
 <2984153.Xctncej7hL@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62149 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757532Ab3CIJPL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Mar 2013 04:15:11 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJD00E06Z196PB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Mar 2013 18:15:09 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJD00EJBZ18B950@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Mar 2013 18:15:09 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, devicetree-discuss@lists.ozlabs.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, t.figa@samsung.com

Kukjin Kim wrote:

[...]

Thomas,

As I said, I applied this whole series into Samsung tree, following error
happens with exynos4_defconfig(non-DT) though.

drivers/clk/samsung/clk.c: In function 'samsung_clk_of_register_fixed_ext':
drivers/clk/samsung/clk.c:251:2: error: implicit declaration of function
'for_each_matching_node_and_match' [-Werror=implicit-function-declaration]
drivers/clk/samsung/clk.c:251:60: error: expected ';' before '{' token
drivers/clk/samsung/clk.c:249:6: warning: unused variable 'freq'
[-Wunused-variable]
cc1: some warnings being treated as errors
make[3]: *** [drivers/clk/samsung/clk.o] Error 1
make[2]: *** [drivers/clk/samsung] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [drivers/clk] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [drivers] Error 2
make: *** Waiting for unfinished jobs....

I think, it's time to decide to support non-DT exynos continuously, above
compilation error can be fixed though.

Hey guys, how do you think?

- Kukjin

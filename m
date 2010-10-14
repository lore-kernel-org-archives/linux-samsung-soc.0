From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 1/2] ARM: S5PV210: Add i2c information to Goni and
 Aquila board
Date: Thu, 14 Oct 2010 15:12:05 +0900
Message-ID: <007501cb6b66$bb12f890$3138e9b0$%kim@samsung.com>
References: <4CB66396.8010004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11230 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754588Ab0JNGLr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Oct 2010 02:11:47 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA900FLINVLGO30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 15:11:45 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA9007JQNVL3D@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 15:11:45 +0900 (KST)
In-reply-to: <4CB66396.8010004@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Ben Dooks' <ben-linux@fluff.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

Chanwoo Choi wrote:
> 
> This patch the I2C board information for the WM8994 used in the Goni/Aquila
> as audio codec and adds the I2C platform drivers.
> 
> Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by : Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>
               ^
Should be removed above white space like following.
"Signed-off-by: abc <abc@xxx.com>"

Next time, it would be helpful to me if you could re-work based on my tree such as 'for-next'.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

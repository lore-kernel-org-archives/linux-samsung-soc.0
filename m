From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] ARM: S5PV310: Add I2C support
Date: Tue, 12 Oct 2010 09:14:01 +0900
Message-ID: <00ef01cb69a2$620515f0$260f41d0$%kim@samsung.com>
References: <1286450132-7985-1-git-send-email-jongsun.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29278 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754778Ab0JLANp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Oct 2010 20:13:45 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA500KDXHYV1I20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Oct 2010 09:13:43 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA50073NHYVDT@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Oct 2010 09:13:44 +0900 (KST)
In-reply-to: <1286450132-7985-1-git-send-email-jongsun.han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jongsun Han' <jongsun.han@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Jongsun Han wrote:
> 
> This patch adds the I2C support for S5PV310
> 
> [PATCH 1/3] ARM: SAMSUNG: Add a helper function for I2C(3,4,5,6,7)
platform
> devices
> [PATCH 2/3] ARM: S5PV310: Add address and IRQ definitions for
I2C(1,2,3,4,5,6,7)
> [PATCH 3/3] ARM: S5PV310: Add I2C(0,1,3,4,5,6,7) support

Hello Jongsun,

Thanks for your patch.
But we have not enough time to update/discuss it for 37 merge window.
So right now, I applied Kyungmin and Marek's old style I2C patches for many
I2C channels on S5PV310/S5PC210.

But I also hope to change its style to better something and will review your
patches soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

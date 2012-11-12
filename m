From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C64XX: Remove duplicated camera clock
Date: Mon, 12 Nov 2012 14:02:07 +0900
Message-ID: <004901cdc092$dd91a3c0$98b4eb40$%kim@samsung.com>
References: <509e602f.a766980a.0f91.14f4@mx.google.com>
 <509EC5C1.2000901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35804 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750709Ab2KLFCM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 00:02:12 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDC005BMZ9BORG0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 14:02:08 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDC00A22ZBJQRB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 14:02:07 +0900 (KST)
In-reply-to: <509EC5C1.2000901@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, dron0gus@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Andrey Gusakov' <dron_gus@mail.ru>

Sylwester Nawrocki wrote:
> 
> On 11/10/2012 03:07 PM, dron0gus@gmail.com wrote:
> > From: Andrey Gusakov<dron_gus@mail.ru>
> >
> > Camera clock defined two times. One in init_clocks_off array with
> > "cam" name, second in clksrcs array with "camera" name. Leave
> > second definition because clock have divider.
> >
> > Signed-off-by: Andrey Gusakov<dron0gus@gmail.com>
> 
> Reviewed-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

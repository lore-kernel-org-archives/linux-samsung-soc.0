From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2] ARM: EXYNOS: add Exynos3250 PMU support
Date: Wed, 09 Jul 2014 14:42:25 +0200
Message-ID: <1640080.ftkUyQnINn@amdc1032>
References: <2933359.zRXLcIi25R@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:53644 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932094AbaGIMmn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 08:42:43 -0400
In-reply-to: <2933359.zRXLcIi25R@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Vikas Sajjan <vikas.sajjan@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Wednesday, July 09, 2014 02:39:14 PM Bartlomiej Zolnierkiewicz wrote:
> This is needed for suspend/resume and cpuidle AFTR mode support.
> 
> Cc: Pankaj Dubey <pankaj.dubey@samsung.com>
> Cc: Vikas Sajjan <vikas.sajjan@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---

Changelog for v2:

- rebased on top of next-20140708 and
  http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg32410.html
  http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg33660.html
  http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg33675.html

  this patchset also applies fine after/before Exynos5800 PMU support:
  http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg33835.html

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

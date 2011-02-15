From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: S5PV210: Add GONI board setup for CIF camera
 support
Date: Tue, 15 Feb 2011 14:50:09 +0900
Message-ID: <008d01cbccd4$3897da00$a9c78e00$%kim@samsung.com>
References: <1297445273-3829-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10210 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752023Ab1BOFuV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Feb 2011 00:50:21 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LGN00HY89JRLN20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 14:50:15 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LGN00EY79JQLY@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 14:50:15 +0900 (KST)
In-reply-to: <1297445273-3829-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com

Sylwester Nawrocki wrote:
> 
> Hello,
> 
Hi,

> the following patch series introduces changes in GONI board setup file
> required for the CIF camera sensor driver.
> The first patch adds the I2C0 bus driver, the second one adds the
regulator
> supply definitions and the third one just increases virtual size
> of the framebuffer window 0 to enable double-buffering.
> The added regulator supplies are also a subset of the supplies of the high
> resolution camera which that reference board is equipped with.
> 
> Changes since v1:
>  - removed unnecessary "select CONFIG_S3C_DEV_I2C0"
> 
> 
> The patch series contains:
> 
> [PATCH 1/3] ARM: S5PV210: Enable I2C0 bus on GONI board
> [PATCH 2/3] ARM: S5PV210: Add supplies for CIF camera on GONI board
> [PATCH 3/3] ARM: S5PV210: Change framebuffer window 0 size on GONI
> 
> Created against for-next branch at:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> 
Hmm...looks you don't want to follow my suggestion on 2nd patch.

I'm still wondering why array is needed for just one member in
regulator_consumer_supply structure now even though other something will be
added later.

Nevertheless will apply your 3 patches but if not required array will be
removed later.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

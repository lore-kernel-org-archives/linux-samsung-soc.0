From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/5] Samsung S3C24XX updates for 3.16
Date: Wed, 21 May 2014 22:29:28 -0700
Message-ID: <20140522052928.GE32618@quad.lixom.net>
References: <014401cf73c8$3d485e00$b7d91a00$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:62830 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750873AbaEVF3T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 01:29:19 -0400
Received: by mail-pb0-f52.google.com with SMTP id rr13so2161098pbb.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 22:29:18 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <014401cf73c8$3d485e00$b7d91a00$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Heiko Stuebner' <heiko@sntech.de>

On Tue, May 20, 2014 at 10:10:07AM +0900, Kukjin Kim wrote:
> The following changes since commit c9eaa447e77efe77b7fa4c953bd62de8297fd6c5:
> 
>   Linux 3.15-rc1 (2014-04-13 14:18:35 -0700)
> 
> are available in the git repository at:
> 
>   http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/s3c24xx-clk
> 
> for you to fetch changes up to 34c453ce16633539a94a2e876faeb731ac1be899:
> 
>   ARM: S3C24XX: fix merge conflict (2014-05-15 05:54:38 +0900)
> 
> ----------------------------------------------------------------
> Samsung S3C24XX to use the common clock framework
> - S3C2412, S3C2413, S3C2416 and S3C2443 to use CCF
> - S3C2410, S3C2440, S3C2442 to use CCF
> - Remove legacy samsung clock from mach-s3c24xx/
> 
> - Some of them are missed from previous pull-request
> - Clock related sutff got ack from Mike and Tomasz
> - Created the last commit due to missing changes
>   during re-sorting because this branch is provided
>   as a base to samsung clk tree.

Merged into next/cleanup. Thanks.


-Olof

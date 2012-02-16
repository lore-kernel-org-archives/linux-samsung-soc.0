From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 4/4] ARM: SAMSUNG: move the mmc platdata header file to
 linux/mmc/
Date: Thu, 16 Feb 2012 21:56:32 +0900
Message-ID: <4F3CFD00.6020909@samsung.com>
References: <4F39EB0D.90905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:55099 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751323Ab2BPM4j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 07:56:39 -0500
In-Reply-To: <4F39EB0D.90905@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Chris Ball <cjb@laptop.org>, Kyungmin Park <kyungmin.park@samsung.com>, 'kgene kim' <kgene.kim@samsung.com>

On 02/14/12 14:03, Jaehoon Chung wrote:
>
> Signed-off-by: Jaehoon Chung<jh80.chung@samsung.com>
> Signed-off-by: Kyungmin-park<kyungmin.park@samsung.com>
> ---
>   arch/arm/plat-samsung/include/plat/sdhci.h |   59 +-------------------
>   include/linux/mmc/sdhci-s3c.h              |   84 ++++++++++++++++++++++++++++
>   2 files changed, 85 insertions(+), 58 deletions(-)
>   create mode 100644 include/linux/mmc/sdhci-s3c.h
>
Hi,

I don't agree with this.
Basically, the components(struct s3c_sdhci_platdata and some enums) you 
moved here are just for platform data on each board in arch/arm/.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 0/4] [SCSI] ufs: Adds glue drivers to ufshcd
Date: Fri, 13 Jul 2012 15:45:28 +0000
Message-ID: <201207131545.28877.arnd@arndb.de>
References: <1342188465-20239-1-git-send-email-vinholikatti@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:60894 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753966Ab2GMPpm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 11:45:42 -0400
In-Reply-To: <1342188465-20239-1-git-send-email-vinholikatti@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinayak Holikatti <vinholikatti@gmail.com>
Cc: James.Bottomley@hansenpartnership.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, santoshsy@gmail.com, arnd@linaro.org, girish.shivananjappa@linaro.org, saugata.das@linaro.org, vishak.g@samsung.com, venkat@linaro.org, k.rajesh@samsung.com, dsaxena@linaro.org, ilho215.lee@samsung.com, nala.la@samsung.com, sreekumar.c@samsung.com

On Friday 13 July 2012, Vinayak Holikatti wrote:
> This patch set adds following features
>  - Seprates PCI specific code from ufshcd.c to make it as core
>  - Adds PCI glue driver ufshcd-pci.c
>  - Adds Platform glue driver ufshcd-pltfrm.c
>  - Update correct transfer size in Command UPIU

Acked-by: Arnd Bergmann <arnd@arndb.de>

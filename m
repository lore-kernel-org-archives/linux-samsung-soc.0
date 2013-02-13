From: vinayak holikatti <vinholikatti@gmail.com>
Subject: Re: [PATCH V6 0/4] [SCSI] ufs: Adds glue drivers to ufshcd
Date: Wed, 13 Feb 2013 09:11:25 +0530
Message-ID: <CAKVbJB8=HU=Rc7u2siKSQmKQf461=dz0v-k2Ww6XMZdUBTQkcA@mail.gmail.com>
References: <511137ce.0657420a.5b57.ffffa7db@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:32868 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752329Ab3BMDl0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 22:41:26 -0500
In-Reply-To: <511137ce.0657420a.5b57.ffffa7db@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: james.bottomley@hansenpartnership.com
Cc: linux-scsi@vger.kernel.org, santoshsy@gmail.com, patches@linaro.org, linux-samsung-soc@vger.kernel.org, arnd@linaro.org, venkat@linaro.org, subhashj@codeaurora.org, sthumma@codeaurora.org, vinholikatti@gmail.com

Hi James,

look like these patches are fine. Can you please integrate these
patches in your tree.


On Tue, Feb 5, 2013 at 10:17 PM,  <vinholikatti@gmail.com> wrote:
> From: Vinayak Holikatti <vinholikatti@gmail.com>
>
> This patch set adds following features
>  - Seggregate PCI specific code in ufshcd.c and corrected copyright
>  - Adds PCI glue driver ufshcd-pci.c and ufshcd.c become core module
>  - Adds Platform glue driver ufshcd-pltfrm.c
>  - Update correct transfer size in Command UPIU
>
> Vinayak Holikatti (4):
>   [SCSI] drivers/scsi/ufs: Seggregate PCI Specific Code
>   [SCSI] drivers/scsi/ufs: Separate PCI code into glue driver
>   [SCSI] ufs: Add Platform glue driver for ufshcd
>   [SCSI] ufs: Correct the expected data transfersize
>
>  drivers/scsi/ufs/Kconfig         |   87 +++++---
>  drivers/scsi/ufs/Makefile        |    2 +
>  drivers/scsi/ufs/ufs.h           |   44 ++---
>  drivers/scsi/ufs/ufshcd-pci.c    |  211 +++++++++++++++++++
>  drivers/scsi/ufs/ufshcd-pltfrm.c |  217 +++++++++++++++++++
>  drivers/scsi/ufs/ufshcd.c        |  426 ++++++++------------------------------
>  drivers/scsi/ufs/ufshcd.h        |  202 ++++++++++++++++++
>  drivers/scsi/ufs/ufshci.h        |   44 ++---
>  8 files changed, 811 insertions(+), 422 deletions(-)
>  create mode 100644 drivers/scsi/ufs/ufshcd-pci.c
>  create mode 100644 drivers/scsi/ufs/ufshcd-pltfrm.c
>  create mode 100644 drivers/scsi/ufs/ufshcd.h
>
> --
> 1.7.5.4
>

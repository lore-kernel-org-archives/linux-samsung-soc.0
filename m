From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH v3] S3C: ide: Add Samsung S3C IDE controller driver
Date: Wed, 14 Oct 2009 23:25:41 +0200
Message-ID: <87ljjd1xd6.fsf@macbook.be.48ers.dk>
References: <1255507847-5401-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.153]:16158 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750746AbZJNV1f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Oct 2009 17:27:35 -0400
Received: by fg-out-1718.google.com with SMTP id 16so146783fgg.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2009 14:25:46 -0700 (PDT)
In-Reply-To: <1255507847-5401-1-git-send-email-thomas.ab@samsung.com> (Thomas Abraham's message of "Wed\, 14 Oct 2009 17\:10\:47 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Abhilash Kesavan <a.kesavan@samsung.com>

>>>>> "Thomas" == Thomas Abraham <thomas.ab@samsung.com> writes:

Hi,

 Thomas> diff --git a/drivers/ide/Kconfig b/drivers/ide/Kconfig
 Thomas> index 9a5d0aa..f6a728f 100644
 Thomas> --- a/drivers/ide/Kconfig
 Thomas> +++ b/drivers/ide/Kconfig
 Thomas> @@ -292,6 +292,26 @@ config BLK_DEV_IDEPNP
 Thomas>  	  would like the kernel to automatically detect and activate
 Thomas>  	  it, say Y here.
 
 Thomas> +config BLK_DEV_IDE_S3C
 Thomas> +        tristate "Samsung S3C IDE Controller"
 Thomas> +	depends on PLAT_S3C64XX
 Thomas> +        help
 Thomas> +          Say Y here if you want to support using CF controller on SMDK(Samsung)
 Thomas> +	  development board. It will be configured for true IDE mode.
 
Indentation is wrong. Kconfig files are indented with a <tab> (and help
text with <tab><space><space>).

-- 
Bye, Peter Korsgaard

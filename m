From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 3/4] mmc: sdhci-s3c: use the sdhci-s3c.h instead of regs-sdhci.h
Date: Thu, 16 Feb 2012 21:49:38 +0900
Message-ID: <4F3CFB62.5030604@samsung.com>
References: <4F39EB0C.1080003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <4F39EB0C.1080003@samsung.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Chris Ball <cjb@laptop.org>, Kyungmin Park <kyungmin.park@samsung.com>, 'kgene kim' <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 02/14/12 14:03, Jaehoon Chung wrote:
> Use the sdhci-s3c.h
>
This patch should be merged into 2nd patch which is including change the 
name to S3C_SDHCI_xxx from S3C64Xx_SDHCI_xxx. BTW, I'm not sure the name 
should/can be changed because as you know S3C64XX_ means this can be 
used after S3C64XX or just for S3C64XX, so need to check data sheet of 
SDHCI part for S3C24XX and S3C64XX and later.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

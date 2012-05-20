From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 01/10] spi: s3c64xx: remove unused S3C64XX_SPI_ST_TRLCNTZ macro
Date: Sat, 19 May 2012 22:41:50 -0600
Message-ID: <20120520044150.634053E03B8@localhost>
References: <1336514694-22393-1-git-send-email-thomas.abraham@linaro.org> <1336514694-22393-2-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:58747 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750809Ab2ETElw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 May 2012 00:41:52 -0400
Received: by pbbrp8 with SMTP id rp8so5557965pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 May 2012 21:41:52 -0700 (PDT)
In-Reply-To: <1336514694-22393-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>, spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, kgene.kim@samsung.com, jaswinder.singh@linaro.org

On Wed, 09 May 2012 03:34:45 +0530, Thomas Abraham <thomas.abraham@linaro.org> wrote:
> The macro S3C64XX_SPI_ST_TRLCNTZ is not used and hence it is removed.
> 
> Cc: Jaswinder Singh <jaswinder.singh@linaro.org>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

Since this series has dependencies, I'm fine with it going via another
tree.

g.

From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 1/5] DMA: PL330: Add new pl330 filter for DT case.
Date: Wed, 6 Feb 2013 09:00:26 +0000
Message-ID: <201302060900.26986.arnd@arndb.de>
References: <1360131529-2847-1-git-send-email-padma.v@samsung.com> <1360131529-2847-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:60933 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751323Ab3BFJAl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 04:00:41 -0500
In-Reply-To: <1360131529-2847-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org

On Wednesday 06 February 2013, Padmavathi Venna wrote:
> 
> This patch adds a new pl330_dt_filter for DT case to filter the
> required channel based on the new filter params and modifies the
> old filter only for non-DT case as suggested by Arnd Bergmann.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

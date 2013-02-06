From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 5/5] ARM: SAMSUNG: dma: Remove unnecessary code
Date: Wed, 6 Feb 2013 09:00:45 +0000
Message-ID: <201302060900.45462.arnd@arndb.de>
References: <1360131529-2847-1-git-send-email-padma.v@samsung.com> <1360131529-2847-6-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:57025 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751268Ab3BFJBE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 04:01:04 -0500
In-Reply-To: <1360131529-2847-6-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org

On Wednesday 06 February 2013, Padmavathi Venna wrote:
> 
> This patch removes the usage of DMACH_DT_PROP and dt_dmach_prop
> from dma code as the new generic dma dt binding support has been
> added.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>


Acked-by: Arnd Bergmann <arnd@arndb.de>

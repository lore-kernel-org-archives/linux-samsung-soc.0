From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/4] soc: samsung: pm_domains for v4.11
Date: Thu,  2 Feb 2017 20:30:05 +0200
Message-ID: <20170202183008.23500-2-krzk@kernel.org>
References: <20170202183008.23500-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:34828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751568AbdBBSa0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Feb 2017 13:30:26 -0500
In-Reply-To: <20170202183008.23500-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

Hi,

Minor improvements of PM domain driver.

Best regards,
Krzysztof


The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88:

  Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-soc-pm-domains-4.11

for you to fetch changes up to b13b2330aab53af4ebaa2859f72f2c802d01abad:

  soc: samsung: pm_domains: Read domain name from the new label property (2017-01-31 21:30:07 +0200)

----------------------------------------------------------------
Improve the PM domains driver for Exynos by displaying a user-friendly name of
power domain.  Till now, the name of node from DT was used which mostly is just
"power-domain".  We need more than that.

----------------------------------------------------------------
Marek Szyprowski (4):
      soc: samsung: pm_domains: Use full names in subdomains registration log
      soc: samsung: pm_domains: Remove unused name field
      soc: samsung: pm_domains: Remove message about failed memory allocation
      soc: samsung: pm_domains: Read domain name from the new label property

 .../devicetree/bindings/power/pd-samsung.txt       |  4 ++++
 drivers/soc/samsung/pm_domains.c                   | 24 +++++++++++++---------
 2 files changed, 18 insertions(+), 10 deletions(-)

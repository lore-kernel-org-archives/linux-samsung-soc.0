From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: [media] exynos4-is: Add support for asynchronous subdevices
 registration
Date: Fri, 4 Apr 2014 14:13:36 +0300
Message-ID: <20140404111336.GA17652@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:34503 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752336AbaDDLNw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 07:13:52 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com
Cc: linux-samsung-soc@vger.kernel.org

Hello Sylwester Nawrocki,

This is a semi-automatic email about new static checker warnings.

The patch fa91f1056f17: "[media] exynos4-is: Add support for 
asynchronous subdevices registration" from Feb 24, 2014, leads to the 
following Smatch complaint:

drivers/media/platform/exynos4-is/media-dev.c:1206 __fimc_md_set_camclk()
	 warn: variable dereferenced before check 'fmd' (see line 1203)

drivers/media/platform/exynos4-is/media-dev.c
  1202		 */
  1203		if (fmd->pdev->dev.of_node)
                    ^^^^^^^^^
Patch adds a dereference.

  1204			return 0;
  1205	
  1206		if (WARN_ON(si->clk_id >= FIMC_MAX_CAMCLKS) || !fmd || !fmd->pmf)
                                                               ^^^^
Old check.

  1207			return -EINVAL;
  1208	

regards,
dan carpenter

From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: [media] exynos4-is: Add Exynos5250 SoC support to fimc-lite
 driver
Date: Wed, 21 Aug 2013 11:52:41 +0300
Message-ID: <20130821085241.GA7574@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:46452 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751498Ab3HUIwn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Aug 2013 04:52:43 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com
Cc: linux-samsung-soc@vger.kernel.org

Hello Sylwester Nawrocki,

This is a semi-automatic email about new static checker warnings.

The patch 086eca2905d0: "[media] exynos4-is: Add Exynos5250 SoC 
support to fimc-lite driver" from Jun 14, 2013, leads to the 
following Smatch complaint:

drivers/media/platform/exynos4-is/fimc-lite.c:1521 fimc_lite_probe()
	 error: we previously assumed 'dev->of_node' could be null (see line 1511)

drivers/media/platform/exynos4-is/fimc-lite.c
  1510	
  1511		if (dev->of_node) {
                    ^^^^^^^^^^^^
Existing check.

  1512			of_id = of_match_node(flite_of_match, dev->of_node);
  1513			if (of_id)
  1514				drv_data = (struct flite_drvdata *)of_id->data;
  1515			fimc->index = of_alias_get_id(dev->of_node, "fimc-lite");
  1516		}
  1517	
  1518		if (!drv_data || fimc->index >= drv_data->num_instances ||
  1519							fimc->index < 0) {
  1520			dev_err(dev, "Wrong %s node alias\n",
  1521						dev->of_node->full_name);
                                                ^^^^^^^^^^^^^^
Patch adds this dereference.

  1522			return -EINVAL;
  1523		}

regards,
dan carpenter

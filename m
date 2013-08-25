From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [media] exynos4-is: Add Exynos5250 SoC support to fimc-lite driver
Date: Sun, 25 Aug 2013 15:30:17 +0200
Message-ID: <521A06E9.7010100@gmail.com>
References: <20130821085241.GA7574@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62996 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753603Ab3HYNaV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Aug 2013 09:30:21 -0400
Received: by mail-ee0-f46.google.com with SMTP id c13so1112430eek.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Aug 2013 06:30:20 -0700 (PDT)
In-Reply-To: <20130821085241.GA7574@elgon.mountain>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org

On 08/21/2013 10:52 AM, Dan Carpenter wrote:
> Hello Sylwester Nawrocki,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch 086eca2905d0: "[media] exynos4-is: Add Exynos5250 SoC
> support to fimc-lite driver" from Jun 14, 2013, leads to the
> following Smatch complaint:
>
> drivers/media/platform/exynos4-is/fimc-lite.c:1521 fimc_lite_probe()
> 	 error: we previously assumed 'dev->of_node' could be null (see line 1511)
>
> drivers/media/platform/exynos4-is/fimc-lite.c
>    1510	
>    1511		if (dev->of_node) {
>                      ^^^^^^^^^^^^
> Existing check.
>
>    1512			of_id = of_match_node(flite_of_match, dev->of_node);
>    1513			if (of_id)
>    1514				drv_data = (struct flite_drvdata *)of_id->data;
>    1515			fimc->index = of_alias_get_id(dev->of_node, "fimc-lite");
>    1516		}
>    1517	
>    1518		if (!drv_data || fimc->index>= drv_data->num_instances ||
>    1519							fimc->index<  0) {
>    1520			dev_err(dev, "Wrong %s node alias\n",
>    1521						dev->of_node->full_name);
>                                                  ^^^^^^^^^^^^^^
> Patch adds this dereference.


Thanks, this issue has been fixed in commit:
http://git.linuxtv.org/media_tree.git/commitdiff/6a40cbbe471bc7b821458973a5c18ba3d97d72f4

--
Regards,
Sylwester

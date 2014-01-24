From: Tomasz Figa <t.figa@samsung.com>
Subject: Samsung-clk patches for 3.15
Date: Fri, 24 Jan 2014 15:38:33 +0100
Message-ID: <52E27AE9.7040501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44346 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752445AbaAXOiu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jan 2014 09:38:50 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MZW00CL6U0P3290@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 24 Jan 2014 14:38:49 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, thomas.ab@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>, a.hajda@samsung.com

Hi,

Linux 3.14 is going to include Andrzej Hajda's patches converting 
Samsung clock drivers to use clock ID defines in include/dt-bindings, 
instead of local enums, but to avoid unnecessary merge conflicts we have 
converted only the clock driver, leaving DTS files unchanged yet.

We intend to complete the conversion in 3.15, by replacing magic numbers 
in DTS files with respective preprocessor macros, but to reduce 
potential conflicts we need help of you, Samsung clock patches authors :).

I'd like to ask anybody who already has patches for DTS files adding any 
clock-related contents still using numeric IDs, e.g. clock properties in 
nodes or full nodes containing clock properties, to make sure that the 
patches are merged before Andrzej sends the conversion patches. Then 
Andrzej's script will generate patches updating all clock properties, 
leaving no numeric IDs in DTS files.

If you are just starting your work on a patch that introduces changes as 
mentioned above, please make sure to already use clock macros, not 
numeric IDs. Otherwise you risk having needless rebases with a lot of 
conflicts. You have been warned ;).

Best regards,
Tomasz

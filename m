From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/1] drivers: net: silence compiler warning in smc91x.c
Date: Mon, 13 Jan 2014 11:54:59 -0800 (PST)
Message-ID: <20140113.115459.326248442934302460.davem@davemloft.net>
References: <1389323046-4521-1-git-send-email-pankaj.dubey@samsung.com>
	<52D05B41.7000601@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:38256 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750899AbaAMTzA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jan 2014 14:55:00 -0500
In-Reply-To: <52D05B41.7000601@cogentembedded.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sergei.shtylyov@cogentembedded.com
Cc: pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, netdev@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Fri, 10 Jan 2014 23:42:41 +0300

> Hello.
> 
> On 01/10/2014 06:04 AM, Pankaj Dubey wrote:
> 
>> If used 64 bit compiler GCC warns that:
> 
>> drivers/net/ethernet/smsc/smc91x.c:1897:7:
>> warning: cast from pointer to integer of different
>> size [-Wpointer-to-int-cast]
> 
>> This patch fixes this by changing typecase from "unsigned int" to
>> "unsigned long"
> 
>    Only "typecast".

Applied with this typo fixed, thanks.

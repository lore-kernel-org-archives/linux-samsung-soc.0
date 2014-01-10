From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/1] drivers: net: silence compiler warning in smc91x.c
Date: Fri, 10 Jan 2014 23:42:41 +0300
Message-ID: <52D05B41.7000601@cogentembedded.com>
References: <1389323046-4521-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:58734 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752520AbaAJTmi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jan 2014 14:42:38 -0500
Received: by mail-la0-f52.google.com with SMTP id y1so3570166lam.39
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jan 2014 11:42:36 -0800 (PST)
In-Reply-To: <1389323046-4521-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: "David S. Miller" <davem@davemloft.net>, Jingoo Han <jg1.han@samsung.com>, netdev@vger.kernel.org

Hello.

On 01/10/2014 06:04 AM, Pankaj Dubey wrote:

> If used 64 bit compiler GCC warns that:

> drivers/net/ethernet/smsc/smc91x.c:1897:7:
> warning: cast from pointer to integer of different
> size [-Wpointer-to-int-cast]

> This patch fixes this by changing typecase from "unsigned int" to "unsigned long"

    Only "typecast".

> CC: "David S. Miller" <davem@davemloft.net>
> CC: Jingoo Han <jg1.han@samsung.com>
> CC: netdev@vger.kernel.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>

WBR, Sergei

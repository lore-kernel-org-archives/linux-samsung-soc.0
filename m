From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: sxgbe: sw reset moved to probe function
Date: Wed, 30 Apr 2014 16:14:54 -0400 (EDT)
Message-ID: <20140430.161454.9517336091176344.davem@davemloft.net>
References: <001b01cf6361$9f4b6650$dde232f0$%an@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <001b01cf6361$9f4b6650$dde232f0$%an@samsung.com>
Sender: netdev-owner@vger.kernel.org
To: bh74.an@samsung.com
Cc: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, ks.giri@samsung.com, vipul.pandya@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

From: Byungho An <bh74.an@samsung.com>
Date: Tue, 29 Apr 2014 13:15:15 +0900

> 
> This patch moves sw reset to probe function because
> sw reset is needed early stage before open function.
> 
> Signed-off-by: Byungho An <bh74.an@samsung.net>

Applied.
